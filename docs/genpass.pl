#!/usr/bin/perl

use strict;
use warnings;

my $maxLenth=8;
my @dataSource = (1..9,1..9,1..9,'a'..'n','p'..'z','A'..'N','P'..'Z','~','!','@','#','$');
#my @dataSource = (0..9,'a'..'z','A'..'Z','~','!','@','#','$','%','^','&',,'*','-','+','_','=','(',')','{','}','[',']',':',';','"',',','.','<','>','?','/','\\','|','\'');

print "@dataSource\n";
print int rand @dataSource;
print "\n";
print map { $dataSource[int rand @dataSource] } 0..($maxLenth-1);
print "\n";

my $randomString = join '', map { $dataSource[int rand @dataSource] } 0..($maxLenth-1);

print "$randomString\n";
