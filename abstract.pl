#!/usr/bin/perl -w

##################################################################################
### telnet AC then login ap to abstract channel busy values
###   the ac/ap/hot information are exported from netman system
###   the apip-apid-apserial table is abstract from the response of telnet command
###
##################################################################################
### AUTHOR:  3/25/2013 Chengan
### VERSION: 3/25/2013 0.1 finished all files parsing and telnet modules,
###                        integration them
###                        obtain the channel busy kpi from ac by telnet
###          5/25/2013 0.2 modified the data structure to abstract other KPIs
###          5/30/2013 0.3 add most important kpis
##################################################################################

use strict;
use warnings;

use File::Basename;
use lib dirname(__FILE__) . "/";

use Mconstants ':const_switch';
use Mconstants ':const_var';
use Mconstants ':const_col';
use Mutils qw(
    printlog
    printdbg
    _sleep
    trans_hash
    gen_key_arr
    gen_value_arr
    get_file_list
    get_file_list_fromto
    by_number
    get_delta_sec
    gen_test_files
    accu_value_arr
    aver_value_arr
);

use POSIX qw(strftime);

use Data::Merger qw(merger);
use Net::Telnet;
use File::Basename;
use File::Spec;
use data::Dumper;
use Storable;
use Clone qw(clone);

use Encode;
use Spreadsheet::WriteExcel;
use Time::Piece;
use Time::Seconds;

$Data::Dumper::Terse  = 0;
$Data::Dumper::Indent = 1;

my $collectdir = shift(@ARGV);  # channel busy original data


##XXXX # the column number of needed information
##XXXX #   move to Mconstan.pm
##XXXX my %ac_tab_cols =
##XXXX (
##XXXX     acnocol     =>0,
##XXXX     acnamecol   =>1,
##XXXX     acipaddcol  =>2,
##XXXX     acusercol   =>8,
##XXXX     acpwdcol    =>9
##XXXX );
##XXXX my %ap_tab_cols =
##XXXX (
##XXXX     apidcol     =>0,
##XXXX     apsericol   =>38,
##XXXX     apnamecol   =>1,
##XXXX     apipcol     =>12,
##XXXX     apmaccol    =>13,
##XXXX     apacnamecol =>37,
##XXXX     hotnamecol  =>19
##XXXX );
##XXXX my %hot_tab_cols =
##XXXX (
##XXXX     hotcitycol  =>6,
##XXXX     hotnamecol  =>2,
##XXXX     hotaccol    =>32
##XXXX );

##XXXX ################################################
# some kpi name constant list
#   move to Mconstan.pm
##XXXX ################################################
##XXXX  # for ap/ac/hot compute accumulation value
##XXXX  my @gap = (
##XXXX      "assoc_hist",
##XXXX      "reassoc_hist",
##XXXX      "assoc_fail_hist",
##XXXX      #"except_deauth_hist",
##XXXX      "tran_data_pkts",
##XXXX      "tran_ctl_pkts",
##XXXX      "recv_data_pkts",
##XXXX      "recv_ctl_pkts",
##XXXX      "conn_cnt",
##XXXX      #"num_client",
##XXXX  );
##XXXX  # only for ap
##XXXX  my @gap2 = (
##XXXX      #"curr_num_radio",
##XXXX      "max_num_radio",
##XXXX      "numradio"
##XXXX      #"priority_level",
##XXXX      #"echo_interval",
##XXXX      #"client_idle_interval",
##XXXX  );
##XXXX  # only for ap
##XXXX  my @gr = (
##XXXX      "power",
##XXXX      "channel_num",
##XXXX      "wireless_mode",
##XXXX  );
##XXXX  # for ap/ac/hot  compute average value
##XXXX  my @gr2 = (
##XXXX      "avg_rssi",
##XXXX      "avg_rx_rate",
##XXXX      "avg_tx_rate",
##XXXX      "num_client",
##XXXX      "opr_rate",
##XXXX      "resource_ratio",
##XXXX      "noise_floor"
##XXXX  );
##XXXX  # for ap/ac/hot compute average value
##XXXX  my @gr_cb = (
##XXXX      #"date",
##XXXX      #"time",
##XXXX      "channel",
##XXXX      "channelbusy",
##XXXX      "rxbusy",
##XXXX      "txbusy"
##XXXX  );
##XXXX  my @gr_frametype = (
##XXXX      "transmit",
##XXXX      "receive"
##XXXX  );
##XXXX  # for ap/ac/hot compute accumuation value
##XXXX  my @gr_pkt_size = (
##XXXX      "le_128",
##XXXX      "between_128_512",
##XXXX      "between_512_1024",
##XXXX      "gt_1024"
##XXXX  );
##XXXX  # for ap/ac/hot compute accumuation value
##XXXX  my @gr_transmit = (
##XXXX      "total_frame",
##XXXX      "unicast_frame",
##XXXX      "broad_multi_frame",
##XXXX      "others_frame",
##XXXX      "discard_frame",
##XXXX      "retry_frame"
##XXXX  );
##XXXX  # for ap/ac/hot compute accumuation value
##XXXX  my @gr_receive = (
##XXXX      "total_frame",
##XXXX      "unicast_frame",
##XXXX      "broad_multi_frame"
##XXXX  );
##XXXX  # for ap/ac/hot compute accumuation value
##XXXX  my @gr_11grate = ("1","2","5.5","6","9","11","12","18","24","36","48","54");
##XXXX  # for ap/ac/hot compute accumuation value
##XXXX  my @gr_11nrate = ("6.5","13","13.5","15","19.5","26","27","30","39","40.5",
##XXXX      "45","52","54","58.5","60","65","72.2","78","81","90","104","108",
##XXXX      "117","120","121.5","130","135","144.4","150","156","162","173.3",
##XXXX      "175.5","180","195","216","216.7","240","243","270","300","324","360","364.5","405","450");


# global key data structure
my $ac        =();  # ac  information from export file
my $ap        =();  # ap  information from export file
my $hot       =();  # hot information from export file
my $telnetaps =();  # ap  information from telnet
my $acap      =();  # acap data structure
my $kpis      =();  # kpi data sturcture
my $ackpis    =();  # ac kpi data sturcture
my $hotkpis   =();  # hot kpi data sturcture

open LOGFH,">$logfn" or die "can not open file $logfn - $!\n";
open DBGFH,">$dbgfn" or die "can not open file $dbgfn - $!\n";
printlog(\*LOGFH,"\n################ ".localtime." ######################");

my $startt = localtime();


##########################################################
### MAIN LOOP
##########################################################
&pre_handle();
&main_loop();


##########################################################
### extract informations by parse export file and telnet device
### $ap,$ac,$acap
##########################################################
sub pre_handle()
{
    ##########################################################
    ### parse all ac/ap/hotspot files which are exported
    ###   from netman
    ##########################################################
    open ACEXPORTFN,"<$acexportfn" or die "can not open file $acexportfn- $!\n";
    $ac=&parse_ac_export_file(\*ACEXPORTFN);
    if(DBG_AC_FH) ## DBG
    {
        #print scalar (keys %$ac) ."\n";
        &printdbg(\*DBGFH,Data::Dumper->Dump([\$ac],["ac"]));
    }
    close ACEXPORTFN;

    open APEXPORTFH,"<$apexportfn" or die "can not open file $apexportfn- $!\n";
    $ap=&parse_ap_export_file(\*APEXPORTFH);
    if(DBG_AP_FH) ## DBG
    {
        #print scalar (keys %$ap) ."\n";
        &printdbg(\*DBGFH,Data::Dumper->Dump([\$ap],["ap"]));
    }
    close APEXPORTFH;

    open HOTEXPORTFH,"<$hotexportfn" or die "can not open file $hotexportfn- $!\n";
    $hot=&parse_hot_export_file(\*HOTEXPORTFH);
    if(DBG_HOT_FH) ## DBG
    {
        #print scalar (keys %$hot) ."\n";
        &printdbg(\*DBGFH,Data::Dumper->Dump([\$hot],["hot"]));
    }
    close HOTEXPORTFH;

    ##########################################################
    ### STEP1. the apid information is not collectted in netman
    ###        so we need to check apip-apid-apserial information
    ###        by ap telnet command response, and update $acap apid
    ##########################################################
    foreach my $acip (keys %$ac) {
        my $anac = $ac->{$acip};

        my $acusername =$anac->{acuser};
        my $acpasswd   =$anac->{acpasswd};

        &command_apip_seri($acip,$acusername,$acpasswd);

        open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
        $telnetaps->{$acip} = &parse_ac_aps_log(\*TELNETLOGFH);
        close TELNETLOGFH;

        if(DBG_APID_SERI) { ## DBG
            &printdbg(\*DBGFH,Data::Dumper->Dump([\$telnetaps->{$acip}],["telnetaps->$acip"]));
        }
    }

    #unlink $telnetlog;
    #unlink $telnetdbg;

    ###########################################################
    ### change $ac to:
    ###    $ac->{acname}->{acnumber}   =$acnumber;
    ###    $ac->{acname}->{acipaddr}   =$acipaddr;
    ###    $ac->{acname}->{acuser}     =$acuser;
    ###    $ac->{acname}->{acpasswd}   =$acpasswd;
    ###########################################################
    my $tac=();
    foreach my $t (keys %$ac)
    {
        my $anac=$ac->{$t};
        my $acname =$anac->{acname};
        $tac->{$acname}->{acipaddr} =$t;
        $tac->{$acname}->{acnumber} =$anac->{acnumber};
        $tac->{$acname}->{acuser}   =$anac->{acuser};
        $tac->{$acname}->{acpasswd} =$anac->{acpasswd};
    }
    $ac=(); $ac=$tac; $tac=();

    ###########################################################
    ### change $ap to:
    ###     $ap->{$apip}->{apid}
    ###     $ap->{$apip}->{apname}
    ###     $ap->{$apip}->{apmac}
    ###     $ap->{$apip}->{hotname}
    ###     $ap->{$apip}->{acname}
    ###     $ap->{$apip}->{$ap->{hotname}}->{hotcity}
    ###     $ap->{$apip}->{$ap->{hotname}}->{hotac}
    ###     $ap->{$apip}->{$ac->{acname}}->{acnumber}
    ###     $ap->{$apip}->{$ac->{acname}}->{acipaddr}
    ###     $ap->{$apip}->{$ac->{acname}}->{acuser}
    ###     $ap->{$apip}->{$ac->{acname}}->{acpasswd}
    ###
    ###     '10.150.4.135' => {
    ###                         'apmac' => 'C4CAD98362D0',
    ###                         'apid' => 'ap-dgjtw-5',
    ###                         'hotname' => '定海临城交通委大楼',
    ###                         '定海临城交通委大楼' => {
    ###                                                   'hotac' => '华三AC定海76(主)',
    ###                                                   'hotcity' => '舟山市'
    ###                                                 },
    ###                         'apname' => 'ap-定海临城交通委大楼-5',
    ###                         'acname' => '华三AC定海76(主)',
    ###                         '华三AC定海76(主)' => {
    ###                                                 'acnumber' => 'AC-ZS-76-M',
    ###                                                 'acipaddr' => '10.145.253.76',
    ###                                                 'acpasswd' => 'zsdx0580',
    ###                                                 'acuser' => 'zsdx'
    ###                                               }
    ###                       },
    ###########################################################
    foreach my $apip (keys %$ap)
    {
        my $anap  =$ap->{$apip};             # ap information in netman
        my $ahot  =$hot->{$anap->{hotname}}; # hot information in netman
        my $anac  =$ac->{$anap->{acname}};   # ac information in netman

        if(defined $ahot && defined $anac) # this ap is included in $hot list and is included $ac list
                                           # and is included in ac telnet output
        {
            $ap->{$apip}->{apid} = $telnetaps->{$anac->{acipaddr}}->{$anap->{apseri}}->{apid};
            $ap->{$apip}->{$anap->{hotname}}->{hotcity}   =$ahot->{hotcity};
            $ap->{$apip}->{$anap->{hotname}}->{hotac}     =$ahot->{hotac};
            $ap->{$apip}->{$anap->{acname}}->{acnumber}   =$anac->{acnumber};
            $ap->{$apip}->{$anap->{acname}}->{acipaddr}   =$anac->{acipaddr};
            $ap->{$apip}->{$anap->{acname}}->{acuser}     =$anac->{acuser};
            $ap->{$apip}->{$anap->{acname}}->{acpasswd}   =$anac->{acpasswd};
        }
        ### clean the $ap not include in $ac && $hot list
        else
        {
            delete $ap->{$apip};
        }
    }
    if(DBG_AP) ### DBG
    {
        &printdbg(\*DBGFH,Data::Dumper->Dump([\$ap],[qw/ap/]));
    }

    ##########################################################
    ### $acap = \{
    ###         '10.145.253.78' => {
    ###                              'acuser' => 'zsdx',
    ###                              'acpasswd' => 'zsdx0580'
    ###                              'acnumber' => 'ac-zs-78-m',
    ###                              'acname' => '华三ac普陀78(主)',
    ###                              '10.151.3.66' => {
    ###                                                 'apmac' => 'c4cad997e3c0',
    ###                                                 'apid' => undef,
    ###                                                 'hotname' => '普陀朱家尖蜈蚣峙码头停车场室外',
    ###                                                 'apname' => 'ap-普陀朱家尖蜈蚣峙码头停车场室外-1'
    ###                                               },
    ###                              '10.151.45.196' => {
    ###                                                   'apmac' => 'c4cad9ea2510',
    ###                                                   'apid' => 'pt-ptskymt-ap1',
    ###                                                   'hotname' => '普陀普陀山客运码头',
    ###                                                   'apname' => 'ap-普陀普陀山客运码头-1'
    ###                                                 },
    ###                                 ......
    ###                            }
    ###                 ......
    ##########################################################
    foreach my $apip (keys %$ap)
    {
        my $anap =$ap->{$apip};
        my $anac =$ac->{$anap->{acname}};
        my $ahot =$hot->{$anap->{hotname}};

        my ($apid,$apname,$apmac,$hotname,$acname) = (
            $anap->{apid},
            $anap->{apname},
            $anap->{apmac},
            $anap->{hotname},
            $anap->{acname},
        );
        my ($acip,$acnumber,$acuser,$acpasswd) = (
            $anac->{acipaddr},
            $anac->{acnumber},
            $anac->{acuser},
            $anac->{acpasswd}
        );
        my $hotcity = $ahot->{hotcity};

        $acap->{$acip}->{acuser}   = $acuser;
        $acap->{$acip}->{acpasswd} = $acpasswd;
        $acap->{$acip}->{acnumber} = $acnumber;
        $acap->{$acip}->{acname}   = $acname;

        $acap->{$acip}->{$apip}->{apid}     = $apid;
        $acap->{$acip}->{$apip}->{apname}   = $apname;
        $acap->{$acip}->{$apip}->{apmac}    = $apmac;
        $acap->{$acip}->{$apip}->{hotname}  = $hotname;
    }
    if(DBG_ACAP) ### DBG
    {
        &printdbg(\*DBGFH,Data::Dumper->Dump([\$acap],[qw/acap/]));
    }
}


