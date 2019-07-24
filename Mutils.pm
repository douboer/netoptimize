##################################################################################
### utility functions define in this file
### 
##################################################################################
### AUTHOR:  6/04/2013 Chengan
### VERSION: 6/04/2013 seperate utility functions from other .pl source files
##################################################################################

package Mutils;

use strict;
require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw(
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

use Date::Calc qw(Delta_DHMS Add_Delta_DHMS);
use File::Copy;
use File::Find;

use Socket qw(AF_INET SOCK_STREAM);

##########################################################
## print log information to log file and STDOUT
##########################################################
sub printlog
{
    my $logfh =$_[0];
    my $str   =$_[1];

    print $str."\n";
    print $logfh $str."\n";
}

##########################################################
## print debug information to debug file, such as Dumper info
##########################################################
sub printdbg
{
    my $dbgfh =$_[0];
    my $str   =$_[1];

    print $dbgfh $str."\n";
}

##########################################################
## COPY From Telnet.pm
##########################################################
sub _sleep {
    my ($secs) = @_;
    my $bitmask = "";
    local *SOCK;

    socket SOCK, AF_INET, SOCK_STREAM, 0;
    vec($bitmask, fileno(SOCK), 1) = 1;
    select $bitmask, "", "", $secs;
    CORE::close SOCK;

    1;
} # end sub _sleep

##########################################################
##  $test = {
##        'c' => {
##                 'e' => 3
##               },
##        'a' => 1,
##        'g' => {
##                 'h' => {
##                          'i' => 5
##                        }
##               },
##        'b' => 2,
##        'd' => {
##                 'f' => 4
##               },
##        'j' => {
##                 'k' => {
##                          'l' => {
##                                   'm' => {
##                                            'n' => 6
##                                          }
##                                 }
##                        }
##               }
##      };
##  ==>
##  $test = {
##        'a' => 1,
##        'd_f' => 4,
##        'b' => 2,
##        'c_e' => 3,
##        'j_k_l_m_n' => 6,
##        'g_h_i' => 5
##      };
##
##########################################################
sub trans_hash()
{
    my $mhash      = shift;
    my $startlevel = shift;

    my $nohash = 0;
    my $thash  = $mhash;
    while(!$nohash)
    {
        my $t = ();
        $nohash = 1;  # initialize to no hash
        while(my ($k1, $v1) = each(%$thash))
        {
            if(!ref $v1)  # k1 => v1
            {
                $t->{$k1} = $v1;
            }
            else  # k1 => hash
            {
                while(my ($k2, $v2) = each(%$v1))
                {
                    $t->{$k1."_".$k2} = $v2;
                }
                $nohash = 0;
            }
        }
        $thash = $t;
    }

    return $thash;
}


##########################################################
### generate kpi keys with prefix, so we know the information
###     (such as radio number) of kpi
### input :  prefix
###          array of kpi
### output:  array of the key with prefix
##########################################################
sub gen_key_arr()
{
    my $mprefix = $_[0];
    my $mg      = $_[1];

    my @tg = ();
    foreach my $r (@$mg)
    {
        push(@tg, $mprefix.$r);
    }

    return @tg;
}


##########################################################
### generate kpi values array by the the key array
###     (such as radio number) of kpi
### input :  the kpis hash
###          array of kpi
### output:  the kpis value array
##########################################################
sub gen_value_arr()
{
    my $mhash = shift;
    my $mg    = shift;

    my @tg = ();
    foreach my $r (@$mg)
    {
        push(@tg, $mhash->{$r});
    }

    return @tg;
}

# accumulate values
sub accu_value_arr()
{
    my $mhash1 = shift;
    my $mhash2 = shift;
    my $mg     = shift;

    foreach my $r (@$mg)
    {
        $mhash1->{$r} += $mhash2->{$r} if(defined $mhash2->{$r} && $mhash2->{$r} ne "NA");
    }
}

# average of values
sub aver_value_arr()
{
    my $mhash = shift;
    my $mg    = shift;
    my $mrecn = shift;

    foreach my $r (@$mg)
    {
        $mhash->{$r} /= $mrecn if(defined $mhash->{$r} && $mrecn != 0);
    }
}


sub get_file_list()
{
    my $mdir = shift;  # dir
    my $mext = shift;  # extension of file

    opendir(my $dh, $mdir) || die "can't opendir $mdir: $!";
    my @dots = grep { /\.$mext$/ && -f "$mdir/$_" } readdir($dh);
    closedir $dh;

    return sort by_number @dots;
}
##########################################################
## xxxx get file list with specialized suffix and dir
##########################################################
#sub get_file_list
#{
#    my $mdir    = shift;
#    my $msuffix = shift;
#    my @dlist = ();
#
#    opendir (DIRHANDLE, $mdir) or die "can't open the directory!";
#    my @d = readdir DIRHANDLE;
#    foreach $fn (@d) {
#        push (@dlist,$mdir.$fn) if( $fn =~ /\.$msuffix$/);
#    }
#    closedir DIRHANDLE;
#
#    return @dlist;
#}


sub get_file_list_fromto
{
    my $mbindir = shift;
    my $msuffix = shift;
    my $mfrom   = shift; # from datetime with format YYYYMMDDhhmmss
    my $mto     = shift; # to   datetime with format YYYYMMDDhhmmss

    my @_l = ();
    my @_d = &get_file_list($mbindir,$msuffix);
    for my $fn (@_d)
    {
        $fn=~/kpis_(\d{14})\.$msuffix$/;
        if($1>=$mfrom && $1<=$mto)
        {
            push(@_l,$mbindir.$fn);
        }
    }

    return @_l;
}

#sort by number
sub by_number
{
    $a=~/kpis_(\d{14})\.dat$/;my $aa=$1;
    $b=~/kpis_(\d{14})\.dat$/;my $bb=$1;

    # larger -> smaller
    if($aa>$bb) {1} elsif($aa<$bb) {-1} else {0};
}


##########################################################
## format = 0: default, date format - YYYYMMDDhhmmss
##        = 1:          date format - 07/06/2013 17:11:34
##########################################################
sub get_delta_sec()
{
    my $mt1 = shift;  # early datetime
    my $mt2 = shift;  # late datetime
    my $format = shift;

    my($yy,$mm,$dd,$h,$m,$s);
    my ($Dd,$Dh,$Dm,$Ds);
    if($format==0)
    {
        $mt1=~/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/;
        ($yy,$mm,$dd,$h,$m,$s) = ($1,$2,$3,$4,$5,$6);
        $mt2=~/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/;
        ($Dd,$Dh,$Dm,$Ds) = Delta_DHMS($yy,$mm,$dd,$h,$m,$s,$1,$2,$3,$4,$5,$6);
    }
    elsif($format==1)
    {
        $mt1=~/(\d{2})\/(\d{2})\/(\d{4}) (\d{2}):(\d{2}):(\d{2})/;
        ($yy,$mm,$dd,$h,$m,$s) = ($3,$1,$2,$4,$5,$6);
        $mt2=~/(\d{2})\/(\d{2})\/(\d{4}) (\d{2}):(\d{2}):(\d{2})/;
        ($Dd,$Dh,$Dm,$Ds) = Delta_DHMS($yy,$mm,$dd,$h,$m,$s,$3,$1,$2,$4,$5,$6);
    }

    return ($Dd*3600*24+$Dh*3600+$Dm*60+$Ds);
}


sub gen_test_files()
{
    my $dstr = shift;  # start date 20130531225220 ($year,$month,$day, $hour,$min,$sec)
    my $nf   = shift;  # number of files
    my $dsec = shift;  # delta seconds
    my $mbindir = shift; # the directory of files

    my ($dh,$dm,$ds) = (int $dsec/3600, int $dsec/60, int $dsec%60);
    my (@date,@ndate,$oldfn,$newfn);

    $dstr=~/kpis_(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})\.dat/;
    @date = ($1,$2,$3,$4,$5,$6);

    for(0 .. $nf)
    {
        @ndate = Add_Delta_DHMS(@date, 0,$dh,$dm,$ds);

        $oldfn = sprintf("%skpis_%4s%02s%02s%02s%02s%02s.dat",
            $mbindir,$date[0],$date[1],$date[2],$date[3],$date[4],$date[5]);
        $newfn = sprintf("%skpis_%4s%02s%02s%02s%02s%02s.dat",
            $mbindir,$ndate[0],$ndate[1],$ndate[2],$ndate[3],$ndate[4],$ndate[5]);

        print "copy $oldfn $newfn \n";

        copy($oldfn, $newfn) or die "Copy failed: $!";
        @date = @ndate;
    }
}

1;
