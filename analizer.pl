##################################################################################
### retrieve kpis from .dat files and analize kpis
##################################################################################
### AUTHOR:  6/04/2013 Chengan
### VERSION: 6/04/2013 0.1 retrieve from binary dat files
##################################################################################

use strict;
use warnings;

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
);

my steps

open LOGFH,">$logfn" or die "can not open file $logfn - $!\n";
open DBGFH,">$dbgfn" or die "can not open file $dbgfn - $!\n";
printlog(\*LOGFH,"\n################ ".localtime." ######################");

my $startt = localtime();
&main_loop();
sub main_loop()
{



}

my $stopt = localtime();
my $difft = $stopt-$startt;
&printlog(\*LOGFH,"processed analizer, take " . (60*($difft->minutes)) . " seconds");


# close file handler
close DBGFH;
close LOGFH;