sub main_loop()
{
    my $tmstamp = strftime "%Y%m%d%H%M%S", localtime;
    my $resultcsvfn_aps = File::Spec->catfile($resultdir,"output_$tmstamp" . "_aps.csv");
    my $resultxlsfn_aps = File::Spec->catfile($resultdir,"output_$tmstamp" . "_aps.xls");
    my $resultcsvfn_acs = File::Spec->catfile($resultdir,"output_$tmstamp" . "_acs.csv");
    my $resultxlsfn_acs = File::Spec->catfile($resultdir,"output_$tmstamp" . "_acs.xls");
    my $resultcsvfn_hot = File::Spec->catfile($resultdir,"output_$tmstamp" . "_hot.csv");
    my $resultxlsfn_hot = File::Spec->catfile($resultdir,"output_$tmstamp" . "_hot.xls");
    my $storekpis       = File::Spec->catfile($bindir, "kpis_$tmstamp" . ".dat");
    my $acstorekpis     = File::Spec->catfile($bindir, "ackpis_$tmstamp" . ".dat");
    my $hotstorekpis    = File::Spec->catfile($bindir, "hotkpis_$tmstamp" . ".dat");

    ##########################################################
    ### STEP2: telnet ac/ap to obtain the performance values
    ###        and check the HASH $kpis to handle the undef data
    ##########################################################
    $kpis    = &process_telnet($acap);
    $ackpis  = &gen_ac_kpis($acap,$kpis);
    $hotkpis = &gen_hot_kpis($acap,$kpis);

    if(DBG_KPI && defined $kpis) { ## DBG
        &printdbg(\*DBGFH,Data::Dumper->Dump([\$kpis],["kpis"]));
        &printdbg(\*DBGFH,Data::Dumper->Dump([\$ackpis],["ackpis"]));
        &printdbg(\*DBGFH,Data::Dumper->Dump([\$hotkpis],["hotkpis"]));

        # store all kpis to binary data files, so we can retrieve kpis from these file for late analize
        store($kpis,    "$storekpis")    || die "can't store to $storekpis.dat\n";;
        store($ackpis,  "$acstorekpis")  || die "can't store to $acstorekpis.dat\n";;
        store($hotkpis, "$hotstorekpis") || die "can't store to $hotstorekpis.dat\n";;

        #my $testretrieve = retrieve("TestArray.dat");
        #&printdbg(\*DBGFH,Data::Dumper->Dump([\$testretrieve],["testretrieve"]));
    }

    #unlink $telnetlog;
    #unlink $telnetdbg;

    ##########################################################
    ### STEP3: print results to csv/xls tables
    ##########################################################
    # print KPIs for each aps
    #open RESULTCSVFH,">$resultcsvfn_aps" or die "can not open file $resultcsvfn_aps - $!\n";
    #&print_results_aps(\*RESULTCSVFH,$acap,$kpis);

    my $resultbook_aps  = Spreadsheet::WriteExcel->new($resultxlsfn_aps);
    $resultbook_aps->add_worksheet("channel busy values");
    &print_results_aps($resultbook_aps,$acap,$kpis);

    # print KPIs for each acs
    my $resultbook_acs  = Spreadsheet::WriteExcel->new($resultxlsfn_acs);
    $resultbook_acs->add_worksheet("channel busy values");
    &print_results_acs($resultbook_acs,$ackpis);

    # print KPIs for each hot spot
    my $resultbook_hot  = Spreadsheet::WriteExcel->new($resultxlsfn_hot);
    $resultbook_hot->add_worksheet("channel busy values");
    &print_results_hot($resultbook_hot,$hotkpis);

    $resultbook_hot->close();
    $resultbook_acs->close();
    $resultbook_aps->close();
    #close RESULTCSVFH;

    my $stopt = localtime();
    my $difft = $stopt-$startt;
    &printlog(\*LOGFH,"processed " . scalar keys(%$kpis) . " ACs, take " . (60*($difft->minutes)) . " seconds");
}


###########################################################
### process telnet logfile, then return the KPI structure
### $kpis structure:
### $kpis = \{
###   '10.145.253.78' => {
###     '10.151.3.68' => {
###       'numradio' => 1,
###       'radio' => {
###         '1' => {
###           'cb' => {
###             'rxbusy' => '5',
###             'time' => '13:42:45',
###             'date' => '28/05/2013',
###             'channelbusy' => '7',
###             'txbusy' => '1',
###             'channel' => '11'
###           }
###         }
###       }
###     },
###########################################################
sub process_telnet
{
    my $tacap  = shift;
    my $mkpis = ();

    foreach my $acip (keys %$tacap) {
        my $anac = $tacap->{$acip};

        my $acusername =$anac->{acuser};
        my $acpasswd   =$anac->{acpasswd};

        foreach my $apip (keys %$anac) {
            next if ($apip!~/^(?:\d+\.){3}\d+$/ ); # spip keys that are not ipaddress

            my $anap = $anac->{$apip};
            my $apid = $anap->{apid};

            # the special serial number ap is not founded in $telnetaps
            if (!defined $apid)
            {
                # print log info
                &printlog(\*LOGFH,"### The ap serial $ap->{$apip}->{apseri} not find by telnet ap-$apip, ac-$acip ###");

                next;
            }

            #
            # send command to ac and parse log file
            #
            my ($cb,
                $apinfo,
                $ap_client_info,
                $conn_hist,
                $radio_stat
            );
            if(ENABLED_CHANNELBUSY)
            {
                open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
                &command_channelbusy($acip,$acusername,$acpasswd,$apip,$apid);
                $cb = &parse_channelbusy_log(\*TELNETLOGFH);
                close TELNETLOGFH;

                if(DBG_CB) { ## DBG
                    &printdbg(\*DBGFH,Data::Dumper->Dump([\$cb],["cb"]));
                }

                $mkpis->{$acip}->{$apip} = $cb;
            }

            if(ENABLED_AP_INFO)
            {
                open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
                &command_ap_info($acip,$acusername,$acpasswd,$apip,$apid);
                $apinfo = &parse_ap_info_log(\*TELNETLOGFH);
                close TELNETLOGFH;

                $mkpis->{$acip}->{$apip} = merger($mkpis->{$acip}->{$apip},$apinfo);
            }

            if(ENABLED_AP_CLIENTS_INFO)
            {
                open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
                &command_ap_clients_info($acip,$acusername,$acpasswd,$apip,$apid);
                $ap_client_info = &parse_ap_clients_info_log(\*TELNETLOGFH);
                close TELNETLOGFH;

                $mkpis->{$acip}->{$apip} = merger($mkpis->{$acip}->{$apip},$ap_client_info);
            }

            if(ENABLED_CONNECT_HISTORY)
            {
                open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
                &command_connect_history($acip,$acusername,$acpasswd,$apip,$apid);
                $conn_hist=&parse_connect_history_log(\*TELNETLOGFH);
                close TELNETLOGFH;

                $mkpis->{$acip}->{$apip} = merger($mkpis->{$acip}->{$apip},$conn_hist);
            }

            if(ENABLED_RADIO_STATISTICS)
            {
                open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
                &command_radio_statistics($acip,$acusername,$acpasswd,$apip,$apid);
                $radio_stat = &parse_radio_statistics_log(\*TELNETLOGFH);
                close TELNETLOGFH;

                $mkpis->{$acip}->{$apip} = merger($mkpis->{$acip}->{$apip},$radio_stat);
            }

            ## test only xxxx
            #&printlog(\*LOGFH,"\"$acip\",\"$acusername\",\"$acpasswd\",\"$apip\",\"$apid\"\n");
        }
    }

    return $mkpis;
}

###########################################################
### only for DEBUG
### must set DBG_FUNC=>0 to close debug when release
###########################################################
if(DBG_FUNC)
{
    my $dat = ();

    my $macip       = "192.168.123.223";
    my $macusername = "admin";
    my $macpasswd   = "admin";
    my $mapip       = "192.168.123.192";
    my $mapid       = "hz-test-0129";
    my $mcltmacaddr    = "70ba-efb0-bb60";

    &command_apip_seri($macip, $macusername, $macpasswd);

    if(1) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_channelbusy($macip,$macusername,$macpasswd,$mapip,$mapid);
    $dat=&parse_channelbusy_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["channelbusy"]));
    close TELNETLOGFH;
    } ### DBG
    if(1) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_channelbusy($macip,$macusername,$macpasswd,$mapip,$mapid);
    $dat=&parse_channelbusy_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["channelbusy"]));
    close TELNETLOGFH;
    } ### DBG

    if(1) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_ap_info($macip,$macusername,$macpasswd,$mapip,$mapid);
    $dat=&parse_ap_info_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["ap_info"]));
    close TELNETLOGFH;
    } ### DBG
    if(1) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_ap_info($macip,$macusername,$macpasswd,$mapip,$mapid);
    $dat=&parse_ap_info_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["ap_info"]));
    close TELNETLOGFH;
    } ### DBG

    if(1) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_ap_clients_info($macip,$macusername,$macpasswd,$mapip,$mapid);
    $dat=&parse_ap_clients_info_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["ap_clients_info"]));
    close TELNETLOGFH;
    } ### DBG
    if(1) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_ap_clients_info($macip,$macusername,$macpasswd,$mapip,$mapid);
    $dat=&parse_ap_clients_info_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["ap_clients_info"]));
    close TELNETLOGFH;
    } ### DBG

    if(1) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_connect_history($macip,$macusername,$macpasswd,$mapip,$mapid);
    $dat=&parse_connect_history_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["connect_history"]));
    close TELNETLOGFH;
    } ### DBG
    if(1) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_connect_history($macip,$macusername,$macpasswd,$mapip,$mapid);
    $dat=&parse_connect_history_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["connect_history"]));
    close TELNETLOGFH;
    } ### DBG

    if(1) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_radio_statistics($macip,$macusername,$macpasswd,$mapip,$mapid);
    $dat=&parse_radio_statistics_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["radio_statistics"]));
    close TELNETLOGFH;
    } ### DBG
    if(1) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_radio_statistics($macip,$macusername,$macpasswd,$mapip,$mapid);
    $dat=&parse_radio_statistics_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["radio_statistics"]));
    close TELNETLOGFH;
    } ### DBG


    if(0) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_client_info($macip,$macusername,$macpasswd,$mapip,$mcltmacaddr);
    $dat=&parse_client_info_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["client_info"]));
    close TELNETLOGFH;
    } ### DBG
    if(0) { ### DBG
    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    &command_client_info($macip,$macusername,$macpasswd,$mapip,$mcltmacaddr);
    $dat=&parse_client_info_log(\*TELNETLOGFH);
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$dat],["client_info"]));
    close TELNETLOGFH;
    } ### DBG
}


