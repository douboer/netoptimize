use data::Dumper;
use Date::Calc qw(Delta_DHMS Add_Delta_DHMS);
use File::Copy;
use File::Find;
use Clone qw(clone);

use POSIX qw(strftime);

my $stopt = localtime();
print $stopt . "\n";

#my $tmstamp = strftime "%Y%m%d%H%M%S", localtime;
my $tmstamp = strftime "%d/%m/%Y %H:%M:%S", localtime;

print $tmstamp."\n";



my $test ;
$test->{a} = 1;
$test->{b} = 2;
$test->{c}->{e} = 3;
$test->{c}->{f} = 4;
$test->{g}->{h}->{i} = 5;
$test->{j}->{k}->{l}->{m}->{n} = 6;

print Data::Dumper->Dump([$test],["test"]);

{
    $test2 = clone($test);
    $test2->{a} = 111;

    print Data::Dumper->Dump([$test],["test--"]);
    print Data::Dumper->Dump([$test2],["test2--"]);

    my $t1 = 5;
    my $t2 = $t1;

    $t2 = 100;
    print "t1  $t1  t2 $t2 \n";

    my $idx=0;
    for ($idx=0;$idx<5;$idx++)
    {
        &test_pass_hash($test->{c});
    }
    print Data::Dumper->Dump([$test],["test-"]);
}

sub test_pass_hash()
{
    my $t = shift;
    $t->{e}+=555;
}



sub trans_hash()
{
    my $mhash = shift;

    my $nohash = 0;
    my $thash  = $mhash;
    while(!$nohash)
    {
        my $t = ();
        $nohash = 1;  # initialize to no hash
        while(($k1, $v1) = each(%$thash))
        {
            if(!ref $v1)  # k1 => v1
            {
                $t->{$k1} = $v1;
            }
            else  # k1 => hash
            {
                while(($k2, $v2) = each(%$v1))
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

print Data::Dumper->Dump([&trans_hash($test)],["test"]);
print Data::Dumper->Dump([$test],["test"]);


sub get_file_list()
{
    my $mdir = shift;  # dir
    my $mext = shift;  # extension of file

    opendir(my $dh, $mdir) || die "can't opendir $mdir: $!";
    @dots = grep { /\.$mext$/ && -f "$mdir/$_" } readdir($dh);
    closedir $dh;

    return sort by_number @dots;
}
my $resultdir   =".\\outputs";
print join ("\n", &get_file_list($resultdir,"dat")); print "\n";

{
    my $t1 = "20120530204426";
    my $t2 = "20130530204628";
    $t1=~/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/;
    $yy=$1;
    $mm=$2;
    $dd=$3;
    $h=$4;
    $m=$5;
    $s=$6;
    $t2=~/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/;
    print "$yy,$mm,$dd,$h,$m,$s,$1,$2,$3,$4,$5,$6\n";
    my ($Dd,$Dh,$Dm,$Ds) = Delta_DHMS($yy,$mm,$dd,$h,$m,$s,$1,$2,$3,$4,$5,$6);

    print $Dd."\n";
    print $Dh."\n";
    print $Dm."\n";
    print $Ds."\n";
    
    print &get_delta_sec($t1,$t2) . "\n";
}


sub get_delta_sec()
{
    $mt1 = shift;  # early datetime with format YYYYMMDDhhmmss
    $mt2 = shift;  # late datetime with format YYYYMMDDhhmmss

    $mt1=~/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/;
    $yy=$1; $mm=$2; $dd=$3; $h=$4; $m=$5; $s=$6;
    $mt2=~/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/;
    my ($Dd,$Dh,$Dm,$Ds) = Delta_DHMS($yy,$mm,$dd,$h,$m,$s,$1,$2,$3,$4,$5,$6);

    return ($Dd*3600*24+$Dh*3600+$Dm*60+$Ds);
}


sub gen_test_files()
{
    my $dstr = shift;  # start date 20130531225220 ($year,$month,$day, $hour,$min,$sec)
    my $nf   = shift;  # number of files
    my $dsec = shift;  # delta seconds

    my $bindir = ".\\binfiles\\";

    $dh = int $dsec/3600;
    $dm = int $dsec/60;
    $ds = int $dsec%60;

    $dstr=~/kpis_(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})\.dat/;
    @date = ($1,$2,$3,$4,$5,$6);

    for(0 .. $nf)
    {
        @ndate = Add_Delta_DHMS(@date, 0,$dh,$dm,$ds);

        $oldfn = sprintf("%skpis_%4s%02s%02s%02s%02s%02s.dat",
            $bindir,$date[0],$date[1],$date[2],$date[3],$date[4],$date[5]);
        $newfn = sprintf("%skpis_%4s%02s%02s%02s%02s%02s.dat",
            $bindir,$ndate[0],$ndate[1],$ndate[2],$ndate[3],$ndate[4],$ndate[5]);

        print "copy $oldfn $newfn \n";

        copy($oldfn, $newfn) or die "Copy failed: $!";
        @date = @ndate;
    }
}
#kpis_20130531225220.dat
##&gen_test_files("kpis_20130601110938.dat",100,60*30);


sub get_file_list_fromto
{
    my $mbindir = shift;
    my $msuffix = shift;
    my $mfrom   = shift; # from datetime with format YYYYMMDDhhmmss
    my $mto     = shift; # to   datetime with format YYYYMMDDhhmmss

    my @_l = ();
    my @_d = &get_file_list($mbindir,$msuffix);
    for $fn (@_d)
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

{
    my $bindir = ".\\binfiles\\";
    #print join("\n", &get_date_list($bindir,"dat"));
    #print join("\n", &get_file_list($bindir,"dat"));

    my @f = &get_file_list_fromto($bindir,"dat","20130601150938","20130602000938");
    print (scalar @f . " \n");
    print join("\n", @f);
    print "\n";
}


{
my @array = (111, 5, 6, 7, 3, 2);
print join(", ", sort {$b <=> $a} @array) . "\n";
}
