##################################################################################
### Test parsing export ac/ap/hotspot files functions and data structure
### - Chengan 3/20/2013
##################################################################################

use warnings;
use strict;

use Net::Telnet;
use File::basename;
use File::Spec;
use data::Dumper;

my $collectdir =shift(@ARGV);  # channel busy original data

my $acdir           =".\\AClist";
my $exportdir       =".\\exportfiles";
my $resultdir       =".\\outputs";

my $logfn           ="logfn";
my $dbgfn           ="dbgfn";

my $acexportfn      =File::Spec->catfile($exportdir,"acexportzhoushan.csv");
my $apexportfn      =File::Spec->catfile($exportdir,"apexportzhoushan.csv");
my $hotexportfn     =File::Spec->catfile($exportdir,"hotexportzhoushan.csv");

# the column number of needed information
my %ac_tab_cols =
(
    acnocol     =>0,
    acnamecol   =>1,
    acipaddcol  =>2,
    acusercol   =>8,
    acpwdcol    =>9
);
my %ap_tab_cols =
(
    apidcol     =>0,
    apnamecol   =>1,
    apipcol     =>12,
    apmaccol    =>13,
    apacnamecol =>37,
    hotnamecol  =>19
);
my %hot_tab_cols =
(
    hotcitycol    =>6,
    hotnamecol    =>2,
    hotaccol      =>32
);

open LOGFH,">$logfn" or die "can not open file $logfn - $!\n";
open DBGFH,">$dbgfn" or die "can not open file $dbgfn - $!\n";

printlog(\*LOGFH,"\n################ ".localtime." ######################");

use constant FHDBG => 0;

open ACEXPORTFN,"<$acexportfn" or die "can not open file $acexportfn- $!\n";
my $ac=&parse_ac_export_file(\*ACEXPORTFN);
print scalar (keys %$ac) ."\n";
foreach my $t (keys %$ac)
{
    my $anac=$ac->{$t};
    if(FHDBG) ## DBG
    {
    &printdbg(\*DBGFH, $t.",".$anac->{acnumber}.",".$anac->{acname}.",".$anac->{acuser}.",".$anac->{acpasswd});
    }
}
close ACEXPORTFN;

open APEXPORTFH,"<$apexportfn" or die "can not open file $apexportfn- $!\n";
my $ap=&parse_ap_export_file(\*APEXPORTFH);
print scalar (keys %$ap) ."\n";
foreach my $t (keys %$ap)
{
    my $anap=$ap->{$t};
    if(FHDBG) ## DBG
    {
    &printdbg(\*DBGFH, $t.",".$anap->{apid}.",".$anap->{apname}.",".$anap->{apmac}.",".
    $anap->{apacname}.",".$anap->{hotname});
    }
}
close APEXPORTFH;

open HOTEXPORTFH,"<$hotexportfn" or die "can not open file $hotexportfn- $!\n";
my $hot=&parse_hot_export_file(\*HOTEXPORTFH);
print scalar (keys %$hot) ."\n";
foreach my $t (keys %$hot)
{
    my $ahot=$hot->{$t};
    if(FHDBG) ## DBG
    {
    &printdbg(\*DBGFH, $t.",".$ahot->{hotcity}.",".$ahot->{hotac});
    }
}
close HOTEXPORTFH;

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
    $tac->{$acname}->{acipaddr}   =$t;
    $tac->{$acname}->{acnumber}   =$anac->{acnumber};
    $tac->{$acname}->{acuser}     =$anac->{acuser};
    $tac->{$acname}->{acpasswd}   =$anac->{acpasswd};
}
$ac=(); $ac=$tac; $tac=();

###########################################################
### change $ap to:
###     $ap->{$apip}->{apid}
###     $ap->{$apip}->{apname}
###     $ap->{$apip}->{apmac}
###     $ap->{$apip}->{hotname}
###     $ap->{$apip}->{acname}
###     $ap->{$apip}->{apmac}
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
###                         'apacname' => '华三AC定海76(主)',
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
    my $anap  =$ap->{$apip};
    my $ahot  =$hot->{$anap->{hotname}};
    my $aac   =$ac->{$anap->{apacname}};
    if(defined $ahot && defined $aac) # this ap is included in $hot list and is included $ac list
    {
        $ap->{$apip}->{$anap->{hotname}}->{hotcity}     =$ahot->{hotcity};
        $ap->{$apip}->{$anap->{hotname}}->{hotac}       =$ahot->{hotac};
        $ap->{$apip}->{$anap->{apacname}}->{acnumber}   =$aac->{acnumber};
        $ap->{$apip}->{$anap->{apacname}}->{acipaddr}   =$aac->{acipaddr};
        $ap->{$apip}->{$anap->{apacname}}->{acuser}     =$aac->{acuser};
        $ap->{$apip}->{$anap->{apacname}}->{acpasswd}   =$aac->{acpasswd};
    }
    ### clean the $ap not include in $ac && $hot list
    else
    {
        #$ap->{$apip}->{apid}     =undef;
        #$ap->{$apip}->{apname}   =undef;
        #$ap->{$apip}->{apmac}    =undef;

        delete $ap->{$apip};

        ### DBG
        #$ap->{$apip}->{flag}=-1 if(not defined $ahot);
        #$ap->{$apip}->{flag}=-2 if(not defined $aac);
    }
}
use constant APDBG => 0;
if(APDBG) ### DBG
{
&printdbg(\*DBGFH,"###################### TEST \$ap Structure ################################");
&printdbg(\*DBGFH,Data::Dumper->Dump([\$ap]));
}