sub command_apip_seri
{
    my $macip       = $_[0];
    my $macusername = $_[1];
    my $macpasswd   = $_[2];

    my $cr=chr(13); # CR
    my $cz=chr(11); # Ctrl+k

    my $t = new Net::Telnet(
        Timeout=>5,
        Port   =>23,
        Prompt =>'/[\]>] *$/i',
        Input_log  =>$telnetlog
    );
    $t->open($macip);
    #$t->dump_log($telnetdbg);

    $t->waitfor(-match=>'/username: *$/i'); $t->print($macusername);
    $t->waitfor(-match=>'/password: *$/i'); $t->print($macpasswd);

    ###########################################################
    # display ap information
    # ---------------------------------------------------------
    #  AP Name     State Model           Serial-ID
    # ---------------------------------------------------------
    #  dh-hsbjdmd  R/M   WA1208E-GP-H20  210235A0GNC119013872
    ###########################################################
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display wlan ap all");
    $t->getline;
    my $nc = $t->getline;
    $nc =~ /^ Total Number of APs configured +: (\d+)$/;
    $t->print(' 'x(!defined $1?0:$1/20));
    #select(undef, undef, undef, 0.01);  # sleep 0.25 second
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print('quit');

    ###########################################################
    #########  Net::Telnet->getlines do not work! #############
    #########  ERROR: no response !!!             #############
    ###########################################################
    #my @line = $t->getlines;
    #print @line;

    $t->close;
}


sub command_channelbusy
{
    my $macip       = $_[0];
    my $macusername = $_[1];
    my $macpasswd   = $_[2];
    my $mapip       = $_[3];
    my $mapid       = $_[4];

    my $cr=chr(13); # CR
    my $cz=chr(11); # Ctrl+k
    my $t = new Net::Telnet(
        Timeout    =>3,
        Port       =>23,
        Prompt     =>'/[\]>] *$/i',
        errmode    =>'return',
        Input_log  =>$telnetlog
    );
    #$t->dump_log($telnetdbg);

    my $opened = $t->open($macip);
    if (defined $opened) {
        my $logined = $t->login($macusername, $macpasswd);
        if (!defined $logined) {
            &printlog(\*LOGFH,"Error logging into device $macip : " . $t->errmsg);
            $t->close;
            next;
        }
    } else {
        &printlog(\*LOGFH,"Error connecting to device: " . $t->errmsg);
        next;
    }
=here
    $t->open($macip);
    $t->waitfor(-match=>'/username: *$/i'); $t->print($macusername);
    $t->waitfor(-match=>'/password: *$/i'); $t->print($macpasswd);
=cut

    $t->print("#\n"x5);
    &printlog(\*LOGFH,"###start processing channelbusy "."$macip,$mapip,$mapid###");
    #select(undef, undef, undef, 0.05);  # sleep 0.05 second
    &_sleep(0.05);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###start processing channelbusy " . "(acip,apip,apid):$macip,$mapip,$mapid###");  #channel busy ap start tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display wlan ap name $mapid radio");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("sys");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("_h");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("wlan ap-execute $mapid telnet enable");
    my ($prem,$m) = $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("wlan ap-execute $mapid exec-control enable");
    if($prem=~/AP is not in operational state/) {
        $t->print("quit");
        $t->print("quit");
        $t->close;
        return;
    }
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    #select(undef, undef, undef, 0.05);  # sleep 0.05 second
    &_sleep(0.05);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("telnet $mapip");
    $t->print("#\n"x5);

    ## Decimal to Hex to ASCII Converter Chart, ref - http://www.ascii.cl/
    #$t->waitfor(-match=>'/Press CTRL.+to abort *$/i'); $t->print($cz);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("sys");
    #select(undef, undef, undef, 0.05);  # sleep 0.25 second
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("_h");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display ar5drv 1 channelbusy");
    $t->print(' 'x5);
    #select(undef, undef, undef, 0.05);  # sleep 0.25 second
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display ar5drv 2 channelbusy");
    $t->print(' 'x5);
    #select(undef, undef, undef, 0.05);  # sleep 0.25 second
    &_sleep(0.05);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###stop processing channelbusy " .
        "(acip,apip,apid):$macip,$mapip,$mapid###"); # channel busy ap stop tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    &_sleep(0.05);
    #select(undef, undef, undef, 0.05);  # sleep 0.25 second

    ###########################################################
    #########  Net::Telnet->cmd do not work! ##################
    #########  ERROR  !! cmd time-out  ??    ##################
    ###########################################################
    ##  my @lines = $t->cmd("display vlan");
    ##  $t->waitfor(-match=>'/> *$/i');
    ##  print @lines;
    ###########################################################

    $t->close;
}


sub command_ap_info
{
    my $macip       = $_[0];
    my $macusername = $_[1];
    my $macpasswd   = $_[2];
    my $mapip       = $_[3];
    my $mapid       = $_[4];

    my $cr=chr(13); # CR
    my $cz=chr(11); # Ctrl+k
    my $t = new Net::Telnet(
        Timeout    =>3,
        Port       =>23,
        Prompt     =>'/[\]>] *$/i',
        errmode    =>'return',
        Input_log  =>$telnetlog
    );
    #$t->dump_log($telnetdbg);

    my $opened = $t->open($macip);
    if (defined $opened) {
        my $logined = $t->login($macusername, $macpasswd);
        if (!defined $logined) {
            &printlog(\*LOGFH,"Error login ac $macip : " . $t->errmsg);
            $t->close;
            next;
        }
    } else {
        &printlog(\*LOGFH,"Error connecting to ac : " . $t->errmsg);
        next;
    }

    $t->print("#\n"x5);
    &printlog(\*LOGFH,"###start processing display wlan ap info "."$macip,$mapip,$mapid###");
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###start processing wlan ap info " .
        "(acip,apip,apid):$macip,$mapip,$mapid###");  #start tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###timestamp" . strftime "%d/%m/%Y %H:%M:%S", localtime);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display wlan ap name $mapid verbose");
    &_sleep(0.01);
    $t->print(' 'x5);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###stop processing wlan ap info " .
        "(acip,apip,apid):$macip,$mapip,$mapid###");  #stop tag
    #&_sleep(0.05);
    $t->print("#\n"x5);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print('quit');

    $t->close;
}


sub command_ap_clients_info
{
    my $macip       = $_[0];
    my $macusername = $_[1];
    my $macpasswd   = $_[2];
    my $mapip       = $_[3];
    my $mapid       = $_[4];

    my $cr=chr(13); # CR
    my $cz=chr(11); # Ctrl+k
    my $t = new Net::Telnet(
        Timeout    =>3,
        Port       =>23,
        Prompt     =>'/[\]>] *$/i',
        errmode    =>'return',
        Input_log  =>$telnetlog
    );
    #$t->dump_log($telnetdbg);

    my $opened = $t->open($macip);
    if (defined $opened) {
        my $logined = $t->login($macusername, $macpasswd);
        if (!defined $logined) {
            &printlog(\*LOGFH,"Error login ac $macip : " . $t->errmsg);
            $t->close;
            next;
        }
    } else {
        &printlog(\*LOGFH,"Error connecting to ac : " . $t->errmsg);
        next;
    }

    $t->print("#\n"x5);
    &printlog(\*LOGFH,"###start processing display wlan ap's clinets info "."$macip,$mapip,$mapid###");
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###start processing wlan ap's clients info " .
        "(acip,apip,apid):$macip,$mapip,$mapid###");  #start tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###timestamp" . strftime "%d/%m/%Y %H:%M:%S", localtime);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display wlan client ap $mapid verbose");
    $t->getline;
    my $nc = $t->getline;
    if($nc =~/Clients do not exist/)
    {
        &printlog(\*LOGFH,"###NO CLIENT FOUND IN AP " . "($macip, $mapid)!###");
    }
    $nc =~ /^ Total Number of Clients +: (\d+)$/;
    $t->print(' 'x(!defined $1?0:($1*5)/3));
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###stop processing wlan ap's clients info " .
        "(acip,apip,apid):$macip,$mapip,$mapid###");  #stop tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print('quit');

    $t->close;
}


sub command_connect_history
{
    my $macip       = $_[0];
    my $macusername = $_[1];
    my $macpasswd   = $_[2];
    my $mapip       = $_[3];
    my $mapid       = $_[4];

    my $cr=chr(13); # CR
    my $cz=chr(11); # Ctrl+k
    my $t = new Net::Telnet(
        Timeout    =>3,
        Port       =>23,
        Prompt     =>'/[\]>] *$/i',
        errmode    =>'return',
        Input_log  =>$telnetlog
    );
    #$t->dump_log($telnetdbg);

    my $opened = $t->open($macip);
    if (defined $opened) {
        my $logined = $t->login($macusername, $macpasswd);
        if (!defined $logined) {
            &printlog(\*LOGFH,"Error login ac $macip : " . $t->errmsg);
            $t->close;
            next;
        }
    } else {
        &printlog(\*LOGFH,"Error connecting to ac : " . $t->errmsg);
        next;
    }

    $t->print("#\n"x5);
    &printlog(\*LOGFH,"###start processing display ap's connection history "."$macip,$mapip,$mapid###");
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###start processing wlan ap's clients info " .
        "(acip,apip,apid):$macip,$mapip,$mapid###");  #start tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###timestamp" . strftime "%d/%m/%Y %H:%M:%S", localtime);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display wlan statistics ap name  $mapid connect-history");
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###stop processing display ap's connection history " .
        "(acip,apip,apid):$macip,$mapip,$mapid###");  #stop tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print('quit');

    $t->close;
}


sub command_radio_statistics
{
    my $macip       = $_[0];
    my $macusername = $_[1];
    my $macpasswd   = $_[2];
    my $mapip       = $_[3];
    my $mapid       = $_[4];

    my $cr=chr(13); # CR
    my $cz=chr(11); # Ctrl+k
    my $t = new Net::Telnet(
        Timeout    =>3,
        Port       =>23,
        Prompt     =>'/[\]>] *$/i',
        errmode    =>'return',
        Input_log  =>$telnetlog
    );
    #$t->dump_log($telnetdbg);

    my $opened = $t->open($macip);
    if (defined $opened) {
        my $logined = $t->login($macusername, $macpasswd);
        if (!defined $logined) {
            &printlog(\*LOGFH,"Error login ac $macip : " . $t->errmsg);
            $t->close;
            next;
        }
    } else {
        &printlog(\*LOGFH,"Error connecting to ac : " . $t->errmsg);
        next;
    }

    $t->print("#\n"x5);
    &printlog(\*LOGFH,"###start processing display radio statistics "."$macip,$mapip,$mapid###");
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###start processing wlan ap's clients info " .
        "(acip,apip,apid):$macip,$mapip,$mapid###");  #start tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###timestamp" . strftime "%d/%m/%Y %H:%M:%S", localtime);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display wlan statistics radio ap $mapid");
    $t->print(' 'x5);
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###stop processing display radio statistics " .
        "(acip,apip,apid):$macip,$mapip,$mapid###");  #stop tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print('quit');

    $t->close;
}


sub command_client_info
{
    my $macip       = $_[0];
    my $macusername = $_[1];
    my $macpasswd   = $_[2];
    my $mapip       = $_[3];
    my $mcltmacaddr    = $_[4];

    my $cr=chr(13); # CR
    my $cz=chr(11); # Ctrl+k
    my $t = new Net::Telnet(
        Timeout    =>3,
        Port       =>23,
        Prompt     =>'/[\]>] *$/i',
        errmode    =>'return',
        Input_log  =>$telnetlog
    );
    #$t->dump_log($telnetdbg);

    my $opened = $t->open($macip);
    if (defined $opened) {
        my $logined = $t->login($macusername, $macpasswd);
        if (!defined $logined) {
            &printlog(\*LOGFH,"Error login ac $macip : " . $t->errmsg);
            $t->close;
            next;
        }
    } else {
        &printlog(\*LOGFH,"Error connecting to ac : " . $t->errmsg);
        next;
    }

    $t->print("#\n"x5);
    &printlog(\*LOGFH,"###start processing display client information "."$macip,$mapip,$mcltmacaddr###");
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###start processing wlan ap's clients info " .
        "(acip,apip,macaddr):$macip,$mapip,$mcltmacaddr###");  #start tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###timestamp" . strftime "%d/%m/%Y %H:%M:%S", localtime);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display wlan client mac-address $mcltmacaddr verbose");
    $t->print(' 'x5);
    &_sleep(0.01);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###stop processing display client information " .
        "(acip,apip,clientmacaddr):$macip,$mapip,$mcltmacaddr###");  #stop tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print('quit');

    $t->close;
}


