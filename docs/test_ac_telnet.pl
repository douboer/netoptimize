##################################################################################
### Test telnet 
### - Chengan 3/20/2013
##################################################################################

use warnings;
use strict;

use Net::Telnet;
use File::basename;
use File::Spec;
use Data::Dumper;

my $dbgfn      ="dbgfn";
my $logfn      ="logfn";
my $telnetdbg  ="telnetdbg";
my $telnetlog  ="telnetlog";

open DBGFH,">$dbgfn" or die "can not open file $dbgfn - $!\n";
open LOGFH,"<$logfn" or die "can not open file $logfn - $!\n";

printdbg(\*DBGFH,"\n################ ".localtime." ######################");

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
use constant TELNETDBG => 1;

# telnet to AC and abstract apid-apserialnumber table
if(0)
{
    my $username ="zsdx";
    my $passwd   ="zsdx0580";
    my $acip     ="10.145.253.82";

    my $t = new Net::Telnet(
        Timeout=>5,
        Port   =>23,
        Prompt =>'/[\]>] *$/i',
        Input_log  =>$telnetlog
    );
    $t->open($acip);
    if(TELNETDBG) { ## DBG
        $t->dump_log($telnetdbg);
    }

    $t->waitfor(-match=>'/username: *$/i'); $t->print($username);
    $t->waitfor(-match=>'/password: *$/i'); $t->print($passwd);

    ###########################################################
    # display ap information
    # ---------------------------------------------------------
    #  AP Name     State Model           Serial-ID
    # ---------------------------------------------------------
    #  dh-hsbjdmd  R/M   WA1208E-GP-H20  210235A0GNC119013872
    ###########################################################
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display wlan ap all");
    $t->print(' 'x100);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print(' ');

    ###########################################################
    #########  Net::Telnet->getlines do not work! #############
    #########  ERROR: no response !!!             #############
    ###########################################################
    #my @line = $t->getlines;
    #print @line;

    $t->close;

    open TELNETLOGFH,"<$telnetlog" or die "can not open file $telnetlog - $!\n";
    my $ap = &parse_ap_all_log(\*TELNETLOGFH);
    close TELNETLOGFH;

    use constant APDBG =>1;
    if(APDBG) { ## DBG
        &printdbg(\*DBGFH,"###################### TEST \$ap Structure ################################");
        &printdbg(\*DBGFH,Data::Dumper->Dump([\$ap],["ap"]));
    }
}
#unlink $telnetlog;
#unlink $telnetdbg;

# telnet to ac and get channelbusy log
my $username ="zsdx";
my $passwd   ="zsdx0580";
my $acip     ="10.145.253.82";
my ($apip,$apid) = ("10.150.25.51","dh-kedKTV-ap6");

my $t = new Net::Telnet(
    Timeout    =>5,
    Port       =>23,
    Prompt     =>'/[\]>] *$/i',
    Errmode    =>'return',
    Input_log  =>$telnetlog
);
if(TELNETDBG) { ## DBG
    $t->dump_log($telnetdbg);
}

my $openResult = $t->open($acip);
if (defined $openResult) {
    my $loginResult = $t->login($username, $passwd);
    if (defined $loginResult) {
        print "telnet success @!\n";
    } else {
        print "Error logging into device: '" . $t->errmsg . "' \n";
    }
    $t->close;
} else {
    print "Error connecting to device: '" . $t->errmsg . "' \n";
}

#print $t->open($acip) . "\n";
#$t->waitfor(-match=>'/username: *$/i'); $t->print($username);
#$t->waitfor(-match=>'/password: *$/i'); $t->print($passwd);
#for(my $i=1;$i<=4;$i++) {
    # channelbusy information
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###start processing channelbusy".
        "(acip,apip,apid):$acip,$apip,$apid###");  #channel busy ap start tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("sys");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("_h");

    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("wlan ap-execute $apid telnet enable");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("wlan ap-execute $apid exec-control enable");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("telnet $apip");

    ## Decimal to Hex to ASCII Converter Chart, ref - http://www.ascii.cl/
    my $cz=chr(11);  ## great!!
    $t->waitfor(-match=>'/Press CTRL\+K to abort *$/i'); $t->print($cz);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("sys");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("_h");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display ar5drv 1 channelbusy");
    $t->print(' 'x5);
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("display ar5drv 2 channelbusy");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("###stop processing channelbusy".
        "(acip,apip,apid):$acip,$apip,$apid###"); # channel busy ap stop tag
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print("quit");
    $t->waitfor(-match=>'/[\]>] *$/i'); $t->print(' ');
#}

$t->close;

#open TELNETLOGFH,"<AC-10.10.255.99_busy_99_2013031815_2.txt"
#    or die "can not open file $telnetlog - $!\n";
open TELNETLOGFH,"<$telnetlog"
    or die "can not open file $telnetlog - $!\n";
my $cb = &parse_channelbusy_log(\*TELNETLOGFH);
close TELNETLOGFH;

use constant CBDBG =>1;
if(CBDBG) { ## DBG
    &printdbg(\*DBGFH,"###################### TEST \$ap Structure ################################");
    &printdbg(\*DBGFH,Data::Dumper->Dump([\$cb],["cb"]));
}

