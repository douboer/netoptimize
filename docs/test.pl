
use Time::gmtime;
use Time::Local;

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =
localtime(time);

printf("%d%d%d%d%d%d", $year+1900 , $mon+1 , $mday , $hour , $min , $sec);
print "\n";

use POSIX qw(strftime);
my $now_string = strftime "%Y%m%d%H%M%S", localtime;
print $now_string;