##########################################################
## $acap:
##      '10.145.253.78' => {
##                           '10.151.75.198' => {
##                                                'apmac' => 'C4CAD9F47320',
##                                                'apname' => 'ap-普陀桃花射雕城金庸文化园室外-2',
##                                                'apid' => 'ap-dhhsbjcgld-21'
##                                              },
##                           '10.151.77.19' => {
##                                               'apmac' => '5866BA752760',
##                                               'apname' => 'ap-普陀东港港汇广场-32',
##                                               'apid' => 'ap-ptdgghgc-32'
##                                             },
##                           ......
##                         }
##
##########################################################
my $acap=();
foreach my $apip (keys %$ap)
{
    my $anap=$ap->{$apip};
    my $aac =$ac->{$anap->{apacname}};

    my ($apid,$apname,$apmac) = (
        $anap->{apid},
        $anap->{apname},
        $anap->{apmac}
    );
    my ($acname,$acip,$acnumber,$acuser,$acpasswd) = (
        $ac->{$anap}->{apacname},
        $aac->{acipaddr},
        $aac->{acnumber},
        $aac->{acuser},
        $aac->{acpasswd}
    );
    $acap->{$acip}->{acuser}    = $acuser;
    $acap->{$acip}->{acpasswd}  = $acpasswd;
    $acap->{$acip}->{acnumber}  = $acnumber;
    $acap->{$acip}->{acname}    = $acname;
    $acap->{$acip}->{$apip}->{apid}    = $apid;
    $acap->{$acip}->{$apip}->{apname}  = $apname;
    $acap->{$acip}->{$apip}->{apmac}   = $apmac;
}

use constant ACAPDBG => 1;
if(ACAPDBG) ### DBG
{
&printdbg(\*DBGFH,"###################### TEST \$acap Structure ################################");
&printdbg(\*DBGFH,Data::Dumper->Dump([\$acap]));
}

###########################################################
### test Net::Telnet module
### ACIP: 10.145.253.76
###     '10.150.25.51' => {
###         'apmac' => '5866BA670610',
###         'apname' => 'ap-定海凯尔登大酒店-9',
###         'apid' => 'dh-kedKTV-ap6'
###     },
###
### COMMAND:
###     sys
###     _h
###     wlan ap-execute dh-kedKTV-ap6 telnet enable
###     wlan ap-execute dh-kedKTV-ap6 exec-control enable
###     quit
###     quit
###     telnet 10.150.25.51
###     sys
###     _h
###     display ar5drv 1 channelbusy
###     display ar5drv 2 channelbusy
###     quit
###     quit
###     quit
###########################################################
use constant TELNETDBG => 0;
if (1) {
    #close DBGFH;
    #close LOGFH;
    #open DBGFH,">$dbgfn" or die "can not open file $dbgfn - $!\n";
    #open LOGFH,">$logfn" or die "can not open file $logfn - $!\n";

    my $username ="zsdx";
    my $passwd   ="zsdx0580";
    my $acip     ="10.145.253.76";
    my ($apip,$apid) = ("10.150.25.51","dh-kedKTV-ap6");

    my $t = new Net::Telnet(
        Timeout=>1,
        Port   =>23,
        Prompt =>'/[\]>] *$/i'
    );
    $t->open($acip);


    if(TELNETDBG) { ## DBG
    $t->dump_log(\*DBGFH);
    $t->input_log(\*LOGFH);
    }

    $t->waitfor(-match=>'/username: *$/i'); $t->print($username);
    $t->waitfor(-match=>'/password: *$/i'); $t->print($passwd);

    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("sys");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("_h");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("wlan ap-execute $apid telnet enable");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("wlan ap-execute $apid exec-control enable");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("telnet $apip");

    ## Decimal to Hex to ASCII Converter Chart, ref - http://techurls.tripod.com/dha.htm
    my $cz=chr(11);  ## great!!
    $t->waitfor(-match=>'/Press CTRL\+K to abort *$/i'); $t->print($cz);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("sys");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("_h");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display ar5drv 1 channelbusy");
    $t->print(' 'x5);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display ar5drv 2 channelbusy");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");

    #########   ERROR  !! cmd time-out  ??  ###################
    ###########################################################
    ##  my @lines = $t->cmd("display vlan");
    ##  $t->waitfor(-match=>'/> *$/i');
    ##  print @lines;
    ###########################################################

    $t->close;
}

close LOGFH;
close DBGFH;

###########################################################
### parse AC file
###########################################################
sub parse_ac_export_file
{
    my $fh    =shift;
    my $ac    =();

    while(<$fh>)
    {
        chomp;

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

sub parse_ap_export_file
{
    my $fh  =shift;
    my $ap  =();

    while (<$fh>) {
        chomp;
        if(/^\s*$/ || /^\s*#.*$/)
        {
            next;
        }
        my($apid,$apname,$apip,$apmac,$apacname,$hotname)=(split /,/)[
            $ap_tab_cols{apidcol},
            $ap_tab_cols{apnamecol},
            $ap_tab_cols{apipcol},
            $ap_tab_cols{apmaccol},
            $ap_tab_cols{apacnamecol},
            $ap_tab_cols{hotnamecol}];
        $ap->{$apip}->{apid}     =$apid;
        $ap->{$apip}->{apname}   =$apname;
        $ap->{$apip}->{apmac}    =$apmac;
        $ap->{$apip}->{apacname} =$apacname;
        $ap->{$apip}->{hotname}  =$hotname;
    }

    return $ap 
}

sub parse_hot_export_file
{
    my $fh  =shift;
    my $hot  =();

    while (<$fh>) {
        chomp;
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

sub printlog
{
    my $logfn =$_[0];
    my $str   =$_[1];

    print $str."\n";
    print $logfn $str."\n";
}

sub printdbg
{
    my $dbgfn =$_[0];
    my $str   =$_[1];

    print $dbgfn $str."\n";
}