###########################################################
#########  Net::Telnet->cmd do not work! ##################
#########  ERROR  !! cmd time-out  ??    ##################
###########################################################
##  my @lines = $t->cmd("display vlan");
##  $t->waitfor(-match=>'/> *$/i');
##  print @lines;
###########################################################

use constant CLEARFILE=>0;
if(CLEARFILE)
{
unlink $telnetlog;
unlink $telnetdbg;
}
close DBGFH;
close LOGFH;

sub parse_ap_all_log
{
    my $fh   = shift;
    my $ap   = ();
    my $stat = "INIT";

    while(<$fh>)
    {
        chomp;
        if(/^\s*$/)
        {
            next;
        }
        if($stat eq "INIT" && /display +wlan +ap +all/)
        {
            $stat="HEAD";
        }
        elsif($stat eq "HEAD" && /AP Name +State Model +Serial-ID/)
        {
            $stat="SERIAL";
        }
        elsif($stat eq "SERIAL"
            && (/^\s*([\w\d\-]+)\s+([\w\d\-\/]+)\s+([\w\d\-]+)\s+([\w\d]{20})$/
            ||  /^.*More.+16D ([\w\d\-]+)\s+([\w\d\-\/]+)\s+([\w\d\-]+)\s+([\w\d]{20})$/))
        {
            $ap->{$4}->{apid}=$1;
        }
        else
        {
            # do nothing
        }
    }

    return $ap;
}

sub parse_channelbusy_log
{
    my $fh   = shift;
    my $cb   = ();
    my $stat = "INIT";

    my (
        $idx,$found,
        $acip,
        $apip,
        $apid,
        $date,
        $time,
        $is2radio,
        $channelbusy,
        $txbusy,
        $rxbusy
    );

    while(<$fh>)
    {
        chomp;
        if(/^\s*$/)
        {
            next;
        }
        elsif($stat eq "INIT"
            && /^.+#start.+ing.+busy.+\):((?:\d{1,3}\.){3}\d{1,3}),((?:\d{1,3}\.){3}\d{1,3}),(.+)###$/)
        {
            #initialazation
            $is2radio    =0;
            $date        ="";
            $channelbusy =();
            $txbusy      =();
            $rxbusy      =();

            $acip  =$1;
            $apip  =$2;
            $apid  =$3;

            $stat="CHANNEL";
        }
        elsif($stat eq "CHANNEL"
            && /^ Ctl Channel:\s+(\d{2,3})\s+Channel Band.+$/)
        {
            ($1>11)?($is2radio=1):($is2radio=0);

            $stat="DATE";
        }
        elsif($stat eq "DATE" && /^ Date\/Month\/Year:\s+(.+)$/)
        {
            $idx   =0;
            $found =0;

            $date  =$1;

            $stat="CBVALUE";
        }
        elsif($stat eq "CBVALUE"
            && !$found
            && /^\s+\d{2}\s+(\d+:\d+:\d+)\s+(\d+)\s+(\d+)\s+(\d+).*$/)
        {

            $time=$1;

            if($is2radio) {
                $channelbusy->{dot11n} =$2;
                $txbusy->{dot11n}      =$3;
                $rxbusy->{dot11n}      =$4;
            }
            else
            {
                $channelbusy->{dot11g} =$2;
                $txbusy->{dot11g}      =$3;
                $rxbusy->{dot11g}      =$4;
            }

            $idx++;

            if(!/100/ || $idx>=8)
            {
                $found=1;
                $is2radio?($stat="CHANNEL"):($stat="FOUND");
            }
        }
        elsif(/^.+#stop.+ing.+busy.+\):((?:\d{1,3}\.){3}\d{1,3}),((?:\d{1,3}\.){3}\d{1,3}),(.+)###$/)
        {

            $cb->{$acip}->{$apip}->{apid}     =$apid;
            if($stat eq "FOUND" ||  ## found dot11g values
               $stat eq "CHANNEL")  ## no dot11g channel busy after d0t11n data
                                    ## seldom case,maybe command execute error!
            {
                # create data structure
                $cb->{$acip}->{$apip}->{date}     =$date;
                $cb->{$acip}->{$apip}->{time}     =$time;
                $cb->{$acip}->{$apip}->{is2radio} =$is2radio;
                $cb->{$acip}->{$apip}->{channelbusy}->{dot11g}  =$channelbusy->{dot11g};
                $cb->{$acip}->{$apip}->{txbusy}->{dot11g}       =$txbusy->{dot11g};
                $cb->{$acip}->{$apip}->{rxbusy}->{dot11g}       =$rxbusy->{dot11g};
                $cb->{$acip}->{$apip}->{channelbusy}->{dot11n}  =$channelbusy->{dot11n};
                $cb->{$acip}->{$apip}->{txbusy}->{dot11n}       =$txbusy->{dot11n};
                $cb->{$acip}->{$apip}->{rxbusy}->{dot11n}       =$rxbusy->{dot11n};
            }

            $stat="INIT"; # to process next ap's channel busy, until EOF
        }
        else
        {
            # do nothing
        }
    }

    return $cb;
}

sub printlog
{
    my $fh =$_[0];
    my $str   =$_[1];

    print $str."\n";
    print $fh $str."\n";
}

sub printdbg
{
    my $fh =$_[0];
    my $str   =$_[1];

    print $fh $str."\n";
}