###########################################################
### parse AC file
### $ac structure:
###     $ac->{$acipaddr}->{acnumber}   =$acnumber;
###     $ac->{$acipaddr}->{acname}     =$acname;
###     $ac->{$acipaddr}->{acuser}     =$acuser;
###     $ac->{$acipaddr}->{acpasswd}   =$acpasswd;
###########################################################
sub parse_ac_export_file
{
    my $fh =shift;
    my $ac =();

    while(<$fh>)
    {
        chomp;
        $_=lc;

        # skip lines start with # and blank line
        if (/^\s*#.*$/ || /^\s*$/)
        {
            next;
        }

        # parse line
        my ($acnumber,$acname,$acipaddr,$acuser,$acpasswd)=(split /,/)[
            $ac_tab_cols{acnocol},
            $ac_tab_cols{acnamecol},
            $ac_tab_cols{acipaddcol},
            $ac_tab_cols{acusercol},
            $ac_tab_cols{acpwdcol}];
        $ac->{$acipaddr}->{acnumber}   =$acnumber;
        $ac->{$acipaddr}->{acname}     =$acname;
        $ac->{$acipaddr}->{acuser}     =$acuser;
        $ac->{$acipaddr}->{acpasswd}   =$acpasswd;
    }

    return $ac;
}

###########################################################
### parse AP file
### $ap structure:
###     $ap->{$apip}->{apid}     =$apid;
###     $ap->{$apip}->{apname}   =$apname;
###     $ap->{$apip}->{apseri}   =$apseri;
###     $ap->{$apip}->{apmac}    =$apmac;
###     $ap->{$apip}->{acname}   =$acname;
###     $ap->{$apip}->{hotname}  =$hotname;
###########################################################
sub parse_ap_export_file
{
    my $fh  =shift;
    my $ap  =();

    while (<$fh>) {
        chomp;
        $_=lc;
        if(/^\s*$/ || /^\s*#.*$/)
        {
            next;
        }
        my($apid,$apname,$apip,$apseri,$apmac,$acname,$hotname)=(split /,/)[
            $ap_tab_cols{apidcol},
            $ap_tab_cols{apnamecol},
            $ap_tab_cols{apipcol},
            $ap_tab_cols{apsericol},
            $ap_tab_cols{apmaccol},
            $ap_tab_cols{apacnamecol},
            $ap_tab_cols{hotnamecol}];
        $ap->{$apip}->{apid}     =$apid;
        $ap->{$apip}->{apname}   =$apname;
        $ap->{$apip}->{apseri}   =$apseri;
        $ap->{$apip}->{apmac}    =$apmac;
        $ap->{$apip}->{acname}   =$acname;
        $ap->{$apip}->{hotname}  =$hotname;
    }

    return $ap
}

###########################################################
### parse Hotspot file
### $hot structure:
###     $hot->{$hotname}->{hotcity}  =$hotcity;
###     $hot->{$hotname}->{hotac}    =$hotac;
###########################################################
sub parse_hot_export_file
{
    my $fh  =shift;
    my $hot  =();

    while (<$fh>) {
        chomp;
        $_=lc;
        if(/^\s*$/ || /^\s*#.*$/)
        {
            next;
        }
        my($hotcity,$hotname,$hotac)=(split /,/)[
            $hot_tab_cols{hotcitycol},
            $hot_tab_cols{hotnamecol},
            $hot_tab_cols{hotaccol}];
        $hot->{$hotname}->{hotcity}  =$hotcity;
        $hot->{$hotname}->{hotac}    =$hotac;
    }

    return $hot;
}

###########################################################
### parse the apid-apserialnumber correlation table which
### obtained from telnet interface
### $aps structure:
###     $aps->{$apserial}->{apid} = $apid
###
###     '210235A0D4C11C005261' => {
###                                 'apid' => 'dh-lcjyjdl1h-3f'
###                               },
###########################################################
sub parse_ac_aps_log
{
    my $fh   = shift;
    my $aps  = ();
    my $stat = "INIT";

    while(<$fh>)
    {
        chomp;
        $_=lc;
        if(/^\s*$/)
        {
            next;
        }
        if($stat eq "INIT" && /display +wlan +ap +all/)
        {
            $stat="HEAD";
        }
        elsif($stat eq "HEAD" && /ap name +state model +serial-id/)
        {
            $stat="SERIAL";
        }
        elsif($stat eq "SERIAL"
            && (/^\s*([\w\d\-]+)\s+([\w\d\-\/]+)\s+([\w\d\-]+)\s+([\w\d]{20})$/
            ||  /^.*more.+16d ([\w\d\-]+)\s+([\w\d\-\/]+)\s+([\w\d\-]+)\s+([\w\d]{20})$/))
        {
            $aps->{$4}->{apid}=$1;
        }
        else
        {
            # do nothing
        }
    }

    return $aps;
}

###########################################################
### parse all aps channel busy value for cooresponding ac by telnet ACs
###     for cooresponding radio
###########################################################
sub parse_channelbusy_log
{

    my $mfh  = shift;
    my $mcb  = ();
    my $stat = "INIT";

    my (
        $acip,
        $apip,
        $apid,
                        #---------------------------------------------------------
                        # AP Name            Radio ID   Channel  Tx Power (dBm)
                        #---------------------------------------------------------
        $radio_idx,     # pt-lhsamt-2      1          auto     19
                        # or #   hz-test-0129     1          auto(6)  20
                        # pt-lhsamt-2      2          6        27
                        #---------------------------------------------------------
                        #[WA2220X-AGP-hidecmd]display ar5drv 1 channelbusy
                        #ChannelBusy information
                        # Ctl Channel:    38    Channel Band: 20M
                        # Record Interval(s):  9
        $date,$time,    # Date/Month/Year: 27/05/2013
                        #       Time(h/m/s):   CtlBusy(%) TxBusy(%)  RxBusy(%)
                        # 01     20:29:57            0           0        0
                        # 02     20:29:48            0           0        0
                        # 03     20:29:39            0           0        0
                        # 04     20:29:29            0           0        0
                        # 05     20:29:20            0           0        0
                        # 06     20:29:11            0           0        0
                        # 07     20:29:02            0           0        0
                        # 08     20:28:53            0           0        0
                        # 09     20:28:44            0           0        0
                        # 10     20:28:35            0           0        0
                        # 11     20:28:26            0           0        0
                        # 12     20:28:17            0           0        0
                        # 13     20:28:08            0           0        0
                        # 14     20:27:59            0           0        0
                        # 15     20:27:49            0           0        0
                        # 16     20:27:40            0           0        0
                        # 17     20:27:31            0           0        0
                        # 18     20:27:22            0           0        0
                        # 19     20:27:13            0           0        0
                        # 20     20:27:04            0           0        0
                        # [WA2220X-AGP-hidecmd]display ar5drv 2 channelbusy
                        #ChannelBusy information
                        # Ctl Channel:    06    Channel Band: 20M
                        # Record Interval(s):  9
                        # Date/Month/Year: 27/05/2013
                        #       Time(h/m/s):   CtlBusy(%) TxBusy(%)  RxBusy(%)
                        # 01     20:29:57           15           0       14
                        # 02     20:29:48           20           0       18
                        # 03     20:29:39           16           0       15
                        # 04     20:29:29           19           0       18
                        # 05     20:29:20           20           0       19
                        # 06     20:29:11           25           0       23
                        # 07     20:29:02           21           0       19
                        # 08     20:28:53           21           0       20
                        # 09     20:28:44           22           0       21
                        # 10     20:28:35           22           0       21
                        # 11     20:28:26           20           0       19
                        # 12     20:28:17           10           0        9
                        # 13     20:28:08           16           0       15
                        # 14     20:27:59           29           0       28
                        # 15     20:27:49           26           0       25
                        # 16     20:27:40           27           0       26
                        # 17     20:27:31           23           0       22
                        # 18     20:27:22           10           0        9
                        # 19     20:27:13           21           0       18
                        # 20     20:27:04           20           0       18
    );
    my $cb_idx    = 0;
    my $num_radio = 0;


    #initial
    $mcb->{numradio} = 2;
    for($radio_idx=1;$radio_idx<=2;$radio_idx++)
    {
        $mcb->{radio}->{$radio_idx}->{cb}->{date}        = "NA";
        $mcb->{radio}->{$radio_idx}->{cb}->{time}        = "NA";
        $mcb->{radio}->{$radio_idx}->{cb}->{channel}     = "NA";
        $mcb->{radio}->{$radio_idx}->{cb}->{channelbusy} = "NA";
        $mcb->{radio}->{$radio_idx}->{cb}->{txbusy}      = "NA";
        $mcb->{radio}->{$radio_idx}->{cb}->{rxbusy}      = "NA";
    }

    while(<$mfh>)
    {
        chomp;
        if(/^\s*$/)
        {
            next;
        }
        elsif($stat eq "INIT"
            && /^.+#start.+ing.+busy.+\):((?:\d{1,3}\.){3}\d{1,3}),((?:\d{1,3}\.){3}\d{1,3}),(.+)###$/)
        {
            $acip  =$1;
            $apip  =$2;
            $apid  =$3;
        }
        elsif(/.*AP Name.*Radio ID.*Channel.*Tx Power/)
        {
            $stat="NUMRADIO";
        }
        elsif($stat eq "NUMRADIO")
        {
            if(/     (1|2) +auto.+ +\d+/)
            {
                $num_radio ++;
            }
            elsif(/sys/)
            {
                $mcb->{numradio} = $num_radio;
                $stat = "CHANNEL";
            }
        }
        elsif($stat eq "CHANNEL" && /display ar5drv (\d+) channelbusy/)
        {
            $radio_idx = $1;
        }
        elsif(/^ Ctl Channel:\s+(\d{2,3})\s+Channel Band.+$/)
        {
            $mcb->{radio}->{$radio_idx}->{cb}->{channel} = $1;
        }
        elsif(/^ Date\/Month\/Year:\s+(.+)$/)
        {
            $mcb->{radio}->{$radio_idx}->{cb}->{date} = $1;
            $cb_idx = 0;

            $stat="CBVALUE";
        }
        elsif($stat eq "CBVALUE")
        {
            if (/^\s+\d{2}\s+(\d+:\d+:\d+)\s+(\d+)\s+(\d+)\s+(\d+).*$/)
            {
                if (!/100/ || $cb_idx>=8)
                {
                    $mcb->{radio}->{$radio_idx}->{cb}->{time} = $1;
                    $mcb->{radio}->{$radio_idx}->{cb}->{channelbusy} = $2;
                    $mcb->{radio}->{$radio_idx}->{cb}->{txbusy} = $3;
                    $mcb->{radio}->{$radio_idx}->{cb}->{rxbusy} = $4;

                    $stat = "CHANNEL";  # next radio loop
                    if($radio_idx == $num_radio) # finish the last radio channelbusy
                    {
                        last;
                    }
                }

                $cb_idx ++;
            }
        }
        else
        {
            # do nothing
        }
    }

    return $mcb;
}

sub parse_ap_info_log
{
    my $mfh     = shift;
    my $mapinfo = ();
    my $stat    = "INIT";

    my (
        $radio_idx,
        $ssid_idx,
        $acip,
        $apip,
        $apid,
        $date,
        $time,
        $model,                 # Model                         : WA2610E-GNP
        $priority_level,        # Priority Level                : 7
        $echo_interval,         # Echo Interval(s)              : 10
        $tran_ctl_pkts,         # Transmitted control packets   : 828603
        $recv_ctl_pkts,         # Received control packets      : 828491
        $tran_data_pkts,        # Transmitted data packets      : 51582614
        $recv_data_pkts,        # Received data packets         : 22588714
        $conn_cnt,              # Connection Count              : 4
        $max_num_radio,         # Maximum Number of Radios      : 1
        $curr_num_radio,        # Current Number of Radios      : 1
        $client_idle_interval,  # Client Idle Interval(s)       : 3600
        $radio,                 # Radio 1:
        $bss_cnt,               #   Current BSS Count           : 2
        $num_client,            #   Running Clients Count       : 25
        $wireless_mode,         #   Wireless Mode               : 11gn
        $channel_num,           #   Configured Channel          : 6
        $power,                 #   Configured Power (dBm)      : 27
                                #   Interference (%)            : -NA-
                                #   Channel Load (%)            : -NA-
                                #   Utilization (%)             : -NA-
                                #   Co-channel Neighbor Count   : -NA-
                                #   Channel Health              : -NA-
                                #   Service Template            : 1
        $ssid,                  #     SSID                      : ChinaNet
                                #   Service Template            : 2
                                #     SSID                      : ChinaNet-PuTuo
        $support_rate,          #   Operational Rates (Mbps):
                                #     11                        : mandatory
                                #     12                        : supported
                                #     18                        : supported
                                #     24                        : supported
                                #     36                        : supported
                                #     48                        : supported
                                #     54                        : supported
        $resource_ratio,        #   Resource Using Ratio (%)    : 6
        $noise_floor            #   Noise Floor (dBm)           : -114
    );
    my $opr_rate = 0;

    #initial
    $mapinfo->{model}               = "NA";
    $mapinfo->{priority_level}      = "NA";
    $mapinfo->{echo_interval}       = "NA";
    $mapinfo->{tran_ctl_pkts}       = "NA";
    $mapinfo->{recv_ctl_pkts}       = "NA";
    $mapinfo->{tran_data_pkts}      = "NA";
    $mapinfo->{recv_data_pkts}      = "NA";
    $mapinfo->{conn_cnt}            = "NA";
    $mapinfo->{max_num_radio}       = "NA";
    $mapinfo->{curr_num_radio}      = "NA";
    $mapinfo->{client_idle_interval}= "NA";
    for($radio_idx=1;$radio_idx<=2;$radio_idx++)
    {
        $radio->{$radio_idx}->{bss_cnt}        = "NA";
        $radio->{$radio_idx}->{num_client}     = "NA";
        $radio->{$radio_idx}->{channel_num}    = "NA";
        $radio->{$radio_idx}->{power}          = "NA";
        $radio->{$radio_idx}->{resource_ratio} = "NA";
        $radio->{$radio_idx}->{wireless_mode}  = "NA";
        $radio->{$radio_idx}->{opr_rate}       = "NA";
        $radio->{$radio_idx}->{noise_floor}    = "NA";
        $radio->{$radio_idx}->{ssid}->{"1"}    = "NA";
        $radio->{$radio_idx}->{ssid}->{"2"}    = "NA";
    }
    
    while(<$mfh>)
    {
        chomp;
        if(/^\s*$/)
        {
            next;
        }
        elsif($stat eq "INIT"
            && /^.+#start processing wlan ap info.+:((?:\d{1,3}\.){3}\d{1,3}),((?:\d{1,3}\.){3}\d{1,3}),(.+)###$/)
        {
            #initialazation XXXX
            $acip  =$1;
            $apip  =$2;
            $apid  =$3;

            $stat="TIMESTAMP";
        }
        elsif($stat eq "TIMESTAMP"
            && /^.+#timestamp(.+) (.+)$/)
        {
            $mapinfo->{date} = $1;
            $mapinfo->{time} = $2;

            $stat="APINFO";
        }
        elsif($stat eq "APINFO")
        {
            if (/^ *Model.+: (.+)$/)
            {
                $mapinfo->{model} = $1;
            }
            elsif (/^ *Priority Level.+: (.+)$/)
            {
                $mapinfo->{priority_level} = $1;
            }
            elsif (/^ *Echo Interval.+: (.+)$/)
            {
                $mapinfo->{echo_interval} = $1;
            }
            elsif (/^ *Transmitted control packet.+: (.+)$/)
            {
                $mapinfo->{tran_ctl_pkts}= $1;
            }
            elsif (/^ *Received control packets.+: (.+)$/)
            {
                $mapinfo->{recv_ctl_pkts}= $1;
            }
            elsif (/^ *Transmitted data packets.+: (.+)$/)
            {
                $mapinfo->{tran_data_pkts}= $1;
            }
            elsif (/^ *Received data packet.+: (.+)$/)
            {
                $mapinfo->{recv_data_pkts}= $1;
            }
            elsif (/^ *Connection Coun.+: (.+)$/)
            {
                $mapinfo->{conn_cnt}= $1;
            }
            elsif (/^ *Maximum Number of Radios.+: (.+)$/)
            {
                $mapinfo->{max_num_radio}= $1;
            }
            elsif (/^ *Current Number of Radios.+: (.+)$/)
            {
                $mapinfo->{curr_num_radio}= $1;
            }
            elsif (/^ *Client Idle Interval.+: (.+)$/)
            {
                $mapinfo->{client_idle_interval}= $1;

                $stat="RADIO";
            }
        }
        elsif($stat eq "RADIO")
        {
            if(/^ *Radio *(\d+):.*$/)
            {
                $radio_idx = $1;
            }
            elsif(/^ *Current BSS Coun.+: (.+)$/)
            {
                $radio->{$radio_idx}->{bss_cnt} = $1;
            }
            elsif(/^ *Running Clients Count.+: (.+)$/)
            {
                $radio->{$radio_idx}->{num_client} = $1;
            }
            elsif(/^ *Configured Channel.+: (.+)$/)
            {
                $radio->{$radio_idx}->{channel_num} = $1;
            }
            elsif(/^ *Configured Power.+: (.+)$/)
            {
                $radio->{$radio_idx}->{power} = $1;
            }
            elsif(/^.*Service Template.+: (.+)$/)
            {
                $ssid_idx = $1;
            }
            elsif(/^ *SSID.+: (.+)$/)
            {
                $radio->{$radio_idx}->{ssid}->{$ssid_idx} = $1;
            }
            elsif(/^ *Resource Using Ratio.+: (.+)$/)
            {
                $radio->{$radio_idx}->{resource_ratio} = $1;
            }
            elsif(/^ *Wireless Mode.+: (.+)$/)
            {
                $radio->{$radio_idx}->{wireless_mode} = $1;
            }
            elsif(/Operational Rates/)
            {
                $opr_rate = 1;
            }
            elsif($opr_rate==1 && /^ +(\d+\.*\d*) +: (mandatory|supported)$/)
            {
                $radio->{$radio_idx}->{opr_rate} = $1;
                $opr_rate = 0;
            }
            elsif(/^ *Noise Floor.+: (.+)$/)
            {
                $radio->{$radio_idx}->{noise_floor} = $1;
                #if($radio_idx eq $mapinfo->{curr_num_radio})
                #{
                #    $stat = "FINISH";
                #    last;
                #}
            }
        }
        else
        {
            # do nothing
        }
    }
    $mapinfo->{radio} = $radio;

    return $mapinfo;
}


sub parse_ap_clients_info_log
{
    my $mfh        = shift;
    my $mapcltinfo = ();
    my $stat       = "INIT";

    my (
        $acip,
        $apip,
        $apid,
        $date,
        $time,
        $num_client,                        # Total Number of Clients           : 3
                                            #                              Client Information
                                            # MAC Address                       : 0016-6dd2-4934
                                            # User Name                         : -NA-
                                            # AID                               : 1
                                            # AP Name                           : pt-ptskymt-ap1
        $radio_idx,                         # Radio Id                          : 1
                                            # SSID                              : ChinaNet
                                            # BSSID                             : c4ca-d9ea-2510
                                            # Port                              : WLAN-DBSS1:962
                                            # VLAN                              : 1020
                                            # State                             : Running
                                            # Power Save Mode                   : Sleep
                                            # Wireless Mode                     : 11gn
                                            # Channel Band-width                : 20MHz
                                            # SM Power Save Enable              : Disabled
                                            # Short GI for 20MHz                : Not Supported
                                            # Short GI for 40MHz                : Not Supported
                                            # Support MCS Set                   : 0,1,2,3,4,5,6,7
                                            # BLOCK ACK-TID 0                   : BOTH
                                            # QoS Mode                          : WMM
                                            # Listen Interval (Beacon Interval) : 10
        $rssi,                              # RSSI                              : 19
        $rx_rate,$tx_rate                   # Rx/Tx Rate                        : 26/65
                                            # Client Type                       : PRE-RSNA
                                            # Authentication Method             : Open System
                                            # Authentication Mode               : Central
                                            # AKM Method                        : None
                                            # 4-Way Handshake State             : -NA-
                                            # Group Key State                   : -NA-
                                            # Encryption Cipher                 : Clear
                                            # Roam Status                       : Normal
                                            # Roam Count                        : 0
                                            # Up Time (hh:mm:ss)                : 00:18:58


    );

    while(<$mfh>)
    {
        chomp;
        if(/^\s*$/)
        {
            next;
        }
        elsif($stat eq "INIT"
            && /^.+#start processing.+:((?:\d{1,3}\.){3}\d{1,3}),((?:\d{1,3}\.){3}\d{1,3}),(.+)###$/)
        {
            #initialazation
            $acip  =$1;
            $apip  =$2;
            $apid  =$3;

            $stat="TIMESTAMP";
        }
        elsif($stat eq "TIMESTAMP"
            && /^.+#timestamp(.+) (.+)$/)
        {
            $mapcltinfo->{date} = $1;
            $mapcltinfo->{time} = $2;

            $stat="NUMCLIENTS";
        }
        elsif($stat eq "NUMCLIENTS" && /^ *Total Number of Clients.+: (.+)$/)
        {
            $mapcltinfo->{num_client} = $1;
        
            $stat="CLIENT";
        }
        elsif($stat eq "CLIENT")
        {
            if (/^ *Radio Id.+: (.+)$/)
            {
                $radio_idx = $1;

                $mapcltinfo->{radio}->{$radio_idx}->{tnum_client} ++;
            }
            elsif (/^ *RSSI.+: (.+)$/)
            {
                $mapcltinfo->{radio}->{$radio_idx}->{avg_rssi} += ($1-90.);
            }
            elsif (/^ *Rx\/Tx Rate.+: (.+)\/(.+)$/)
            {
                $mapcltinfo->{radio}->{$radio_idx}->{avg_rx_rate} += ($1+0.0);
                $mapcltinfo->{radio}->{$radio_idx}->{avg_tx_rate} += ($2+0.0);
            }
        }
        else
        {
            # do nothing
        }
    }

    for($radio_idx=1;$radio_idx<=2;$radio_idx++)
    {
        my $radio = $mapcltinfo->{radio}->{$radio_idx};
        if(defined $radio->{tnum_client} && $radio->{tnum_client} > 0)
        {
            $radio->{avg_rssi}    /= $radio->{tnum_client};
            $radio->{avg_rx_rate} /= $radio->{tnum_client};
            $radio->{avg_tx_rate} /= $radio->{tnum_client};
        }
        else
        {
            $radio->{avg_rssi}    = "NA";
            $radio->{avg_rx_rate} = "NA";
            $radio->{avg_tx_rate} = "NA";
        }
        $mapcltinfo->{radio}->{$radio_idx}=$radio;
        delete $mapcltinfo->{radio}->{$radio_idx}->{tnum_client};
    }

    return $mapcltinfo;
}

sub parse_connect_history_log
{
    my $mfh        = shift;
    my $mconnhist  = ();
    my $stat       = "INIT";

    my (
        $acip,
        $apip,
        $apid,
        $date,
        $time,
                              #      Connection History
                              # AP Name                        : pt-ptskymt-ap1
        $assoc_hist,          # Associations                   : 13360
        $reassoc_hist,        # Reassociations                 : 3396
        $assoc_fail_hist,     # Failures                       : 22
                              # Rejections                     : 0
        $except_deauth_hist   # Exceptional Deauthentication   : 2168
                              # Current Associations           : 2
    );

    #initial
    $mconnhist->{assoc_hist}         = "NA";
    $mconnhist->{reassoc_hist}       = "NA";
    $mconnhist->{assoc_fail_hist}    = "NA";
    $mconnhist->{except_deauth_hist} = "NA";

    while(<$mfh>)
    {
        chomp;
        if(/^\s*$/)
        {
            next;
        }
        elsif($stat eq "INIT"
            && /^.+#start processing.+:((?:\d{1,3}\.){3}\d{1,3}),((?:\d{1,3}\.){3}\d{1,3}),(.+)###$/)
        {
            #initialazation
            $acip  =$1;
            $apip  =$2;
            $apid  =$3;

            $stat="TIMESTAMP";
        }
        elsif($stat eq "TIMESTAMP"
            && /^.+#timestamp(.+) (.+)$/)
        {
            $mconnhist->{date} = $1;
            $mconnhist->{time} = $2;

            $stat="CONNHIST";
        }
        elsif($stat eq "CONNHIST")
        {
            if (/^ *Associations.+: (.+)$/)
            {
                $mconnhist->{assoc_hist} = $1;
            }
            elsif (/^ *Reassociations.+: (.+)$/)
            {
                $mconnhist->{reassoc_hist} = $1;
            }
            elsif (/^ *Failures.+: (.+)$/)
            {
                $mconnhist->{assoc_fail_hist} = $1;
            }
            elsif (/^ *Exceptional Deauthentication.+: (.+)$/)
            {
                $mconnhist->{except_deauth_hist} = $1;
            }
        }
        else
        {
            # do nothing
        }
    }

    return $mconnhist;
}

sub parse_radio_statistics_log
{
    my $mfh         = shift;
    my $mradiostat  = ();
    my $stat        = "INIT";

    my (
        $acip,
        $apip,
        $apid,
        $date,
        $time,
                                #    			        Radio Statistics
        $radio_idx,             # AP Name: pt-ptskymt-ap1                        Radio Id: 1
        $transmit,$frame_type,  # Transmitted Frames Statistics:
        $total_frame,           #   Total Frames (Frames/Bytes)               : 55083182/1132153946
        $unicast_frame,         #   Unicast Frames (Frames/Bytes)             : 31932129/21956044
        $broad_multi_frame,     #   Broadcast/Multicast Frames (Frames/Bytes) : 2495217/330317058
        $others_frame,          #   Others (Frames/Bytes)/management frames   : 20655836/779880844
        $discard_frame,         #   Discarded Frames                : 178587     Failed RTS         : 25
        $retry_frame,           #   Retry Count (frames)            : 20313614   Successful RTS     : 1682
                                #   Multiple Retry Count (frames)   : 9936095    Failed ACK         : 29489857
                                #   Authentication Frames           : 18486      Association Frames : 17327
                                #
                                #   Packet Statistics Based on Size:
        $le_128,                #     Smaller than or equal to 128            : 16250786
        $between_128_512,       #     Between 128 and 512 (inclusive)         : 21377573
        $between_512_1024,      #     Between 512 and 1024 (inclusive)        : 586212
        $gt_1024,               #     Larger than 1024                        : 26731932
                                #
        $packet_rate,$mode,     #   Packet Statistics Based on Rate:
                                #         1 Mbps                    : 22293287            2 Mbps    : 0
                                #       5.5 Mbps                    : 0                   6 Mbps    : 0
                                #         9 Mbps                    : 0                  11 Mbps    : 33079130
                                #        12 Mbps                    : 11194              18 Mbps    : 20988
                                #        24 Mbps                    : 30949              36 Mbps    : 86769
                                #        48 Mbps                    : 10336              54 Mbps    : 12767
                                #
                                #   Packet Statistics Based on 802.11n Rate:
                                #       6.5 Mbps                    : 1222154            13 Mbps    : 164043
                                #      13.5 Mbps                    : 0                  15 Mbps    : 0
                                #      19.5 Mbps                    : 392653             26 Mbps    : 391398
                                #        27 Mbps                    : 0                  30 Mbps    : 0
                                #        39 Mbps                    : 1583652          40.5 Mbps    : 0
                                #        45 Mbps                    : 0                  52 Mbps    : 3232866
                                #        54 Mbps                    : 0                58.5 Mbps    : 2633151
                                #        60 Mbps                    : 0                  65 Mbps    : 4350954
                                #      72.2 Mbps                    : 0                  78 Mbps    : 0
                                #        81 Mbps                    : 0                  90 Mbps    : 0
                                #       104 Mbps                    : 0                 108 Mbps    : 0
                                #       117 Mbps                    : 0                 120 Mbps    : 0
                                #     121.5 Mbps                    : 0                 130 Mbps    : 0
                                #       135 Mbps                    : 0               144.4 Mbps    : 0
                                #       150 Mbps                    : 0                 156 Mbps    : 0
                                #       162 Mbps                    : 0               173.3 Mbps    : 0
                                #     175.5 Mbps                    : 0                 180 Mbps    : 0
                                #       195 Mbps                    : 0                 216 Mbps    : 0
                                #     216.7 Mbps                    : 0                 240 Mbps    : 0
                                #       243 Mbps                    : 0                 270 Mbps    : 0
                                #       300 Mbps                    : 0                 324 Mbps    : 0
                                #       360 Mbps                    : 0               364.5 Mbps    : 0
                                #       405 Mbps                    : 0                 450 Mbps    : 0
                                # Received Frames Statistics:
                                #   Total Frames (Frames/Bytes)               : 37747749/2096462400
                                #   Unicast Frames (Frames/Bytes)             : 25412521/611322034
                                #   Broadcast/Multicast Frames (Frames/Bytes) : 12335228/1485140366
                                #   Fragmented Frames               : 6          Duplicate Frames   : 571
         $fcs_fail,             #   FCS Failures                    : 152146546  Decryption Errors  : 2755
                                #   Authentication Frames           : 18486      Association Frames : 17327
                                #
                                #   Packet Statistics Based on Size:
                                #     Smaller than or equal to 128            : 32369913
                                #     Between 128 and 512 (inclusive)         : 2675126
                                #     Between 512 and 1024 (inclusive)        : 234688
                                #     Larger than 1024                        : 2015117
                                #
                                #   Packet Statistics Based on Rate:
                                #         1 Mbps                    : 11598056            2 Mbps    : 5332
                                #       5.5 Mbps                    : 15294               6 Mbps    : 109712
                                #         9 Mbps                    : 633                11 Mbps    : 431509
                                #        12 Mbps                    : 2919               18 Mbps    : 9867
                                #        24 Mbps                    : 9113               36 Mbps    : 29652
                                #        48 Mbps                    : 32411              54 Mbps    : 37539
                                #
                                #   Packet Statistics Based on 802.11n Rate:
                                #       6.5 Mbps                    : 1795167            13 Mbps    : 3258371
                                #      13.5 Mbps                    : 0                  15 Mbps    : 0
                                #      19.5 Mbps                    : 2928542            26 Mbps    : 5161057
                                #        27 Mbps                    : 0                  30 Mbps    : 0
                                #        39 Mbps                    : 4407630          40.5 Mbps    : 0
                                #        45 Mbps                    : 0                  52 Mbps    : 2241046
                                #        54 Mbps                    : 10739            58.5 Mbps    : 1347506
                                #        60 Mbps                    : 0                  65 Mbps    : 2208367
                                #      72.2 Mbps                    : 0                  78 Mbps    : 0
                                #        81 Mbps                    : 0                  90 Mbps    : 0
                                #       104 Mbps                    : 0                 108 Mbps    : 0
                                #       117 Mbps                    : 0                 120 Mbps    : 0
                                #     121.5 Mbps                    : 0                 130 Mbps    : 0
                                #       135 Mbps                    : 0               144.4 Mbps    : 0
                                #       150 Mbps                    : 0                 156 Mbps    : 0
                                #       162 Mbps                    : 0               173.3 Mbps    : 0
                                #     175.5 Mbps                    : 0                 180 Mbps    : 0
                                #       195 Mbps                    : 0                 216 Mbps    : 0
                                #     216.7 Mbps                    : 0                 240 Mbps    : 0
                                #       243 Mbps                    : 0                 270 Mbps    : 0
                                #       300 Mbps                    : 0                 324 Mbps    : 0
                                #       360 Mbps                    : 0               364.5 Mbps    : 0
                                #       405 Mbps                    : 0                 450 Mbps    : 0
    );



    #initial
    foreach $frame_type (@gr_frametype)
    {
        for($radio_idx=1;$radio_idx<=2;$radio_idx++)
        {
            my @frm; ($frame_type eq "transmit")?(@frm=@gr_transmit):(@frm=@gr_receive);
            foreach my $r (@frm)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{$r} = "NA";
            }

            $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{size}->{le_128}            = "NA";
            $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{size}->{between_128_512}   = "NA";
            $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{size}->{between_512_1024}  = "NA";
            $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{size}->{gt_1024}           = "NA";
            $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{size}->{gt_1024}           = "NA";

            foreach my $r (@gr_11grate)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{packet_rate}->{"11g"}->{$r} ="NA";
            }

            foreach my $r (@gr_11nrate)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{packet_rate}->{"11n"}->{$r} ="NA";
            }
        }
    }

    while(<$mfh>)
    {
        chomp;
        if(/^\s*$/)
        {
            next;
        }
        elsif($stat eq "INIT"
            && /^.+#start processing.+:((?:\d{1,3}\.){3}\d{1,3}),((?:\d{1,3}\.){3}\d{1,3}),(.+)###$/)
        {
            #initialazation
            $acip  =$1;
            $apip  =$2;
            $apid  =$3;

            $stat="TIMESTAMP";
        }
        elsif($stat eq "TIMESTAMP"
            && /^.+#timestamp(.+) (.+)$/)
        {
            $mradiostat->{date} = $1;
            $mradiostat->{time} = $2;

            $stat="RADIO";
        }
        elsif($stat eq "RADIO")
        {
            if (/^.+Radio Id.*: (.+)$/)
            {
                $radio_idx = $1;
            }
            elsif (/Transmitted Frames Statistics/)
            {
                $frame_type = "transmit";
            }
            elsif (/Received Frames Statistics/)
            {
                $frame_type = "receive";
            }
            elsif (/^.*Total Frames.*: (.+)\/(.+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{total_frame} = $1;
            }
            elsif (/^.*Unicast Frames.*: (.+)\/(.+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{unicast_frame} = $1;
            }
            elsif (/^.*Broadcast\/Multicast Frames.*: (.+)\/(.+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{broad_multi_frame} = $1;
            }
            elsif (/^.*Others.*: (.+)\/(.+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{others_frame} = $1;
            }
            elsif (/^.*Discarded Frames.*: (\d+).+: (\d+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{discard_frame} = $1;
            }
            elsif (/^.*Retry Count.*: (\d+).+: (\d+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{retry_frame} = $1;
            }
            elsif (/^.*Smaller than or equal to 128.*: (.+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{size}->{le_128} = $1;
            }
            elsif (/^.*Between 128 and 512.*: (.+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{size}->{between_128_512} = $1;
            }
            elsif (/^.*Between 512 and 1024.*: (.+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{size}->{between_512_1024} = $1;
            }
            elsif (/^.*Larger than 1024.*: (.+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{size}->{gt_1024} = $1;
            }
            elsif (/^.*FCS Failures.*: (\d+).+: (\d+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{size}->{gt_1024} = $1;
            }
            elsif (/Packet Statistics Based on Size/)
            {
                $mode = "11g";
            }
            elsif (/Packet Statistics Based on 802.11n Rate/)
            {
                $mode = "11n";
            }
            elsif (/^.*(\d+\.*\d*) Mbps *: (\d+) *(\d+\.*\d*) Mbps *: (\d+)$/)
            {
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{packet_rate}->{$mode}->{$1} = $2;
                $mradiostat->{radio}->{$radio_idx}->{$frame_type}->{packet_rate}->{$mode}->{$3} = $4;
            }
        }
        else
        {
            # do nothing
        }
    }

    return $mradiostat;

}

sub parse_client_info_log
{
    my $mfh      = shift;
    my $mcltinfo = ();
    my $stat     = "INIT";

    my (
        $acip,
        $apip,
        $apid,
        $date,
        $time,
                                            # Total Number of Clients           : 1
                                            #                              Client Information
                                            # MAC Address                       : 0016-6dd2-4934
                                            # User Name                         : -NA-
                                            # AID                               : 1
                                            # AP Name                           : pt-ptskymt-ap1
        $radio_idx,                         # Radio Id                          : 1
        $ssid,                              # SSID                              : ChinaNet
                                            # BSSID                             : c4ca-d9ea-2510
                                            # Port                              : WLAN-DBSS1:962
                                            # VLAN                              : 1020
                                            # State                             : Running
        $power_mode,                        # Power Save Mode                   : Sleep
        $wireless_mode,                     # Wireless Mode                     : 11gn
                                            # Channel Band-width                : 20MHz
                                            # SM Power Save Enable              : Disabled
                                            # Short GI for 20MHz                : Not Supported
                                            # Short GI for 40MHz                : Not Supported
                                            # Support MCS Set                   : 0,1,2,3,4,5,6,7
                                            # BLOCK ACK-TID 0                   : BOTH
                                            # QoS Mode                          : WMM
                                            # Listen Interval (Beacon Interval) : 10
        $rssi,                              # RSSI                              : 19
        $rx_rate,$tx_rate                   # Rx/Tx Rate                        : 26/65
                                            # Client Type                       : PRE-RSNA
                                            # Authentication Method             : Open System
                                            # Authentication Mode               : Central
                                            # AKM Method                        : None
                                            # 4-Way Handshake State             : -NA-
                                            # Group Key State                   : -NA-
                                            # Encryption Cipher                 : Clear
                                            # Roam Status                       : Normal
                                            # Roam Count                        : 0
                                            # Up Time (hh:mm:ss)                : 00:18:58


    );

    while(<$mfh>)
    {
        chomp;
        if(/^\s*$/)
        {
            next;
        }
        elsif($stat eq "INIT"
            && /^.+#start processing.+:((?:\d{1,3}\.){3}\d{1,3}),((?:\d{1,3}\.){3}\d{1,3}),(.+)###$/)
        {
            #initialazation
            $acip  =$1;
            $apip  =$2;
            $apid  =$3;

            $stat="TIMESTAMP";
        }
        elsif($stat eq "TIMESTAMP"
            && /^.+#timestamp(.+) (.+)$/)
        {
            $mcltinfo->{date} = $1;
            $mcltinfo->{time} = $2;

            $stat="CLIENT";
        }
        elsif($stat eq "CLIENT")
        {
            if (/^ *Radio Id.+: (.+)$/)
            {
                $mcltinfo->{radioid} = $1;
            }
            elsif (/^ *RSSI.+: (.+)$/)
            {
                $mcltinfo->{rssi} = $1-90.;
            }
            elsif (/^ *Power Save Mode.+: (.+)$/)
            {
                $mcltinfo->{power_mode} = $1;
            }
            elsif (/^ *Wireless Mode .+: (.+)$/)
            {
                $mcltinfo->{wireless_mode} = $1;
            }
            elsif (/^ *SSID.+: (.+)$/)
            {
                $mcltinfo->{ssid} = $1;
            }
            elsif (/^ *Rx\/Tx Rate.+: (.+)\/(.+)$/)
            {
                $mcltinfo->{rx_rate} = $1;
                $mcltinfo->{tx_rate} = $2;
            }
        }
        else
        {
            # do nothing
        }
    }

    return $mcltinfo;
}

sub gen_ac_kpis()
{
    my $macap = shift;
    my $mkpis = shift;

    if (!defined $mkpis) { return; }
    my $mackpis = ();

    foreach my $acip (keys %$macap) {
        my $anac = $macap->{$acip};

        $mackpis->{$acip}->{acnumber} = $anac->{acnumber};
        $mackpis->{$acip}->{acname}   = $anac->{acname};
        my $numradio = 0;
        my $numrec   = 0;
        my $firstap  = 1;
        foreach my $apip (keys %$anac) {
            if($apip =~ /(acname|acnumber|acuser|acpasswd)/) { next; }
            my $anap   = $anac->{$apip};
            my $apid   = $anap->{apid};
            my $mapkpi = $mkpis->{$acip}->{$apip};
            my $mradio = $mapkpi->{radio};

            $numradio = $mapkpi->{numradio};
            $numradio = 1 if (!defined $numradio && $numradio eq 0);

            if (!defined $apid) { next; }

            if($firstap==1)
            {
                $mackpis->{$acip}->{date} = $mapkpi->{date};
                $mackpis->{$acip}->{time} = $mapkpi->{time};
                $firstap = 0;
            }

            #!!!!!!!!!!!!!!!!!!!!!!
            # WARNING : Useless use of hash element in void context
            # in order to create $mackpis->{$acip}->{cb}
            {
                $mackpis->{$acip}->{cb}->{channelbusy}            =0;
                $mackpis->{$acip}->{transmit}->{size}->{le_128}   =0;
                $mackpis->{$acip}->{receive}->{size}->{le_128}    =0;
            }

            &accu_value_arr($mackpis->{$acip},$mapkpi,\@gap);
            &accu_value_arr($mackpis->{$acip}, $mradio->{$numradio}, \@gr2);
            &accu_value_arr($mackpis->{$acip}->{cb}, $mradio->{$numradio}->{cb}, \@gr_cb);
            &accu_value_arr($mackpis->{$acip}->{transmit},
                $mradio->{$numradio}->{transmit}, \@gr_transmit);
            &accu_value_arr($mackpis->{$acip}->{transmit}->{size},
                $mradio->{$numradio}->{transmit}->{size},\@gr_pkt_size);

            #&accu_value_arr($mackpis->{$acip}->{transmit}->{packet_rate}->{"11g"},
            #    $mradio->{$numradio}->{transmit}->{packet_rate}->{"11g"}, \@gr_11grate);
            #&accu_value_arr($mackpis->{$acip}->{transmit}->{packet_rate}->{"11n"},
            #   $mradio->{$numradio}->{transmit}->{packet_rate}->{"11n"}, \@gr_11nrate);
            &accu_value_arr($mackpis->{$acip}->{receive},
                $mradio->{$numradio}->{receive}, \@gr_receive);
            &accu_value_arr($mackpis->{$acip}->{receive}->{size},
                $mradio->{$numradio}->{receive}->{size}, \@gr_pkt_size);
            #&accu_value_arr($mackpis->{$acip}->{receive}->{packet_rate}->{"11g"},
            #    $mradio->{$numradio}->{receive}->{packet_rate}->{"11g"},  \@gr_11grate);
            #&accu_value_arr($mackpis->{$acip}->{receive}->{packet_rate}->{"11n"},
            #    $mradio->{$numradio}->{receive}->{packet_rate}->{"11n"},  \@gr_11nrate);

            $numrec++;
        }

        &aver_value_arr($mackpis->{$acip}, \@gr2, $numrec);
        &aver_value_arr($mackpis->{$acip}->{cb}, \@gr_cb, $numrec);
    }

    return $mackpis;
}


sub gen_hot_kpis()
{
    my $macap = shift;
    my $mkpis = shift;

    if (!defined $mkpis) { return; }
    my $mhotkpis = ();

    foreach my $acip (keys %$macap) {
        my $anac = $macap->{$acip};

        my $numradio;
        foreach my $apip (keys %$anac) {
            if($apip =~ /(acname|acnumber|acuser|acpasswd)/) { next; }
            my $anap   = $anac->{$apip};
            my $apid   = $anap->{apid};
            my $mapkpi = $mkpis->{$acip}->{$apip};
            my $mradio = $mapkpi->{radio};

            $numradio = $mapkpi->{numradio};
            $numradio = 1 if ( !defined $numradio || $numradio == 0 );

            if (!defined $apid) { next; }

            my $hotname = $anap->{hotname};

            # record the date and time of abstracting first ap's kpi
            if(!defined $mhotkpis->{$hotname}->{firstap})
            {
                $mhotkpis->{$hotname}->{date} = $mapkpi->{date};
                $mhotkpis->{$hotname}->{time} = $mapkpi->{time};
                $mhotkpis->{$hotname}->{firsap} = 1;
            }

            #!!!!!!!!!!!!!!!!!!!!!!
            # WARNING : Useless use of hash element in void context
            # in order to create $mhotkpis->{$hotname}->{cb}
            {
                $mhotkpis->{$hotname}->{cb}->{channelbusy}           =0;
                $mhotkpis->{$hotname}->{transmit}->{size}->{le_128}  =0;
                $mhotkpis->{$hotname}->{receive}->{size}->{le_128}   =0;
            }

            &accu_value_arr($mhotkpis->{$hotname},$mapkpi,\@gap);
            &accu_value_arr($mhotkpis->{$hotname}, $mradio->{$numradio}, \@gr2);
            &accu_value_arr($mhotkpis->{$hotname}->{cb}, $mradio->{$numradio}->{cb}, \@gr_cb);
            &accu_value_arr($mhotkpis->{$hotname}->{transmit}, $mradio->{$numradio}->{transmit}, \@gr_transmit);
            &accu_value_arr($mhotkpis->{$hotname}->{transmit}->{size}, $mradio->{$numradio}->{transmit}->{size},\@gr_pkt_size);
            #&accu_value_arr($mhotkpis->{$hotname}->{transmit}->{packet_rate}->{"11g"},
            #    $mradio->{$numradio}->{transmit}->{packet_rate}->{"11g"}, \@gr_11grate);
            #&accu_value_arr($mhotkpis->{$hotname}->{transmit}->{packet_rate}->{"11n"},
            #   $mradio->{$numradio}->{transmit}->{packet_rate}->{"11n"}, \@gr_11nrate);
            &accu_value_arr($mhotkpis->{$hotname}->{receive}, $mradio->{$numradio}->{receive}, \@gr_receive);
            &accu_value_arr($mhotkpis->{$hotname}->{receive}->{size}, $mradio->{$numradio}->{receive}->{size}, \@gr_pkt_size);
            #&accu_value_arr($mhotkpis->{$hotname}->{receive}->{packet_rate}->{"11g"},
            #    $mradio->{$numradio}->{receive}->{packet_rate}->{"11g"},  \@gr_11grate);
            #&accu_value_arr($mhotkpis->{$hotname}->{receive}->{packet_rate}->{"11n"},
            #    $mradio->{$numradio}->{receive}->{packet_rate}->{"11n"},  \@gr_11nrate);

            $mhotkpis->{$hotname}->{numrec} ++ ;
        }
    }

    foreach my $hotname (keys %$mhotkpis) {
        my $numrec = $mhotkpis->{$hotname}->{numrec};
        if (defined $numrec)
        {
            &aver_value_arr($mhotkpis->{$hotname},\@gr2, $numrec);
            &aver_value_arr($mhotkpis->{$hotname}->{cb}, \@gr_cb, $numrec);
        }
        else
        {
            $numrec = 0;
        }

        delete $mhotkpis->{$hotname}->{firsap};
        delete $mhotkpis->{$hotname}->{numrec};
    }

    return $mhotkpis;
}


##########################################################
#  need to set different background colors
#
##########################################################
sub print_results_aps
{
    my $outobj= $_[0];  # filehandler / workbook
    my $macap = $_[1];
    my $mkpis = $_[2];

    if (!defined $mkpis) { return; }

    my $isxls = 0;
    if(ref $outobj eq 'Spreadsheet::WriteExcel') { $isxls=1; }
    else                                         { $isxls=0; }

    my ($anac,
        $acname,
        $acnumber,
        $hotname,
        $apid,
        $apname,
        $apmac,
        $date,
        $time,
    );

    my $format;
    if($isxls)
    {
        $format  = $outobj->add_format(
           bold     => 1,
           color    => 'orange',
           bg_color => 'silver',
           size     => 11,
           merge    => 1,
           align    => 'center',
           valign   => 'vcenter',
           );
    }
    my @headings = ();
    push(@headings,"acname");
    push(@headings,"acnumber");
    push(@headings,"hotname");
    push(@headings,"apid");
    push(@headings,"apname");
    push(@headings,"apmac");
    push(@headings,"date");
    push(@headings,"time");
    #ap informatio);
    push(@headings,&gen_key_arr("",                                 \@gap));
    push(@headings,&gen_key_arr("",                                 \@gap2));
    #radio 1 informatio);
    push(@headings,&gen_key_arr("radio1_",                          \@gr));
    push(@headings,&gen_key_arr("radio1_",                          \@gr2));
    push(@headings,&gen_key_arr("radio1_cb_",                       \@gr_cb));
    push(@headings,"radio1_"."bss_cnt");
    push(@headings,"radio1_"."ssid_1");
    push(@headings,"radio1_"."ssid_2");
    push(@headings,&gen_key_arr("radio1_"."transmit_",              \@gr_transmit));
    push(@headings,&gen_key_arr("radio1_"."transmit_size_",         \@gr_pkt_size));
    #push(@headings,&gen_key_arr("radio1_transmit_packet_rate_11g_", \@gr_11grate));
    #push(@headings,&gen_key_arr("radio1_transmit_packet_rate_11n_", \@gr_11nrate));
    push(@headings,&gen_key_arr("radio1_"."receive_",               \@gr_receive));
    push(@headings,&gen_key_arr("radio1_"."receive_size_",          \@gr_pkt_size));
    #push(@headings,&gen_key_arr("radio1_receive_packet_rate_11g_",  \@gr_11grate));
    #push(@headings,&gen_key_arr("radio1_receive_packet_rate_11n_",  \@gr_11nrate));

    #raido 2 informatio);
    if (ENABLED_PRINT_11N)
    {
        push(@headings,&gen_key_arr("radio2_",                           \@gr));
        push(@headings,&gen_key_arr("radio2_",                           \@gr2));
        push(@headings,&gen_key_arr("radio2_cb_",                        \@gr_cb));
        push(@headings,"radio2_"."bss_cnt");
        push(@headings,"radio2_"."ssid_1");
        push(@headings,"radio2_"."ssid_2");
        push(@headings,&gen_key_arr("radio2_"."transmit_",              \@gr_transmit));
        push(@headings,&gen_key_arr("radio2_"."transmit_size_",         \@gr_pkt_size));
        #push(@headings,&gen_key_arr("radio2_transmit_packet_rate_11g_", \@gr_11grate));
        #push(@headings,&gen_key_arr("radio2_transmit_packet_rate_11n_", \@gr_11nrate));
        push(@headings,&gen_key_arr("radio2_"."receive_",               \@gr_receive));
        push(@headings,&gen_key_arr("radio2_"."receive_size_",          \@gr_pkt_size));
        #push(@headings,&gen_key_arr("radio2_receive_packet_rate_11g_",  \@gr_11grate));
        #push(@headings,&gen_key_arr("radio2_receive_packet_rate_11n_",  \@gr_11nrate));
    }

    if($isxls)
    {
        $outobj->sheets(0)->write_row('A1', \@headings, $format);
    }
    else
    {
        print $outobj join(',',@headings) . "\n";
    }

    ## print content
    my $rowidx = 2;
    foreach my $acip (keys %$macap) {
        $anac = $macap->{$acip};
        $acname   = $anac->{acname};
        $acnumber = $anac->{acnumber};

        foreach my $apip (keys %$anac) {
            if($apip =~ /(acname|acnumber|acuser|acpasswd)/)
            {
                next;
            }

            my $anap = $anac->{$apip};
            my $mapkpi = $mkpis->{$acip}->{$apip};
            my $mradio = $mapkpi->{radio};

            $hotname  = $anap->{hotname};
            $apid     = $anap->{apid};
            $apname   = $anap->{apname};
            $apmac    = $anap->{apmac};

            if (!defined $apid) { next; }

            my @rows=();
            push(@rows,$isxls?decode("gb2312",$acname  ):$acname);
            push(@rows,$isxls?decode("gb2312",$acnumber):$acnumber);
            push(@rows,$isxls?decode("gb2312",$hotname ):$hotname);
            push(@rows,$isxls?decode("gb2312",$apid    ):$apid);
            push(@rows,$isxls?decode("gb2312",$apname  ):$apname);
            push(@rows,$apmac);
            push(@rows,$mapkpi->{date});
            push(@rows,$mapkpi->{time});
            #ap information
            push(@rows,&gen_value_arr($mapkpi,\@gap));
            push(@rows,&gen_value_arr($mapkpi,\@gap2));
            #raido 2 informatio);
            if($mapkpi->{numradio}>1)
            {
                push(@rows,&gen_value_arr($mradio->{2},       \@gr));
                push(@rows,&gen_value_arr($mradio->{2},       \@gr2));
                push(@rows,&gen_value_arr($mradio->{2}->{cb}, \@gr_cb));
                push(@rows,$mradio->{2}->{bss_cnt});
                push(@rows,$mradio->{2}->{ssid}->{1});
                push(@rows,$mradio->{2}->{ssid}->{2});
                push(@rows,&gen_value_arr($mradio->{2}->{transmit},        \@gr_transmit));
                push(@rows,&gen_value_arr($mradio->{2}->{transmit}->{size},\@gr_pkt_size));
                #push(@rows,&gen_value_arr($mradio->{2}->{transmit}->{packet_rate}->{"11g"}, \@gr_11grate));
                #push(@rows,&gen_value_arr($mradio->{2}->{transmit}->{packet_rate}->{"11n"}, \@gr_11nrate));
                push(@rows,&gen_value_arr($mradio->{2}->{receive},                          \@gr_receive));
                push(@rows,&gen_value_arr($mradio->{2}->{receive}->{size},                  \@gr_pkt_size));
                #push(@rows,&gen_value_arr($mradio->{2}->{receive}->{packet_rate}->{"11g"},  \@gr_11grate));
                #push(@rows,&gen_value_arr($mradio->{2}->{receive}->{packet_rate}->{"11n"},  \@gr_11nrate));
            }
            if($mapkpi->{numradio}==1 ||
              ($mapkpi->{numradio}>1 && ENABLED_PRINT_11N))
            {
                #radio 1 information
                push(@rows,&gen_value_arr($mradio->{1},      \@gr));
                push(@rows,&gen_value_arr($mradio->{1},      \@gr2));
                push(@rows,&gen_value_arr($mradio->{1}->{cb},\@gr_cb));
                push(@rows,$mradio->{1}->{bss_cnt});
                push(@rows,$mradio->{1}->{ssid}->{1});
                push(@rows,$mradio->{1}->{ssid}->{2});
                push(@rows,&gen_value_arr($mradio->{1}->{transmit},                        \@gr_transmit));
                push(@rows,&gen_value_arr($mradio->{1}->{transmit}->{size},                \@gr_pkt_size));
                #push(@rows,&gen_value_arr($mradio->{1}->{transmit}->{packet_rate}->{"11g"},\@gr_11grate));
                #push(@rows,&gen_value_arr($mradio->{1}->{transmit}->{packet_rate}->{"11n"},\@gr_11nrate));
                push(@rows,&gen_value_arr($mradio->{1}->{receive},                         \@gr_receive));
                push(@rows,&gen_value_arr($mradio->{1}->{receive}->{size},                 \@gr_pkt_size));
                #push(@rows,&gen_value_arr($mradio->{1}->{receive}->{packet_rate}->{"11g"}, \@gr_11grate));
                #push(@rows,&gen_value_arr($mradio->{1}->{receive}->{packet_rate}->{"11n"}, \@gr_11nrate));
            }

            if($isxls)
            {
                $outobj->sheets(0)->write_row("A$rowidx", \@rows);
            }
            else
            {
                print $outobj join(',',@rows) . "\n";
            }
            $rowidx++;
        }
    }
}

sub print_results_acs
{
    my $outobj  = $_[0];  # filehandler / workbook
    my $mackpis = $_[1];

    if (!defined $mackpis) { return; }

    my $isxls = 0;
    if(ref $outobj eq 'Spreadsheet::WriteExcel') { $isxls=1; }
    else                                         { $isxls=0; }

    my ($anackpi,
        $acname,
        $acnumber,
    );

    my $format;
    if($isxls)
    {
        $format  = $outobj->add_format(
           bold     => 1,
           color    => 'orange',
           bg_color => 'silver',
           size     => 11,
           merge    => 1,
           align    => 'center',
           valign   => 'vcenter',
           );
    }
    my @headings = ();
    push(@headings,"acname");
    push(@headings,"acnumber");
    push(@headings,"date");
    push(@headings,"time");
    #ap informatio);
    push(@headings,&gen_key_arr("",                          \@gap));
    #radio 1 informatio);
    push(@headings,&gen_key_arr("",                          \@gr2));
    push(@headings,&gen_key_arr("cb_",                       \@gr_cb));
    push(@headings,&gen_key_arr(""."transmit_",              \@gr_transmit));
    push(@headings,&gen_key_arr(""."transmit_size_",         \@gr_pkt_size));
    #push(@headings,&gen_key_arr("transmit_packet_rate_11g_", \@gr_11grate));
    #push(@headings,&gen_key_arr("transmit_packet_rate_11n_", \@gr_11nrate));
    push(@headings,&gen_key_arr(""."receive_",               \@gr_receive));
    push(@headings,&gen_key_arr(""."receive_size_",          \@gr_pkt_size));
    #push(@headings,&gen_key_arr("receive_packet_rate_11g_",  \@gr_11grate));
    #push(@headings,&gen_key_arr("receive_packet_rate_11n_",  \@gr_11nrate));

    if($isxls)
    {
        $outobj->sheets(0)->write_row('A1', \@headings, $format);
    }
    else
    {
        print $outobj join(',',@headings) . "\n";
    }

    ## print content
    my $rowidx  = 2;
    foreach my $acip (keys %$mackpis) {
        $anackpi = $mackpis->{$acip};
        $acname   = $anackpi->{acname};
        $acnumber = $anackpi->{acnumber};

        my @rows=();
        push(@rows,$isxls?decode("gb2312",$acname  ):$acname);
        push(@rows,$isxls?decode("gb2312",$acnumber):$acnumber);
        push(@rows,$anackpi->{date});
        push(@rows,$anackpi->{time});

        #ap information
        push(@rows,&gen_value_arr($anackpi,\@gap));
        push(@rows,&gen_value_arr($anackpi,       \@gr2));
        push(@rows,&gen_value_arr($anackpi->{cb}, \@gr_cb));
        push(@rows,&gen_value_arr($anackpi->{transmit},        \@gr_transmit));
        push(@rows,&gen_value_arr($anackpi->{transmit}->{size},\@gr_pkt_size));
        #push(@rows,&gen_value_arr($anackpi->{transmit}->{packet_rate}->{"11g"}, \@gr_11grate));
        #push(@rows,&gen_value_arr($anackpi->{transmit}->{packet_rate}->{"11n"}, \@gr_11nrate));
        push(@rows,&gen_value_arr($anackpi->{receive},                          \@gr_receive));
        push(@rows,&gen_value_arr($anackpi->{receive}->{size},                  \@gr_pkt_size));
        #push(@rows,&gen_value_arr($anackpi->{receive}->{packet_rate}->{"11g"},  \@gr_11grate));
        #push(@rows,&gen_value_arr($anackpi->{receive}->{packet_rate}->{"11n"},  \@gr_11nrate));

        if($isxls)
        {
            $outobj->sheets(0)->write_row("A$rowidx", \@rows);
        }
        else
        {
            print $outobj join(',',@rows) . "\n";
        }
        $rowidx++;
    }
}

sub print_results_hot
{
    my $outobj  = $_[0];  # filehandler / workbook
    my $mhotkpis = $_[1];

    if (!defined $mhotkpis) { return; }

    my $isxls = 0;
    if(ref $outobj eq 'Spreadsheet::WriteExcel') { $isxls=1; }
    else                                         { $isxls=0; }

    my $anhotkpi;

    my $format;
    if($isxls)
    {
        $format  = $outobj->add_format(
           bold     => 1,
           color    => 'orange',
           bg_color => 'silver',
           size     => 11,
           merge    => 1,
           align    => 'center',
           valign   => 'vcenter',
           );
    }
    my @headings = ();
    push(@headings,"hotname");
    push(@headings,"date");
    push(@headings,"time");
    #ap informatio);
    push(@headings,&gen_key_arr("",                          \@gap));
    #radio 1 informatio);
    push(@headings,&gen_key_arr("",                          \@gr2));
    push(@headings,&gen_key_arr("cb_",                       \@gr_cb));
    push(@headings,&gen_key_arr(""."transmit_",              \@gr_transmit));
    push(@headings,&gen_key_arr(""."transmit_size_",         \@gr_pkt_size));
    #push(@headings,&gen_key_arr("transmit_packet_rate_11g_", \@gr_11grate));
    #push(@headings,&gen_key_arr("transmit_packet_rate_11n_", \@gr_11nrate));
    push(@headings,&gen_key_arr(""."receive_",               \@gr_receive));
    push(@headings,&gen_key_arr(""."receive_size_",          \@gr_pkt_size));
    #push(@headings,&gen_key_arr("receive_packet_rate_11g_",  \@gr_11grate));
    #push(@headings,&gen_key_arr("receive_packet_rate_11n_",  \@gr_11nrate));

    if($isxls)
    {
        $outobj->sheets(0)->write_row('A1', \@headings, $format);
    }
    else
    {
        print $outobj join(',',@headings) . "\n";
    }

    ## print content
    my $rowidx  = 2;
    foreach my $hotname (keys %$mhotkpis) {
        $anhotkpi = $mhotkpis->{$hotname};

        my @rows=();
        push(@rows,$isxls?decode("gb2312",$hotname):$hotname);
        push(@rows,$anhotkpi->{date});
        push(@rows,$anhotkpi->{time});

        #ap information
        push(@rows,&gen_value_arr($anhotkpi,\@gap));
        push(@rows,&gen_value_arr($anhotkpi,       \@gr2));
        push(@rows,&gen_value_arr($anhotkpi->{cb}, \@gr_cb));
        push(@rows,&gen_value_arr($anhotkpi->{transmit},        \@gr_transmit));
        push(@rows,&gen_value_arr($anhotkpi->{transmit}->{size},\@gr_pkt_size));
        #push(@rows,&gen_value_arr($anhotkpi->{transmit}->{packet_rate}->{"11g"}, \@gr_11grate));
        #push(@rows,&gen_value_arr($anhotkpi->{transmit}->{packet_rate}->{"11n"}, \@gr_11nrate));
        push(@rows,&gen_value_arr($anhotkpi->{receive},                          \@gr_receive));
        push(@rows,&gen_value_arr($anhotkpi->{receive}->{size},                  \@gr_pkt_size));
        #push(@rows,&gen_value_arr($anhotkpi->{receive}->{packet_rate}->{"11g"},  \@gr_11grate));
        #push(@rows,&gen_value_arr($anhotkpi->{receive}->{packet_rate}->{"11n"},  \@gr_11nrate));

        if($isxls)
        {
            $outobj->sheets(0)->write_row("A$rowidx", \@rows);
        }
        else
        {
            print $outobj join(',',@rows) . "\n";
        }
        $rowidx++;
    }
}


# close file handler
close DBGFH;
close LOGFH;

