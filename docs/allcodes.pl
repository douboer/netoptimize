!!!CODE1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
print "Hello!\n";
============================================================
for ($loop_index = 1; $loop_index <=5; $loop_index++) {
    print "Hello";
    print "there!\n";
}
============================================================
#!/usr/bin/sh
eval '/usr/local/bin/users/standard/build36/perl5 
-wS $0 ${1+"$@"}' if 0;
============================================================
print "Hello!\n";

print "Press <Enter> to continue...";
============================================================
@rem = '--*-Perl-*--
@echo off
if "%OS%" == "Windows_NT" goto WinNT
perl -x -S "%0" %1 %2 %3 %4 %5 %6 %7 %8 %9
goto endofperl
:WinNT
perl -x -S "%0" %*
if NOT "%COMSPEC%" == "%SystemRoot%\system32\cmd.exe" 
goto endofperl
if %errorlevel%==9009 echo You do not have Perl in your PATH.
goto endofperl
@rem ';
#!perl
#line 14
print "Hello!\n";

print "Press <Enter> to continue...";
<STDIN>;

__END__
:endofperl
============================================================
perl [ -sTuU ] [ -hv ] [ -V[:configvar] ] [ -cw ] 
[ -d[:debugger] ] [ -D[number/list] ] [ -pna ] 
[ -Fpattern ] [ -l[octal] ] [ -0[octal] ] [ -Idir ] 
[ -m[-]module ] [ -M[-]'module...' ] [ -P ] [ -S ] 
[ -x[dir] ] [ -i[extension] ] [ -e 'command' ] 
[ -- ] [ programfile ] [ argument ]... 
============================================================
$text = "hello";
$text += 1;
print $text;
============================================================
%perl -e 'print "@INC";'
============================================================
%perl -e 'print "Hello ";' -e 'print "there";'
============================================================
%perl -e '$text = "Hello there";' -e 'print $text;'
============================================================
%perl -e 'print "Hello "; print "there";'
============================================================
#!/usr/bin/perl -w   # Use Perl with warnings
my $count = 0;       # $count used to match {}, (), etc.
my $statement = "";  # $statement holds multi-line statements
local $SIG{__WARN__} = sub {}; # Supress error reporting

while (<>) {         # Accept input from the keyboard

    chomp;           # Clean up input
    while (/{|\(|\[/g) {$count++};    # Watch for {, (, etc.
    while (/}|\)|\]/g) {$count--};    # Pair with }, ), etc.

    $statement .= $_ . " ";    # Append input to current statement

    if (!$count) {       # Only evaluate if {, ( matches }, ) etc.

        eval $statement; # Evaluate the Perl statement
        if($@) {print "Syntax error.\n"};  # Notify of error
        $statement = ""; # Clear the current statement
        $count = 0       # Clear the multi-line {, ( etc. count

    }
}
============================================================
print "Hello!\n";
============================================================
print "Hello ", "there!\n";
============================================================
print "Hello!\n" x 10;
============================================================
print "-" x 30
============================================================
%perl -e "print __LINE__;"
============================================================
print "\"Hello!\"\n";
============================================================
print "Hello\tfrom\tPerl.\n";
============================================================
print "Hello\nfrom\nPerl.\n";
============================================================
while ($temp = <STDIN>) {
    print $temp;
}
============================================================
while(<>) {
    print;
}
============================================================
while($_ = <STDIN>) {
   print $_;
}
============================================================
while (<>) {
   for (split) {
       s/m/y/g;
       print;
   }
}
============================================================
while ($_ = <>) {
   for $_ (split / /, $_) {
       $_ =~ s/m/y/g;
       print $_;
   }
}
============================================================
while (<>) {eval if !/^#/}
============================================================
while (<>) {
    chop;
    print;
}
============================================================

!!!CODE2!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
============================================================
$scalar1 = 5;
$scalar2 = "Hello there!";
============================================================
print ("H", "e", "l", "l", "o");
============================================================
print "H", "e", "l", "l", "o";
============================================================
$x = 100;
$y = 200;
$warning = "Do you smell smoke?";
============================================================
$x = $y = $z = 1;
print join (", ", $x, $y, $z);
============================================================
$x = $x + 2;
$x = $x - 2;
$x = $x * 5;
============================================================
$x += 2;
$x -= 2;
$x *= 5;
============================================================
($degrees += 100) *= 700;
============================================================
$degrees += 100;
$degrees *= 700;
============================================================
chop ($input = 123);
print $input;
============================================================
$variable1 = 5;
undef $variable1;
============================================================
$variable1 = 5;
undef $variable1;

if (defined $variable1) {
    print "\$variable1 is defined.\n";
} else {
    print "\$variable1 is not defined.\n";
}
============================================================
*MAXFILES = \100;
print "$MAXFILES\n";
$MAXFILES = 101;
============================================================
if ($bottom) {
    $result = $top / $bottom;
}
else {
    $ result = 0;
}
============================================================
print "Got a data value." if ($value = returnvalue($index));
============================================================
print "Got a data value." if defined($value = returnvalue($index));
============================================================
$decimal = 4;
$binary = unpack("B32", pack("N", $decimal));
print $binary;
============================================================
$decimal = 4;
$binary = unpack("B32", pack("N", $decimal));
$newdecimal = unpack("N", pack("B32", $binary));
print $newdecimal;
============================================================
$x = 1.99999;
$y = 1.00001;
print join (", ", int($x), int($y));
============================================================
print sprintf "%.2f", 3.1415926;
============================================================
$variable1 = sprintf "%.4f", 3.1415926;
print $variable1;
============================================================
$variable1 = sprintf "%.2f", 3.1415926;
============================================================
$variable1 = sprintf "%.2f", 3.1415926;
$variable1 += .01;
print $variable1;
============================================================
$variable1 = "Hello ";	
$variable2 = "there\n";
print $variable1 + $variable2;		#Does not concatinate!
============================================================
$variable1 = "Hello ";
$variable2 = "there\n";
print $variable1 . $variable2;
============================================================
$variable1 = "Hello.";
$variable2 = 'Hello again.';
============================================================
============================================================
$x = 111;
$y = "This is a string";
print '$x is in string format' if ($x & ~$x);
print '$y is in string format' if ($y & ~$y);
============================================================
$! = 1;
print "$!\n";
print "Error number " , 0 + $! , " occurred.";
============================================================
$text = "Hello";
print 'Perl says: $text!\n';
============================================================
$text = "un";
print "Don't be ${text}happy.";
============================================================
$uptime = `uptime`;
print $uptime;
============================================================
$a = "Hello";
$b = "there";
$c = "$a $b\n";
print $c;
============================================================
print "${&getmessage}";

sub getmessage {
    $msg = "Hello!";
    return "msg"
};
============================================================
$text = Hello there!;	#No good
print $text;			#Doesn't work
============================================================
$hash{name} = "George Washington";
print $hash{name};
============================================================
print qq|I said, "Hello".|;
============================================================
$statement = qq/print "Hello.";/;
eval $statement;
============================================================
$statement = q/print "Hello.";/;
eval $statement;
============================================================
($first, $second, $third, $fourth) = qw/This is a test/;
============================================================
$text = "I\ said\ \"Hello\.\"";
$text = quotemeta('I said "Hello."');
$text = "\Q'I said "Hello."'\E";
============================================================
print (1, 2, 3);
============================================================
print ((1, 2, 3), 4, 5, (6, 7), 8, 9);
============================================================
print ("a" .. "z");
============================================================
$variable1 = (a, b, c)[1];
print $variable1;
============================================================
$size = (stat("size.pl"))[7];
print "File size is $size";
============================================================
($a, $b) = ($c, $d);
============================================================
($a, $b) = ($b, $a);
============================================================
@a = (2, 4, 6);
$a = @a;
print $a;
============================================================
print join(", ", ("Nancy", "Claire", "Linda", "Sara"));
============================================================
print join (":", "12", "00", "00");
============================================================
print join ("", H, e, l, l, o);
============================================================
print split ",", "H,e,l,l,o";
============================================================
print ((split " ", "Now is the time")[3]);
============================================================
while (<>) {
    for (split) {
        if (/^\w{4}$/) {
            print "You shouldn't use four letter words.\n";
        }
    }
}
============================================================
print join(", ", (map lc, A, B, C));
============================================================
print join(", ", (map chr, 65, 66, 67));
============================================================
print join(", ", (map {2 * $_} 1, 2, 3));
============================================================
print (map "The current number is: $_\n", (1, 2, 3));
============================================================
print join(", ", (map {my $value = $_; $value += 1} 1, 2, 3));
============================================================
print grep(!/x/, a, b, x, d);

============================================================
print join(" ",(grep {!/^\w{4}$/} (qw(Here are some four letter words.))));
============================================================
@array1 = (1, 1, 1, 1);
@array2 = grep {$_ *= 2} @array1;
print @array1[1];
============================================================
@array1 = (1, 1, 1, 1);
@array2 = grep {$_ *= 2} @{[@array1]};
print @array1[1];
============================================================
@array1 = (1, 1, 1, 1);
@array2 = grep {$_} @array1;
@array2 = map {2 * $_} array2;
print @array1[1];
============================================================
print sort ("c", "b", "a");
============================================================
print sort {$a cmp $b} ("c", "b", "a");
============================================================
print sort {$b cmp $a} ("c", "b", "a");
============================================================
print sort {$a <=> $b} (3, 2, 1);
============================================================
@name = qw(soap blanket shirt pants plow);
@category = qw(home home apparel apparel farm);
@subcategory = qw(bath bedroom top bottom field);

@indices = sort {$category[$a] cmp $subcategory[$b]
    or $category[$a] cmp $subcategory[$b]} (0 .. 4);

foreach $index (@indices) {
    print "$category[$index]/$subcategory[$index]: $name[$index]\n";
}
============================================================
sub myfunction 
{
   return (shift(@_) <=> shift(@_));
}

print sort {myfunction($a, $b)} (3, 2, 1);
============================================================
print reverse (1, 2, 3);
============================================================
$a = (2, 4, 6);
============================================================


!!!CODE3!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
==========================================================
$hash{'fruit'} = 'apple';
print "$hash{'fruit'}\n";
==========================================================
%hash = (
    'fruit'    ,  'apple',
    'sandwich' ,  'hamburger',
    'drink'    ,  'bubbly',
);

print "$hash{'fruit'}\n";
==========================================================
$data = "Here's the data.";
@data = (1, 2, 3);
==========================================================
*alsodata = *data;
==========================================================
print "$alsodata\n";
==========================================================
@array = (1, 2, 3);
print @array;
==========================================================
@array = (1, 2, 3);
print $array[0];
==========================================================
@array = ("one", "two", "three");
print @array;
==========================================================
@array = (
    "one",  "two",  "three",
    "four", "five", "six",
);

print @array;
==========================================================
@array = (0) x 100;
==========================================================
@array = (1 .. 10);
==========================================================
@array = qw(one two three);
==========================================================
@array = (1, 2, 3);
$array[5] = "Here is a new element!";
print "$array[5]\n";
==========================================================
@array = ("one", "two", "three");
print $array[1];
==========================================================
@a1 = ("one", "two", "three");
@a2 = @a1;

print $a2[1];
==========================================================
while(<>) {
   @array = ('0' .. '9', 'a' .. 'f');
   $hex = $array[$_];
   print "$hex\n";
}
==========================================================
@array = ("one", "two", "three");
for ($loop_index = 0; $loop_index <= $#array; $loop_index++) {
    print $array[$loop_index] . " ";
}
==========================================================
@a1 = (1, 2, 3);

print @a1[-2];
==========================================================
push(@array, "one");
push(@array, "two");
push(@array, "three");
print $array[0];
==========================================================
@array = ("one", "two", "three");
$variable1 = pop(@array);
print $variable1;
==========================================================
use integer;

$value = 257;

while($value) {
   push @digits, (0 .. 9, a .. f)[$value & 15];
   $value /= 16;
}

while(@digits) {
   print pop @digits;
}
==========================================================
@array = ("one", "two", "three");
$variable1 = shift(@array);
print $variable1;
==========================================================
use integer;

$value = 257;

while($value) {
   unshift @digits, (0 .. 9, a .. f)[$value & 15];
   $value /= 16;
}

print @digits;
==========================================================
@array = (1, 2, 3);
print "\@array has " . ($#array + 1) . " elements.";
==========================================================
$value = pop(@array);
$value = $array[$#array--];
==========================================================
@array = (1, 2, 3);
print "\@array has " . scalar(@array) . " elements.";
==========================================================
@array = (1, 2, 3);
$variable = @array;
print "\@array has $variable elements.";
==========================================================
use integer;

$value = 257;

while($value) {
   push @digits, (0 .. 9, a .. f)[$value & 15];
   $value /= 16;
}

while(@digits) {
   print pop @digits;
}
==========================================================
@a1 = ("one", "two", "three");
@a2 = @a1;
@a3 = @a1 + @a2;
print "@a3";
==========================================================
@array = (1, 2, 3);
$#array = 10;
$array[5] = "Here is a new element!";
print "$array[5]\n";
==========================================================
@array = (1, 2, 3);
$array[5] = "Here is a new element!";
print "$array[5]\n";
==========================================================
@a1 = (1, 2, 3);
@a2 = (4, 5, 6);
@a3 = (@a1, @a2);
==========================================================
@a1 = (1, 2, 3);
@a2 = (4, 5, 6);

push (@a1, @a2);

print join (", ", @a1);
==========================================================
@a1 = (1, 2, 3, 4, 5, 6);
@a2 = @a1[0, 1, 2, 3];
print join (", ", @a2);
==========================================================
@a1 = (1, 2, 3, 4, 5, 6);
@a2 = @a1[0 .. 3];
print join (", ", @a2);
==========================================================
@a1 = (1, 2, 3, 4, 5, 6);
@a2 = @a1[1, 3];
print join (", ", @a2);
==========================================================
($atime, $mtime) = (stat 'timer.pl')[8, 9];
==========================================================
@array = (1, 2, 3, 4, 5, 6);
@array[2 .. 4] = reverse @array[2 .. 4];

print join (", ", @array);
==========================================================
@array = ("one", "two", "three");
for($loop_index = 0; $loop_index <= $#array; $loop_index++) {
    print $array[$loop_index];
}
==========================================================
@array = (1, 2, 3, 4, 5);
foreach $element (@array) {
    print "$element\n";
}
==========================================================
@array = (1, 2, 3);
@array2 = (4, 5, 6);
foreach $element (@array, @array2) {
    print "$element\n";
}
==========================================================
@array = (1, 2, 3, 4, 5);
for (@array) { 
    print; 
}
==========================================================
use integer;

$value = 257;

while($value) {
   push @digits, (0 .. 9, a .. f)[$value & 15];
   $value /= 16;
}

while(@digits) {
   print pop @digits;
==========================================================
@array = ("one", "two", "three");
print "Here is the array: ", @array, ".\n";
==========================================================
@array = ("one", "two", "three");
print "Here is the array: @array.\n";
==========================================================
@array = ("one", "two", "three");
$, = ",";
print "Here is the array: ", @array, ".\n";
==========================================================
@array = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
print join(", ", @array);
==========================================================
@array = ("one", "two", "three");
foreach $element (@array) {
    print "Current element = $element\n";
}
==========================================================
@array = ("one", "two");
splice(@array, 2, 0, "three");
print join(", ", @array);
==========================================================
@array = ("one", "two");
@array2 = ("three", "four");
splice(@array, 2, 0, @array2);

print join(", ", @array);
==========================================================
@array = ("one", "two");
@array2 = ("two", "three", "four");
splice(@array, 2, 1, @array2);
print join(", ", @array);
==========================================================
@a1 = (1, 2, 3, 4, 5, 6);
@a2 = reverse @a1;
==========================================================
use integer;

$value = 258;

while($value) {
   push @digits, (0 .. 9, a .. f)[$value & 15];
   $value /= 16;
}

print reverse @digits;
==========================================================
@array = (1, 2, 3, 4, 5, 6);
@array[2 .. 4] = reverse @array[2 .. 4];

print join (", ", @array);
==========================================================
@sorted = sort @array;
==========================================================
@sorted = sort {$a <=> $b} @array;
==========================================================
@sorted = sort {$b <=> $a} @array;
==========================================================
@array = (6, 5, 4, 3, 2, 1);

sub myfunction
{
   return (shift(@_) <=> shift(@_));
}

print join(", ", sort {myfunction($a, $b)} @array);
==========================================================
use Getopt::Std;

getopt('pMN');

print "-p switch: $opt_p, -M switch: $opt_M, -N switch: $opt_N";
==========================================================
%hash = ();

$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;
==========================================================
%hash = ();

$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

print $hash{sandwich};
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

print $hash{sandwich};
==========================================================
@array = (
    "one",  "two",  "three",
    "four", "five", "six",
);
==========================================================
%hash = (
    'fruit'    ,  'apple',
    'sandwich' ,  'hamburger',
    'drink'    ,  'bubbly',
);

print "$hash{'fruit'}\n";
==========================================================
%hash = qw(
    fruit      apple
    sandwich   hamburger
    drink      bubbly
);

print "$hash{'fruit'}\n";
==========================================================
%hash = (
    fruit    ,  apple,
    sandwich ,  hamburger,
    drink    ,  bubbly,
);

print "$hash{fruit}\n";
==========================================================
%hash = (
    fruit    =>  apple,
    sandwich =>  hamburger,
    drink    =>  bubbly,
);
print "$hash{fruit}\n";
==========================================================
print "x"=>"y"=>"z";
==========================================================
$hash2{cake} = chocolate;
$hash2{pie} = blueberry;
$hash2{'ice cream'} = pecan;
==========================================================
$hash2{cake} = chocolate;
$hash2{pie} = blueberry;
$hash2{'ice cream'} = pecan;
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

print $hash{sandwich};
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

print join(" ", %hash);
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

while(($key, $value) = each(%hash)) {
    print "$key => $value\n";
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

foreach $key (keys %hash) {
    print $hash{$key} . "\n";
}
==========================================================
%hash = ();

$hash{$key} = $value;
$hash{$key2} = $value2;
==========================================================
%hash = (
    fruit    =>  apple,
    sandwich =>  hamburger,
    drink    =>  bubbly,
);

%hash = (%hash, dressing, 'blue cheese');

print "$hash{dressing}\n";
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

if (exists($hash{'vegetable'})) {
    print "Key is in the hash.";
} else {
    print "Key is not in the hash.";
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

if (defined($hash{'vegetable'})) {
    print "Element is defined.";
} else {
    print "Element is not defined.";
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

delete($hash{'fruit'});

if (exists($hash{"fruit"})) {
    print "Key exists.";
} else {
    print "Key does not exist.";
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

while(($key, $value) = each(%hash)) {
    print "$key => $value\n";
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

foreach $key (keys %hash) {
    print $hash{$key} . "\n";
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

foreach $value (values %hash) {
    print "$value\n";
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

print map "$_ => $hash{$_}\n", keys %hash;
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

print "@{[%hash]}\n";
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

while (($key, $value) = each %hash ) {
    print "$key: $value\n";
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

foreach $key (sort keys %hash) {
    print "$key => $hash{$key}\n";
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

%reversed = reverse %hash;

foreach $key (sort keys %reversed) {
    print "$key => $reversed{$key}\n";
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

foreach $key (sort keys %hash) {
    print "$key => $hash{$key}\n";
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

foreach $key (sort {myfunction($a, $b)} keys %hash) {
    print "$key => $hash{$key}\n";
}

sub myfunction
{
   return (shift(@_) cmp shift(@_));
}
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

foreach $value (sort values %hash) {
    print "$value\n";
}
==========================================================
$h1{fruit} = apple;
$h1{sandwich} = hamburger;
$h1{drink} = bubbly;

$h2{cake} = chocolate;
$h2{pie} = blueberry;
$h2{'ice cream'} = pecan;

%h3 = (%h1, %h2);
print $h3{'ice cream'}; 
==========================================================
$h1{fruit} = apple;
$h1{sandwich} = hamburger;
$h1{drink} = bubbly;

$h2{cake} = chocolate;
$h2{pie} = blueberry;
$h2{'ice cream'} = pecan;

%h3 = (%h1, %h2);
print $h3{'ice cream'}; 
==========================================================
($variable1, $variable2, @array) = (1, 2, 3, 4, 5, 6, 7, 8);
print "$variable1\n";
print "$variable2\n";
print "@array\n";
==========================================================
keys(%employees) = 40_000;

$employees{'Fred'} = 'fired';
$employees{'Tom'} = 'promoted';

while (($name, $action) = each %employees) {
    print "Dear $name, you have been $action!\n"
==========================================================
$data = "Here's the data.";
@data = (1, 2, 3);

*alsodata = *data;

print "$alsodata\n";
print @alsodata;
==========================================================

!!!CODE4!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=======================================================
print 1, 2, 3, 4, sort 9, 8, 7, 6, 5;
=======================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

$hashref = \%hash;
print $hashref->{sandwich};
=======================================================
$result = $myobject->mymethod($data); 
=======================================================
$variable1 = 1;
$variable2 = 1;

print $variable2++ . "\n";
print $variable2 . "\n";
=======================================================
$variable = 'AAA';
print ++$variable . "\n";
$variable = 'bbb';
print ++$variable . "\n";
$variable = 'zzz';
print ++$variable . "\n";
=======================================================
print 2 ** 16;
=======================================================
print 2 ** -1
=======================================================
print 144 ** .5;
=======================================================
print 81 ** .25;
=======================================================
print !0;

=======================================================
$value = 3;
print -$value;
=======================================================
print ~0;
=======================================================
$variable1 = 5;
$reference = \$variable1;
print $$reference;
=======================================================
$line = ".Hello!";

if ($line =~ m/^\./) {
    print "You shouldn't start a sentence with a period!";
}
=======================================================
print 2 * 4;
=======================================================
print 2 * 3.1415926535;
=======================================================
print 16 / 4;
=======================================================
print 16 / 3;
=======================================================
use integer;

print 16 / 3;

5
=======================================================
print '-' x 30;
=======================================================
print 16 % 3;
=======================================================
use integer;

$value = 257;

while($value) {
   push @digits, (0 .. 9, a .. f)[$value % 16];
   $value /= 16;
}

while(@digits) {
   print pop @digits;
}
=======================================================
print "Hello " . "there.";
=======================================================
$hello = "Hello";
$there = "there";
print "$hello $there.";
=======================================================
print 2 << 10;
=======================================================
print 2048 >> 3;
=======================================================
print 24 & 15;
=======================================================
print sqrt 4;
=======================================================
print -e STDIN;		#Does STDIN exist?
=======================================================
print -t STDIN;		#Is it tied to a terminal?
=======================================================
print -z STDIN;		#Does it have zero size? 
=======================================================
while (<>) {
    if ($_ > 100) {
        print "Too big!\n";
    }
}
=======================================================
print "Please enter letters from k to m\n";
while (<>) {
    chop;
    if ($_ lt 'k' or $_ gt 'm') {
        print "Please enter letters from k to m\n";
    } else {
        print "Thank you - let's have another!\n";
    }
}
=======================================================
$v1 = 4;
$v2 = 5;
if ($v1 = $v2) {
    print "\$v1 = \$v2.";
}
=======================================================
print "Please type the letter y\n";
while (<>) {
    chop;
    if ($_ ne 'y') {
        print "Please type the letter y\n";
    } else {
        print "Do you always do what you're told?\n";
        exit;
    }
}
=======================================================
$v1 = 1;
$v2 = 2;

if ($v1 = $v2) {
    print "Assigned a non-zero value.";
}
=======================================================
sub eqfloat4 {return sprintf("%.4f", shift) eq sprintf("%.4f", shift)}

if (eqfloat4 1.23455, 1.23456) {
    print "Numbers are equal to four decimal places.";
}
=======================================================
$flag = 2030136;

if ($flag & 1 << 3) {
    print "The third bit is set.";
} 
else {
    print "The third bit is not set.";
}
=======================================================
print "h l o\n" | " e l ";
=======================================================
print "h l o\n" ^ " e l ";
=======================================================
print "he" | "  llo\n";
=======================================================
print "hello\n" & '______';

=======================================================
print "Please enter positive numbers up to 100\n";
while (<>) {
    chomp;
    if ($_ > 0 && $_ < 100) {
        print "Thank you - let's have another!\n";
    } else {
        print "Please enter positive numbers up to 100\n";
    }
}
=======================================================
print "Please enter numbers from 5 to 10\n";

while (<>) {
    chop;
    if ($_ < 5 || $_ > 10) {
        print "Please enter numbers from 5 to 10\n";
    } else {
        print "Thank you - let's have another!\n";
    }
}
=======================================================
$result = this($data) || that($data) 
|| die "Can't get this or that to work";
=======================================================
$value = 0;
$default = 100;
$value = $value || $default;
print $value;
=======================================================
$value = 0;
$default = 100;
$value ||= $default;
print $value;
=======================================================
for (1 .. 10) {
    print "Here we are again!\n";
}
=======================================================
while (<>) {
    print $_ >= 0 ? $_ : -$_
}
=======================================================
while (<>) {
    print $_ < 10 ? $_ : "${\((a .. f)[$_ - 10])}\n";
}
=======================================================
while (<>) {
    print $_ > 0 && $_ < 10 ? $_ : "${\($_ < 16 ? 
    (a .. f)[$_ - 10] : \"Number is not a 
    single hex digit.\")}\n";
}
=======================================================
$variable1 = 5;
print $variable1;
=======================================================
$x = $y = $z = 1;
=======================================================
$x = 2 * ($y = 2 * ($z = 1));
print join(", ", $x, $y, $z);
=======================================================
$doubleme *= 2;
=======================================================
chop ($input = <>);
=======================================================
$variable = (1, 2, 3);
print $variable;
=======================================================
@array = (1, 2, 3);
print join(", ", @array);
=======================================================
print 1, 2, 3, 4, sort 9, 8, 7, 6, 5;
=======================================================
$v1 = 1;
$v2 = 0;
$v3 = not $v1 && $v2;
if($v3) {
    print "\$v3 is true.";
}
else {
    print "\$v3 is false.";
}
=======================================================
$v1 = 1;
$v2 = 0;
$v3 = ! $v1 && $v2;
if($v3) {
    print "\$v3 is true.";
}
else {
    print "\$v3 is false.";
}
=======================================================
$v1 = 0;

@a1 = $v1 && 1 .. 10;

print join (" ", @a1);
=======================================================
$v1 = 0;

@a1 = $v1 and 1 .. 10;

print join (" ", @a1);
=======================================================
$v1 = ($v2 or $v3);            
$v1 = $v2 || $v3;              
=======================================================
while(<>) {
    print;
}
=======================================================
@all_lines =  <FILEHANDLE>;
=======================================================
while(<>) {
    print;
}
=======================================================
while(<*.h>) {
    print;
    print "\n";
}
=======================================================



!!!CODE5!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=============================================================
$variable = 5; 

if ($variable == 5) {
    print "Yes, it's five.\n";
} else {
    print "No, it's not five.\n";
}
=============================================================
$variable = 5;

if ($variable == 5) 
{
    print "Yes, it's five.\n";
} 
else 
{
    print "No, it's not five.\n";
}
=============================================================
$variable = 5;

if ($variable == 5) 			#wrong!
    print "Yes, it's five.\n";
else 
    print "No, it's not five.\n";
=============================================================
$factorial = 1;

for ($loop_index = 1; $loop_index <= 6; $loop_index++) {
    $factorial *= $loop_index;
}
print "6! = $factorial\n";
=============================================================
@array = ("one", "two", "three");
for ($loop_index = 0; $loop_index <= $#array; $loop_index++) 
{
    print $array[$loop_index] . " ";
}
=============================================================
$factorial = 1;

for (1 .. 6) {
    $factorial *= $_;
}
print "6! = $factorial\n";
=============================================================
$variable = 1;
$variable = $temperature;
print $z;
@array = ('0' .. '9', 'a' .. 'f');
=============================================================
while(<>) {
   @array = ('0' .. '9', 'a' .. 'f');
   $hex = $array[$_];
   print "$hex\n";
}

if (open(CHILDHANDLE, "|-")) {
    print CHILDHANDLE "Here is the text.";
    close(CHILDHANDLE);
}

if ($head != $tail) {   
    $data = $buffer[$head]{data};
    $head = $buffer[$head]{next};
    return $data;
} else {
    return undef;
}
=============================================================
$variable = 5;

if ($variable == 5) {
    print "Yes, it's five.\n";
}
=============================================================
use integer;

$variable = 5;

if ($variable < 6 && $variable > 4) {
    print "Yes, it's five.\n";
}
=============================================================
$variable = 6;

if ($variable == 5) {
    print "Yes, it's five.\n";
} else {
    print "No, it's not five.\n";
}
=============================================================
$variable = 2;

if ($variable == 1) { 
    print "Yes, it's one.\n";
} elsif ($variable == 2) {
    print "Yes, it's two.\n";
} elsif ($variable == 3) {
    print "Yes, it's three.\n";
} elsif ($variable == 4) {
    print "Yes, it's four.\n";
} elsif ($variable == 5) {
    print "Yes, it's five.\n";
} else {
    print "Sorry, can't match it!\n";
}
=============================================================
while (<>) {
    print "Too big!\n" if $_ > 100;
}
=============================================================
$variable = 6;

unless ($variable == 5) {
    print "No, it's not five.\n";
}
=============================================================
$variable = 6;

unless ($variable == 5) {
    print "No, it's not five.\n";
} else {
    print "Yes, it's five.\n";
}
=============================================================
$variable = 2;

unless ($variable != 1) { 
    print "Yes, it's one.\n";
} elsif ($variable == 2) {
    print "Yes, it's two.\n";
} elsif ($variable == 3) {
    print "Yes, it's three.\n";
} elsif ($variable == 4) {
    print "Yes, it's four.\n";
} elsif ($variable == 5) {
    print "Yes, it's five.\n";
} else {
    print "Sorry, can't match it!\n";
}
=============================================================
while (<>) {
    chomp;
    unless (/^q/i) {
        print;
    } else {
        exit;
    }
}
=============================================================
while (<>) {
    print "Too small!\n" unless $_ > 100;
}
=============================================================
for ($loop_index = 1; $loop_index <= 10; $loop_index++) {
    print "Hello!\n";
}
=============================================================
for ($loop_index = 1; $loop_index <= 10; $loop_index++) {
    print "This is iteration number $loop_index\n";
}
=============================================================
@a = (1, 2, 3, 4, 5, 6, 7, 8, 9);
$running_sum = 0;

for ($loop_index = 0; $loop_index <= $#a + 1; $loop_index++) {
    $running_sum += $a[$loop_index];
}

print "Average value = " . $running_sum / ($#a + 1);
=============================================================
for ($loop_index = 0, $double = 0; $loop_index <= 10 
    ; $loop_index++, $double = 2 * $loop_index) {
    print "Loop index " . $loop_index . " doubled equals " .
        $double . "\n";
}
=============================================================
$factorial = 1;
for ($loop_index = 1; $loop_index <= 6; $loop_index++) {
    $factorial *= $loop_index;
}

print $loop_index - 1 . "! = $factorial\n";
=============================================================
$factorial = 1;
for (my $loop_index = 1; $loop_index <= 6; $loop_index++) {
    $factorial *= $loop_index;
}
=============================================================
for (print "Type q to quit.\n"; <> ne "q\n"; print 
    "Don't you want to quit?\n") {}
=============================================================
for (;<>;) {
    print;
}
=============================================================
while (<>) {
    print;
}
=============================================================
for (print "%"; <>; print "%") {
    print;
} 
=============================================================
foreach ($loop_index = 1; $loop_index <= 10; $loop_index++) {
    print "Hello!\n";
}
=============================================================
@array = ("Hello ", "there.\n");
for (@array) {print;}
=============================================================
@array = (1, 2, 3);
$running_sum = 0;

foreach $element (@array) {
    $running_sum += $element;
}

print "Total = $running_sum";
=============================================================
@name = qw(soap blanket shirt pants plow);
@category = qw(home home apparel apparel farm);
@subcategory = qw(bath bedroom top bottom field);

@indices = sort {$category[$a] cmp $subcategory[$b]
    or $category[$a] cmp $subcategory[$b]} (0 .. 4);

foreach $index (@indices) {
    print "$category[$index]/$subcategory[$index]: $name[$index]\n";
}
=============================================================
@array = ("Hello ", "there.\n");

foreach (@array) {print;}
=============================================================
@array = ("Hello ", "there.\n");

foreach $_ (@array) {print $_;}
=============================================================
foreach (1 .. 10) {print;}
=============================================================
foreach (glob '*') {print;}
=============================================================
$hash{fruit} = orange;
$hash{sandwich} = club;
$hash{drink} = lemonade;

foreach $key (keys %hash) {
    print $hash{$key} . "\n";
}
=============================================================
$hash{fruit} = orange;
$hash{sandwich} = club;
$hash{drink} = lemonade;
while(($key, $value) = each(%hash)) {
    print "$key => $value\n";
}
=============================================================
@array = (1, 2, 3);
foreach $element (@array) {
    $element++;
}

print join(", ", @array);
=============================================================
$savings = 0; 
while ($savings < 1_000_000) {
    print "Enter the amount you earned today: ";
    $savings += <>;
}

print "Congratulations, millionaire!\n";
=============================================================
use integer;

$value = 257;

while($value) {
   push @digits, (0 .. 9, a .. f)[$value & 15];
   $value /= 16;
}

while(@digits) {
   print pop @digits;
}
=============================================================
$hash{fruit} = orange;
$hash{sandwich} = club;
$hash{drink} = lemonade;
while (($key, $value) = each %hash ) {
    print "$key: $value\n";
}
=============================================================
while (defined($_ = <FILEHANDLE>)) 
while ($_ = <FILEHANDLE>) 
while (<FILEHANDLE>) 
for (;<FILEHANDLE>;) 
=============================================================
open FILEHANDLE, "<show.pl";

while(<FILEHANDLE>) {
    print;
}
=============================================================
$loop_index = 1;

while ($loop_index <= 10) {
    print "Hello!\n";
} continue {
    $loop_index++;
}
=============================================================
while ($loop_index <= 10) {
    print "Hello\n";
    next if $loop_index > 5;
    print "there\n";
} continue {
    $loop_index++;
}
=============================================================
while (<FILEHANDLE>) {
    print;
}
=============================================================
until (($line = <>) eq 'q\n') {
    print $line;
}
=============================================================
$loop_index = 1;
until ($loop_index > 10) {
    print "Hello!\n";
    $loop_index++;
}
=============================================================
$loop_index = 1;
until ($loop_index > 10) {
    print "Hello!\n";
} continue {
    $loop_index++;
}
=============================================================
@a = (1 .. 10);

foreach (@a) {$_ *= 2;}

print join(", ", @a);
=============================================================
@a = (1 .. 10);

map {$_ *= 2} (@a);

print join(", ", @a);

2, 4, 6, 8, 10, 12, 14, 16, 18, 20
=============================================================
print join(", ", (map {my $value = $_; $value *= 2} (1 .. 10)));
=============================================================
@a = (1 .. 10);

foreach (@a) {if ($_ > 5) {push @b, $_}};

print join(", ", @b);
=============================================================
@a = (1 .. 10);

@b = grep {$_ > 5} @a;

print join(", ", @b);
=============================================================
print join(" ",(grep {!/^\w{4}$/} (qw(Here are some four letter words.))));
=============================================================
while (chomp($input = <>)) {

    print "You typed: $input\n" unless $input eq 'L';

}
=============================================================
while (<>) {
    print "Too big!\n" if $_ > 100;
}
=============================================================
print "Please enter more text (q to quit).\n"  until (<> eq "q\n");
=============================================================
print "Current number: $_.\n" foreach (1 .. 10);
=============================================================
do {
    print;
} while (<>);
=============================================================
@a = (1 .. 10);

do {

    $v = shift @a;
    print "Current number: $v\n";

} while ($v < 5);
=============================================================
NUMBER: while (<>) {
    next NUMBER if /^-/;      
    print; 
}
=============================================================
@a = (0 .. 20);
@b = (-10 .. 10);

DIVISION: while (@a) {
    $a = pop @a;
    $b = pop @b;

    next DIVISION if ($b == 0);
    print "$a / $b = " . $a / $b . "\n";
}
=============================================================
while ($loop_index <= 10) {
    print "Hello\n";
    next if $loop_index > 5;
    print "there\n";
} continue {
    $loop_index++;
}
=============================================================
# Strip this line
# Strip this line too
COMMENTS: while (<>) {
    last COMMENTS if !/^#/;
}
do {
    print;
=============================================================
FOREVER: for (;;) {

    chomp($line = <>);

    if ($line eq 'q') {
        last FOREVER;
    } else {
        print "You typed: $line\n";
    }
}
=============================================================
for ($loop_index = 0; _
    $loop_index <= 10; _
    $loop_index++) { _
    print $loop_index; }
=============================================================
while (<>) {
    if (s/_//g) {      # Match and remove underscores
        $_ .= <>;
        redo;
    }
    eval;
}
=============================================================
print "Enter command: ";

while(<>) {
SWITCH: {
        /run/ && do {
                      $message = "Running\n"; 
                      last SWITCH;
                  };

        /stop/ && do {
                       $message = "Stopped\n"; 
                       last SWITCH;
                  };

        /connect/ && do {
                       $message = "Connected\n"; 
                       last SWITCH;
                  };

        /find/ && do {
                       $message = "Found\n"; 
                       last SWITCH;

                  };
        /q/ && do {
                       exit;
                  };
        DEFAULT:       $message = "No match.\n";
    }

    print $message;
    print "Enter command: ";
}
=============================================================
$hash{run}     = "Running\n";
$hash{stop}    = "Stopped\n";
$hash{connect} = "Connected\n";
$hash{find}    = "Found\n";

print "Enter command: ";

while(<>) {

    chomp;

    if ($_ eq 'q') {
        exit;
    } elsif (exists($hash{$_})) {
        print $hash{$_};
    } else {
        print "No match.\n";
    }

    print "Enter command: ";
}
=============================================================
INPUT: $line = <>;
if ($line !~ /exit/) {print "Try again\n"; goto INPUT}
=============================================================
$x = 1;
$y = 0;
eval {$result = $x / $y};
print "eval says: $@" if $@;
=============================================================
print "Please type the letter y\n";
while (<>) {
    chop;
    if ($_ ne 'y') {
        print "Please type the letter y\n";
    } else {
        print "Do you always do what you're told?\n";
        exit;
    }
}
=============================================================


!!!CODE6!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=========================================================
while(<>) { 
    if(m/exit/i) {exit;}
}
=========================================================
while($line = <>) {
    if($line =~ m/exit/i) {exit;}
}
=========================================================
while($line = <>) {
    if($line =~ /exit/i) {exit;}
}
=========================================================
while($line = <>) {
    if($line =~ m{exit}i) {exit;}
}
=========================================================
$_ = "Here is the text";
@a = m/\b[^A-Z]+\b/g;
print "@a";
=========================================================
$s = "Here is the text";
$match = "text";
if ($s =~ m/$match/) {
    print "Found the text.";
}
=========================================================
$text = "Pretty young.";
$text =~ s/young/old/;
print $text;
=========================================================
$text = "Pretty young.";
$text =~ s|young|old|;
print $text;
=========================================================
$text = "Pretty young.";
$text =~ s(young)(old);
print $text;
=========================================================
$text = "Pretty young, but not very young.";
$text =~ s/young/old/;
print $text;
=========================================================
$text = "Pretty young, but not very young.";
$text =~ s/young/old/g;
print $text;
=========================================================
while (<>) {
    tr/o/i/;
    print;
}
=========================================================
$text = "His name is Tom.";
$text =~ tr/o/i/;
print $text;
=========================================================
$text =~ tr/\r//d;
=========================================================
$text = "Perl is the subject.";
$text =~ /\b([A-Za-z]+)\b/;
print $1;
=========================================================
while(<>) {
    if(m/quit/) {exit;}
}
=========================================================
while(<>) {
    if(m/^quit$/i) {exit;}
}
=========================================================
$text = "Here is some text.";
$text =~ s/\w+/There/;
print $text;
=========================================================
$text = "Now is the time.";
$text =~ s/./*/g;
print $text;
=========================================================
$line = ".Hello!";

if ($line =~ m/^\./) {
    print "Shouldn't start a sentence with a period!";
}
=========================================================
$code = "count++; /* Increment count */";

$code =~ s/\/\*.*\*\///g;

print $code;
=========================================================
$code = "count++; /* Increment count */";

$code =~ s|\/\*.*\*\/||g;

print $code;
=========================================================
$text = "I\ said\ \"Hello\.\"";
$text = quotemeta('I said "Hello."');
=========================================================
$text = "Here is the text.";
if ($text =~ /[aeiou]/) {print "Yep, we got vowels.\n";}
=========================================================
$text = "What is the subject";
$text =~ s/[A-Za-z]+/Perl/;
print $text;
=========================================================
$text = "Perl is the subject on page 493 of the book.";
$text =~ s/[^A-Za-z\s]+/500/;
print $text;
=========================================================
$_ = "Here is the text";
@a = m/\b[^A-Z]+\b/g;
print "@a";
=========================================================
while(<>) {
    if(m/exit|quit|stop/) {exit;}
}
=========================================================
while(<>) {
    if(m/^(exit|quit|stop)$/) {exit;}
}
=========================================================
$text = "Hello from Peeeeeeeeeeeeeerl.";
$text =~ s/e+/e/g;
print $text;
=========================================================
$_ = "Here is the text";
@a = m/\b[^A-Z]+\b/g;
print "@a";
=========================================================
while (<>) {
    if(!m/.{20,}/) {print "Please type longer lines!\n";}
}
=========================================================
$code = "count++; /* Increment count */";

$code =~ s/\/\*.*\*\///g;

print $code;
=========================================================
$text = "That is some text, isn't it?";
$text =~ s/.*is/That's/;
print $text;
=========================================================
$text = "Here is some text.";
$text =~ s/\b([A-Za-z]+)\b/There/;
print $text;
=========================================================
while(<>) {
    if(m/^(yes)$/) {print "Thank you for being agreeable.}
}
=========================================================
$text = "<a>Here is an anchor.</a>";
if ($text =~ /<([img|a])>[\w\s\.]+<\/\1>/i)
    {print "Found an image or anchor tag.";}
=========================================================
$name = "Anonymous Perl Programmers";
$name =~ s/(\w)\w*/$1\./g;
print "The meeting of the $name foundation is now in session.";
=========================================================
$text = "I have 4 apples.";
if ($text =~ /(\d+)/) {print "Here's the number of apples: $1.\n";}
=========================================================
$text = "I see you";
$text =~ s/^(\w+) *(\w+) *(\w+)/$3 $2 $1/;
print $text;
=========================================================
$text = 'ID: 1234 Moola: $5.99 Destination: Unknown';

$text =~ /Cash: \$(.*) Destination|Moola: \$(.*) Destination/;

print "Amount = \$$+";
=========================================================
$_ = "This is a test";
@a = m/(\w*)\W(\w*)\W(\w*)\W(\w*)/;
print "@a";
=========================================================
@a = ("This is a test" =~ m/\w{4}\b/g);
print "@a";
=========================================================
$text = "I see you";
$text =~ s/^(?# 1st)(\w+) *(?# 2nd)(\w+) *(?# 3rd)(\w+)/$3 $2 $1/;
print $text;
=========================================================
$_ = "I'm going to Paris, London, and Vienna.";
print "Found all three." if /.*Vienna.*Paris.*London/;
=========================================================
$_ = "I'm going to Paris, London, and Vienna.";
print "Found all three." if /(?=.*Vienna)(?=.*Paris)(?=.*London)/;
=========================================================
while(<>) {
    if(m/^(exit|quit|stop)$/) {
        if($1) {
            print "You typed: $1\n";
        } else {
            print "Nothing stored.\n";
        }
    }
}
=========================================================
while(<>) {
    if(m/^(?:exit|quit|stop)$/) {
        if($1) {
            print "You typed: $1\n";
        } else {
            print "Nothing stored.\n";
        }
    }
}
=========================================================
$text = "Here is the texxxxxt.";
while ($text =~ m/x/g) {print "Found another x.\n";}
=========================================================
@a = ("This is a test" =~ m/\w{4}\b/g);
print "@a";
=========================================================
$text = "Now is the time.";
$text =~ s/./*/g;
print $text;
=========================================================
$text = "My name's Tim.";
$text =~ tr/i/o/;
print $text;
=========================================================
while (<>) {
    tr/i/o/;
    print;
}
=========================================================
$text = "Here is the text.";
$text =~ tr/a-z/A-Z/;
print $text;
=========================================================
$text = "Here is the text.";
$xcount = ($text =~ tr/x/x/);
print $xcount;
=========================================================
$text = "Now is the time.";
$text =~ /(\S+)/;
print $1;
=========================================================
$text = "Now is the time.";
$text =~ /(\w+)/;
print $1;
=========================================================
$text = "Now is the time.";
$text =~ /([A-Za-z]+)/;
print $1;
=========================================================
$text = "Now is the time.";
$text =~ /(\b[A-Za-z]+\b)/;
print $1;
=========================================================
$_ = "This isn't right.";
@a = m/(\w+)[\W|.]/g;
print "@a";
=========================================================
$_ = "This isn't right.";
@a = m/(\S+)[\s|.]/g;
print "@a";
=========================================================
$line = ".Hello!";

if ($line =~ m/^\./) {
    print "Shouldn't start a sentence with a period!";
}
=========================================================
$line = ".Hello!";

if ($line =~ m/\A\./) {
    print "Shouldn't start a sentence with a period!";
}
=========================================================
while(<>) {
    if(m/^exit$/) {exit;}
}
=========================================================
$text = "Here is some text\n";
$text =~ m/(.*$)/;
print "${1}.";
=========================================================
$text = "Here is some text\n";
$text =~ m/(.*)/s;
print "${1}.";
=========================================================
$text = "Here is some text\n";
$text =~ s/\n//;
print "${text}.";
=========================================================
$text = "Here is some text\n";
$text =~ m/(.*\Z)/;
print "${1}.";
=========================================================
$text = "Hello!";
if ($text =~ /\D/) {print "It's not a number.";}
=========================================================
$text = "345";
if ($text =~ /^\d+$/) {print "It's a number.";}
=========================================================
$text = "3.1415";
if ($text =~ /^\d+\.\d*$/) {print "It's a number.";}
=========================================================
$text = "-3.1415";
if ($text =~ /^[+-]\d+\.\d*$/) {print "It's a number.";}
=========================================================
$text = "1A0";
unless ($text =~ /^[+-]*[\da-f]+$/i) {print "It's not a hex number.";}
=========================================================
$_ = "1.0 and 2.4 and 310 and 4.7 and so on.";
@a = m/([\d|\.]+)\D+/g;
print "@a";
=========================================================
$text = "aBc";
if ($text =~ /^\w+$/) {print "Only word characters found.";}
=========================================================
$text = "aBc";
if ($text =~ /^[A-Za-z]+$/) {print "Only letters found.";}
=========================================================
$_ = "1.0 and 2.4 and retval-5";
@a = m/(\S+)/g;
print join(", ", @a);
=========================================================
$text = "Here is the texxxxxt.";
while ($text =~ m/x/g) {print "Found another x.\n";}
=========================================================
$_ = "This is a test";
@a = m/\w{4}/g;
print "@a";
=========================================================
$_ = "Here is the text";
@a = m/\b[^A-Z]+\b/g;
print "@a";
=========================================================
$_ = "This is a test";
@a = m/(\w*)\W(\w*)\W(\w*)\W(\w*)/;
print "@a";
=========================================================
$text = "Here is the texxxxxt.";
$text =~ s/x/z/g;
print $text;
=========================================================
$text = "Here is the texxxxxt.";
print ($text =~ s/x/z/g);
=========================================================
@a = qw(This is a test);
@b = map/^(\w{4})/, @a;
print "@b";
=========================================================
@a = qw(This is a test);
@b = grep/^\w{4}/, @a;
print "@b";
=========================================================
$text = "Name: Anne Name: Burkart Name: Claire Name: Dan";
$match = 0;

while ($text =~ /Name: *(\w+)/g) {
    ++$match;
    print "Match number $match is $1.\n";
}
=========================================================
$text = "Name: Anne Name: Burkart Name: Claire Name: Dan";

for ($match = 0; $text =~ /Name: *(\w+)/g; print
    "Match number ${\++$match} is $1.\n") {}
=========================================================
$_ = "There's Thomas on the bus!";
while(/o/g) {
    print "There's an \"o\" at position ". pos() . "\n";
}
=========================================================
$_ = "There's Thomas on the bus!";
m/o/g;
m/\G(.*)/g;
print $1;
=========================================================
$text = "Here is some text\n";
$text =~ m/(.*)/s;
print "${1}.";
=========================================================
$_ = "This text\nhas multiple lines.";
s/^/BOL/g;
s/$/EOL/g;
print;
=========================================================
$_ = "This text\nhas multiple lines.";
s/^/BOL/mg;
s/$/EOL/mg;
print;
=========================================================
$_ = "This text\nhas multiple lines.";
s/\A/BOS/mg;
s/\Z/EOS/mg;
=========================================================
while (<>) {
    chomp;
    unless (/^q/i) {
        print;
    } else {
        exit;
    }
}
=========================================================
while (<>) {
    chomp;
    unless (/^(q|Q)/i) {
        print;
    } else {
        exit;
    }
}
=========================================================
while(<>) {
    if(m/^stop$/i) {exit;}
}
=========================================================
$record = "Product number: 12345 Product type: printer 
    Product price: $325";
if ($record =~ /Product type: *([a-z]+)/i) {print 
    "The product's type is $1\n";}
=========================================================
$text = "Now is the time.";
$text =~ s/(\w+)/uc($1)/ge;
print $text;
=========================================================
sub negatory
{
   $hash{is} = 'is not';
   $hash{may} = 'may not';
   $hash{can} = 'can not';
   $hash{was} = 'was not';
   $hash{will} = 'will not';

   $value = shift;

   if (exists $hash{$value}) {
       return $hash{$value};
   } else {
       return $value;
   }
}

$text = "Now is the time.";
$text =~ s/(\w+)/negatory($1)/ge;

print $text;
=========================================================
$_ = "Now is the the time time.";

@duplicates = m/(\S+)\s\1/g;

print "Duplicated words: @duplicates";
=========================================================
$text = "That is some text, isn't it?";
$text =~ s/.*is/That's/;
print $text;
=========================================================
$text = "That is some text, isn't it?";
$text =~ s/.*?is/That's/;
print $text;
=========================================================
$_ = "No, these are the documents, over there.";
s/the(.*)e/those/;
print;
=========================================================
$_ = "No, these are the documents, over there.";
s/the(.*?)e/those/;
print;
=========================================================
$text = "     Now is the time.";
$text =~ s/^\s+//;
print $text;
=========================================================
$text = "Now is the time.     ";
$text =~ s/\s+$//;
print $text;
=========================================================
$text = "Mary Tom Frank ";
while ($text =~ /\w+(?=\s)/g) {
    print "$&\n";
}
=========================================================
$text = "Mary Tom Frank ";
while ($text =~ /(\w+)\s/g) {
    print "$1\n";
}
=========================================================
$_ = "Not just any Tom, Dick, or Harry.";
print "Found Dick, Tom, and Harry." if /.*Dick.*Tom.*Harry/;
=========================================================
$_ = "Not just any Tom, Dick, or Harry.";
print "Found Dick, Tom, and Harry." if /(?=.*Dick)(?=.*Tom)(?=.*Harry)/;
=========================================================
while (<>) {
    if (!m/.{20,}) {
        print "Please type longer lines!\n";
    } else {
        print "Let's have another!\n";
    }
}
=========================================================
$match = "Perl";

while (<>) {
    if (/$match/) {
        print "You typed Perl.\n";
    } else {
        print "You didn't type Perl.\n";
    }
}
=========================================================
$match = "Perl";

while (<>) {
    if (/$match/o) {
        print "You typed Perl.\n";
    } else {
        print "You didn't type Perl.\n";
    }
}
=========================================================
@patterns =
(
    qr/\bis\b/,
    qr/\bthe\b/,
    qr/\bbut\b/,
    qr/\ba\b/,
    qr/\bnone\b/,
);
=========================================================
@patterns =
(
    qr/\bis\b/,
    qr/\bthe\b/,
    qr/\bbut\b/,
    qr/\ba\b/,
    qr/\bnone\b/,
);

while (<>) {

    for ($loop_index = 0; $loop_index < $#patterns; $loop_index++) {

        if(/$patterns[$loop_index]/) {
           print "Matched pattern $loop_index!\n";
        }
        else {
           print "Didn't match pattern $loop_index.\n";
        }

    }
}
=========================================================
!!!CODE7!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
============================================================
$value = 10; 
if ($value > 10 ) {
    print "Value is $value.\n";
} else {
    print "Value is too small.\n";
}
$value = 12;
if ($value > 10 ) {
    print "Value is $value.\n";
} else {
    print "Value is too small.\n";
}
============================================================
sub printifOK
{
    if ($value > 10 ) {
        print "Value is $value.\n";
    } else {
        print "Value is too small.\n";
    }
}

$value = 10;
printifOK;

$value = 12;
printifOK;
============================================================
sub printifOK
{
    my $localvalue = $value;

    if ($localvalue > 10 ) {
        print "Value is $value.\n";
    } else {
        print "Value is too small.\n";
    }
}

$value = 10;
printifOK;

$value = 12;
printifOK;
============================================================
$value = 10;
printifOK ($value);
============================================================
sub printifOK
{
    my $internalvalue = shift(@_);

    if ($internalvalue > 10 ) {
        print "Value is $value.\n";
    } else {
        print "Value is too small.\n";
    }
}
============================================================
$value = 10;
printifOK ($value);

$value = 12;
printifOK ($value);
============================================================
sub addem
{
    ($value1, $value2) = @_;
    return $value1 + $value2;
}

print "2 + 2 = " . addem(2, 2) . "\n";
============================================================
sub addem
{
    ($value1, $value2) = @_;
    $value1 + $value2;
}

print "2 + 2 = " . addem(2, 2) . "\n";
============================================================
$value = addem(2, 2);

print "2 + 2 = $value\n";

sub addem
{
    ($value1, $value2) = @_;
    $value1 + $value2;
}
============================================================
$value = addem 2, 2;

print "2 + 2 = $value\n";

sub addem
{
    ($value1, $value2) = @_;
    $value1 + $value2;
}
============================================================
sub addem;

$value = addem 2, 2;

print "2 + 2 = $value\n";

sub addem
{
    ($value1, $value2) = @_;
    $value1 + $value2;
}
============================================================
sub addem
{
    ($value1, $value2) = @_;
    $value1 + $value2;
}

$value = addem 2, 2;

print "2 + 2 = $value\n";
============================================================
sub printhello
{
    print "Hello!";
}
============================================================
sub printhello
{
    print "Hello!";
}

printhello;
============================================================
printhello;

sub printhello
{
    print "Hello!";
}
============================================================
printhello();

sub printhello
{
    print "Hello!";
}
============================================================
sub addem
{
    ($value1, $value2) = @_;
    $value1 + $value2;
}

$value = &addem(2, 2);
$value = addem(2, 2);
$value = addem 2, 2;

$name = "addem";
$value = &$name(2, 2);

print "2 + 2 = $value\n";
============================================================
sub addem
{
    ($value1, $value2) = @_;
    $value1 + $value2;
}

@_ = (2, 2);
$value = &addem;

print "2 + 2 = $value\n";
============================================================
sub addem
{
    ($value1, $value2) = @_;
    $value1 + $value2;
}

@_ = (2, 2);
$value = &addem if defined addem;

print "2 + 2 = $value\n";
============================================================
sub addem
{
    $value1 = shift;
    $value2 = shift;
    print "$value1 + $value2 = " . ($value1 + $value2) . "\n";
}
============================================================
sub addem
{
    ($value1, $value2) = @_;
    print "$value1 + $value2 = " . ($value1 + $value2) . "\n";
}
============================================================
sub addone
{
    ++@_[0];
}

$value = 1;

addone($value);

print "The value of \$value = $value.\n";
============================================================
sub addone
{
    foreach (@_) {
        $_++;
    }
    return @_;
}

@a = (1, 2, 3);

@b = addone(@a);

print "@b";
============================================================
$hash{fruit} = peach;
$hash{vegetable} = broccoli;
$hash{pie} = blueberry;

sub printem
{
    %hash = @_;

    foreach $key (keys %hash) {
        print "$key => $hash{$key}\n";
    }
}

printem(%hash);
============================================================
sub addem
{
    $sum = 0;

    print "You passed " . ($#_ + 1) . " elements.\n";

    foreach $element (@_) {
        $sum += $element;
    }
    print join (" + ", @_) . " = $sum\n";
}

addem(2, 2, 2);
============================================================
sub addem
{
    ($value1, $value2) = @_;
    $value2 ||= 1;
    print "$value1 + $value2 = " . ($value1 + $value2);
}

addem(2);
============================================================
sub addem
{
    ($value1, $value2) = @_;
    if (!defined($value2)) {
        $value2 = 1
    };
    print "$value1 + $value2 = " . ($value1 + $value2);
}

addem(2);
============================================================
sub addem
{
    $value1 = shift @_;
    if ($#_ > 0) {
        $value2 = @_[1];
    } else {
        $value2 = 1;
    }
    print "$value1 + $value2 = " . ($value1 + $value2);
}
addem(2);
============================================================
sub addem
{
    ($value1, $value2) = @_;
    return $value1 + $value2;
}

print "2 + 2 = " . addem(2, 2) . "\n";
============================================================
sub getvalues
{
    return 1, 2, 3, 4, 5, 6;
}

@array = getvalues;
print join(", ", @array);
============================================================
sub addone
{
    foreach (@_) {
        $_++;
    }
    return @_;
}

@a = (1, 2, 3);

@b = addone(@a);

print "@b";

============================================================
sub gethash ()
{
    $hash{fruit} = peach;
    $hash{vegetable} = broccoli;
    $hash{pie} = blueberry;

    return %hash;
}

%myhash = gethash;

foreach $key (keys %myhash) {
    print "$key => $myhash{$key}\n";
}
============================================================
sub getdata()
{
    eval {
        open FILEHANDLE, "<nonexist.dat";
        $line = <FILEHANDLE> if FILEHANDLE;
    };

    if ($@) {
       return;
    } else {
       return $line;
    }
}
============================================================
$data = getdata();

if (defined ($data)) {
    print $data;
} else {
    print "Sorry, getdata failed!\n";
}
============================================================
sub printem
{
    $inner = shift @_;
    print $inner;
}

printem "Hello!\n";

print $inner;
============================================================
sub printem
{
    my $inner = shift @_;
    print $inner;
}

printem "Hello!\n";

print $inner;
============================================================
my $variable;
my ($variable1, $variable2);    
my $variable = 5;  
my @array = (1, 2, 3);
my %hash;
============================================================
my $variable1, $variable2 = 5;                  
============================================================
$testvalue = 10;

if ((my $variable1 = 10) > $testvalue ) {

    print "Value, $variable1, is greater than the test value.\n";

} elsif ($variable1 < $testvalue) {

    print "Value, $variable1, is less than the test value.\n";

} else {

    print "Value, $variable1, is equal to the test value.\n";

}
============================================================
sub printifOK
{
    local $localvalue = $value;

    if ($localvalue > 10 ) {
        print "Value is $value.\n";
    } else {
        print "Value is too small.\n";
    }
}

$value = 10;
printifOK;

$value = 12;
printifOK;
============================================================
$value = 1;

sub printem() {print "\$value = $value\n"};

sub makelocal()
{
    local $value = 2;
    printem;
}

makelocal;
printem;
============================================================
$value = 1;

sub printem() {print "\$value = $value\n"};

sub makelocal()
{
    my $value = 2;
    printem;
}

makelocal;
printem;
============================================================
$value1 = 1;

my $value2 = 2;

local $value3 = 3;

print join(", ", keys %::);
============================================================
sub incrementcount {
    my $count;
    return ++$count;
}

print incrementcount . "\n";
print incrementcount . "\n";
print incrementcount . "\n";
print incrementcount . "\n";
============================================================
sub BEGIN 
{
    my $count = 0;
    sub incrementcount {
        return ++$count;
    }
    print incrementcount . "\n";
    print incrementcount . "\n";
    print incrementcount . "\n";
    print incrementcount . "\n";
}
============================================================
sub addem
{
    ($value1, $value2) = @_;
    $value1 + $value2;
    print join(", ", caller);

}

$value = &addem(2, 2);
============================================================
sub addem
{
    ($value1, $value2) = @_;
    $value1 + $value2;
    print join(", ", caller 1);

}

sub callingfunction
{
    $value = addem(2, 2);
}

callingfunction;
============================================================
sub factorial
{
    my $value = shift (@_);

    return $value == 1 ? $value : $value * factorial ($value - 1);

}

$result = factorial(6);

print $result;
============================================================
============================================================
sub outer
{
    my $s = "Inside the inner subroutine.\n";

    sub inner
    {
        my $s2 = $s;
        print $s2;
    }

    inner();
}

outer();
============================================================
@a = (1, 2, 3);
@b = (4, 5, 6);
============================================================
@array = addem (\@a, \@b);
============================================================
sub addem
{
    my ($ref1, $ref2) = @_;

    while (@{$ref1}) {

        unshift @result, pop(@{$ref1}) + pop(@{$ref2});

    }

    return @result;
}
============================================================
@array = addem (\@a, \@b);
============================================================
sub getarrays
{
    @a = (1, 2, 3);
    @b = (4, 5, 6);

    return \@a, \@b;
}
============================================================
($aref, $bref) = getarrays;

print "@$aref\n";
print "@$bref\n";
============================================================
@a = (1, 2, 3);
@b = (4, 5, 6);

sub addem {
    local(*array1, *array2) = @_;

    while (@array1) {

        unshift @result, pop(@array1) + pop(@array2);

    }

    return @result
}

@result = addem(*a, *b);
print join(", ", @result);
============================================================
sub printhello {
    my $handle = shift;
    print $handle "Hello!\n";
}
printhello(\*STDOUT);
============================================================
sub swapxy 
{
    my @data = @_;
    for (@data) {
        s/x/y/g;
    }
    return wantarray ? @data : $data[0];
}
============================================================
$a = "xyz";
$b = "xxx";

($a, $b) = swapxy($a, $b);

print "$a\n";
print "$b\n";
============================================================
sub e () {2.71828}             
sub e () {exp 1}      
============================================================
sub addem
{
    my %hash = @_;

    return $hash{OPERAND1} + $hash{OPERAND2};
}
============================================================
print "The result is: " . addem(OPERAND1 => 2, OPERAND2 => 3);
============================================================
sub addem
{
    my %hash =
    (
        OPERAND1 => 2,
        OPERAND2 => 3,
        @_,
    );

    return $hash{OPERAND1} + $hash{OPERAND2};
}

print "The result is: " . addem(OPERAND1 => 3);
============================================================
use subs 'exit';
sub exit
{
    print "Do you really want to exit?";
    $answer = <>;
    if ($answer =~ /^y/i) {CORE::exit;}
}
while (1) {
    exit;
}
============================================================
$coderef = sub {print "Hello!\n";};
============================================================
&{$coderef};
============================================================
local $SIG{__WARN__} = sub {}; 
============================================================
sub ctof          #Centigrade to farenheit
{
   $value = shift(@_);
   return 9 * $value / 5 + 32;
}

sub ftoc          #Farenheit to centigrade
{
   $value = shift(@_);
   return 5 * ($value - 32) / 9;
}
============================================================
$tempconvert[0] = \&ftoc;
$tempconvert[1] = \&ctof;
============================================================
print "Zero centigrade is " . &{$tempconvert[1]}(0) . " farenheit.\n";
============================================================
sub sub1
{
    $text = shift;
    print "$text there!\n";
}
============================================================
sub sub2
{
    $text = shift;
    print "$text everyone!\n";
}
============================================================
sub1("Hello");

*sub1 = \&sub2;         #redefine sub1

sub1("Hello");
============================================================
!!!CODE8!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
==========================================================
format STDOUT = 
@<<<<<<<<<<<@>>>>>>>>>>>>>>>  
$text1      $text2
.
==========================================================
$text1 = "Hello";
$text2 = "there!";
==========================================================
write;                        #Uses STDOUT by default.
==========================================================
@<<<<<<<<<<<@>>>>>>>>>>>>>>>  
Hello                 there!
==========================================================
format STDOUT =
@<<<<<<<<<<<@<<<<<<<<<<<<<<<<<<<<
$text1      $text2
.
$text1 = "Hello";
$text2 = "there!";
==========================================================
write;                        #Uses STDOUT by default.
==========================================================
format STDOUT =
@||||||||||||||||||||||||||
sprintf "%.4f", 3.1415
.

write;
==========================================================
print <<EOD;
==========================================================
print <<EOD;

This 
is 
a 
"here" 
document.
EOD
==========================================================
print <<EOD;

This
 is
  a
   "here"
    document.
EOD
==========================================================
$display = 1;

if ($display) {
    print <<EOD;
This 
is 
a 
"here" 
document.
EOD
}
==========================================================
$display = 1;

if ($display) {
    $here = <<EOD;
    This
    is
    a
    "here"
    document.
EOD

    $here =~ s/^\s+//mg;

    print $here;
}
==========================================================
format STDOUT =
@<<<<<<<<<<<@>>>>>>>>>>>>>>>  
$text1      $text2
.

$text1 = "Hello";
$text2 = "there!";

write;                        
==========================================================
format STDOUT =
@<<<<<<<<<<<<@<<<<<<<<<<<<@<<<<<<<<@<<<<
$firstname   $lastname    $ID      $extension
.

$firstname = "Cary"; 
$lastname = "Grant";
$ID = 1234; 
$extension = x456;

==========================================================
==========================================================
format STDOUT =
@>>>>>>>>>>>>>>>>
$text
.

$text = "Hello!";

write;
==========================================================
format STDOUT =
@||||||||||||||||||||||||||
$text
.

$text = "Hello!";

write;
==========================================================
$pi = 3.1415926;

format STDOUT =
@.## @.#######
$pi   $pi
.

write;
==========================================================
format STDOUT =
@||||||||||||||||||||||||||
sprintf "%.4f", 3.1415
.

write;
==========================================================
format STDOUT =
@<<<<<<<<<<<@<<<<<<<<<<<<<<<
$text1      $text2
@<<<<<<<<<<<@<<<<<<<<<<<<<<<
$text3      $text4
.

$text1 = "Hello";
$text2 = "there!";
$text3 = "How're";
$text4 = "things?";

write;
==========================================================
format STDOUT =
English: ^<<<<<
       $text
German: ^<<<<<<<<<
       $text
French: ^<<<<<<<<
       $text
.

$text = "Hello!Guten Tag!Bonjour!";
==========================================================
$: = "";
format STDOUT =
English: ^<<<<<
       $text
German: ^<<<<<<<<<
       $text
French: ^<<<<<<<<
       $text
.

$text = "Hello!Guten Tag!Bonjour!";

write;
==========================================================
format STDOUT =
@*
$text
.
$text = "Here\nis\nthe\ntext.";
write;
==========================================================
print <<EOD
Here\nis\nthe\ntext.
EOD
==========================================================
format STDOUT =
@*
$text
@<<<<<<<<<<<<@<<<<<<<<<<<<@<<<<<<<<@<<<<
$firstname   $lastname    $ID      $extension
.

$text = "Here is the data you asked for...";
$firstname = "Cary";
$lastname = "Grant";
$ID = 1234;
$extension = x456;

write;
==========================================================
format STDOUT_TOP =
                  Employees
First Name   Last Name    ID       Extension
--------------------------------------------
.

format STDOUT =
@<<<<<<<<<<<<@<<<<<<<<<<<<@<<<<<<<<@<<<<
$firstname   $lastname    $ID      $extension
.

$firstname = "Cary"; $lastname = "Grant";
$ID = 1234; $extension = x456;

write;
==========================================================
format standardformat =
@||||||||||||||||||||||||||
$text
.
$text = "Hello!";
$~ = standardformat;
write;
==========================================================
format standardformat_top =
                  Employees
First Name   Last Name    ID       Extension
--------------------------------------------
.

format standardformat =
@<<<<<<<<<<<<@<<<<<<<<<<<<@<<<<<<<<@<<<<
$firstname   $lastname    $ID      $extension
.

$firstname = "Cary"; $lastname = "Grant";
$ID = 1234; $extension = x456;
==========================================================
open FILEHANDLE, ">report.frm" or die "Can't open file";

select FILEHANDLE;
==========================================================
open FILEHANDLE, ">report.frm" or die "Can't open file";

select FILEHANDLE;

$~ = standardformat;
$^ = standardformat_top;

write;
close;
==========================================================
format standardformat_top =
@>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"Page $%"
                  Employees          
First Name   Last Name    ID       Extension
--------------------------------------------
.

format standardformat =
@<<<<<<<<<<<<@<<<<<<<<<<<<@<<<<<<<<@<<<<
$firstname   $lastname    $ID      $extension
.

$text = "Here is the data you asked for...";
$firstname = "Cary"; 
$lastname = "Grant";
$ID = 1234; 
$extension = x456;
==========================================================
open FILEHANDLE, ">report.frm" or die "Can't open file";

select FILEHANDLE;
==========================================================
$~ = standardformat;
$^= standardformat_top;
$= = 1;

write;
write;
==========================================================
$str = formline <<'EOD', right, center, left;
Here's some text justification...
----------------------------
@<<<<<<<<@|||||||@>>>>>>>>>>
EOD

print "$^A\n";
==========================================================
while (<>) {
    print "Here's what you typed lowercased: " . lc . "\n";
    print "Here's what you typed uppercased: " . uc . "\n";
}
==========================================================
while (<>) {
    print "Initial lowercase: " . lcfirst;
    print "Initial uppercase: " . ucfirst;
}
==========================================================
$text = "This is the promise.";

print "First occurance of \"is\" is at position: " .
    index($text, "is") . "\n";
print "Last occurance of \"is\" is at position: " .
    rindex($text, "is") . "\n";
==========================================================
$text = "Here is the text.";

print substr ($text, 12) . "\n";
==========================================================
print substr ($text, 12, 4) . "\n";
==========================================================
substr ($text, 12, 4, "word");
print "$text\n";
==========================================================
substr ($text, 12, 4) = "word";

print $text;
==========================================================
sub replace
{
    ($text, $to_replace, $replace_with) = @_;

    substr ($text, index($text, $to_replace),
        length($to_replace), $replace_with);

    return $text;
}

print replace("Here is the text.", "text", "word");
==========================================================
$text = "Hello there!";

print "The string \"$text\" is " . length ($text) . " characters long.";
==========================================================
sub replace
{
    ($text, $to_replace, $replace_with) = @_;

    substr ($text, index($text, $to_replace),
        length($to_replace), $replace_with);

    return $text;
}

print replace("Here is the text.", "text", "word");
==========================================================
print pack("ccc", 88, 89, 90); 
==========================================================
print pack("c3", 65, 66, 67);
==========================================================
print pack("c*", 68, 69, 70, 71);
==========================================================
$string = pack("ccc", 88, 89, 90);

print join(", ", unpack "ccc", $string);
==========================================================
$decimal = 17;
$binary = unpack("B32", pack("N", $decimal));
print $binary;
==========================================================
$decimal = 17;
$binary = unpack("B32", pack("N", $decimal));
$newdecimal = unpack("N", pack("B32", $binary));
print $newdecimal;
==========================================================
$string = "This is the text",
$substring_start = 12;
$substring_length = 4;

print unpack("x$substring_start a$substring_length", $string);
==========================================================
$s = "Hello";
@a = unpack("C*", $s);
print join(", ", @a);
==========================================================
$value = 1234.56789;
print sprintf "%.4f\n", $value;
==========================================================
print sprintf "%.5f\n", $value;
==========================================================
print sprintf "%6.6f\n", $value;
==========================================================
print sprintf "%+.4e\n", $value;
==========================================================
@a = ("%s%s%s%s", "P", "e", "r", "l");
print sprintf(@a);
==========================================================
$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

foreach $key (sort {myfunction($a, $b)} keys %hash) {
    print "$key => $hash{$key}\n";
}

sub myfunction
{
   return (shift(@_) cmp shift(@_));
}
==========================================================
$s1 = 5;
$s2 = 10;

if ($s1 gt $s2) {     #wrong!
    print "$s1 is greater than $s2";
}
==========================================================
$s1 = "apples";
$s2 = "oranges";

if ($s1 == $s2) {
    print "$s1 are the same as $s2";
}
==========================================================
print ord 'A';
==========================================================
print ord 'ABC';
==========================================================
print chr 65;
==========================================================
print chr(ord "A");
==========================================================
$s = "Hello";
@a = unpack("C*", $s);
print join(", ", @a);
==========================================================
print pack("c3", 65, 66, 67);
==========================================================
$s = "Hello";
==========================================================
@a = split (//, $s);
print "@a\n";
==========================================================
while ($s =~ /(.)/gs) {print "$1 "};
print "\n";
==========================================================
foreach (unpack("C*", $s)) {print chr($_), " "};
print "\n";
==========================================================
for ($loop_index = 0; $loop_index < length($s); $loop_index++) {
    print substr($s, $loop_index, 1) , " ";
}
==========================================================
$string = "Hello!";

$reversed = reverse($string);
print "$reversed\n";
==========================================================
foreach (split (//, $string)) {push @a, $_};
while(@a) {print (pop (@a))};
print "\n";
==========================================================
while ($string =~ /(.)/gs) {unshift @a, $1};
print @a;
==========================================================
$text = "Hello";
$encrypted = crypt $text, "AB";
print $encrypted;
==========================================================
$encrypted = "AB/uOsC7P93EI";

$salt = substr($encrypted, 0, 2);

print "Guess the word: ";

while(<>) {

    chomp;
    if ($encrypted eq (crypt $_, $salt)) {
        print "You got it!";
        exit;
    } else {
        print "Nope.\n";
        print "Guess the word: ";
    }
}
==========================================================
$text = "hello there!";

print "$text\n";

$text =~ tr/a-z/d-za-c/;

print "$text\n";

$text =~ tr/d-za-c/a-z/;

print "$text\n";
==========================================================
$text = q/"I said, 'no.'"/;
print $text;

"I said, 'no.'"
==========================================================
$string = "no.";
$text = qq/"I said, '$string'"/;
print $text;
==========================================================
@patterns =
(
    qr/\bis\b/,
    qr/\bthe\b/,
    qr/\bbut\b/,
    qr/\ba\b/,
    qr/\bnone\b/,
);

while (<>) {

    for ($loop_index = 0; $loop_index < $#patterns; $loop_index++) {

        if(/$patterns[$loop_index]/) {
           print "Matched pattern $loop_index!\n";
        }
        else {
           print "Didn't match pattern $loop_index.\n";
        }

    }
}
==========================================================
$ls = 'ls';
print qx/$ls/;
==========================================================
$ls = `ls`;
print $ls;
==========================================================
$dir = dir;
print qx/$dir/;
==========================================================
qw/Now is the time./;
split(' ', q/Now is the time/);
==========================================================
@name = qw(soap blanket shirt pants plow);
@category = qw(home home apparel apparel farm);
@subcategory = qw(bath bedroom top bottom field);

@indices = sort {$category[$a] cmp $subcategory[$b]
    or $category[$a] cmp $subcategory[$b]} (0 .. 4);

foreach $index (@indices) {
    print "$category[$index]/$subcategory[$index]: $name[$index]\n";
}
==========================================================
@a = qw/P, e, r, l/;
print @a;
==========================================================
=head1 Simulation of Named Characters

=head2 This example uses hashes.

This example:

=over 4

=item 1

Shows how to set up two named parameters

=item 2

Shows how to set up defaults for arguments

=cut
==========================================================
=head1 Simulation of Named Characters

=head2 This example uses hashes.

This example:

=over 4

=item 1

Shows how to set up two named parameters

=item 2

Shows how to set up defaults for arguments

=cut

sub addem 
{
    my %hash = 
    (
        OPERAND1 => 2,
        OPERAND2 => 3,
        @_,
    );

    return $hash{OPERAND1} + $hash{OPERAND2};
}

print "The result is: " . addem(OPERAND1 => 3);
==========================================================
<!-- $Id$ -->
<HTML><HEAD>
<CENTER><TITLE>a.pl</TITLE>
</HEAD>
<BODY></CENTER><p><hr>

<H1> 
<A NAME="a.pl_simulation_0">
Simulation of Named Characters</A>
</H1>
<p>
<H2> 
<A NAME="a.pl_this_0">
This example uses hashes.</A>
</H2>
This example:
<p>
<OL>
<LI>Shows how to set up two named parameters
<p>
<LI>Shows how to set up defaults for arguments
<p>
</OL>

</BODY>
</HTML>
==========================================================
!!!CODE9!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=================================================================
$variable1 = 5;

$reference = \$variable1;

print $reference;
=================================================================
@a = (1, 2, 3);

$arrayref = \@a;

print "@$arrayref";
=================================================================
$variable1 = 5;

$variablename = "variable1";

print "$$variablename\n";
=================================================================
@a = (1, 2, 3);

$arrayref = "a";

print "@$arrayref";
=================================================================
@array = (1, 2, 3);

$arrayref = \@array;

print @$arrayref[0];

print $arrayref->[0];
=================================================================
$arrayref = [1, 2, 3];

print $$arrayref[0];
=================================================================
$reference = \"Hello!";

print $$reference;
=================================================================
$reference4 = \\\\"Hello!";
=================================================================
print $$$$$reference4;
=================================================================
$scalarreference = \$variable1;
$arrayreference  = \@array;
$hashreference   = \%hash;
$codereference   = \&subroutine;
$globreference   = \*name;
=================================================================
$variable1 = 100;
$scalarreference = \$variable1;
=================================================================
$variable1 = 100;
$scalarreference = \$variable1;
print "$$scalarreference\n";
=================================================================
@array = (1, 2, 3);
$arrayreference  = \@array;
=================================================================
@array = (1, 2, 3);
$arrayreference  = \@array;

print "@$arrayreference\n";
=================================================================
%hash = (that => this);
$hashreference   = \%hash;

print "$$hashreference{that}\n";
=================================================================
sub subroutine
{
    print "Hello!\n";
}
=================================================================
$codereference   = \&subroutine;
=================================================================
&$codereference;
=================================================================
sub printhello
{
    print "Hello!\n";
}

sub printem
{
    &{@_[0]};
}

printem \&printhello;
=================================================================
sub printhello
{
    my $handle = shift;
    print $handle "Hello!\n";
}
=================================================================
open FILEHANDLE, ">file.tmp" or die "Can't open file.";
=================================================================
printhello(FILEHANDLE);
=================================================================
printhello(*FILEHANDLE);
=================================================================
printhello(\*FILEHANDLE);
=================================================================
$$reference = 5;

print "$$reference\n";
=================================================================
print "$reference\n";
=================================================================
@a = (1, 2, 3);
@b = (4, 5, 6);

sub addem
{
    my ($reference1, $reference2) = @_;
    for ($loop_index = 0; $loop_index <= $#$reference1; 
        $loop_index++) {
        $result[$loop_index] = @$reference1[$loop_index] + 
            @$reference2[$loop_index];
    }
    return @result;
}

@array = addem (\@a, \@b);
print join (', ', @array);
=================================================================
@reflist = \($s1, $s2, $s3);      
@reflist = (\$s1, \$s2, \$s3);
=================================================================
$ref = \(2, 4, 6); 
print $$ref;
=================================================================
$ref = \(1 .. 3); 
print "@$ref";
=================================================================
$string = "Hello";
$ref = \substr($a, 0, 1);
print $ref;
=================================================================
$arrayreference = [1, 2, 3];

print $$arrayreference[0];
=================================================================
$arrayreference = [1, 2, 3];

print $arrayreference->[0];
=================================================================
@a = (1, 2, 3);
$s = pop @a;

print "@a\n";
=================================================================
@a = (1, 2, 3);
$s = pop @{[@a]};

print "@a\n";
=================================================================
print "@{[uc(hello)]} there.\n";
=================================================================
$ref = \(qw/Now is the time./);    #wrong!
=================================================================
$ref = [qw/Now is the time./];
print "@$ref";
=================================================================
$ref = [1, 2, 3];

for ($total = 0, $loop_index = 0; $loop_index <= $#$ref + 1;
    $loop_index++) {

    $total += $$ref[$loop_index];

}

print "Average value = " . $total / ($#$ref + 1);
=================================================================
$hashref = {
    Name  => Tommie,
    ID => 1234,
};
=================================================================
print $$hashref{Name};
=================================================================
$hashreference = {
    Name  => Tommie,
    ID => 1234,
};

print $hashreference->{Name};
=================================================================
$hashref = {
    fruit => apple,
    sandwich => hamburger,
    drink => bubbly,
};

while(($key, $value) = each(%$hashref)) {
    print "$key => $value\n";
}
=================================================================
$codereference = sub {print "Hello!\n"};

&$codereference;
=================================================================
$codereference = sub {print shift};

&$codereference("Hello!\n");
=================================================================
$codereference = sub {print shift};

$codereference->("Hello!\n");
=================================================================
$codereference = sub {100};

$s = &$codereference;
=================================================================
local $SIG{__WARN__} = sub {}; 
=================================================================
sub record
{
    ($value, $max, $min) = @_;

    if ($value >= $min && $value <= $max){
        return {
            value => $value,
            max => $max,
            min => $min,
        };
    } else {
        return;
    }
}
=================================================================
$myrecord = record(100, 1000, 10);
=================================================================
$myrecord = record(100, 1000, 10);

print $myrecord->{value};
=================================================================
$scalarreference = *name{SCALAR};
$arrayreference  = *name{ARRAY};
$hashreference   = *name{HASH};
$codereference   = *name{CODE};
$ioreference     = *name{IO};
$globreference   = *name{GLOB};
=================================================================
$variable1 = 5;

$scalarreference = *variable1{SCALAR};

print $$scalarreference;
=================================================================
$scalar = 1;

${*scalar{SCALAR}} = 5;

print $scalar;
=================================================================
sub printem
{
    print "Hello!\n";
}

$codereference = *printem{CODE};

&$codereference;
=================================================================
open FILEHANDLE, ">file.dat" or die "Couldn't open file.";

$ioref = *FILEHANDLE{IO};

print $ioref "Hello";

close $ioref;
=================================================================
sub writefile
{
    my $my_ioref = @_[0];
    print $my_ioref "Hello!";

}

open FILEHANDLE, ">file.dat" or die "Couldn't open file.";

$ioref = *FILEHANDLE{IO};

writefile $ioref;

close $ioref;
=================================================================
${*newscalar{SCALAR}} = 5;

print $newscalar;
=================================================================
$variable1 = 5;

$reference = \$variable1;

print $$reference;
=================================================================
$reference4 = \\\\"Hello!";
print $$$$$reference4;
=================================================================
@array = (1, 2, 3);
$arrayreference = \@array;

print $$arrayreference[0];
=================================================================
%hash = (
    Name  => Tommie,
    ID => 1234,
);

$hashreference = \%hash;

print $$hashreference{Name};
=================================================================
sub printem
{
    print shift;
}

$codereference = \&printem;

&$codereference ("Hello!\n");
=================================================================
@a = (1, 2, 3);
$ref = \@a;

print "@$ref";
=================================================================
$scalar = $$scalarreference;
@array = @$arrayreference;
%hash = %$hashreference;
&$codereference($argument1, $argument2);
*glob = *$globreference;
=================================================================
$scalar = ${$scalarreference};
@array = @{$arrayreference};
%hash = %{$hashreference};
&{$codereference}($argument1, $argument2);
*glob = *{$globreference};
=================================================================
$ref = 5;

@ref = (1, 2, 3);

print "${*ref}\n";
=================================================================
$ref = 5;

@ref = (1, 2, 3);

print "${*ref}\n";
=================================================================
print "@{*ref}\n";
=================================================================
$arrayreference = [1, 2, 3];

print $arrayreference->[0];
=================================================================
$hashreference->{key} = "This is the text.";

print $hashreference->{key};
=================================================================
sub printem
{
    print shift;
}

$codereference = \&printem;

$codereference->("Hello!\n");
=================================================================
$dataset[$today]->{prices}->[1234] = "$4999.99";
=================================================================
$arrayreference = [[1, 2, 3], [4, 5, 6]];
=================================================================
$arrayreference = [[1, 2, 3], [4, 5, 6]];

print "@{$arrayreference->[1]}";
=================================================================
$arrayreference = [[1, 2, 3], [4, 5, 6]];

print $arrayreference->[1]->[1];
=================================================================
$dataset[$today]->{prices}->[1234] = "$4999.99";
=================================================================
$dataset[$today]{prices}[1234] = "$4999.99";
=================================================================
@array = (
    [1, 2],
    [3, 4],
);

print $array[1][1];
=================================================================
@array = (
    [1, 2],
    [3, 4],
);

print $array[0][1];
=================================================================
@array = (
    [1, 2],
    [3, 4],
);

print $array[1][0];
=================================================================
@a = (1, 2, 3);
@b = (4, 5, 6);
=================================================================
@array = addem (\@a, \@b);
=================================================================
sub addem
{
    my ($ref1, $ref2) = @_;

    while (@$ref1) {

        unshift @result, pop(@$ref1) + pop(@$ref2);

    }

    return @result;
}
=================================================================
@array = addem (\@a, \@b);
print join (', ', @array);
=================================================================
sub getarrays
{
    @a = (1, 2, 3);
    @b = (4, 5, 6);

    return \@a, \@b;
}
=================================================================
($aref, $bref) = getarrays;

print "@$aref\n";
print "@$bref\n";
=================================================================
$variable1 = 5;
$scalarref = \$variable1;

print (ref $scalarref);
=================================================================
sub printem
{
    print shift;
}

$coderef = \&printem;

print (ref $coderef);
=================================================================
@a = (1, 2, 3);
@b = (4, 5, 6);

sub addem
{
    my ($ref1, $ref2) = @_;

    if (ref($ref1) eq "ARRAY" && ref($ref2) eq "ARRAY") {

        while (@$ref1) {

            unshift @result, pop(@$ref1) + pop(@$ref2);

        }

        return @result;

    } elsif (ref($ref1) eq "SCALAR" && ref($ref2) eq "SCALAR") {

        return $$ref1 + $$ref2;

    }
}

@array = addem (\@a, \@b);

print join (', ', @array);
=================================================================
$string = "Hello";
$ref = \substr($a, 0, 1);
print ref($ref);
=================================================================
$variable1 = 1;

$symbolicreference = "variable1";
=================================================================
$variable1 = 1;

$symbolicreference = "variable1";

print $$symbolicreference;
=================================================================
$variable1 = 1;

$symbolicreference = "variable1";
$$symbolicreference = 5;

print "$variable1\n";
=================================================================
$variablename = "variable1";

$$variablename = 5;

print "$variable1\n";
=================================================================
$arrayname = "array1";

$arrayname->[1] = 5;
print "$array1[1]\n";
=================================================================
$subroutinename = "subroutine1";

sub subroutine1
{
    print "Hello!\n";
}

&$subroutinename();
=================================================================
my $variable1 = 10;
$variablename = "variable1";               #Will be a problem. 
print "The value is $$variablename\n";     #Can't use symbolic reference here
=================================================================
$value = 5;

while(<>) {
    chomp;
    s/\$(\S+)/${$1}/;
    print;
}
=================================================================
use strict 'refs';

$variable = 100;
$variablename = "variable";

print $$variablename;
=================================================================
use strict 'refs';

$variable = 100;

{
    no strict 'refs';

    $variablename = "variable";

    print $$variablename;
}
=================================================================
sub makerefs
{
    my $scalar1 = \$scalar2;
    my $scalar2 = \$scalar1;

    my @array1 = (\@array2);
    my @array2 = (\@array1);
}

makerefs;
=================================================================
$arrayreference = [{first => 1, second => 2}, "Hello", "there"];
=================================================================
$arrayreference = [{first => 1, second => 2}, "Hello", "there"];

print "$arrayreference->{first} $arrayreference->{second}";
=================================================================
$arrayreference = [{first => 1, second => 2}, "Hello", "there"];

print "$arrayreference->{first} $arrayreference->{second}\n";
print "$arrayreference->[1] $arrayreference->[2]\n";
=================================================================
$salary = [{Ed => 1, Tom => 2, Mike => 3}, 50_000, 200_000,
    150_000];

$salary->{Ed} = 100_000;

for ($total = 0, $loop_index = 1; $loop_index <= $#$salary;
    $loop_index++) {

    $total += $salary->[$loop_index];
}

print "Average salary = \$" . $total / $#$salary;
vsub printem
{
    my $string1 = shift;
    return sub {my $string2 = shift;
        print "$string1 $string2\n";};
}
=================================================================
$hellosub = printem("Hello");
=================================================================
&$hellosub("today.");
&$hellosub("there.");
=================================================================
@greetings = ("Hello", "Hi", "Greetings");
=================================================================
foreach my $term (@greetings) {

    *{"print" . $term} = sub {print "$term\n"};

}
=================================================================
printHello();
printGreetings();
=================================================================
@greetings = ("Hello", "Hi", "Greetings");

foreach my $term (@greetings) {

    ${"print" . $term} = sub {print "$term\n"};
}
=================================================================
&$printHello();
&$printGreetings();
=================================================================
!!!CODE10!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
==============================================================
sub replace 
{
    ($text, $to_replace, $replace_with) = @_;

    substr ($text, index($text, $to_replace),
        length($to_replace), $replace_with);

    return $text;
}

print replace("Here is the text.", "text", "word");
==============================================================
use English;
==============================================================
$text = 'This is the time.';
$text =~ /time/;
print "Matched: \"$&\".\n";
==============================================================
use English;

$text = 'This is the time.';
$text =~ /time/;
print "Matched: \"$MATCH\".\n";
==============================================================
use FileHandle;

format standardformat_top =
@>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"Page $%"
                  Employees          
First Name   Last Name    ID       Extension
--------------------------------------------
.

format standardformat =
@<<<<<<<<<<<<@<<<<<<<<<<<<@<<<<<<<<@<<<<
$firstname   $lastname    $ID      $extension
.

$firstname = "Cary"; 
$lastname = "Grant";
$ID = 1234; 
$extension = x456;

open FILEHANDLE, ">report.frm" or die "Can't open file";

select FILEHANDLE;

format_name FILEHANDLE standardformat;
format_top_name FILEHANDLE standardformat_top;
format_lines_per_page FILEHANDLE 1;

write;
write;
==============================================================
$text = 'earlynowlate';
$text =~ /now/;

print "Prematch: \"$`\" Match: \"$&\" Postmatch: \"$'\"\n";
==============================================================
use File::Copy;
copy("nonexistant.pl","new.pl");   #Try to copy a non-existant file.
print $!;
==============================================================
$! = 1;
print "$!\n";
print "Error number " , 0 + $! , " occurred.";
==============================================================
@array = (1, 2, 3);
$" = ',';
$text = "@array";
print $text;
==============================================================
@array = (1, 2, 3);
$" = ', ';
$text = "@array";
print $text;
==============================================================
$pi = 3.1415926;
$# = '%.6g';
print "$pi\n";
==============================================================
use FileHandle;

format standardformat_top =
@>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"Page $%"
                  Employees          
First Name   Last Name    ID       Extension
--------------------------------------------
.
==============================================================
$text = 'earlynowlate';
$text =~ /now/;
print "Prematch: \"$`\" Match: \"$&\" Postmatch: \"$'\"\n";
==============================================================
$_ = "This text\nhas multiple lines.";
s/^/BOL/g;
s/$/EOL/g;
print;
==============================================================
$_ = "This text\nhas multiple lines.";
$* = 1;
s/^/BOL/g;
s/$/EOL/g;
print;
==============================================================
$_ = "This text\nhas multiple lines.";
s/^/BOL/mg;
s/$/EOL/mg;
print;
==============================================================
$, = ';';
print 1, 2, 3;
==============================================================
open FILEHANDLE, "<reader.pl";

while (defined ($line = <FILEHANDLE>)) {
    print "Current line = $.\n";
}

close FILEHANDLE;
==============================================================
undef $/;
open HANDLE, "file.txt";
$text = <HANDLE>;
print $text;
==============================================================
$hash{x,y,z}
$hash{join($;, x, y, z)}
==============================================================
$hash{"1$;1$;1"} = "Hello!";

print $hash{1,1,1};
==============================================================
@array = (
    [1, 2],
    [3, 4],
);

print $array[1][1];
==============================================================
print `uptime`;
print $?;
==============================================================
print `dir`;
print $?;
==============================================================
$x = 1;
$y = 0;
eval {$result = $x / $y};
print "eval says: $@" if $@;
==============================================================
@a = (1, 2, 3);

print "Array \@a = @a\n";

print "Element \@a[0] = $a[0]\n";

print "Resetting array base...\n";

$[ = 1;

print "Element \@a[1] = $a[1]\n";
==============================================================
$\ = "END_OF_OUTPUT";
print "Hello!";
==============================================================
print $];
==============================================================
if ($] < 5.005) {

    print "Isn't it time to upgrade?";

} else {

    #Use qr//, new in Perl 5.005

    print "Creating compiled patterns...\n";

    @patterns =
    (
        qr/\bis\b/,
        qr/\bthe\b/,
        qr/\bbut\b/,
        qr/\ba\b/,
        qr/\bnone\b/,
    );
}
==============================================================
format standardformat_top =
                  Employees
First Name   Last Name    ID       Extension
--------------------------------------------
.

format standardformat =
@<<<<<<<<<<<<@<<<<<<<<<<<<@<<<<<<<<@<<<<
$firstname   $lastname    $ID      $extension
.

$firstname = "Cary"; $lastname = "Grant";
$ID = 1234; $extension = x456;

open FILEHANDLE, ">report.frm" or die "Can't open file";

select FILEHANDLE;

$~ = standardformat;
$^ = standardformat_top;

write;
close;
==============================================================
$str = formline <<'EOD', right, center, left;
Here's some text justification...
----------------------------
@<<<<<<<<@|||||||@>>>>>>>>>>
EOD

print "$^A\n";
==============================================================
use File::Copy;
copy("nonexistant.pl","new.pl");   #Try to copy a non-existant file.
print "$!\n";
==============================================================
use File::Copy;
copy("nonexistant.pl","new.pl");   #Try to copy a non-existant file.
print "$!\n";
print "$^E\n";
==============================================================
use strict 'vars';
use strict 'refs';
use strict 'subs';

if ($^H && 2 )    {print "You're using use strict 'refs'\n"};
if ($^H && 512 )  {print "You're using use strict 'subs'\n"};
if ($^H && 1024 ) {print "You're using use strict 'vars'\n"};
==============================================================
$^M = ' ' x (2 ** 20);
==============================================================
print $^O;
==============================================================
print $^O;
==============================================================
$text = "text";
$text =~ /x(?{$variable1 = 5})/;
print $^R;
==============================================================
if ($^S) {
    print "Inside eval.\n";
} else {
    print "Outside eval.\n";
}

eval {
    if ($^S) {
        print "Inside eval.\n";
    } else {
        print "Outside eval.\n";
    }
}
==============================================================
print $^T;
==============================================================
$s = localtime($^T);
print $s;
==============================================================
while (<>) {
    $time = time - $^T;
    print "You started this script $time seconds ago.\n";
}
==============================================================
if (!$^W) {
    print "You should use the -w switch.";
}

open FILEHANDLE, "<file.dat";

print FILEHANDLE "Hello!";

close FILEHANDLE;
==============================================================
#$^W = 1;

open FILEHANDLE, "<file.dat";

print FILEHANDLE "Hello!";

close FILEHANDLE;
==============================================================
print $^X;
==============================================================
print $^X;
==============================================================
print $^X;
==============================================================
print $^X;
==============================================================
while ($_ = <>) {
    print $_;
}
==============================================================
while (<>) {
    print;
}
==============================================================
while (<>) {
   for (split) {
       s/m/y/g;
       print;
   }
}
==============================================================
while ($_ = <>) {
   for $_ (split / /, $_) {
       $_ =~ s/m/y/g;
       print $_;
   }
}
==============================================================
$text = 'earlynowlate';

$text =~ /now/;

print "Prematch: \"$`\" Match: \"$&\" Postmatch: \"$'\"\n";
==============================================================
pipe(READER, WRITER);

autoflush WRITER 1;

This does the same thing: 

pipe(READER, WRITER);

WRITER->autoflush(1);
==============================================================
format standardformat_top =
                  Employees
First Name   Last Name    ID       Extension
--------------------------------------------
.

format standardformat =
@<<<<<<<<<<<<@<<<<<<<<<<<<@<<<<<<<<@<<<<
$firstname   $lastname    $ID      $extension
.

$firstname = "Cary"; $lastname = "Grant";
$ID = 1234; $extension = x456;

open FILEHANDLE, ">report.frm" or die "Can't open file";

select FILEHANDLE;

$~ = standardformat;
$^ = standardformat_top;

write;
close;
==============================================================
$text = "Here is the text.";
$text =~ /(\w+) is the (\w+)./;

print $+;
==============================================================
$text = 'ID: 1234 Moola: $5.99 Destination: Unknown';

$text =~ /Cash: \$(.*) Destination|Moola: \$(.*) Destination/;
==============================================================
$text = 'ID: 1234 Moola: $5.99 Destination: Unknown';

$text =~ /Cash: \$(.*) Destination|Moola: \$(.*) Destination/;

print "Amount = \$$+";
==============================================================
print $<;
==============================================================
print $=;
==============================================================
format standardformat_top =
@>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"Page $%"
                  Employees
First Name   Last Name    ID       Extension
--------------------------------------------
.

format standardformat =
@<<<<<<<<<<<<@<<<<<<<<<<<<@<<<<<<<<@<<<<
$firstname   $lastname    $ID      $extension
.

$text = "Here is the data you asked for...";
$firstname = "Bertie";
$lastname = "Wooster";
$ID = 1234;
$extension = x456;

open FILEHANDLE, ">report.frm" or die "Can't open file";

select FILEHANDLE;

$~ = standardformat;
$^= standardformat_top;
$= = 1;

write;
write;
==============================================================
print $>;
==============================================================
$error = 1;
$errorline = 100;

if ($error != 0) {
    print "Error in $0 at line $errorline.";
}
==============================================================
$text = <>;
print $ARGV;
==============================================================
$text = "no and yes";

$text =~ s/(\w+) (\w+) (\w+)/$3 $2 $1/;

print $text;
==============================================================
$text = "Perl is the subject.";

$text =~ /\b([A-Za-z]+)\b/;

print $1;
==============================================================
$name = "United Perl Programmers";

$name =~ s/(\w)\w*/$1\./g;

print "The $name meeting will now come to order, maybe.";
==============================================================
$v = "Hello\n";

print $v;
print $main::v;
==============================================================
foreach $key (keys %::) {
    print "$key => $::{$key}\n";
}
==============================================================
$v = "Hello\n";

print $v;
print $main::v;
print $main::main::v;
==============================================================
print "Hello, $ENV{USER}!\n";
==============================================================
while(($key, $value) = each(%ENV)) {
    print "$key => $value\n";
}
==============================================================
while(($key, $value) = each(%ENV)) {
    print "$key => $value\n";
}
==============================================================
require English;

print $INC{'English.pm'};
==============================================================
$SIG{'QUIT'} = sub {print "Got a quit signal.\n"}; 
==============================================================
$SIG{__WARN__} = sub {}; 
==============================================================
$SIG{__WARN__} = 'IGNORE';    
==============================================================
$SIG{__WARN__} = 'DEFAULT';   
==============================================================
$SIG{__WARN__} = sub {die};
==============================================================
$SIG{__WARN__} = sub {die "Warning: $_[0]"};
==============================================================
$SIG{__DIE__} = sub {print "This script is about to die!\n"};

die;
==============================================================
$SIG{INT} = sub {print "Hey!"};
while(<>){}
==============================================================
sub addem
{
    $value1 = @_[0];
    $value2 = @_[1];
    print "$value1 + $value2 = " . ($value1 + $value2) . "\n";
}

addem(2, 2);
==============================================================
sub addem
{
    $value1 = shift @_;
    $value2 = shift @_;
    print "$value1 + $value2 = " . ($value1 + $value2) . "\n";
}

addem(2, 2);
==============================================================
sub addem
{
    $value1 = shift;
    $value2 = shift;
    print "$value1 + $value2 = " . ($value1 + $value2) . "\n";
}

addem(2, 2);
==============================================================
sub addem
{
    ($value1, $value2) = @_;
    print "$value1 + $value2 = " . ($value1 + $value2) . "\n";
}

addem(2, 2);
==============================================================
print join (", ", @ARGV);
==============================================================
print join (', ', @INC);
==============================================================
!!!CODE11!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
====================================================================
@array = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
print join(", ", @array);
====================================================================
$hash{sandwich} = ham;
$hash{drink} = 'strawberry juice';

foreach $key (keys %hash) {
    print $hash{$key} . "\n";
}
====================================================================
$hexdigit = 0xA;

vec ($data, 0, 8) = $hexdigit;
print vec ($data, 3, 1);
print vec ($data, 2, 1);
print vec ($data, 1, 1);
print vec ($data, 0, 1);
====================================================================
$s = -5;

print "The absolute value of $s = ", abs $s;
====================================================================
$s = -4;

print "The square root = ", sqrt(abs $s);
====================================================================
print (4 * atan2 1, 1);

====================================================================
$y = 1.15470053837925;
$x = 2.0;

$conversion = 180 / 3.14159265358979;

print "The angle = ", $conversion * atan2($y, $x), " degrees.";
====================================================================
use Math::BigInt;

$bi = Math::BigInt->new('111111111111111111');

print $bi * $bi;
====================================================================
use Math::BigInt;

$bi1 = Math::BigInt->new('111111111111111111');
$bi2 = Math::BigInt->new('111111111111111112');

print "\$bi2 > \$bi1" if $bi2 > $bi1;
====================================================================
$s = 65;
print "The character " . chr($s) . " corresponds to ASCII code $s";
====================================================================
foreach (65 .. 67) {
    print chr(), " ";
}
====================================================================
print pack("c3", 65, 66, 67);
====================================================================
use Math::Complex;

$c1 = Math::Complex->new(-2,3);

$c2 = Math::Complex->new(4,5);
====================================================================
use Math::Complex;

$c1 = Math::Complex->new(-2,3);

$c2 = Math::Complex->new(4,5);

$c3 = $c1 * $c2;

print "$c1 x $c2 = $c3\n";
====================================================================
use Math::Complex;

$c1 = Math::Complex->new(1,1);

$c2 = Math::Complex->new(2,2);

print "$c2 > $c1" if $c2 > $c1;
====================================================================
$angle = 45;

$conversion = 3.14159265358979 / 180;

$radians = $angle * $conversion;

print "The cosine of $angle degrees = ", cos $radians;
====================================================================
$hash{sandwich} = grilled;
$hash{drink} = 'root beer';
while(($key, $value) = each(%hash)) {print "$key => $value\n";}
====================================================================
$hash{sandwich} = grilled;
$hash{drink} = 'root beer';
while($key = each(%hash)) {print "$key => $hash{$key}\n";}
====================================================================
sub try (&) {
    my $code = shift;
    eval {&$code};
    if ($@) {print "eval says: $@";}
};
try {
    $operand1 = 1;
    $operand2 = 0;
    $result = $operand1 / $operand2;
};
====================================================================
$hash{ID} = 12334;
$hash{Name} = Bertie;
$hash{Division} = Sales;

if (exists($hash{Phone})) {
    print "Key is in the hash.";
} else {
    print "Key is not in the hash.";
}
====================================================================
$hash{ID} = 12334;
$hash{Name} = Bertie;
$hash{Division} = Sales;

if (defined($hash{Phone})) {
    print "Element is defined.";
} else {
    print "Element is not defined.";
}
====================================================================
print "Welcome to the Exponentiator!\n";
print "Enter a number: ";

while ($s = <>) {
    print "\n";
    print " $s";
    print "e  = " . exp($s) . "\n";
    print "Enter a number: ";
}
====================================================================
print join(" ",(grep {!/^\w{4}$/} (qw(Here are some four letter words.))));
====================================================================
print hex("10") , "\n";
====================================================================
print hex("0x10") , "\n";
====================================================================
print hex("ab") , "\n";
====================================================================
print hex("Ab") , "\n";
====================================================================
print hex("aB") , "\n";
====================================================================
print hex("AB") , "\n";
====================================================================
$text = "Here's the text!";

print index $text, 'text';
====================================================================
print int 1.999;
====================================================================
print int 2.001;
====================================================================
use integer;

$s1 = 11;
$s2 = 2;

print "With integer math, $s1 / $s2 = " . ($s1 / $s2);
====================================================================
use integer;

$s1 = 11;
$s2 = 11.2;

print "\$s1 = \$s2" if ($s1 == $s2);
====================================================================
use integer;

$value = 258;

print "$value in hex = ";

while($value) {
   push @digits, (0 .. 9, a .. f)[$value & 15];
   $value /= 16;
}

while(@digits) {
   print pop @digits;
}
====================================================================
@array = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
print join(", ", @array);
====================================================================
print join ("", H, e, l, l, o);
====================================================================
$hash{sandwich} = salami;
$hash{drink} = 'root beer';

foreach $key (keys %hash) {print $hash{$key} . "\n";}
====================================================================
$hash{sandwich} = salami;
$hash{drink} = 'root beer';

print "\%hash has " . keys(%hash) . " keys\n";
====================================================================
print lc 'HELLO!';
====================================================================
while (<>) {
    print "Here's what you typed lowercased: " . lc . "\n";
    print "Here's what you typed uppercased: " . uc . "\n";
}
====================================================================
print lc "I like poems by e. e. cummings.";
====================================================================
$text = "Here is the text.";
print length $text;
====================================================================
$s = "Hello";
@a = unpack("C*", $s);
print join(", ", @a);
====================================================================
print pack("ccc", 88, 89, 90); 
====================================================================
print pack("c3", 65, 66, 67);
====================================================================
print pack("c*", 68, 69, 70, 71);
====================================================================
$decimal = 100;

$binary = unpack("B32", pack("N", $decimal));

print $binary;
====================================================================
$decimal = 100;

$binary = unpack("B32", pack("N", $decimal));

$newdecimal = unpack("N", pack("B32", $binary));

print $newdecimal;
====================================================================
use POSIX;                  #Add the whole POSIX library
use POSIX qw(FUNCTION);     #Use a selected function.
====================================================================
use POSIX;

print POSIX::tan(atan2 (1, 1));
====================================================================
use POSIX;

$text = "Here's the text!";

print "The substring starts at position " . strstr $text, 'text';
====================================================================
$random = rand(100);
print $random;
====================================================================
$letter = ('a' .. 'z')[26 * rand];
print $letter;
====================================================================
print "Some lottery numbers to try:";
foreach (1 .. 6) {
    print " " . int rand (50) + 1;
}
====================================================================
print join(" ", reverse (1 .. 20));
====================================================================
@array = (1, 2 ,3);

print join(", ", reverse @array);
====================================================================
$hash{sandwich} = grilled;
$hash{drink} = 'root beer';

%reversed = reverse %hash;

while($key = each(%reversed)) {print "$key => $reversed{$key}\n";}
====================================================================
$string = "Hello!";

$reversed = reverse($string);
print "$reversed\n";
====================================================================
$text = "I said, no, I just don't know.";

print "First occurence of \"no\" is at position: " .
    index($text, "no") . "\n";
print "Last occurence of \"no\" is at position: " .
    rindex($text, "no") . "\n";
====================================================================
use POSIX;

$angle = 45;

$conversion = 3.14159265358979 / 180;

$radians = $angle * $conversion;

print "The sine of $angle degrees = ", sin $radians;
====================================================================
use POSIX;

$angle = 45;

$conversion = 3.14159265358979 / 180;

$radians = $angle * $conversion;

$sine = sin $radians;

print "The sine of $angle degrees = ", $sine, "\n";
====================================================================
$asine = POSIX::asin $sine;

$reconversion = 180 / 3.14159265358979;

$degrees = $asine * $reconversion;

print "The arcsine of $sine = ", $degrees, " degrees.";
====================================================================
@array = ('z', 'b', 'a', 'x', 'y', 'c');
print join (", ", @array) . "\n";
====================================================================
print join(", ", sort {$a cmp $b} @array) . "\n";
====================================================================
print join(", ", sort {$b cmp $a} @array) . "\n";
====================================================================
@array = (1, 5, 6, 7, 3, 2);
print join(", ", sort {$a <=> $b} @array) . "\n";
====================================================================
print join(", ", sort {$b <=> $a} @array) . "\n";
====================================================================
print sort {$a cmp $b} ("c", "b", "a");
====================================================================
print sort {$b cmp $a} ("c", "b", "a");
====================================================================
@name = qw(curtains towels pants pants);
@category = qw(home home clothing clothing);
@subcategory = qw(bedroom bathroom indoor outdoor);

@indices = sort {$category[$a] cmp $subcategory[$b]
    or $category[$a] cmp $subcategory[$b]} (0 .. $#name);

foreach $index (@indices) {
    print "$category[$index] ($subcategory[$index]): $name[$index]\n";
}
====================================================================
sub sort_function
{
   return (shift(@_) <=> shift(@_));
}

print join (", ", sort {sort_function($a, $b)} (6, 4, 5));
====================================================================
print join('-', split(//, 'Hello'));
====================================================================
print ((split " ", "Now is the time")[3]);
====================================================================
$value = 1234.56789;
print sprintf "%.4f\n", $value;
====================================================================
print sprintf "%.5f\n", $value;
====================================================================
print sprintf "%6.6f\n", $value;
====================================================================
print sprintf "%+.4e\n", $value;
====================================================================
print "Welcome to the Hypotenusizer!\n";
print "Enter two sides of a right triangle: ";
while (<>) {
    ($a, $b) = split;
    $hypotenuse = sqrt($a * $a + $b * $b);
    print "The hypotenuse is: ", $hypotenuse, "\n";
    print "Enter two sides of a right triangle: ";
}
====================================================================
srand;
$random = rand(100);
print $random;
====================================================================
$text = "Here is the text.";
print substr ($text, 12) . "\n";
====================================================================
use Math::Trig;

print "Pi = ", pi, "\n";
====================================================================
print "Pi in degrees = ", rad2deg pi, "\n";
====================================================================
print "The tangent of 0 = ", tan(0), "\n";
====================================================================
print "The arccosine of 1 = ", acos(1), "\n";
====================================================================
print "The arcsine of 1 / sqrt(2) = ", rad2deg(asin(1 / sqrt(2))),
====================================================================
print uc 'hello!';
====================================================================
while (<>) {
    print "Here's what you typed lowercased: " . lc . "\n";
    print "Here's what you typed uppercased: " . uc . "\n";
}
====================================================================
print ucfirst "i said yes!";
====================================================================
$headline = "Government announces tax rebate for Perl programmers!";

foreach (split " ", $headline) {
    print ucfirst, " ";
}
====================================================================
$string = pack("ccc", 88, 89, 90);

print join(", ", unpack "ccc", $string);
====================================================================
vec ($data, 0, 32) = 0x11;

$bitstring = unpack("B*", $data);

print $bitstring;
====================================================================
$decimal = 17;

$binary = unpack("B32", pack("N", $decimal));

print $binary;
====================================================================
$decimal = 17;

$binary = unpack("B32", pack("N", $decimal));

$newdecimal = unpack("N", pack("B32", $binary));

print $newdecimal;
====================================================================
open INFILEHANDLE, "<data.uue";
open OUTFILEHANDLE, ">data.dat";

binmode OUTFILEHANDLE;    #Necessary in MS DOS!

while (defined($line = <INFILEHANDLE>)) {
    print OUTFILEHANDLE unpack('u*', $line);
}

close INFILEHANDLE;
close OUTFILEHANDLE;
====================================================================
$hash{sandwich} = 'ham and cheese';
$hash{drink} = 'diet cola';

foreach $value (values %hash) {
    print "$value\n";
}
====================================================================
$hexdigit = 0xA;

vec ($data, 0, 8) = $hexdigit;
print vec ($data, 3, 1);
print vec ($data, 2, 1);
print vec ($data, 1, 1);
print vec ($data, 0, 1);
====================================================================
!!!CODE12!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
============================================================
system "stty cbreak </dev/tty >&1"; 

print ">";

while (($char = getc) ne 'q') {
    print "\n";
    print "You typed $char\n>";
}
============================================================
system "stty cbreak </dev/tty >&1";
============================================================
print "Type something...\n";

local $SIG{ALRM} = sub { print "Sorry, timed out.\n"; exit; };
============================================================
print "Type something...\n";

local $SIG{ALRM} = sub { print "Sorry, timed out.\n"; exit; };
alarm(5);

while(<>) {
    print "Thanks, please type again...\n";
    alarm(5);
}
============================================================
use Carp;

sub callme
{
    confess "There's a problem!";
}

callme;
============================================================
print "Please type four characters...\n";

for (1 .. 4) {
    $char = <>;
    chomp $char;
    $word .= $char;
}

print "You typed: " , $word;
============================================================
print "Please type four characters...\n";

for (1 .. 4) {
    $char = <>;
    $word .= $char;
}

print "You typed: " , $word;
============================================================
Use Curses;

$monitor = new Curses;

$monitor->standout();

$monitor->addstr(20, 20, 'Hello from Perl!');

$monitor->standend();

$monitor->refresh;
============================================================
$filename = "file.dat";

open FILEHANDLE, ">$filename" or die "Cannot open $filename\n";
============================================================
$filename = "file.dat";

open FILEHANDLE, ">$filename" or die $!;
============================================================
$filename = "file.dat";

open FILEHANDLE, ">$filename" or die $^E;
============================================================
system "stty cbreak </dev/tty >&1";

print ">";

while (($char = getc) ne 'q') {
    print "\n";
    print "You typed $char\n>";
}
============================================================
system "stty cbreak </dev/tty >&1";

print "Type an up arrow:";
$c1 = getc;       
$c2 = getc;       
$c3 = getc;       

if ((ord($c1) == 27) && ($c2 eq '[') && ($c3 eq 'A')) {        
    print "You typed an up arrow.";
} else {
    print "You did not type an up arrow.";
}
============================================================
use HotKey;
$char = readkey();
print "You typed: $char\n";
============================================================
open(STDERR, ">error.log") || die "Can't redirect stderr to error log.";
print STDERR "There's a problem!";
============================================================
use POSIX qw(:termios_h);

$termios = POSIX::Termios->new;
$termios->getattr();
============================================================
use POSIX qw(:termios_h);

$termios = POSIX::Termios->new;
$termios->getattr();

$termios->setcc(VERASE, ord('<'));
$termios->setcc(VKILL, ord('Q'));
$termios->setattr(1, TCSANOW);
============================================================
use POSIX qw(:termios_h);

$termios = POSIX::Termios->new;
$termios->getattr();

$termios->setcc(VERASE, ord('<'));
$termios->setcc(VKILL, ord('Q'));
$termios->setattr(1, TCSANOW);

print("Use < to erase and Q to quit.\n");
print ">";

while (defined($input = <STDIN>)) {
    print "Thank you for typing $input";
    print ">";
}
============================================================
$a = "Hello"; $b = " to"; $c = " you"; 
$d = " from"; $e = " Perl!";

print $a, $b, $c, $d, $e;
============================================================
$value = 1234.56789;
printf "%.4f\n", $value;
============================================================
printf "%.5f\n", $value;
============================================================
printf "%6.6f\n", $value;
============================================================
printf "%+.4e\n", $value;
============================================================
use Term::ANSIColor;

print color("red"), "That is an error!\n", color("reset");
============================================================
while(<>) {

    print;

}
============================================================
open(STDIN, "<redirect.pl") || die "Problem redirecting STDIN.";
============================================================
============================================================
use POSIX;
use Term::Cap;

$termios = POSIX::Termios->new();

$termios->getattr;
$speed = $termios->getospeed;

$termcap = Term::Cap->Tgetent({TERM => undef, OSPEED => $speed });

$termcap->Tputs('cl', 1, STDOUT);
============================================================
use POSIX;
use Term::Cap;

$termios = POSIX::Termios->new;
$termios->getattr;
$speed = $termios->getospeed;

$termcap = Term::Cap->Tgetent ({TERM => undef, OSPEED => $speed });
$termcap->Tputs('cl', 1, *STDOUT);
$termcap->Tgoto('cm', 40, 5, *STDOUT);

print "Perl";
============================================================
use Term::ReadKey;

ReadMode('cbreak');

$char = ReadKey(0);

ReadMode('normal');

print "You typed: $char.\n";
============================================================
use Term::ReadKey;

ReadMode('cbreak');

if (defined ($char = ReadKey(-1)) ) {
    print "This key was waiting: $char.";
} else {
    print "Sorry, no key was waiting.";
}

ReadMode('normal');        
============================================================
use Term::ReadKey;

($widthchars, $heightchars, $widthpixels, $heightpixels) 
= GetTerminalSize();

print "Your screen is $heightpixels x $widthpixels pixels.";
============================================================
use Term::ReadKey;

print "Type your password: ";

ReadMode('noecho');

$password = ReadLine(0);
============================================================
use Term::ReadLine;

$term = Term::ReadLine->new("SuperDuperDataCrunch");

$prompt = "%";

while (($line = $term->readline($prompt)) ne 'q') {

    $term->addhistory($line);

    print "You typed: $line\n";

}
============================================================
$@ = "Overflow error";
warn;
============================================================
warn "Something's", " rotten", " in", " Denmark";
============================================================
local $SIG{__WARN__} = sub {}; 
============================================================
format STDOUT_TOP =
                  Employees
First Name   Last Name    ID       Extension
--------------------------------------------
.

format STDOUT =
@<<<<<<<<<<<<@<<<<<<<<<<<<@<<<<<<<<@<<<<
$firstname   $lastname    $ID      $extension
.

$firstname = "Jimmy"; 
$lastname = "Stewart";
$ID = 1234; $extension = x456;

write;
============================================================
!!!CODE13!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
==================================================================
open (FILEHANDLE, ">hello.txt") or die "Cannot open hello.txt";

print FILEHANDLE "Hello!";
close (FILEHANDLE);
==================================================================
open (FILEHANDLE, "<hello.txt") or die ("Cannot open hello.txt");

print <FILEHANDLE>;
close (FILEHANDLE);
==================================================================
use IO::File;
$filehandle = new IO::File;

$filehandle->open(">hello.txt") or die "Cannot open hello.txt";

$filehandle->print("Hello!");
$filehandle->close;
==================================================================
use IO::File;
$filehandle = new IO::File;

$filehandle->open("<hello2.txt") or die "Cannot open hello.txt";

print <$filehandle>;
$filehandle->close;
==================================================================
open (FILEHANDLE, ">hello.txt") or die "Cannot open hello.txt";
print FILEHANDLE "Hello!";

close (FILEHANDLE);
==================================================================
use IO::File;
$filehandle = new IO::File;

$filehandle->open(">hello.txt") or die "Cannot open hello.txt";

$filehandle->print("Hello!");

$filehandle->close;
==================================================================
use IO::File;
$filehandle = new IO::File;

if ($filehandle->open("<hello.txt")) {

    print <$filehandle>;

    undef $filehandle;
}
==================================================================
open (FILEHANDLE, ">hello.txt") or die ("Cannot open hello.txt");

print FILEHANDLE "Hello!";

close (FILEHANDLE);
==================================================================
use IO::File;
$filehandle = new IO::File;

$filehandle->open(">hello.txt") or die "Cannot open hello.txt";

$filehandle->print("Hello!");
$filehandle->close;
==================================================================
open (FILEHANDLE, ">array.dat") 
    or die ("Cannot open array.dat");
$, = "\n";                 #Set output separator to a comma
@array = (1, 2, 3);

print FILEHANDLE @array;

close FILEHANDLE;
==================================================================
open (FILEHANDLE, "<array.dat") 
    or die ("Cannot open array.dat");

chomp(@array = <FILEHANDLE>);

close FILEHANDLE;
print join (', ', @array);
==================================================================
open (FILEHANDLE, ">format.txt") or die ("Cannot open format.txt");

format FILEHANDLE =
@<<<<<<<<<<<@>>>>>>>>>>>>>>>
$text1      $text2
.

$text1 = "Hello";
$text2 = "there!";

write FILEHANDLE;
close (FILEHANDLE);
==================================================================
$filehandle->write(BUFFER, LENGTH [, OFFSET]) 
==================================================================
use IO::File;
$filehandle = new IO::File;

$filehandle->open(">hello.txt") or die "Cannot open hello.txt";
$text = "Hello!";

$filehandle->write($text, length($text));
$filehandle->close;
==================================================================
use IO::File;

format TEXTFORMAT =
@<<<<<<<<<<<@>>>>>>>>>>>>>>>
$text1      $text2
.

$text1 = "Hello";
$text2 = "there!";
==================================================================
$filehandle = new IO::File;

$filehandle->open(">format.txt") or die "Cannot open format.txt";
==================================================================
$filehandle->format_write (::TEXTFORMAT);
$filehandle->close;
==================================================================
open (FILEHANDLE, ">data.txt") 
    or die ("Cannot open data.txt");

print FILEHANDLE "Hello\nthere!";

close (FILEHANDLE);
==================================================================
open (FILEHANDLE, ">data.txt") 
    or die ("Cannot open data.txt");

binmode FILEHANDLE;

print FILEHANDLE "Hello\nthere!";

close (FILEHANDLE);
==================================================================
open INFILEHANDLE, "<data.uue";
open OUTFILEHANDLE, ">data.dat";

binmode OUTFILEHANDLE;    #Necessary in MS DOS!

while (defined($line = <INFILEHANDLE>)) {
    print OUTFILEHANDLE unpack('u*', $line);
}

close INFILEHANDLE;
close OUTFILEHANDLE;
==================================================================
open (FILEHANDLE, "<file.txt") 
    or die ("Cannot open file.txt");
while (<FILEHANDLE>){
    print;
}
==================================================================
use IO::File;
$filehandle = new IO::File;

$filehandle->open("<hello2.txt") or die "Cannot open hello.txt";

print <$filehandle>;
$filehandle->close;
==================================================================
open (FILEHANDLE, "<file.txt") or die "Cannot open file.txt";

$text = "";

while (read (FILEHANDLE, $newtext, 1)){
    $text .= $newtext;
}

print $text;
==================================================================
use IO::File;

$filehandle = new IO::File;
$filehandle->open("<file.txt") or die "Could not open file.txt";

$text = "";

while ($filehandle->read($newtext, 1)) {
    $text .= $newtext;
}

print $text;

$filehandle->close;
==================================================================
open (FILEHANDLE, "<file.txt") or die ("Cannot open file.txt");

while (defined($char = getc FILEHANDLE)){

       print $char;

}

close FILEHANDLE;
==================================================================
use IO::File;

$filehandle = new IO::File;
$filehandle->open("<file.txt") or die "Could not open file.txt";

while (defined($char = $filehandle->getc)) {

    print $char;

}

$filehandle->close;
==================================================================
open (FILEHANDLE, "<file.txt") or die "Cannot open file.txt";

seek FILEHANDLE, 12, 0;

while (<FILEHANDLE>){
    print;
}

close (FILEHANDLE);
==================================================================
use IO::File;
use IO::Seekable;

$filehandle = new IO::File;
$filehandle->open("<file.txt") or die "Cannot open file.txt";

$filehandle->seek(12, 0);

while (<$filehandle>){
    print;
}

$filehandle->close;
==================================================================
open (FILEHANDLE, "<file.txt") or die "Cannot open file.txt";

seek FILEHANDLE, 12, 0;

print tell FILEHANDLE;

close (FILEHANDLE);
==================================================================
use IO::File;
use IO::Seekable;

$filehandle = new IO::File;
$filehandle->open("<file.txt") or die "Cannot open file.txt";

$filehandle->seek(12, 0);

print $filehandle->tell;

$filehandle->close;
==================================================================
$filename = 'file.txt';

($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime,
    $mtime, $ctime, $blksize, $blocks) = stat($filename);

print "$filename is $size bytes long.";
==================================================================
$filename = 'file.txt';

open FILEHANDLE, "<$filename";

($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime,
    $mtime, $ctime, $blksize, $blocks) = stat(FILEHANDLE);

print "$filename is $size bytes long.";
==================================================================
use IO::File;
$filename = 'file.txt';

$filehandle = new IO::File;
$filehandle->open("<$filename") or die "Cannot open $filename";

($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime,
    $mtime, $ctime, $blksize, $blocks) = $filehandle->stat;

print "$filename is $size bytes long.";
==================================================================
use POSIX;

$filename = 'file.txt';

$descrip = POSIX::open($filename, POSIX::O_RDONLY);
($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime,
$mtime, $ctime, $blksize, $blocks) = POSIX::fstat($descrip);

print "$filename is $size bytes long.";
==================================================================
open (FILEHANDLE, ">hello.txt") 
    or die ("Cannot open hello.txt");

select FILEHANDLE;

print "Hello!";
close (FILEHANDLE);
==================================================================
open (FILEHANDLE, "<file.txt") or die "Cannot open file.txt";

$text = "";

until (eof FILEHANDLE) {
    read (FILEHANDLE, $newtext, 1) 
    $text .= $newtext;
}

print $text;
==================================================================
use IO::File;

$filehandle = new IO::File;
$filehandle->open("<file.txt") or die "Could not open file.txt";

$text = "";

until ($filehandle->eof) {
    $filehandle->read($newtext, 1);
    $text .= $newtext;
}

print $text;

$filehandle->close;
==================================================================
while (<>) {
    print;
    if (eof()) {            

        print "And that's it!";

    }
}
==================================================================
$infile = $ARGV[0];
$outfile = $ARGV[1];

open (INFILEHANDLE, "<$infile") or die ("Cannot open file.");
open (OUTFILEHANDLE, ">$outfile") or die ("Cannot open file.");

binmode OUTFILEHANDLE;

while (defined($line = <INFILEHANDLE>)) {
    $line =~ s/\r//g;
    print OUTFILEHANDLE $line;
}

close INFILEHANDLE;
close OUTFILEHANDLE;
==================================================================
$infile = $ARGV[0];
$outfile = $ARGV[1];

open (INFILEHANDLE, "<$infile") or die ("Cannot open file.");
open (OUTFILEHANDLE, ">$outfile") or die ("Cannot open file.");

binmode OUTFILEHANDLE; 

while (defined($line = <INFILEHANDLE>)) {
    $line =~ s/\n/\r\n/g;
    print OUTFILEHANDLE $line;
}

close INFILEHANDLE;
close OUTFILEHANDLE;
==================================================================
while (<DATA>) {
    print;
}
__DATA__
Here
is
the
text!
==================================================================
while (<DATA>) {
    print;
}
__END__
Here
is
the
text!
==================================================================
$number_lines = 0;

open(FILEHANDLE, "file.txt") or die "Can not open file.txt";

while (<FILEHANDLE>) {
    ++$number_lines;
}

close FILEHANDLE;

print "The number of lines in file.txt = $number_lines.";
==================================================================
$number_lines = 0;

open(FILEHANDLE, "file.txt") or die "Can not open file.txt";

$number_lines += tr/\n/\n/ while (read FILEHANDLE, $_, 1000);

close FILEHANDLE;

print "The number of lines in file.txt = $number_lines.";
==================================================================
sub printem
{
    my $file = shift;

    while (<$file>) {
         print;
    }
}

open FILEHANDLE, "<file.txt" or die "Can not open file";

printem FILEHANDLE;
==================================================================
sub printem
{
    my $file = shift;

    while (<$file>) {
         print;
    }
}

open FILEHANDLE, "<file.txt" or die "Can not open file";

printem *FILEHANDLE;
==================================================================
sub printem
{
    my $file = shift;

    while (<$file>) {
         print;
    }
}

open FILEHANDLE, "<file.txt" or die "Can not open file";

printem \*FILEHANDLE;
==================================================================
sub printem
{
    my $file = shift;

    while (<$file>) {
         print;
    }
}

open FILEHANDLE, "<file.txt" or die "Can not open file";

printem *FILEHANDLE{IO};
==================================================================
use IO::File;

sub printem
{
    my $file = shift;

    while (<$file>) {
         print;
    }
}

$filehandle = new IO::File;
$filehandle->open("<file.txt") or die "Could not open file.txt";

printem $filehandle;
==================================================================
open FILEHANDLE, "<file.txt" or die "Can not open file";

*FILEHANDLE2 = *FILEHANDLE;

while (<FILEHANDLE2>) {
    print;
}
==================================================================
open FILEHANDLE, "<file.txt" or die "Can not open file";

open (FILEHANDLE2, "<&FILEHANDLE");

while (<FILEHANDLE2>) {
    print;
}
==================================================================
open FILEHANDLE, "<file.txt" or die "Can not open file";

open (FILEHANDLE2, "<&=FILEHANDLE");

while (<FILEHANDLE2>) {
    print;
}
==================================================================
open FILEHANDLE, "<file.txt" or die "Can not open file";
open FILEHANDLE2, "<otherfile.txt" or die "Can not open file";

open (FILEHANDLE, "<&FILEHANDLE2");

while (<FILEHANDLE>) {
    print;
}
==================================================================
use IO::File;
use IO::Seekable;

$filehandle = IO::File->new_tmpfile()
or die "Can not make temporary file";
==================================================================
$filehandle->print("Hello!");
==================================================================
$filehandle->seek(0, 0);
==================================================================
print <$filehandle>;

$filehandle->close;
==================================================================
@a1 = (1, 2, 3);
==================================================================
open FILEHANDLE, ">array.dat" or die "Can not open array.dat";

print FILEHANDLE "@a1";

close FILEHANDLE;
==================================================================
open FILEHANDLE2, "<array.dat" or die "Can not open array.dat";

@a2 = split(" ", <FILEHANDLE2>);

print "@a2";

close FILEHANDLE2;
==================================================================
use Storable;

@a = (1, 2, 3);

store(\@a, "array.dat");

@a2 = @{retrieve("array.dat")};

print $a2[1];
==================================================================
%hash = (
    meat => turkey,
    drink => tea,
    cheese => colby,
);
==================================================================
open FILEHANDLE, ">hash.dat" or die "Can not open hash.dat";

$, = " ";

print FILEHANDLE %hash;

close FILEHANDLE;
==================================================================
open FILEHANDLE2, "<hash.dat" or die "Can not open hash.dat";

%hash2 = split(" ", <FILEHANDLE2>);

close FILEHANDLE2;
==================================================================
foreach $key (keys %hash2) {

    print "$key => $hash2{$key}\n";

}
==================================================================
use Storable;

%hash = (
    meat => turkey,
    drink => tea,
    cheese => colby,
);

store(\%hash, "hash.dat");

%hash2 = %{retrieve("hash.dat")};

print $hash2{drink};
==================================================================
$time = time;

$s = pack ("a8a8L", Mike, Flash, $time);
==================================================================
open FILEHANDLE, ">file.dat" or die "Can not open file.dat";
print FILEHANDLE $s;
close FILEHANDLE;

open FILEHANDLE2, "<file.dat" or die "Can not open file.dat";
$s2 = <FILEHANDLE2>;
close FILEHANDLE2;
==================================================================
($first, $last, $time) = unpack ("a8a8L", $s2);

print "First name: $first\n";
print "Last name: $last\n";
print "Time: ", scalar localtime($time);
==================================================================
print join ("\n", glob ('*'));
==================================================================
print join ("\n", glob ('/home/steve/*'));
==================================================================
print join ("\n", glob ('C:/*'));
==================================================================
print join ("\n", glob ('C:\\*'));
==================================================================
opendir(DIRECTORY, '.') 
or die "Can't open current directory.";

print join (', ', readdir(DIRECTORY));

closedir DIRECTORY;
==================================================================
chdir '..';

opendir(DIRECTORY, '.') 
    or die "Can't open directory.";

print join (', ', readdir(DIRECTORY));

closedir DIRECTORY;
==================================================================
!!!CODE14!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
===============================================================
use Safe; 

$safecompartment = new Safe;
$safecompartment->permit(qw(print));
$result = $safecompartment->reval("print \"Hello!\";");
===============================================================
use POSIX 'strftime';
print strftime "Here's the date: %m/%d/%Y\n", localtime;
===============================================================
use File::Copy;

copy("file.txt","file2.txt");
===============================================================
use Benchmark;

$timestamp1 = new Benchmark;

for ($loop_index = 0; $loop_index < 1_000_000; $loop_index++) {
    $variable1 = 1;
}

$timestamp2 = new Benchmark;
$timedifference = timediff($timestamp2, $timestamp1);

print "The loop took", timestr($timedifference);
===============================================================
use Class::Struct;

struct( produce => {
        vegetable => item,
        fruit => item,
});
===============================================================
struct( item => [
        name  => '$',
        number => '$',
]);

===============================================================
my $grocery = new produce;
===============================================================
$grocery->fruit->name('bananas');
$grocery->fruit->number(1000);
===============================================================
print "Yes, we have ", $grocery->fruit->number, " ",
    $grocery->fruit->name, ".";
===============================================================
use constant FINAL_MEDIEVAL_YEAR => 1491;
use constant MONTH_OF_SUNDAYS    => 30 * 7;
use constant PI                  => 4 * atan2 1, 1;

print "Pi = " PI;
===============================================================
use Cwd;

$dir = cwd;
print $dir;
===============================================================
use Data::Dumper;

$arrayref1 = [1, 2, 3];
$arrayref2 = [4, 5, 6];

print Data::Dumper->Dump([$arrayref1, $arrayref2], [arrayref1, arrayref2]);
===============================================================
$array1 = [1, 2, 3];
$array2 = [4, 5, 6];

$Data::Dumper::Indent = 3;

print Data::Dumper->Dump([$arrayref1, $arrayref2], [arrayref1, arrayref2]);
===============================================================
use Data::Dumper;

$scalar = 0;
$hashref = {};
$arrayref = [$scalar, $hashref];
$hashref->{arrayref} = $arrayref;

print Data::Dumper->Dump([$arrayref, $hashref], [qw(arrayref hashref)]);
===============================================================
$Data::Dumper::Deepcopy = 1;

print Data::Dumper->Dump([$arrayref, $hashref], [qw(arrayref hashref)]);
===============================================================
===============================================================
use Date::DateCalc qw(Add_Delta_Days);
($new_year, $new_month, $new_day) = Add_Delta_Days($year, $month, $day, 
$delta_days);
===============================================================
use Date::Calc qw(Add_Delta_DHMS);
($new_year, $new_month, $new_day, $new_hour, $new_minute, $new_second) = 
Add_Delta_DHMS($year, $month, $day, $hour, $minute, $second,
    $days_offset, $hour_offset, $minute_offset, $second_offset );
===============================================================
use Date::Calc qw(Delta_Days);
===============================================================
use Date::Calc qw(Delta_DHMS);
($days, $hours, $minutes, $seconds) =
Delta_DHMS($early_year, $early_month, $early_day, $early_hour, $minute1, 
    $early_seconds, $later_year, $later_month, $later_day, $later_hour,  
    $later_minute, $seconds); 
===============================================================
use Date::Calc qw(Add_Delta_DHMS);

($year, $month, $day, $hour, $minute, $second) =
Add_Delta_DHMS(2000, 12, 31, 23, 59, 59, 0, 0, 0, 1);

print "It's $year! Happy New Year!";
===============================================================
use diagnostics;

print NOT_A_FILEHANDLE "Hello!\n";
print $never_declared/0;
===============================================================
$text = 'This is the time.';
$text =~ /time/;
print "Matched: \"$&\".\n";
===============================================================
use English;

$text = 'This is the time.';
$text =~ /time/;
print "Matched: \"$MATCH\".\n";
===============================================================
use Env; 

$path2 = $PATH;
$path2 =~ tr/:/\n/;

print $path2;
===============================================================
use Env qw(PATH HOME);

$path2 = $PATH;
$path2 =~ tr/:/\n/;

print $path2;
===============================================================
use File::Compare;

if (compare("file1.txt","file2.txt")) {

    print "Those files are not equal.\n";

} else {

    print "Those files are equal.\n";

}
===============================================================
use File::Find;

find sub {print "Here's a file: $File::Find::name\n"}, '.';
===============================================================
use File::Find;

find sub {print "Here's a file: $File::Find::name\n" if !-d}, '.';
===============================================================
find sub {print "Here's a text file: $File::Find::name\n" if -T}, '.';
===============================================================
use File::Find;

find sub {

    $File::Find::prune = 1 if /dir1/;

    print "Here's a text file: $File::Find::name\n" if -T

    },
    '.';
===============================================================
use FileCache;

cacheout $name;

print $name $output_data;
===============================================================
use Getopt::Std;

getopt('pMN');

print "-p switch: $opt_p, -M switch: $opt_M, -N switch: $opt_N";
===============================================================
use Getopt::Long;

GetOptions("german"  => \$german,
           "french"  => \$french);

if ($german) {
    print "Guten Tag!\n";
}

if ($french) {
    print "Bonjour!\n";
}

if (!$german && !$french) {
    print "Hello!\n";
}
===============================================================
use Getopt::Long;

GetOptions("file=s"  => \$file);

if ($file) {
    print "File name: $file\n";
}
===============================================================
use Safe;

$safecompartment = new Safe;

$safecompartment->permit(qw(print));

$result = $safecompartment->reval("print \"Hello!\";");
===============================================================
use Shell;

$uptime = uptime();

print $uptime;
===============================================================
use Shell;

$dir = dir();

print $dir;
===============================================================
use Shell;

$text = cat("file.txt");

print $text;
===============================================================
use strict 'refs';
$variable = 5;
$reference = "variable";
print $$reference; 
===============================================================
use strict 'subs';

sub handler
{
    print "I was interrupted.\n";
}

$SIG{INT} = \&handler;
===============================================================
$hash{'this'} = that;
===============================================================
no strict 'vars';
===============================================================
use Text::Abbrev;

%hash = abbrev qw(Now is the time);

foreach $key (keys %hash) {
    print "$key => $hash{$key}\n";
}
===============================================================
use Text::Tabs;

$tabstop = 8;

print expand("Hello\tthere!");
===============================================================
use Text::Wrap qw(wrap $columns);

$columns = 12;

print wrap("", "", "This text just seems to go on and on and on and on and",
    "on and on and on and on and on!");
===============================================================
use Tie::RefHash;

$s = 5;

$hash{a} = \$s;

print ${$hash{a}};
===============================================================
use Tie::IxHash;

tie %hash, "Tie::IxHash";
===============================================================
use Tie::IxHash;

tie %hash, "Tie::IxHash";

$hash{fruit} = apple;
$hash{sandwich} = hamburger;
$hash{drink} = bubbly;

while(($key, $value) = each(%hash)) {
    print "$key => $value\n";
}
===============================================================
use Time::Local;
print timelocal(0, 0, 0, 1, 1, 2000);
===============================================================
use vars qw($scalarname @arrayname %hashname);
===============================================================
!!!CODE15!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=======================================================================
use Tk;  

my $main = MainWindow->new;

MainLoop;
=======================================================================
use Tk;

my $main = MainWindow->new;

$main->Button(-text => 'End',
    -command => [$main => 'destroy']
)->pack;

MainLoop;
=======================================================================
use Tk;

my $main = MainWindow->new;

$main->Button(-text => 'Hello',
    -command => [\&printem, "Hello\n"]
)->pack;

$main->Button(-text => 'End',
    -command => [$main => 'destroy']
)->pack;

MainLoop;

sub printem
{
    print shift;
}
=======================================================================
$main->Button(-text => 'Hello',
    -command => [\&printem, "Hello\n"]
)->pack;
=======================================================================
use Tk;

my $main = MainWindow->new;

MainLoop;
=======================================================================
use Tk;

my $main = MainWindow->new;

$main->Label(-text => 'Hello!',
    -relief => 'sunken'
)->pack;

$main->Label(-text => 'Hello!'
)->pack;

$main->Label(-text => 'Hello!',
    -relief => 'raised'
)->pack;

MainLoop;
=======================================================================
use Tk;

my $main = MainWindow->new;

$main->Button(-text => 'Hello',
    -command => [\&printem, "Hello\n"]
)->pack;

$main->Button(-text => 'End',
    -command => [$main => 'destroy']
)->pack;

MainLoop;

sub printem
{
    print shift;
}
=======================================================================
$main->Button(-text => 'Hello',
    -command => [\&printem, "Hello\n"]
)->pack; 
=======================================================================
use Tk;

$main = MainWindow->new();

$main->Button( -text => "Click Me!",
    -command => \&display
)->pack;

$text1 = $main->Text ('-width'=> 40, '-height' => 2
)->pack;

sub display
{
    $text1->insert('end', "Hello!");
}

MainLoop;
=======================================================================
use Tk;

$main = MainWindow->new();

$main->Button( -text => "Click Me!",
    -command => \&display
)->pack(-side => "left");

$text1 = $main->Text ('-width'=> 40, '-height' => 2
)->pack;

sub display
{
    $text1->insert('end', "Hello!");
}

MainLoop;
=======================================================================
$main->Button( -text => "Click Me!",
    -command => \&display
)->pack;

sub display
{
    $text1->insert('end', "Hello!");
}
=======================================================================
use Tk;

$main = MainWindow->new();

$main->Button( -text => "Click Me!",
    -command => \&display
)->pack(-side => "left");

$text1 = $main->Text ('-width'=> 40, '-height' => 2
)->pack;

$text1->bind('<Double-1>', \&display);

sub display
{
    $text1->insert('end', "Hello!");
}

MainLoop;
=======================================================================
use Tk;

$main = MainWindow->new();

$main->Radiobutton( -text => "Radio 1",
    -command => sub{
    $text1->delete('1.0', 'end');
    $text1->insert('end', "You clicked radio 1");}
)->pack;

$main->Radiobutton( -text => "Radio 2",
    -value => "0",
    -command => sub{
    $text1->delete('1.0', 'end');
    $text1->insert('end', "You clicked radio 2");
    }
)->pack;

$main->Checkbutton( -text => "Check 1",
    -command => sub{
    $text1->delete('1.0', 'end');
    $text1->insert('end', "You clicked check 1");
    }
)->pack;

$main->Checkbutton( -text => "Check 2",
    -command => sub{
    $text1->delete('1.0', 'end');
    $text1->insert('end', "You clicked check 2");
    }
)->pack;

$text1 = $main->Text ('-width'=> 40, '-height' => 2)->pack;

MainLoop;
=======================================================================
$main->Checkbutton( -text => "Check 1",
    -variable => \$check1,
    -command => sub{
    $text1->delete('1.0', 'end');
    }
)->pack;
=======================================================================
$main->Checkbutton( -text => "Check 1",
    -variable => \$check1,
    -command => sub{
    $text1->delete('1.0', 'end');
    $text1->insert('end', "\$check1 is set to: $check1");
    }
)->pack;
=======================================================================
use Tk;

$main = MainWindow->new();

$listbox1 = $main->Listbox("-width" => 25, 
    "-height" => 5
)->pack;
=======================================================================
use Tk;

$main = MainWindow->new();

$listbox1 = $main->Listbox("-width" => 25, 
    "-height" => 5
)->pack;

$listbox1->insert('end', "Apples", "Bananas",
    "Oranges", "Pears", "Pineapples");

$listbox1->bind('<Double-1>', \&getfruit);

$text1 = $main->Text ('-width'=> 40, '-height' 
    => 2
)->pack;

sub getfruit {
    $fruit = $listbox1->get('active');
    $text1->insert('end', "$fruit ");
}

MainLoop;
=======================================================================
use Tk;

$main = MainWindow->new();

$main->Scale('-orient'=> 'horizontal', 
    '-from' => 0,
    '-to' => 200, 
    '-tickinterval' => 40,
    '-label' => 'Select a value:', 
    '-length' => 200,
    '-variable' => \$value, 
    '-command' => \&display
)->pack;

$text1 = $main->Text ('-width'=> 40, 
    '-height' => 2
)->pack;

sub display
{
    $text1->delete('1.0','end');
    $text1->insert('end', "$value");
}

MainLoop;
=======================================================================
use Tk;

my $main = MainWindow->new;

my $listbox1 = $main->Listbox(-width => 25,
    -height => 5);

$listbox1->insert('end', "Apples", "Blueberries",
    "Bananas", "Kiwis", "Mangoes", "Oranges",
    "Pears", "Pineapples");

my $scroll1 = $main->Scrollbar(-command => ['yview', $listbox1]);

$listbox1->configure(-yscrollcommand => ['set', $scroll1]);

$listbox1->pack(-side => 'left', -fill => 'both');

$scroll1->pack(-side => 'right', -fill => 'y');

MainLoop;
=======================================================================
use Tk;
$main = MainWindow->new;

$canvas1 = $main->Canvas('-width' => 400,
    -height => 200
)->pack;

$canvas1->create ('oval', '50', '50', '160',
    '160', -fill => 'red');

$canvas1->create ('rectangle', '250', '50', '360',
    '160', -fill => 'blue');

$canvas1->create ('oval', '50', '50', '160',
    '160', -fill => 'red');

$canvas1->create ('rectangle', '250', '50', '360',
    '160', -fill => 'blue');

$canvas1->create ('line', '105', '105', '305',
    '105');

$canvas1->create ('polygon', '85', '105', '105',
    '85', '125', '105', '105', '125', '85', '105',
    -fill => 'black');

$canvas1->create ('polygon', '285', '105', '305',
    '85', '325', '105', '305', '125', '285', '105',
    -fill => 'black');

MainLoop;
=======================================================================
use Tk;

my $main = MainWindow->new;

$canvas = $main->Canvas('-width' => 330,
    -height => 90);

$main->Photo('image1',
    -file => 'image.gif');

$canvas->createImage(0, 0,
    -anchor => 'nw',
    -image => image1);

$canvas->pack;

MainLoop;
=======================================================================
use Tk;

my $main = MainWindow->new;

$main->Label(-bitmap => 'error')->pack;

$main->Label(-bitmap => 'gray12')->pack;

$main->Label(-bitmap => 'gray25')->pack;

$main->Label(-bitmap => 'gray50')->pack;

$main->Label(-bitmap => 'gray75')->pack;

$main->Label(-bitmap => 'hourglass')->pack;

$main->Label(-bitmap => 'info')->pack;

$main->Label(-bitmap => 'question')->pack;

$main->Label(-bitmap => 'questhead')->pack;

$main->Label(-bitmap => 'warning')->pack;

MainLoop;
=======================================================================
use Tk;

my $main = MainWindow->new;

my $frame1 = $main->Frame;

$frame1->pack;

my $frame2 = $frame1->Frame;

$frame2->Button(-text => 'Click Me!')->pack(-side => 'left');
$frame2->Button(-text => 'Click Me!')->pack(-side => 'right');

$frame2->pack(-side => 'left');

my $frame3 = $frame1->Frame;

$frame3->Button(-text => 'Click Me!')->pack(-side => 'left');
$frame3->Button(-text => 'Click Me!')->pack(-side => 'right');

$frame3->pack(-side => 'right');

my $frame4 = $main->Frame;

$frame4->Button(-text => 'Click Me!')->pack(-side => 'left');
$frame4->Button(-text => 'Click Me!')->pack(-side => 'right');

$frame4->pack(-fill => 'both');

my $frame5 = $main->Frame;

$frame5->Button(-text => 'Click Me!')->pack(-side => 'left');
$frame5->Button(-text => 'Click Me!')->pack(-side => 'right');

$frame5->pack(-fill => 'both');

my $frame6 = $main->Frame;

$frame6->Button(-text => 'Click Me!')->pack(-side => 'left');
$frame6->Button(-text => 'Click Me!')->pack(-side => 'right');

$frame6->pack(-fill => 'both');

my $frame7 = $main->Frame;

$frame7->pack;

my $frame8 = $frame7->Frame;

$frame8->Button(-text => 'Click Me!')->pack(-side => 'left');
$frame8->Button(-text => 'Click Me!')->pack(-side => 'right');

$frame8->pack(-side => 'left');

my $frame9 = $frame7->Frame;

$frame9->Button(-text => 'Click Me!')->pack(-side => 'left');
$frame9->Button(-text => 'Click Me!')->pack(-side => 'right');

$frame9->pack(-side => 'right');

MainLoop;
=======================================================================
use Tk;

my $main = MainWindow->new;

$button1 = $main->Button(-text => 'Click Me!')->place(-x => 0, -y => 0);

$button1 = $main->Button(-text => 'Click Me!')->place(-x => 30, -y => 30);

$button1 = $main->Button(-text => 'Click Me!')->place(-x => 60, -y => 60);

$button1 = $main->Button(-text => 'Click Me!')->place(-x => 90, -y => 90);

$button1 = $main->Button(-text => 'Click Me!')->place(-x => 120, 
    -y => 120);

$button1 = $main->Button(-text => 'Click Me!')->place(-x => 150, 
    -y => 150);

MainLoop;
=======================================================================
use Tk;

my $main = MainWindow->new;

my $entry1 = $main->Entry->pack;
=======================================================================
use Tk;

my $main = MainWindow->new;

my $entry1 = $main->Entry->pack;

$entry1->insert(
    0,
    'Here is some long text that you have to scroll to see.'
);

MainLoop;
=======================================================================
use Tk;
my $main = MainWindow->new;

my $entry1 = $main->Entry->pack;

my $entry2 = $main->Scrolled(
    Entry,
    -relief => 'sunken',
    -scrollbars => 's'
)->pack;

$entry1->insert(
    0,
    'Here is some long text that you have to scroll to see.'
);

$entry2->insert(
    0,
    'Here is some long text that you have to scroll to see.'
);

MainLoop;
=======================================================================
use Tk;

my $main = MainWindow->new();

$menubar = $main->Frame()->pack('-side' => 'top', '-fill' => 'x');

$filemenu = $menubar->Menubutton('-text' => 'File')->pack('-side' => 'left');

$filemenu->command('-label' => 'Open', '-command' => sub
    {$text->delete('1.0', 'end');
    $text->insert('end', "You clicked open.");});

$filemenu->separator();

$filemenu->command('-label' => 'Exit', '-command' => sub {exit});

$editmenu = $menubar->Menubutton('-text' => 'Edit')->pack('-side' => 'left');

$editmenu->command('-label' => 'Search', '-command' => sub
    {$text->delete('1.0', 'end');
    $text->insert('end', "You clicked search.");});

$editmenu->command('-label' => 'Replace', '-command' => sub
    {$text->delete('1.0', 'end');
    $text->insert('end', "You clicked replace.");});

$text = $main->Text ('-width' => 40, '-height' => 3)->pack();

MainLoop;
=======================================================================
use Tk; 
               
my $main = MainWindow->new;        

my $menubar = $main->Frame;

$menubar->pack(-fill => 'x');

my $filemenu = $menubar->Menubutton(-text => 'File');

$filemenu->command(
    -label       => 'Open', 
    -command     => sub {$text1->insert('1.0', "You chose open.\n")},
    -accelerator => 'Ctrl+O',
);

$main->bind('<Control-o>' => sub {$text1->insert('1.0', "You chose open.\n")});

$filemenu->cascade(-label => 'Check buttons');
$filemenu->cascade(-label => 'Radio buttons');

my $checkcascade = $filemenu->cget(-menu); 
my $checkmenu = $checkcascade->Menu;
$filemenu->entryconfigure('Check buttons', -menu => $checkmenu);

$checkmenu->checkbutton(-label => 'Check 1', -variable => \$check1,
    -command => sub {$text1->insert('1.0', "You chose check 1.\n")});
$checkmenu->checkbutton(-label => 'Check 2', -variable => \$check2,
    -command => sub {$text1->insert('1.0', "You chose check 2.\n")});
$checkmenu->checkbutton(-label => 'Check 3', -variable => \$check3,
    -command => sub {$text1->insert('1.0', "You chose check 3.\n")});
$checkmenu->checkbutton(-label => 'Check 4', -variable => \$check4,
    -command => sub {$text1->insert('1.0', "You chose check 4.\n")});
$checkmenu->checkbutton(-label => 'Check 5', -variable => \$check5,
    -command => sub {$text1->insert('1.0', "You chose check 5.\n")});
$checkmenu->checkbutton(-label => 'Check 6', -variable => \$check6,
    -command => sub {$text1->insert('1.0', "You chose check 6.\n")});
$checkmenu->checkbutton(-label => 'Check 7', -variable => \$check7,
    -command => sub {$text1->insert('1.0', "You chose check 7.\n")});
$checkmenu->checkbutton(-label => 'Check 8', -variable => \$check8,
    -command => sub {$text1->insert('1.0', "You chose check 8.\n")});

my $radiocascade = $filemenu->cget(-menu); 
my $radiomenu = $radiocascade->Menu;
$filemenu->entryconfigure('Radio buttons', -menu => $radiomenu);

$radiomenu->radiobutton(-label => 'Radio 1', -variable => \$radio1,
    -command => sub {$text1->insert('1.0', "You chose radio 1.\n")});
$radiomenu->radiobutton(-label => 'Radio 2', -variable => \$radio1,
    -command => sub {$text1->insert('1.0', "You chose radio 2.\n")});
$radiomenu->radiobutton(-label => 'Radio 3', -variable => \$radio1,
    -command => sub {$text1->insert('1.0', "You chose radio 3.\n")});
$radiomenu->radiobutton(-label => 'Radio 4', -variable => \$radio1,
    -command => sub {$text1->insert('1.0', "You chose radio 4.\n")});
$radiomenu->separator;
$radiomenu->radiobutton(-label => 'Radio 5', -variable => \$radio2,
    -command => sub {$text1->insert('1.0', "You chose radio 5.\n")});
$radiomenu->radiobutton(-label => 'Radio 6', -variable => \$radio2,
    -command => sub {$text1->insert('1.0', "You chose radio 6.\n")});
$radiomenu->radiobutton(-label => 'Radio 7', -variable => \$radio2,
    -command => sub {$text1->insert('1.0', "You chose radio 7.\n")});
$radiomenu->radiobutton(-label => 'Radio 8', -variable => \$radio2,
    -command => sub {$text1->insert('1.0', "You chose radio 8.\n")});
$radiomenu->separator;

$filemenu->command('-label' => 'Exit', '-command' => sub {exit});

$filemenu->pack(-side => 'left');

$editmenu = $menubar->Menubutton('-text' => 'Edit')->pack('-side' => 
'left');

$editmenu->command(-label => 'Search', 
    -background => "red",
    -command => sub
    {$text1->delete('1.0', 'end');
    $text1->insert('end', "You chose search.");});

$editmenu->command(-label => 'Replace', 
    -background => "orange",
    -command => sub
    {$text1->delete('1.0', 'end');
    $text1->insert('end', "You chose replace.");});

$editmenu->command(-label => 'Find', 
    -background => "yellow",
    -command => sub
    {$text1->delete('1.0', 'end');
    $text1->insert('end', "You chose find.");});


$editmenu->pack(-side => 'left');

$text1 = $main->Text;

$text1->pack(-fill => 'both');

MainLoop;
=======================================================================
use Tk;

$main = MainWindow->new();

$dialog = $main->DialogBox(
    -title => "Dialog box",
    -buttons => ["OK", "Cancel"]
);

$entry = $dialog->add(
    "Entry", -width => 40
)->pack;

$main->Button( 
    -text => "Show dialog box",
    -command => \&show
)->pack;

$text1 = $main->Text (
    -width => 40, 
    -height => 2
)->pack();

MainLoop;

sub show 
{
    $result = $dialog->Show;
    if ($result eq "OK") {
        $text1->delete('1.0','end');
        $text1->insert('end', $entry->get);
    }
}
=======================================================================
!!!CODE16!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=====================================================================
for $outerloop (0..4) {

    for $innerloop (0..4) {

        $array{"$outerloop,$innerloop"} = 1;

    }

}
=====================================================================
print $array{'0,0'};
=====================================================================
for $outerloop (0..4) {

    for $innerloop (0..4) {

        $array[$outerloop][$innerloop] = 1;

    }

}

print $array[0][0];
=====================================================================
$array[0] = ["apples", "oranges"];
$array[1] = ["asparagus", "corn", "peas"];
$array[2] = ["ham", "chicken"];

print $array[1][1];
=====================================================================
@array = (

    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);

print @array[1][1];
=====================================================================
$array = [

    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

];

print $array->[1][1];
=====================================================================
@{$array[0]} = ("apples", "oranges");
@{$array[1]} = ("asparagus", "corn", "peas");
@{$array[2]} = ("ham", "chicken");

print $array[1][1];
=====================================================================
@array = (

    ["apples", "oranges"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);

for $outer (0..$#array) {

    for $inner (0..$#{$array[$outer]}) {

        print $array[$outer][$inner], " ";

    }

    print "\n";

}
=====================================================================
@array = (

    ["apples", "oranges"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);

for $loopindex (0..$#array) {

    print join (", ", @{$array[$loopindex]}), "\n";

}
=====================================================================
@array = (

    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);

for $arrayreference (@array) {

    print join (", ", @{$arrayreference}), "\n";

}
=====================================================================
use strict vars;

$array = [
    
    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

];

print $array[0][0];
=====================================================================
$array[1][2]                          #An array of arrays
$hash{bigkey}{littlekey}              #A hash of hashes
$array[3]{key}                        #An array of hashes
$hash{key}[4]                         #A hash of arrays
=====================================================================
use Fcntl;
use NDBM_File;

tie %hash, "NDBM_File", 'data', O_RDWR|O_CREAT|O_EXCL, 0644;

$hash{drink} = 'root beer';
untie %hash;
=====================================================================
string = "Here's a string.";

@array = (1, 2, 3);

%hash = ('fruit' => 'apples', 'vegetable' => 'corn');

sub printem
{
    print shift;
}

$complex = {
    string         =>   $string,
    number         =>   3.1415926,
    array          =>   [@array],
    hash           =>   {%hash},
    arrayreference =>   \@array,
    hashreference  =>   \%hash,
    sub            =>   \&printem,
    anonymoussub   =>   sub {print shift;},
    handle         =>   \*STDOUT,
};

print $complex->{string}, "\n";

print $complex->{number}, "\n";

print $complex->{array}[0], "\n";

print $complex->{hash}{fruit}, "\n";

print ${$complex->{arrayreference}}[0], "\n";

print ${$complex->{hashreference}}{"fruit"}, "\n";

$complex->{sub}->("Subroutine call.\n");

$complex->{anonymoussub}->("Anonymous subroutine call.\n");

print {$complex->{handle}} "Text printed to a handle.", "\n";
=====================================================================
@array = (

    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);
=====================================================================
$array1ref = $array[1];

print ${$array1ref}[1];
=====================================================================
print ${array[1]}->[1];
=====================================================================
print $array[1]->[1];
=====================================================================
print $array[1][1];
=====================================================================
$array[0] = ["apples", "oranges"];
$array[1] = ["asparagus", "corn", "peas"];
$array[2] = ["ham", "chicken"];

print $array[1][1];
=====================================================================
@array =
(
    [
        ["apple", "orange"],
        ["ham", "chicken"],
    ],

    [
        ["tomatoes", "sprouts", "potatoes"],
        ["asparagus", "corn", "peas"],
    ],
);

print $array[1][1][1];
=====================================================================
@array = (

    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);

print @array[1][1];
=====================================================================
$array[0] = ["apples", "oranges"];
$array[1] = ["asparagus", "corn", "peas"];
$array[2] = ["ham", "chicken"];

print $array[1][1];
=====================================================================
@array1 = qw(apples oranges);
@array2 = qw(asparagus corn peas);
@array3 = qw(ham chicken);

$array[0] = \@array1;
$array[1] = \@array2;
$array[2] = \@array3;

print $array[1][1];
=====================================================================
@{$array[0]} = ("apples", "oranges");
@{$array[1]} = ("asparagus", "corn", "peas");
@{$array[2]} = ("ham", "chicken");

print $array[1][1];
=====================================================================
for $outerloop (0..4) {

    for $inerloop (0..4) {

        $array[$outerloop][$innerloop] = 1;

    }

}

print $array[0][0];
=====================================================================
for $loopindex (0..4) {

    push @array, [1, 1, 1, 1];

}

print $array[0][0];
=====================================================================
for $loopindex (0..4) {

    $array[$loopindex] = [&zerolist];

}

sub zerolist
{
    return (0, 0, 0, 0);
}

print $array[1][1];
=====================================================================
@array = (

    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);

$array[3] = ["chicken noodle", "chili"];

print $array[3][0];
=====================================================================
@array = (

    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);

push @{$array[0]}, "banana";

print $array[0][2];
=====================================================================
@array = (

    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);
=====================================================================
$array1ref = $array[1];
print ${$array1ref}[1];
=====================================================================
print ${array[1]}->[1];
=====================================================================
print $array[1]->[1];
=====================================================================
print $array[1][1];
=====================================================================
for $outerloop (0..4) {
    for $innerloop (0..4) {
        $array[$outerloop][$innerloop] = 1;
    }
}

print $array[0][0];
=====================================================================
@array = (
    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],
);

for $arrayref (@array) {

    print join (", ", @{$arrayref}), "\n";

}
=====================================================================
%hash = (

       fruits => {

               favorite => "apples",
               'second favorite' => "oranges",

       },

       vegetables => {

               favorite => "corn",
               'second favorite' => "peas",
               'least favorite' => "turnip",

       },

       meats => {

               favorite      => "chicken",
               'second favorite' => "beef",

       },

);
=====================================================================
print $hash{fruits}{favorite};
=====================================================================
%hash = (

       fruits => {

               favorite => "apples",
               'second favorite' => "oranges",

       },

       vegetables => {

               favorite => "corn",
               'second favorite' => "peas",
               'least favorite' => "turnip",

       },

       meats => {

               favorite      => "chicken",
               'second favorite' => "beef",

       },

);

print $hash{fruits}{favorite};
=====================================================================
$hash{fruits} = {
    favorite => "apples",
    'second favorite' => "oranges",
};

$hash{vegetables} = {
    favorite => "corn",
    'second favorite' => "peas",
    'least favorite' => "turnip",
};

$hash{meats} =  {
    favorite      => "chicken",
    'second favorite' => "beef",
};

print $hash{fruits}{favorite};
=====================================================================
%hash1 =
(
    favorite => "apples",
    'second favorite' => "oranges",
);

%hash2 =
(
    favorite => "corn",
    'second favorite' => "peas",
    'least favorite' => "turnip",
);

%hash3 =
(
    favorite      => "chicken",
    'second favorite' => "beef",
);

$hash{fruits} = \%hash1;

$hash{vegetables} = \%hash2;

$hash{meats} =  \%hash3;

print $hash{fruits}{favorite};
=====================================================================
for $key ("hash1", "hash2", "hash3" ) {

    $hash{$key} = {&returnlist};

}

sub returnlist

{
    return (key1 => value1, key2 => value2);
}

print $hash{hash1}{key2};
=====================================================================
%hash = (

       fruits => {

               favorite => "apples",
               'second favorite' => "oranges",

       },

       vegetables => {

               favorite => "corn",
               'second favorite' => "peas",
               'least favorite' => "turnip",
       },

);

print $hash{fruits}{'second favorite'};
=====================================================================
%hash = (

       fruits => {

               favorite => "apples",
               'second favorite' => "oranges",

       },

       vegs => {

               favorite => "corn",
               'second favorite' => "peas",

       },

);

for $food (keys %hash) {

    print "$food\t {";
    for $key (keys %{$hash{$food}}) {
        print "'$key' => '$hash{$food}{$key}'";

    }

    print "}\n";

}
=====================================================================
@array = (

    {
        favorite => "apples",
        'second favorite' => "oranges",
    },

    {
        favorite => "corn",
        'second favorite' => "peas",
        'least favorite' => "turnip",
    },

    {
        favorite      => "chicken",
        'second favorite' => "beef",
    },

);

print $array[0]{favorite};
=====================================================================
@array =
(
    {
        favorite => "apples",
        'second favorite' => "oranges",
    },

    {
        favorite => "corn",
        'second favorite' => "peas",
        'least favorite' => "turnip",
    },

    {
        favorite      => "chicken",
        'second favorite' => "beef",
    }
);

print $array[0]{favorite};
=====================================================================
$array[0] =
{
    favorite => "apples",
    'second favorite' => "oranges",
};

$array[1] =
{
    favorite => "corn",
    'second favorite' => "peas",
    'least favorite' => "turnip",
};

$array[2] =
{
    favorite      => "chicken",
    'second favorite' => "beef",
};

print $array[0]{favorite};
=====================================================================
%hash1 =
(
    favorite => "apples",
    'second favorite' => "oranges",
);

%hash2 =
(
    favorite => "corn",
    'second favorite' => "peas",
    'least favorite' => "turnip",
);

%hash3 =
(
    favorite      => "chicken",
    'second favorite' => "beef",
);

@array = (\%hash1, \%hash2, \%hash3);

print $array[0]{favorite};
=====================================================================
push @array, {

    favorite => "apples", 
    'second favorite' => "oranges"

};

push @array, {

    favorite => "corn", 
    'second favorite' => "peas", 
    'least favorite' => "turnip"

};

push @array, {

    favorite => "chicken", 
    'second favorite' => "beef"

};

print $array[0]{favorite};
=====================================================================
$data[0] = "favorite:apples,second favorite:oranges";

$data[1] = "favorite:apples,second favorite:oranges,
    least favorite=turnips";

$data[2] = "favorite:chicken,second favorite:beef";

for $loopindex (0..$#data) {

    for $element (split ',', $data[$loopindex]) {

        ($key, $value) = split ':', $element;
        $array[$loopindex]{$key} = $value;

    }

}

print $array[0]{'second favorite'};
=====================================================================
$array[0] = {
    favorite => "apples", 
    'second favorite' => "oranges"
};

$array[1] = {
    favorite => "corn", 
    'second favorite' => "peas", 
    'least favorite' => "turnip"
};

$array[2] = {
    favorite => "chicken", 
    'second favorite' => "beef"
};

print $array[0]{favorite};
=====================================================================
$array[0] = {
    favorite => "apples", 
    'second favorite' => "oranges"
};

$array[1] = {
    favorite => "corn", 
    'second favorite' => "peas"
};

$array[2] = {
    favorite => "chicken", 
    'second favorite' => "beef"
};

for $loopindex (0..$#array) {

    print "array[$loopindex]: {";
    for $key (keys %{$array[$loopindex]}) {
        print "'$key' => '$array[$loopindex]{$key}' ";

    }

    print "}\n";

}
=====================================================================
$array[0] = {

    favorite => "apples", 
    'second favorite' => "oranges"

};

$array[1] = {

    favorite => "corn", 
    'second favorite' => "peas"

};

$array[2] = {

    favorite => "chicken", 
    'second favorite' => "beef"

};

for $hashreference (@array) {

    print "{";

    for $key (sort keys %$hashreference) {

        print "'$key' => '$hashreference->{$key}'";

    }

    print "}\n";

}
=====================================================================
%hash = (

    fruits => ["apples", "oranges"],
    vegetables => ["corn", "peas", "turnips"],
    meats => ["chicken", "ham"],

);

print $hash{fruits}[0];
=====================================================================
%hash = (

    fruits => ["apples", "oranges"],
    vegetables => ["corn", "peas", "turnips"],
    meats => ["chicken", "ham"],

);

print $hash{fruits}[0];
=====================================================================
$hash{fruits} = ["apples", "oranges"];

$hash{vegetables} = ["corn", "peas", "turnips"];

$hash{meats} = ["chicken", "ham"];

print $hash{fruits}[0];
=====================================================================
@array1 = ("apples", "oranges");
@array2 = ("corn", "peas", "turnips");
@array3 = ("chicken", "ham");

$hash{fruits} = \@array1;
$hash{vegetables} = \@array2;
$hash{meats} = \@array3;

print $hash{fruits}[0];
=====================================================================
push @{$hash{fruits}}, "apples", "oranges";

push @{$hash{vegetables}}, "corn", "peas", "turnips";

push @{$hash{meats}}, "chicken", "ham";

print $hash{fruits}[0];
=====================================================================
%hash = (

    fruits => ["apples", "oranges"],
    vegetables => ["corn", "peas", "turnips"],
    meats => ["chicken", "ham"],

);

print $hash{fruits}[0];
=====================================================================
%hash = (

    fruits => ["apples", "oranges"],
    vegs => ["corn", "peas", "turnips"],
    meats => ["chicken", "ham"],

);

for $key (sort keys %hash) {

    print "$key:\t[", join(", ", @{$hash{$key}}), "]\n"

}
=====================================================================
$buffer[0]{next} = 1;
$buffer[0]{data} = 0;
$buffer[1]{next} = 2;
$buffer[1]{data} = 0;
$buffer[2]{next} = 3;
$buffer[2]{data} = 0;
$buffer[3]{next} = 0;
$buffer[3]{data} = 0;

$head = 0; 

$tail = 0;

sub store
{

    if ($buffer[$tail]{next} != $head) { #Check: buffer full?

        $buffer[$tail]{data} = shift;
        $tail = $buffer[$tail]{next};

        return 1;

    } else {

        return 0;

    }

}

sub retrieve
{

    if ($head != $tail) {   # $tail == $head => empty buffer

        $data = $buffer[$head]{data};
        $head = $buffer[$head]{next};

        return $data;

    } else {

        return undef;

    }

}

store 0;
store 1;
store 2;
store 3;        #buffer full, value not stored

print retrieve, "\n";
print retrieve, "\n";
print retrieve, "\n";
=====================================================================
use Storable;

@a1 = (

    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);

store (\@a1, "array.dat");

@a2 = @{retrieve("array.dat")};

print $a2[1][1];
=====================================================================
@a1 = (

    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);

@a2 = @a1;

$a2[1][1] = "squash";

print $a1[1][1];
=====================================================================
use Storable qw(dclone);

@a1 = (

    ["apple", "orange"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);

@a2 = dclone(\@a1);

$a2[1][1] = "squash";

print $a1[1][1];
=====================================================================
use Data::Dumper;

@array = (

    ["apples", "oranges"],
    ["asparagus", "corn", "peas"],
    ["ham", "chicken"],

);

print Data::Dumper->Dump([\@array], [*array]);
=====================================================================
use Data::Dumper;

%hash = (

       fruits => {

               favorite => "apples",
               'second favorite' => "oranges",

       },

       vegetables => {

               favorite => "corn",
               'second favorite' => "peas",
               'least favorite' => "turnip",

       },

       meats => {

               favorite      => "chicken",
               'second favorite' => "beef",

       },

);

print Data::Dumper->Dump([\%hash], [*hash]);
=====================================================================
sub record
{
    ($value, $max, $min) = @_;

    if ($value >= $min && $value <= $max){
        return {
            value => $value,
            max => $max,
            min => $min,
        };
    } else {
        return;
    }
}
=====================================================================
$myrecord = record(100, 1000, 10);
=====================================================================
$myrecord = record(100, 1000, 10);

print $myrecord->{value};
=====================================================================
use Class::Struct;

struct( produce => {
        vegetable => item,
        fruit => item,
});
=====================================================================
struct( item => [
        name  => '$',
        number => '$',
]);
=====================================================================
my $grocery = new produce;
=====================================================================
$grocery->fruit->name('bananas');
$grocery->fruit->number(1000);
=====================================================================
print "Yes, we have ", $grocery->fruit->number, " ",
    $grocery->fruit->name, ".";
=====================================================================
use Fcntl;
use NDBM_File;

tie %hash, "NDBM_File", 'data', O_RDWR|O_CREAT|O_EXCL, 0644;

$hash{drink} = 'root beer';
$hash{meat} = turkey;
$hash{dessert} = 'blueberry pie';

untie %hash;
=====================================================================
use Fcntl;
use NDBM_File;

tie %hash, "NDBM_File", 'data', O_RDWR, 0644;

while(($key, $value) = each(%hash)) {
    print "$key => $value\n";
}

untie %hash;
=====================================================================
use DB_File;
use Fcntl;

$DB_BTREE->{'compare'} = sub {
    shift cmp shift ;
};

tie(%hash, "DB_File", 'sorted', O_RDWR|O_CREAT|O_TRUNC, 0644, $DB_BTREE)
    or die "Can not tie file.";

$hash{drink} = 'root beer';
$hash{meat} = turkey;
$hash{dessert} = 'blueberry pie';

while(($key, $value) = each(%hash)) {
    print "$key => $value\n";
}

untie %hash;
=====================================================================
use DB_File;
use Fcntl;

tie(@array, "DB_File", "file.txt", O_RDWR|O_CREAT, 0644, $DB_RECNO)    
    or die "Can not open file.";

$array[3] = "Some new text!";

untie @array;
=====================================================================
!!!CODE17!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=====================================================================
package package1;

BEGIN { }

sub subroutine1 {print "Hello!\n";}
return 1;

END { }
=====================================================================
require 'package1.pl';
=====================================================================
require 'package1.pl';

package1::subroutine1();
=====================================================================
package package1;

BEGIN { }

$variable1 = 1;

sub subroutine1 {print "Hello!\n";}

return 1;

END { }
=====================================================================
require 'package1.pl';

package1::subroutine1();

print $package1::variable1;
=====================================================================
package Module1;

BEGIN {
    use Exporter();
    @ISA = qw(Exporter);
    @EXPORT = qw(&subroutine1);
}

sub subroutine1 {print "Hello!\n";}

return 1;

END { }
=====================================================================
use Module1;

subroutine1();
=====================================================================
%perl Makefile.PL
%make
%make test
%make install
=====================================================================
package package1;

sub subroutine1 {print "Hello!\n";}

return 1;
=====================================================================
require 'package1.pl';

package1::subroutine1();
=====================================================================
package1::subroutine1();             #subroutine1 called in package main

package package1;                    #subroutine1 defined in package package1

sub subroutine1 {print "Hello!\n";}
=====================================================================
package package1;

sub BEGIN
{
    $text = "Hello!\n";
}

sub subroutine1 {print $text}

return 1;
=====================================================================
require 'package1.pl';

package1::subroutine1();
=====================================================================
package package1;

sub BEGIN
{
    $text = "Hello!\n";
}

sub subroutine1 {print $text}

return 1;

sub END
{
    print "Thank you for using package1!\n";
}
=====================================================================
package package1;

BEGIN { }

sub subroutine1 {print __PACKAGE__;}

return 1;

END { }
=====================================================================
package package1;

BEGIN {}

sub hello{print "Hello!\n";}

return 1;

END {}
=====================================================================
package package1;

BEGIN {}

sub hello2{print "Hello again!\n";}

return 1;

END {}
=====================================================================
require 'file1.pl';
require 'file2.pl';

package1::hello();
package1::hello2();
=====================================================================
package Module1;

BEGIN { }

sub subroutine1 {print "Hello!\n";}

return 1;

END { }
=====================================================================
package Module1;

BEGIN 
{
    use Exporter();
    @ISA = qw(Exporter);
    @EXPORT = qw(&subroutine1);
}

sub subroutine1 {print "Hello!\n";}

return 1;

END { }
=====================================================================
use Module1;

subroutine1();
=====================================================================
package Module1;

BEGIN 
{
    use Exporter();

    @ISA = qw(Exporter);

    @EXPORT_OK = qw(&subroutine1);
}

sub subroutine1 {print "Hello!\n";}

return 1;

END { }
=====================================================================
use Module1 qw(&subroutine1);

subroutine1();
=====================================================================
use Module1(); 
subroutine1();
=====================================================================
package Uptime;

BEGIN
{
    use Exporter();

    @ISA = qw(Exporter);

    if ($^O ne 'MSWin32') {

        @EXPORT = qw(&uptime);

    } else {

        print "Sorry, no uptime available in Win32.\n";
        @EXPORT_FAIL = qw(&uptime);

    }
}

sub uptime {print `uptime`;}

return 1;

END { }
=====================================================================
use Uptime;

uptime();
=====================================================================
package Module1;

BEGIN { }

use Exporter();

@ISA = qw(Exporter);

@EXPORT = qw ($variable1);

$variable1 = 100;

sub import 
{
    print "In import\n"; 
    Module1->export_to_level(1, @EXPORT); 
}

return 1;

END { }
=====================================================================
use Module1;

print "\$variable1 = ", $variable1;
=====================================================================
package Module1;

BEGIN
{
    use Exporter();
    @ISA = qw(Exporter);
    @EXPORT = qw(&subroutine1 $variable1);
}

sub subroutine1 {print "Hello!\n";}
$variable1 = 100;

return 1;

END { }
=====================================================================
package Module2;

BEGIN
{
    use Exporter();
    @ISA = qw(Exporter);
    @EXPORT = qw(&subroutine1 $variable1);
}

sub subroutine1 {print "Hi!\n";}
$variable1 = 500;

return 1;
END { }
=====================================================================
require Module1;
require Module2;

$module = Module1;
$subname = subroutine1;

$callme = $module . '::' . $subname;
&{$callme};

$module = Module1;
$variablename = variable1;

$printme = $module . '::' . $variablename;
print "The variable = $printme";
=====================================================================
package Module1;

BEGIN
{
    use Exporter();
    @ISA = qw(Exporter);
    @EXPORT = qw(&exit);
}

sub exit {print "Why do you want to quit?\n";}

return 1;

END { }
=====================================================================
use Module1;

exit;

print "I'm still here!";
=====================================================================
package Module1::Code1;

BEGIN
{
    use Exporter();
    @ISA = qw(Exporter);
    @EXPORT = qw(&subroutine1);
}

sub subroutine1 {print "Hello!\n";}

return 1;

END { }
=====================================================================
use Module1::Code1;

subroutine1();
=====================================================================
package Module1;

BEGIN { }

use Exporter();

@ISA = qw(Exporter);
@EXPORT = qw ($variable1);

$VERSION = 1.00;

return 1;

END { }
=====================================================================
use Module1();

Module1->require_version(2.00);
=====================================================================
use Autoload;

subroutine1();
=====================================================================
package Autoload;

BEGIN
{
    use Exporter   ();
    @ISA         = qw(Exporter);
    @EXPORT      = qw(&AUTOLOAD);
}
=====================================================================
package Autoload;

BEGIN
{
    use Exporter   ();
    @ISA         = qw(Exporter);
    @EXPORT      = qw(&AUTOLOAD);
}

sub AUTOLOAD ()
{
    my $subroutine = $AUTOLOAD;
    $subroutine =~ s/.*:://;

    if ($subroutine eq 'subroutine1') {
        .
        .
        .
    }
}
=====================================================================
package Autoload;

BEGIN
{
    use Exporter   ();
    @ISA         = qw(Exporter);
    @EXPORT      = qw(&AUTOLOAD);
}

sub AUTOLOAD ()
{
    my $subroutine = $AUTOLOAD;
    $subroutine =~ s/.*:://;

    if ($subroutine eq 'subroutine1') {

        require Module1;
        &Module1::subroutine1;

    }
}

return 1;

END { }
=====================================================================
package Module1;

BEGIN
{
    use Exporter();
    @ISA = qw(Exporter);
    @EXPORT = qw(&subroutine1 $variable1);
}

sub subroutine1 {print "Hello!\n";}
$variable1 = 100;

return 1;

END { }
=====================================================================
package Autoload;

BEGIN 
{
    use Exporter   ();
    @ISA         = qw(Exporter);
    @EXPORT      = qw(&AUTOLOAD);
}

sub AUTOLOAD () 
{
    my $subroutine = $AUTOLOAD;
    $subroutine =~ s/.*:://;
    print "You called $subroutine with these arguments: ", join(", ", @_);
}

return 1;

END { }
=====================================================================
use Autoload;

printem (1, 2, 3);
=====================================================================
use AutoLoader 'AUTOLOAD';   
=====================================================================
package Module1;

BEGIN
{
    use Exporter();
    use SelfLoader();
    @ISA = qw(Exporter SelfLoader);
    @EXPORT = qw(&subroutine1);
}

return 1;

END { }

__DATA__
sub subroutine1 {print "Hello!\n";}
=====================================================================
use Module1;
subroutine1();
=====================================================================
package Integer::Doubler;

use strict;
use vars qw($VERSION @ISA @EXPORT);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
        
);
$VERSION = '0.01';


# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is the stub of documentation for your module. You better edit it!

=head1 NAME

Integer::Doubler - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Integer::Doubler;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Integer::Doubler was created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head1 AUTHOR

A. U. Thor, a.u.thor@a.galaxy.far.far.away

=head1 SEE ALSO

perl(1).

=cut
=====================================================================
@ISA = qw(Exporter AutoLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
doubler
);
$VERSION = '0.01';


# Preloaded methods go here.   

sub doubler 
{
    return 2 * shift;
}
=====================================================================
#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif


MODULE = Random::Number         PACKAGE = Random::Number
=====================================================================
#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif


MODULE = Random::Number         PACKAGE = Random::Number

double
random()
    CODE:
        RETVAL = rand() % 100;
=====================================================================
#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif


MODULE = Random::Number         PACKAGE = Random::Number

double
random()
    CODE:
        RETVAL = rand() % 100;
    OUTPUT:
        RETVAL
=====================================================================
use Random::Number;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

$s = random();
print "Random number: $s\n";
=====================================================================
=====================================================================
package Math::Boomerang;

use strict;
use vars qw($VERSION @ISA @EXPORT);

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
boomerang       
);
$VERSION = '0.01';
=====================================================================
#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif


MODULE = Math::Boomerang         PACKAGE = Math::Boomerang

int
boomerang(value)
    int value
    CODE:
        RETVAL = value; 
    OUTPUT:
        RETVAL
=====================================================================
#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif


MODULE = Math::Boomerang                PACKAGE = Math::Boomerang

PROTOTYPES: DISABLE
void
boomerang(...)
=====================================================================
PROTOTYPES: DISABLE
void
boomerang(...)
PPCODE:
{
    int loop_index;
    SV **arguments;
    arguments = New(0, arguments, items, SV *);

    for (loop_index = 0; loop_index < items; loop_index++) {
        arguments[loop_index] = ST(loop_index);
    }
=====================================================================
PROTOTYPES: DISABLE
void
boomerang(...)
PPCODE:
{
    int loop_index;
    SV **arguments;
    arguments = New(0, arguments, items, SV *);

    for (loop_index = 0; loop_index < items; loop_index++) {
        arguments[loop_index] = ST(loop_index);
    }

    for (loop_index = 0; loop_index < items; loop_index++) {
        PUSHs(arguments[loop_index]);
    }
    
    Safefree(arguments);
}
=====================================================================
!!!CODE18!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=====================================================================
package Class1;

sub new
{
    my $self  = {};
    bless($self);
    return $self;
}

return 1;
=====================================================================
use Class1;

my $object1 = Class1->new();
=====================================================================
my $object1 = Class1->new();
=====================================================================
my $data = $object1->{DATA};
=====================================================================
my $data = $object1->getdata();
=====================================================================
package Class1;

return 1;
=====================================================================
package Class1;

return 1;
=====================================================================
package Class1;

sub new
{
    my $self  = {};

    bless($self);

    return $self;
}

return 1;
=====================================================================
package Class1;

sub new
{
    my $self  = {};

    shift;
    $self->{DATA_ITEM_1} = shift;
    $self->{DATA_ITEM_2} = shift;

    bless($self);

    return $self;
}

return 1;
=====================================================================
package Class1;

sub new
{
    my $self  = {};

    shift;
    $self->{DATA_ITEM_1} = shift;
    $self->{DATA_ITEM_2} = shift;
    $self->{DATA_ITEM_3} = 3;

    bless($self);

    return $self;
}

return 1;
=====================================================================
package Class1;

my $data_item_3;

BEGIN
{
    $data_item_3 = 3;
}

sub new
{
    my $self  = {};

    shift;
    $self->{DATA_ITEM_1} = shift;
    $self->{DATA_ITEM_2} = shift;
    $self->{DATA_ITEM_3} = $data_item_3;

    bless($self);

    return $self;
}

return 1;
=====================================================================
my $object = Class1->new();

package Class1;

sub new
{
    my $self  = {};

    bless($self);

    return $self;
}
=====================================================================
package Class1;

sub new
{
    my $self  = {};

    bless($self);

    return $self;
}

return 1;
=====================================================================
use Class1;

my $object = Class1->new();
=====================================================================
sub new
{
    my $self  = {};

    shift;
    $self->{DATA_ITEM_1} = shift;
    $self->{DATA_ITEM_2} = shift;
    $self->{DATA_ITEM_3} = 3;

    bless($self);

    return $self;
}
=====================================================================
my $object = Class1->new(1, 2);
=====================================================================
my $object = Class1->new(1, 2);

print "Data item 1 = ", $object->{DATA_ITEM_1}, "\n";
print "Data item 2 = ", $object->{DATA_ITEM_2}, "\n";


package Class1;

sub new
{
    my $self  = {};

    shift;
    $self->{DATA_ITEM_1} = shift;
    $self->{DATA_ITEM_2} = shift;
    $self->{DATA_ITEM_3} = 3;

    bless($self);

    return $self;
}
=====================================================================
my $object1 = Class1->new();

package Class1;

sub new
{
    $class = shift;

    print "You're creating a new object of class $class.";

    my $self  = {};

    bless($self);

    return $self;
}
=====================================================================
print "Class1 supports these methods: ",
    join(", ", Class1->get_interfaces());

package Class1;

sub new
{
    $class = shift;

    my $self  = {};

    bless($self);

    return $self;
}

sub get_interfaces {

    return 'new', 'get_interfaces';
}
=====================================================================
sub addem
{
    ($object, $operand1, $operand2) = @_;

    return $operand1 + $operand2;
}
=====================================================================
sub addem
{
    shift;

    ($operand1, $operand2) = @_;

    return $operand1 + $operand2;
}
=====================================================================
sub addem
{
    my ($object, $operand1, $operand2) = @_;

    return $operand1 + $operand2;
}
=====================================================================
$math_object = Class1->new();

print "2 + 2 = ", $math_object->addem(2, 2);


package Class1;

sub new
{
    my $class = shift;

    my $self  = {};

    bless($self);

    return $self;
}

sub addem
{
    my ($object, $operand1, $operand2) = @_;

    return $operand1 + $operand2;
}
=====================================================================
package Class1;

sub new
{
    my $type  = {};

    bless($type);

    return $type;
}

sub data
{
    my $self = shift;

    if (@_) {$self->{DATA} = shift;}

    return $self->{DATA};
}

return 1;
=====================================================================
use Class1;

my $object1 = Class1->new();

$object1->data("Hello!");

print "Here's the text in the object: ", $object1->data;
=====================================================================
$math_object = Class1->new();

print "2 + 2 = ", $math_object->addem(2, 2);


package Class1;

sub new
{
    my $class = shift;

    my $self  = {};

    bless($self);

    return $self;
}

sub addem
{
    my ($object, $operand1, $operand2) = @_;

    return $operand1 + $operand2;
}
=====================================================================
package Class1;

sub new
{
    my $self  = {};

    bless($self);

    $self->data(0);

    return $self;
}

sub data
{
    my $self = shift;

    if (@_) {$self->{DATA} = shift;}

    return $self->{DATA};
}

return 1;
=====================================================================
package Class1;

sub new
{
    my $self = {};

    bless($self);

    data ($self, 0);

    return $self;

}

sub data
{
    my $self = shift;

    if (@_) {$self->{DATA} = shift;}

    return $self->{DATA};
}

return 1;
=====================================================================
$math_object = Class1->new();

$coderef = \&Class1::addem;

print "2 + 2 = ", &$coderef(0, 2, 2);


package Class1;

sub new
{
    shift;

    my $self  = {};

    bless($self);

    return $self;
}

sub addem
{
    my ($object, $operand1, $operand2) = @_;

    return $operand1 + $operand2;
}
=====================================================================
package Class1;

sub new
{
    my $self  = {};

    $self->{NAME} = "Christine";

    bless($self);

    return $self;
}

return 1;
=====================================================================
use Class1;

my $object1 = Class1->new();

print "The person's name is ", $object1->{NAME}, "\n";
=====================================================================
package Class1;

sub new
{
    my $self  = {};

    $self->{NAME} = "Christine";

    bless($self);

    return $self;
}

return 1;
=====================================================================
use Class1;

my $object1 = Class1->new();

print "The person's name is ", $object1->{NAME}, "\n";
=====================================================================
sub get_name
{

    $self = shift;
    return $self->{NAME};

}
=====================================================================
sub set_name
{

    $self = shift;
    $self->{NAME} = shift;

}
=====================================================================
use Class1;

my $object = Class1->new();

$object->set_name('Nancy');

print "The person's name is ", $object->get_name(), "\n";
=====================================================================
package Class1;

my $name = "Christine";

sub new
{
    my $self  = {};

    bless($self);

    return $self;
}

sub get_name
{

    return $name;

}

sub set_name
{

    shift;
    $name = shift;

}

return 1;
=====================================================================
use Class1;

my $object = Class1->new();

$object->set_name('Nancy');

print "The person's name is ", $object->get_name(), "\n";
=====================================================================
use Class1;

my $object1 = Class1->new();

my $object2 = Class1->new();

$object1->set_name('Nancy');

print "The person's name is ", $object2->get_name(), "\n";
=====================================================================
package Class1;

sub new
{
    my $type  = {};

    $type->{OPERAND1} = 2;

    $type->{OPERAND2} = 2;

    bless($type);

    return $type;
}

sub sum
{
    my $self = shift;

    my $temp = _add ($self->{OPERAND1}, $self->{OPERAND2});

    return $temp;
}

sub _add {return shift() + shift();}

return 1;
=====================================================================
use Class1;

my $object1 = Class1->new();

print "Here's the sum: ", $object1->sum;
=====================================================================
package Cdata;

my $total;

sub new {

    $self = {};

    $total++;

    return bless $self;

}

sub gettotal
{

    return $total;

}

return 1;
=====================================================================
use Cdata;

$object1 = Cdata->new;

print "Current number of objects: ", $object1->gettotal, "\n";

$object2 = Cdata->new;

print "Current number of objects: ", $object2->gettotal, "\n";

$object3 = Cdata->new;

print "Current number of objects: ", $object3->gettotal, "\n";
=====================================================================
package Class1;

sub new
{
    my $self  = {};

    bless($self);

    return $self;
}

sub DESTROY
{

    print "Object is being destroyed!\n"

}

return 1;
=====================================================================
use Class1;

my $object1 = Class1->new();

exit;
=====================================================================
use Class1;

my $object1 = Class1->new();

$object1 = undef;

print "Exiting now...";

exit;
=====================================================================
package Class1;

sub new
{
    my $self  = {};

    bless($self);

    return $self;
}

sub gettext {return "Hello!\n";}

return 1;
=====================================================================
package Class2;

use Class1;

@ISA = qw(Class1);

sub new
{
    my $self  = Class1->new;

    bless($self);

    return $self;
}

return 1;
=====================================================================
use Class2;

my $object1 = Class2->new();

print "The object says: ", $object1->gettext;
=====================================================================
package Class1;

sub new
{
    my $class  = shift;

    my $self  = {};

    bless($self, $class);

    return $self;
}

return 1;
=====================================================================
package Class2;

use Class1;

@ISA = qw(Class1);

sub new
{
    my $self  = Class1->new;

    bless($self);

    return $self;
}

return 1;
=====================================================================
use Class2;

my $object1 = Class2->new();

print "The object's class is: ", ref $object1, "\n";

print "The object says: ", $object1->gettext;
=====================================================================
package Class1;

sub new
{
    my $class  = shift;

    my $self  = {};

    $self->{NAME} = "Christine";
    
    bless $self, $class;

    return $self;
}

return 1;
=====================================================================
package Class2;

use Class1;

@ISA = qw(Class1);

sub new
{
    my $self = Class1->new();

    $self->{DATA} = 200;

    return $self;
}

return 1;
=====================================================================
use Class2;

my $object1 = Class2->new();

print $object1->{NAME}, " has \$", $object1->{DATA}, "\n";
=====================================================================
package Class1;

sub new
{
    my $class  = shift;

    my $self  = [];

    $self->[0] = 100;

    bless $self, $class;

    return $self;
}

return 1;
=====================================================================
package Class2;

use Class1;

@ISA = qw(Class1);

sub new
{
    my $self = Class1->new();

    $self->[1] = 200;

    return $self;
}

return 1;
=====================================================================
use Class2;

my $object1 = Class2->new();

print '$object1->[0] = ', $object1->[0], "\n";
print '$object1->[1] = ', $object1->[1], "\n";
=====================================================================
package Class0;

sub printhi {print "Hi\n";}

return 1;
=====================================================================
package Class1;

sub printhello {print "Hello\n";}

return 1;
=====================================================================
package Class2;

use Class0;

use Class1;

@ISA = qw(Class0 Class1);

sub new
{
    my $self  = {};

    bless($self);

    return $self;
}

return 1;
=====================================================================
use Class2;

my $object1 = Class2->new();

$object1->printhi;

$object1->printhello;
=====================================================================
!!!CODE19!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=====================================================================
use Doubler;

tie $data, 'Doubler', $$;
=====================================================================
use Doubler;

tie $data, 'Doubler', $$;

$data = 5;

print "\$data evaluates to $data";
=====================================================================
package Class1;

sub new
{
    my $type  = {};

    $type->{OPERAND1} = 2;

    $type->{OPERAND2} = 2;

    bless($type);

    return $type;
}

sub sum
{
    my $self = shift;

    my $temp = _add ($self->{OPERAND1}, $self->{OPERAND2});

    return $temp;
}

sub _add {return shift() + shift();}

return 1;
=====================================================================
$object1 = Datum->new(1);

$object2 = Datum->new(2);

$object3 = $object1 + $object2;

$object4 = $object1 + 3;

$object5 = $object1 - $object2;

$object6 = 7 - $object2;
=====================================================================
print "1 + 2 + 3 = ", addem(1, 2, 3), "\n";

print "1 + 2 + 3 + 4 = ", addem(1, 2, 3, 4), "\n";

sub addem
{
    my $sum = 0;

    foreach $value (@_) {

        $sum += $value;

    }

    return $sum;
}
=====================================================================
package Class1;

sub printem
{
    print "Hello";
}

return 1;
=====================================================================
package Class2;

use Class1;

@ISA = qw(Class1);

sub new
{
    my $self  = {};

    bless($self);

    return $self;
}

sub printem
{
    print "Hi";
}

return 1;
=====================================================================
use Class2;

my $object1 = Class2->new();

$object1->printem;
=====================================================================
package Class1;

sub printem
{
    print "Hello";
}

return 1;
=====================================================================
package Class2;

use Class1;

@ISA = qw(Class1);

sub new
{
    my $self  = {};

    bless($self);

    return $self;
}

sub printem
{
    $self = shift;

    $self->SUPER::printem;

    print " there!";
}

return 1;
=====================================================================
use Class2;

my $object1 = Class2->new();

$object1->printem;
=====================================================================
package Doubler;

sub TIESCALAR 
{

    my $class = shift;

    $data = shift;

    return bless \$data, $class;

}
=====================================================================
sub FETCH
{
    my $self = shift;

    return 2 * $data;
}
=====================================================================
sub STORE
{
    my $self = shift;

    $data = shift;

    return 2 * $data;
}
=====================================================================
sub DESTROY { }

return 1;
=====================================================================
use Doubler;

tie $data, 'Doubler', $$;

$data = 5;

print "\$data evaluates to $data";
=====================================================================
package Darray;

sub TIEARRAY {

    my $class = shift;

    @array = @_;

    return bless \@array, $class;

}
=====================================================================
sub FETCH
{
    my $self = shift;

    my $index = shift;

    return 2 * $array[$index];
}
=====================================================================
sub FETCHSIZE 
{
    return ($#array + 1);
}
=====================================================================
sub STORESIZE 
{
    $#array = shift;
}
=====================================================================
sub STORE
{
    my $self = shift;

    my $index = shift;

    return 2 * $array[$index];
}
=====================================================================
sub DESTROY { }

return 1;
=====================================================================
use Darray;

tie @array, 'Darray', (1, 2, 3);

print join (", ", @array);
=====================================================================
use Fcntl;
use NDBM_File;

tie %hash, "NDBM_File", 'data', O_RDWR|O_CREAT|O_EXCL, 0644;

$hash{drink} = 'root beer';

$hash{meat} = turkey;

$hash{dessert} = 'blueberry pie';

untie %hash;
=====================================================================
use Fcntl;
use NDBM_File;

tie %hash, "NDBM_File", 'data', O_RDWR, 0644;
=====================================================================
use Fcntl;
use NDBM_File;

tie %hash, "NDBM_File", 'data', O_RDWR, 0644;

while(($key, $value) = each(%hash)) {

    print "$key => $value\n";

}

untie %hash;
=====================================================================
use Math::Complex;

$operand1 = Math::Complex->new(1, 2);

if ($operand1->isa("Math::Complex")) {print "\$operand1 is 
    an object of class Math::Complex.";}
=====================================================================
$object = Class1->new;

$printemcall = $object->can('printem');

&{$printemcall} if $printemcall;

package Class1;

sub new
{
    my $self  = {};
    bless $self;
    return $self;
}

sub printem
{
    print "Hello\n";
}
=====================================================================
package Class1;

$VERSION = 1.01;

sub new
{
    my $self  = {};
    bless $self;
    return $self;
}

return 1;
=====================================================================
use Class1;

$object1 = Class1->new;

print $object1->VERSION;
=====================================================================
package Class1;

sub new 
{
    my $data = {};

    $data->{NAME} = 'Christine';

    my $closure = sub {
        shift;

        if (@_) {
            $data->{NAME} = shift;
        }

        return  $data->{NAME};
    };

    bless $closure;

    return $closure;
}
=====================================================================
sub name
{
    &{$_[0]};
}

return 1;
=====================================================================
use Class1;

$object = Class1->new;

$object->name('Nancy');

print "The name is: ", $object->name;
=====================================================================
package Class1;

local $coderef;

sub new
{

    my $data = {};

    $data->{NAME} = Nancy;

    $coderef = sub {print "Hello!\n";};

    bless $data;
    return $data;
}
=====================================================================
sub printem
{
    &{$coderef};
}

return 1;
=====================================================================
use Class1;

$object = Class1->new;

$object->printem;
=====================================================================
sub new 
{
    my $coderef = sub {print "Hello!\n";};

    my $closure = sub {

         &{$coderef};
    };

    bless $closure;

    return $closure;
}
=====================================================================
sub printem
{
    &{$_[0]};
}

return 1;
=====================================================================
use Class1;

$object = Class1->new;

$object->printem;
=====================================================================
$object = Class1->new;

$object->printem;


package Class1;

use Alias;

sub new
{

    my $data = {
        NAME  => Nancy,
        CODEREF => sub {print "Hello!\n";},
    };

    bless $data;
    return $data;
}

sub printem
{
    $self = shift;
    &{$self->{CODEREF}};
}
=====================================================================
package Class1;

sub new
{
    my $data = {};

    bless $data;

    return $data;
}

sub printem

{
    shift;
    print shift;
}

return 1;
=====================================================================
use Class1;

$object = Class1->new;
=====================================================================
use Class1;

$object = Class1->new;

$coderef = sub
{
    $object->printem(@_);
};

$coderef->('Hello!');
=====================================================================
package Class1;

sub new
{

    my $data = {};

    $data->{NAME} = Nancy;

    bless $data;

    return $data;
}

return 1;
=====================================================================
use Class1;

$object = Class1->new;

print "Her name is ", $object->{NAME};
=====================================================================
use Class1;

use Alias;

$object = Class1->new;

attr $object;

print "Her name is ", $NAME;
=====================================================================
package Day;

sub new 
{
    my $type = shift;

    my $value = shift;

    my $self = {};

    $self->{DATE} = $value; 

    bless $self;

    return $self;
}
=====================================================================
package Calendar;

sub new 
{
    my $type = shift;

    my $self = [];

    for ($loop_index = 1; $loop_index <= 31; $loop_index++) {

        $self->[$loop_index] = Day->new($loop_index);

    }

    bless $self;

    return $self;
}

return 1;
=====================================================================
use Calendar;

$object = Calendar->new;

print "That date is the ", $object->[10]->{DATE}, "th.";
=====================================================================
package PersonalDBM_File;

use NDBM_File;

sub TIEHASH 
{
    print "Tying a hash to $_[1].pag...\n";

    shift;

    my $self = {};

    my $ref = NDBM_File->new(@_);

    $self->{NDBMref} = $ref;

    bless $self;

    return $self;
}
=====================================================================
sub FETCH
{
    my $self = shift;

    print "Now fetching @_\n";

    $self->{NDBMref}->FETCH(@_);
}
=====================================================================
sub DESTROY {}
=====================================================================
sub STORE
{
    my $self = shift;

    print "Now storing @_\n";

    $self->{NDBMref}->STORE(@_); 
}

return 1;
=====================================================================
use PersonalDBM_File;
use Fcntl; 

tie %hash, "PersonalDBM_File", "file", O_RDWR|O_CREAT, 0644;

$hash{'data'} = 5;

untie %hash;

tie %hash2, "PersonalDBM_File", "file", O_RDWR, 0644;

print "The data value is $hash2{'data'}\n";

untie %hash2;
=====================================================================
$object3 = $object1 + $object2;
=====================================================================
package Datum;

use overload
    "+" => \&add,
    "-" => \&subtract;
=====================================================================
sub new
{
    shift;

    my $self = {};

    $self->{DATA} = shift;

    bless $self;

    return $self;
}
=====================================================================
sub get_data
{
    $self = shift;

    return $self->{DATA};
}
=====================================================================
sub add
{
    my ($obj1, $obj2) = @_;

    $operand1 = ref $obj1 eq 'Datum' ? $obj1->{DATA} : $obj1;
    $operand2 = ref $obj2 eq 'Datum' ? $obj2->{DATA} : $obj2;

    $new_object = Datum->new($operand1 + $operand2);

    return $new_object;
}
=====================================================================
sub subtract
{
    my ($obj1, $obj2, $reversed) = @_;

    $operand1 = ref $obj1 eq 'Datum' ? $obj1->{DATA} : $obj1;
    $operand2 = ref $obj2 eq 'Datum' ? $obj2->{DATA} : $obj2;
    
    if($reversed){

        $new_object = Datum->new($operand2 - $operand1);

    } else {

        $new_object = Datum->new($operand1 - $operand2);

    }

    return $new_object;
}

return 1;
=====================================================================
use Datum;

$object1 = Datum->new(1);
print '$object1 = ', $object1->get_data, "\n";

$object2 = Datum->new(2);
print '$object2 = ', $object2->get_data, "\n";

$object3 = $object1 + $object2;
print '$object1 + $object2 = ', $object3->get_data, "\n";

$object4 = $object1 + 3;
print '$object1 + 3 = ', $object4->get_data, "\n";

$object5 = $object1 - $object2;
print '$object1 - $object2 = ', $object5->get_data, "\n";

$object6 = 7 - $object2;
print '7 - $object2 = ', $object6->get_data, "\n";
=====================================================================
sub new
{
    shift;

    my $self = {};

    $self->{DATA} = shift;

    bless $self;

    return $self;
}
=====================================================================
sub get_data
{
    $self = shift;

    return $self->{DATA};
}
=====================================================================
sub increment
{
    my $obj1 = $_[0];

    $operand1 = $obj1->{DATA};

    $new_object = Datum->new($operand1 + 1);

    $_[0] = $new_object;
}
=====================================================================
sub copy
{
    my $obj1 = $_[0];

    $operand1 = $obj1->{DATA};

    $new_object = Datum->new($operand1);

    return $new_object;
}

return 1;
=====================================================================
use Datum;

$object1 = Datum->new(1);
print '$object1 = ', $object1->get_data, "\n";

$object2 = Datum->new(2);
print '$object2 = ', $object2->get_data, "\n";

++$object1;
print '++$object1 = ', $object1->get_data, "\n";

$object2++;
print '$object2++ = ', $object2->get_data, "\n";
=====================================================================
!!!CODE20!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=================================================================
use Socket;

$site_name = 'www.cpan.org';

$address = inet_ntoa(inet_aton($site_name));

print "The DNS address of www.cpan.org is $address";
=================================================================
use Net::FTP;

$ftp = Net::FTP->new
(
    "ftp.cpan.org", 
    Timeout => 30
) or die "Could not connect.\n";

$username = "anonymous";
$password = "steve";

$ftp->login($username, $password)
        or die "Could not log in.\n";

$ftp->cwd('/pub/CPAN');

$remotefile = "CPAN.html";
$localfile = "file.txt";

$ftp->get($remotefile, $localfile)
        or die "Can not get file.\n";
=================================================================
use Net::FTP;

$ftp = Net::FTP->new("ftp.cpan.org", Timeout => 30)
        or die "Could not connect.\n";

$username = "anonymous";
$password = "steve";

$ftp->login($username, $password)
        or die "Could not log in.\n";

$ftp->cwd('/pub/CPAN');

$remotefile = "CPAN.html";
$localfile = "file.txt";

$ftp->get($remotefile, $localfile)
        or die "Can not get file.\n";
=================================================================
use LWP::Simple;

$content = get("http://www.cpan.org/doc/FAQs/index.html");

open FILEHANDLE, ">file.txt";

print FILEHANDLE $content;

close FILEHANDLE;
=================================================================
use LWP::UserAgent;

$user_agent = new LWP::UserAgent;

$request = new HTTP::Request('GET', 
    'http://www.cpan.org/doc/FAQs/index.html');

$response = $user_agent->request($request);

open FILEHANDLE, ">file.txt";

print FILEHANDLE $response->{_content};

close FILEHANDLE;
=================================================================
use Net::Ping;

$pingobject = Net::Ping->new(icmp);

if ($pingobject->ping('cpan.org')) {print "Could reach CPAN."};

$pingobject->close();
=================================================================
use News::NNTPClient;

$nntp = new News::NNTPClient('news.yourserver.com');

($first, $last) = $nntp->group("comp.lang.perl.moderated");

open FILEHANDLE, ">file.txt";

for ($loop_index = $first; $loop_index <= $last; $loop_index++) {

    print FILEHANDLE $nntp->article($loop_index);

}

close FILEHANDLE;
=================================================================
use Mail::POP3Client;

$mail = new Mail::POP3Client("username", "password", "pop3.yourserver.com");

if ($mail->Count) {

    print "You have ", $mail->Count, " new message(s).\n";

    print "Storing message(s) to disk.\n";

    open FILEHANDLE, ">file.txt";

    for($loop_index = 1; $loop_index <= $mail->Count; $loop_index++) {

        print FILEHANDLE $mail->HeadAndBody($loop_index);

    }

    close FILEHANDLE;
}
=================================================================
use Mail::POP3Client;

$mail = new Mail::POP3Client("username", "password", "pop3.yourserver.com");

if ($mail->Count) {

    print "You have ", $mail->Count, " new message(s).\n";

    print "Storing message(s) to disk.\n";

    open FILEHANDLE, ">file.txt";

    for($loop_index = 1; $loop_index <= $mail->Count; $loop_index++) {

        print FILEHANDLE $mail->HeadAndBody(1);

    }

    close FILEHANDLE;
}
=================================================================
open(MAIL, '| /usr/lib/sendmail -t -oi');

print MAIL <<EOF;
To: steve\@server.com
From: steve\@host.com
Subject: Greetings
Hi Steve!
EOF

close MAIL;
=================================================================
use Net::Telnet;

$telnet = Net::Telnet->new
( 
    Timeout => 90,
    Prompt  => '%', 
    Host => 'server.com' 
);

$telnet->login('username', 'password');

$telnet->cmd("cd code22");

@listing = $telnet->cmd("ls");

print "Here are the files:\n";
print "@listing";

$telnet->close;
=================================================================
use Socket;
use IO::Handle;

socketpair(CHILDHANDLE, PARENTHANDLE, AF_UNIX, SOCK_STREAM, PF_UNSPEC)
    or  die "Could not create socketpair.";

CHILDHANDLE->autoflush(1);
PARENTHANDLE->autoflush(1);

if ($pid = fork) {

    close PARENTHANDLE;

    print CHILDHANDLE "Hello from the parent!\n";

    $line = <CHILDHANDLE>;

    print "Parent read: $line";

    close CHILDHANDLE;

    waitpid($pid,0);

} else {

    close CHILDHANDLE;

    $line = <PARENTHANDLE>;

    print "Child read: $line";

    print PARENTHANDLE "Hello from the child!\n";

    close PARENTHANDLE;

    exit;
}
=================================================================
use Socket;
use IO::Handle;

socketpair(CHILDHANDLE, PARENTHANDLE, AF_UNIX, SOCK_STREAM, PF_UNSPEC)
    or  die "Could not create socketpair.";

CHILDHANDLE->autoflush(1);
PARENTHANDLE->autoflush(1);

if ($pid = fork) {

    close PARENTHANDLE;

    print CHILDHANDLE "Hello from the parent!\n";

    $line = <CHILDHANDLE>;

    print "Parent read: $line";

    close CHILDHANDLE;

    waitpid($pid,0);

} else {

    close CHILDHANDLE;

    $line = <PARENTHANDLE>;

    print "Child read: $line";

    print PARENTHANDLE "Hello from the child!\n";

    close PARENTHANDLE;

    exit;
}
=================================================================
use IO::Socket;

$socket = IO::Socket::INET->new
(
    PeerAddr => 'yourserver.com',
    PeerPort => 1116,
    Proto    => "tcp",
    Type     => SOCK_STREAM
) or die "Could not open port.\n";

print $socket "Hello from the client!\n";

close($socket);
=================================================================
use IO::Socket;

$socket = IO::Socket::INET->new
(
    PeerAddr => 'yourserver.com',
    PeerPort => 1116,
    Proto    => "tcp",
    Type     => SOCK_STREAM
) or die "Could not open port.\n";

$answer = <$socket>;

print $answer;

close($socket);
=================================================================
use IO::Socket;

$server = IO::Socket::INET->new
(
    LocalPort => 1116,
    Type      => SOCK_STREAM,
    Reuse     => 1,
    Listen    => 5 
) or die "Could not open port.\n";

while ($client = $server->accept()) {

    $line = <$client>;

    print $line;

}

close($server);
=================================================================
use IO::Socket;

$server = IO::Socket::INET->new
(
    LocalPort => 1116,
    Type      => SOCK_STREAM,
    Reuse     => 1,
    Listen    => 5 
) or die "Could not open port.\n";

while ($client = $server->accept()) {

    print $client "Hello from the server!\n";

}

close($server);
=================================================================
if ($child_pid) {

    while ($line = <>) {

        print $socket $line;

    }

} else {

    while($line = <$socket>) {

        print "Read this from server: $line";

    }
}
=================================================================
    if ($child_pid) {

        while ($line = <$client>) {

            print "Read this from client: $line";

        }

    } else {

        while ($line = <>) {

            print $client $line; 

        }
    }    
}
=================================================================
use IO::Socket;

$socket = IO::Socket::INET->new
(
    PeerAddr => 'server.com',
    PeerPort => 1247,
    Proto    => "tcp",
    Type     => SOCK_STREAM
) or die "Could not create client.\n";

unless (defined($child_pid = fork())) {die "Can not fork.\n"};

if ($child_pid) {

    while ($line = <>) {

        print $socket $line;

    }

} else {

    while($line = <$socket>) {

        print "Read this from server: $line";

    }
}
=================================================================
use IO::Socket;

$server = IO::Socket::INET->new
(
    LocalPort => 1247,
    Type      => SOCK_STREAM,
    Reuse     => 1,
    Listen    => 5 
) or die "Could not create server.\n";

while ($client = $server->accept()) {

    unless (defined($child_pid = fork())) {die "Can not fork.\n"};

    if ($child_pid) {

        while ($line = <$client>) {

            print "Read this from client: $line";

        }

    } else {

        while ($line = <>) {

            print $client $line; 

        }
    }    
}
=================================================================
use Socket;

socket(SERVER, PF_INET, SOCK_STREAM, getprotobyname('tcp'));

$addr = sockaddr_in(2336, inet_aton('server.com'));

connect(SERVER, $addr)
    or die "Could not connect.\n";

print SERVER "Hello from the client!\n";

close(SERVER);
=================================================================
use Socket;

socket(SERVER, PF_INET, SOCK_STREAM, getprotobyname('tcp'));

$addr = sockaddr_in(2336, inet_aton('server.com'));

connect(SERVER, $addr)
    or die "Could not connect.\n";

$line = <SERVER>;

print $line;

close(SERVER);
=================================================================
use Socket;

socket(SERVER, PF_INET, SOCK_STREAM, getprotobyname('tcp'));

setsockopt(SERVER, SOL_SOCKET, SO_REUSEADDR, 1);

$addr = sockaddr_in(2336, inet_aton('server.com'));

bind(SERVER, $addr)
    or die "Could not bind to port.\n";

listen(SERVER, SOMAXCONN)
    or die "Could not listen to port.\n";

while (accept(CLIENT, SERVER)) {

    $line = <CLIENT>;

    print $line;

}

close(SERVER);
=================================================================
use Socket;

socket(SERVER, PF_INET, SOCK_STREAM, getprotobyname('tcp'));

setsockopt(SERVER, SOL_SOCKET, SO_REUSEADDR, 1);

$addr = sockaddr_in(2336, inet_aton('server.com'));

bind(SERVER, $addr)
    or die "Could not bind to port.\n";

listen(SERVER, SOMAXCONN)
    or die "Could not listen to port.\n";

while (accept(CLIENT, SERVER)) {

    print CLIENT "Hello from the server!\n";

}

close(SERVER);
=================================================================
use Socket;

$file = 'transfer';

socket(SOCKET, PF_UNIX, SOCK_STREAM, 0)       
    or die "Could not create socket.\n";

connect(SOCKET, sockaddr_un($file)) 
    or die "Could not connect.\n";
    
print SOCKET "Hello from the client!\n";

close SOCKET;

exit;
=================================================================
use Socket;

$file = 'transfer';

$addr = sockaddr_un($file);

socket(SERVER, PF_UNIX, SOCK_STREAM, 0)
    or die "Could not create socket.\n";

unlink($file);

bind (SERVER, $addr) 
    or die "Could not bind.\n";

listen(SERVER, SOMAXCONN)
    or die "Could not listen.\n";

while (accept(CLIENT,SERVER)) { 

    $line = <CLIENT>;

    print $line;

}
=================================================================
use IO::Select;

$select = IO::Select->new();

$select->add($socket1);
$select->add($socket2);
$select->add($socket3);
$select->add($socket4);

@ok_to_read = $select->can_read($timeout);

foreach $socket (@ok_to_read) {

    $socket->recv($data_buffer, $flags)

    print $data_buffer;

}
=================================================================
use IO::Socket;

$socket = IO::Socket::INET->new
(
    Proto => 'udp',
    PeerPort  => 4321,
    PeerAddr  => 'servername.com'
);

$socket->send('Hello from the client!');
=================================================================
use IO::Socket;

$socket = IO::Socket::INET->new
(
    LocalPort => 4321,
    Proto => 'udp'
);

$socket->recv($text, 128);
=================================================================
!!!CODE21!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=================================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header,                    

$co->start_html(-title=>'CGI Example'),

$co->center($co->h1('Welcome to CGI!')),

$co->start_form(),

$co->textarea
(
    -name=>'textarea', 
    -rows=>10, 
    -columns=>60
), 

$co->end_form(),

$co->end_html;                  
=================================================================
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<HTML>
<HEAD>
<TITLE>CGI Example</TITLE>
</HEAD>

<BODY>
<CENTER>
<H1>Welcome to CGI!</H1>
</CENTER>
<FORM METHOD="POST"  ENCTYPE="application/x-www-form-urlencoded">

<TEXTAREA NAME="textarea" ROWS=10 COLS=60>
</TEXTAREA>

</FORM>
</BODY>
</HTML>
=================================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header,                    

$co->start_html(-title=>'CGI Example'),

$co->center($co->h1('Welcome to CGI!')),

$co->start_form(),

$co->textarea
(
    -name=>'textarea', 
    -rows=>10, 
    -columns=>60
), 

$co->end_form(),

$co->p({-align=>center}, 'Welcome to CGI!'),

$co->end_html; 
=================================================================
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<HTML>
<HEAD>
<TITLE>CGI Example</TITLE>
</HEAD>

<BODY>
<CENTER>
<H1>Welcome to CGI!</H1>
</CENTER>

<FORM METHOD="POST"  ENCTYPE="application/x-www-form-urlencoded">

<TEXTAREA NAME="textarea" ROWS=10 COLS=60>
</TEXTAREA>

</FORM>

<P ALIGN="center">
Welcome to CGI!
</P>
</BODY>
</HTML>
=================================================================
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<HTML>
<HEAD>
<TITLE>CGI Example</TITLE>
</HEAD>

<BODY>
<CENTER>
<H1>Welcome to CGI!</H1>
</CENTER>

<FORM METHOD="POST"  ENCTYPE="application/x-www-form-urlencoded">

<TEXTAREA NAME="textarea" ROWS=10 COLS=60>
Hello!
</TEXTAREA>

</FORM>
<P ALIGN="center">
Welcome to CGI!
</P>
</BODY>
</HTML>
=================================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header,                    

$co->start_html(-title=>'CGI Example'),

$co->center($co->h1('Welcome to CGI!')),

$co->start_form(),

$co->textarea
(
    -name=>'textarea', 
    -value=>'Hello!', 
    -rows=>10, 
    -columns=>60
), 

$co->end_form(),

$co->p({-align=>center}, 'Welcome to CGI!'),

$co->end_html;    
=================================================================
<FORM METHOD="POST" ACTION="http://www.server.com/username/cgi/cgi2.cgi" 
ENCTYPE="application/x-www-form-urlencoded">
<INPUT TYPE="text" NAME="text" VALUE="">
<INPUT TYPE="submit" NAME="Submit" VALUE="Submit"> 
<INPUT TYPE="reset">
</FORM>
=================================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->start_form
(
    -method=>'POST', 
    -action=>"http://www.yourserver.com/user/cgi/cgi2.cgi"
);
=================================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->start_form
(
    -method=>'POST', 
    -action=>"http://www.yourserver.com/user/cgi/cgi2.cgi"
),

$co->textarea
(
    -name=>'textarea', 
    -value=>'Hello!', 
    -rows=>10, 
    -columns=>60
); 
=================================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->start_form
(
    -method=>'POST', 
    -action=>"http://www.yourserver.com/user/cgi/cgi2.cgi"
),

$co->textarea
(
    -name=>'textarea', 
    -value=>'Hello!', 
    -rows=>10, 
    -columns=>60
), 

$co->submit('Submit'),  

$co->reset,

$co->end_form;
=================================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

$labels{'1'} = 'Sunday';
$labels{'2'} = 'Monday';
$labels{'3'} = 'Tuesday';
$labels{'4'} = 'Wednesday';
$labels{'5'} = 'Thursday';
$labels{'6'} = 'Friday';
$labels{'7'} = 'Saturday';

print $co->header,                    

$co->start_html
(
    -title=>'CGI Example', 
    -author=>'Steve', 
    -meta=>{'keywords'=>'CGI Perl'}, 
    -BGCOLOR=>'white', 
    -LINK=>'red'
),

$co->center($co->img({-src=>'welcome.gif'})),

$co->center($co->h1('Here is the Survey!')),

$co->h2('Please fill out our survey...'),         

"Reasons for filling out our survey:", 
$co->p,

$co->ul
( 
    $co->li('Fame'),
    $co->li('Fortune'),
    $co->li('Fun'),
), 

"If you would rather not fill out our survey, ", 

"you might be interested in ", 

$co->a({href=>"http://www.cpan.org/"},"CPAN"), ".",

$co->hr,

$co->start_form
(
    -method=>'POST', 
    -action=>"http://www.servername/username/cgi2.cgi"
),

"Please enter your name: ",

$co->textfield('text'), $co->p,

"Please enter your opinion: ", 

$co->p,

$co->textarea
(
    -name=>'textarea', 
    -default=>'No opinion', 
    -rows=>10, 
    -columns=>60
), 

$co->p,

"Please indicate what products you use: ", $co->p,

$co->checkbox_group
(
    -name=>'checkboxes',
    -values=>['Shampoo','Toothpaste','Bread','Cruise missles'],
    -defaults=>['Bread','Cruise missles']
), 

$co->p,

"Please indicate your income level: ",

$co->p,

$co->scrolling_list
(
    'list', 
    ['Highest','High','Medium','Low'], 
    'High',
),

$co->p,

"Please indicate the day of the week: ",

$co->p,

$co->radio_group
(
    -name=>'radios', 
    -values=>['1','2','3', '4', '5', '6', '7'], 
    -default=>'1',  
    -labels=>\%labels
), 

$co->p,

"Please enter your password: ", $co->p,

$co->password_field
(
    -name=>'password', 
    -default=>'open sesame', 
    -size=>30, 
), 

$co->p,

"Thank you for filling out our Survey. Please indicate how  
much unsolicited mail you like to get: ",

$co->popup_menu
(
    -name=>'popupmenu',
    -values=>['Very much','A lot','Not so much','None']
), 

$co->p,

$co->hidden
(
    -name=>'hiddendata', 
    -default=>'Rosebud'
),

$co->center
(
    $co->submit('Submit'),  
    $co->reset,
),

$co->hr,

$co->end_form,

$co->end_html;                  
=================================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header,                    

$co->start_html
(
    -title=>'CGI Example', 
    -author=>'Steve', 
    -meta=>{'keywords'=>'CGI Perl'}, 
    -BGCOLOR=>'white', 
    -LINK=>'red'
),

$co->center
(
    $co->h1('Thanks for filling out our survey.')
),

$co->h3
(
    'Here are your responses...'
),

$co->hr;

if ($co->param()) {
    print 
        "Your name is: ",$co->em($co->param('text')), 
        ".", 
        $co->p,

        "Your opinions are: ",$co->em($co->param('textarea')), 
        ".", 
        $co->p,

        "You use these products: ",$co->em(join(", ",
        $co->param('checkboxes'))), ".",
        $co->p,

        "Your income level is: ",$co->em($co->param('list')), 
        ".", 
        $co->p,

        "Today is day ", $co->em($co->param('radios')), 
        " of the week.",
        $co->p, 

        "Your password is: ",$co->em($co->param('password')), 
        ".", 
        $co->p,

        "How much unsolicited mail you like: ", 
        $co->em($co->param('popupmenu')), 
        ".", 
        $co->p,

        "The hidden data is ",$co->em(join(", ", 
        $co->param('hiddendata'))), 
        ".";
}

print $co->hr;

print $co->end_html;                      
=================================================================
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<HTML>
<HEAD>
<TITLE>CGI Example</TITLE>
<LINK REV=MADE HREF="mailto:Steve">
<META NAME="keywords" CONTENT="CGI Perl">
</HEAD>

<BODY BGCOLOR="white" LINK="red">
<CENTER>
<IMG SRC="welcome.gif">
</CENTER>
<CENTER>
<H1>Here is the Survey!</H1>
</CENTER>
<H2>Please fill out our survey...</H2>
Reasons for filling out our survey:
<P>
<UL>
<LI>Fame</LI> 
<LI>Fortune</LI> 
<LI>Fun</LI>
</UL>
If you would rather not fill out our survey, you might be interested in 
<A HREF="http://www.cpan.org/">CPAN</A>.
<HR>
<FORM METHOD="POST" ACTION="http://www.server.com/username/cgi/cgi2.cgi" 
ENCTYPE="application/x-www-form-urlencoded">
Please enter your name: 
<INPUT TYPE="text" NAME="text" VALUE="">
<P>
Please enter your opinion: 
<P>
<TEXTAREA NAME="textarea" ROWS=10 COLS=60>
No opinion
</TEXTAREA>
<P>
Please indicate what products you use: 
<P>
<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Shampoo">Shampoo 
<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Toothpaste">Toothpaste 
<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Bread" CHECKED>Bread 
<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Cruise missles" CHECKED>
Cruise missles 
<P>
Please indicate your income level: 
<P>
<SELECT NAME="list" SIZE=4>
<OPTION  VALUE="Highest">
Highest
<OPTION SELECTED VALUE="High">
High
<OPTION  VALUE="Medium">
Medium
<OPTION  VALUE="Low">
Low
</SELECT>
<P>Please indicate the day of the week: 
<P>
<INPUT TYPE="radio" NAME="radios" VALUE="1" CHECKED>Sunday 
<INPUT TYPE="radio" NAME="radios" VALUE="2">Monday 
<INPUT TYPE="radio" NAME="radios" VALUE="3">Tuesday 
<INPUT TYPE="radio" NAME="radios" VALUE="4">Wednesday 
<INPUT TYPE="radio" NAME="radios" VALUE="5">Thursday 
<INPUT TYPE="radio" NAME="radios" VALUE="6">Friday 
<INPUT TYPE="radio" NAME="radios" VALUE="7">Saturday 
<P>
Please enter your password: 
<P>
<INPUT TYPE="password" NAME="password" VALUE="open sesame" SIZE=30>
<P>
Thank you for filling out our Survey. Please indicate how  
much unsolicited mail you like to get: 
<SELECT NAME="popupmenu">
<OPTION  VALUE="Very much">Very much
<OPTION  VALUE="A lot">A lot
<OPTION  VALUE="Not so much">Not so much
<OPTION  VALUE="None">None
</SELECT>
<P>
<INPUT TYPE="hidden" NAME="hiddendata" VALUE="Rosebud">
<CENTER>
<INPUT TYPE="submit" NAME="Submit" VALUE="Submit"> 
<INPUT TYPE="reset">
</CENTER>
<HR>
<INPUT TYPE="hidden" NAME=".cgifields" VALUE="radios">
<INPUT TYPE="hidden" NAME=".cgifields" VALUE="list">
<INPUT TYPE="hidden" NAME=".cgifields" VALUE="checkboxes">
</FORM>
</BODY>
</HTML>
=================================================================
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<HTML>
<HEAD>
<TITLE>CGI Example</TITLE>
<LINK REV=MADE HREF="mailto:Steve">
<META NAME="keywords" CONTENT="CGI Perl">
</HEAD>
<BODY BGCOLOR="white" LINK="red">
<CENTER>
<H1>Thanks for filling out our survey.</H1>
</CENTER>
<H3>Here are your responses...</H3>
<HR>
Your name is: <EM>Edward</EM>.
<P>
Your opinions are: <EM>No opinion</EM>.
<P>
You use these products: <EM>Bread, Cruise missles</EM>.
<P>
Your income level is: <EM>High</EM>.
<P>
Today is day <EM>1</EM> of the week.
<P>
Your password is: <EM>open sesame</EM>.
<P>
How much unsolicited mail you like: <EM>Very much</EM>.
<P>
The hidden data is <EM>Rosebud</EM>.
<HR>
</BODY>
</HTML>
=================================================================
<HTML>
<HEAD>
<TITLE>PerlScript Example</TITLE>
</HEAD>

<BODY>
<H1>PerlScript Example</H1>

<SCRIPT LANGUAGE="PerlScript">
$window->document->write("Hello!");
</SCRIPT>

</BODY>
</HTML>
=================================================================
#!/usr/local/bin/perl

$co = new CGI;        
                
print $co->header,  
                  
$co->start_html
(
    -title=>'CGI Example', 
    -author=>'Steve', 
    -meta=>{'keywords'=>'CGI Perl'}, 
    -BGCOLOR=>'white', 
    -LINK=>'red'
)
=================================================================
<FORM METHOD="POST" ACTION="http://www.server.com/username/cgi/cgi2.cgi" 
ENCTYPE="application/x-www-form-urlencoded">
Please enter your name: 
    <INPUT TYPE="text" NAME="text" VALUE="">
    <INPUT TYPE="submit" NAME="Submit" VALUE="Submit"> 
    <INPUT TYPE="reset">
</FORM>
=================================================================
<HTML>

<HEAD>

<TITLE>CGI Example</TITLE>
</HEAD>

<BODY BGCOLOR="white" LINK="red">

<CENTER>
<IMG SRC="http://www.server.com/username/cgi/welcome.gif">
</CENTER>
<CENTER>
<H1>Here is the Survey!</H1>
</CENTER>

<HR>

<FORM METHOD="POST" ACTION="http://www.server.com/username/cgi/cgi2.cgi" 
ENCTYPE="application/x-www-form-urlencoded">

Please enter your name: 
<INPUT TYPE="text" NAME="text" VALUE="">
<P>
Please enter your opinion: 
<P>
<TEXTAREA NAME="textarea" ROWS=10 COLS=60>
No opinion
</TEXTAREA>
<P>
Please indicate what products you use: 
<P>
<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Shampoo">Shampoo 
<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Toothpaste">Toothpaste 
<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Bread" CHECKED>Bread 
<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Cruise missles" CHECKED>
Cruise missles 
<P>
Please indicate your income level: 
<P>
<SELECT NAME="list" SIZE=4>
<OPTION  VALUE="Highest">
Highest
<OPTION SELECTED VALUE="High">
High
<OPTION  VALUE="Medium">
Medium
<OPTION  VALUE="Low">
Low
</SELECT>
<P>Please indicate the day of the week: 
<P>
<INPUT TYPE="radio" NAME="radios" VALUE="1" CHECKED>Sunday 
<INPUT TYPE="radio" NAME="radios" VALUE="2">Monday 
<INPUT TYPE="radio" NAME="radios" VALUE="3">Tuesday 
<INPUT TYPE="radio" NAME="radios" VALUE="4">Wednesday 
<INPUT TYPE="radio" NAME="radios" VALUE="5">Thursday 
<INPUT TYPE="radio" NAME="radios" VALUE="6">Friday 
<INPUT TYPE="radio" NAME="radios" VALUE="7">Saturday 
<P>
Please enter your password: 
<P>
<INPUT TYPE="password" NAME="password" VALUE="open sesame" SIZE=30>
<P>
Thank you for filling out our Survey. Please indicate how  
much unsolicited mail you like to get: 
<SELECT NAME="popupmenu">
<OPTION  VALUE="Very much">Very much
<OPTION  VALUE="A lot">A lot
<OPTION  VALUE="Not so much">Not so much
<OPTION  VALUE="None">None
</SELECT>
<P>
<INPUT TYPE="hidden" NAME="hiddendata" VALUE="Rosebud">
<CENTER>
<INPUT TYPE="submit" NAME="Submit" VALUE="Submit"> 
<INPUT TYPE="reset">
</CENTER>
<HR>
<INPUT TYPE="hidden" NAME=".cgifields" VALUE="radios">
<INPUT TYPE="hidden" NAME=".cgifields" VALUE="list">
<INPUT TYPE="hidden" NAME=".cgifields" VALUE="checkboxes">

</FORM>

</BODY>

</HTML>
=================================================================
#!/usr/local/bin/perl

use CGI;

$co = new CGI;    

print $co->header,

$co->start_html('Image Map Example'),

$co->h1('Image Map Example'),

$co->start_form,

$co->image_button
(
    -name => 'map',
    -src=>'map.gif'
),

$co->p,

$co->end_form,

$co->hr;

if ($co->param())
{
    $x = $co->param('map.x');
    $y = $co->param('map.y');
    print "You clicked the map at ($x, $y)";
}

print $co->end_html;
=================================================================
#!/usr/local/bin/perl

use CGI;
$co = new CGI;    

print $co->header,

$co->frameset(
    {-rows=>'40%,60%'},

    $co->frame
    ({
        -name=>'top',
        -src=>'http://www.yourserver.com/username/cgi/a.htm'
    }),

    $co->frame
    ({
        -name=>'bottom',
        -src=>'http://www.yourserver.com/username/cgi/b.htm'
    })
);
=================================================================
#!/usr/local/bin/perl

use CGI qw/:standard/;

print header,

    start_html('CGI Functions Example'),

    h1('CGI Functions Example'),

    start_form,

    "Please enter your name: ",

    textfield('text'),

    p,

    submit, reset,

    end_form,

    hr;

if (param()) {

   print "Your name is: ", em(param('text')), hr;

}

print end_html;
=================================================================
!!!CODE22!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
================================================================================
#!/usr/local/bin/perl -T

$ENV{'PATH'} = '/bin:/usr/bin:/usr/local/bin';

while (<>) {

   $command = $_;

   system($command);    

}
================================================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        


print $co->header,                    

$co->start_html,

"Your browser accepts: ", 

$ENV{HTTP_ACCEPT},

$co->end_form,

$co->end_html;
================================================================================
#!/usr/local/bin/perl

use CGI;

$co = new CGI;

open (IMAGE, "<image.gif");

$size = -s "image.gif";

read IMAGE, $data, $size;

close IMAGE;

print 

$co->header(-type=>'image/gif'),

$data;
================================================================================
<HTML>

<HEAD>
<TITLE>Images From CGI Scripts</TITLE>
</HEAD>

<BODY>

<CENTER>

<H1>Images From CGI Scripts</H1>

<IMG SRC = 'image.cgi'>

</CENTER>

</BODY>

</HTML>
================================================================================
#!/usr/bin/perl

use CGI;

$co = new CGI;

open (COUNT, "<count.dat") 
    or die "Could not open counter data file.";

$count = <COUNT>;

close COUNT;

$count++;

open (COUNT, ">count.dat");

print COUNT $count;

close COUNT;

print 
$co->header,
$co->start_html(
    -title=>'Counter Example', 
    -author=>'Steve', 
    -BGCOLOR=>'white', 
),

$co->center($co->h1('Counter Example')),

$co->p,
$co->center($co->h3("Current count: ", $count)),

$co->p,
$co->center($co->h3("Reload the page to update the count")),

$co->end_html;
================================================================================
<HTML>

<HEAD>
<TITLE>Image Counter Example</TITLE>
</HEAD>

<BODY>

<CENTER>
<H1>You are visitor number</H1> 
<IMG SRC = 'imagecounter1.cgi'>
<IMG SRC = 'imagecounter2.cgi'>
<IMG SRC = 'imagecounter3.cgi'>
</CENTER>

</BODY>
</HTML>
================================================================================
#!/usr/local/bin/perl

use CGI;

$co = new CGI;

open (COUNT, "<count.dat") 
    or die "Could not open counter data file.";

$count = <COUNT>;

close COUNT;

$count++;

open (COUNT, ">count.dat");

print COUNT $count;

close COUNT;

$image = int($count / 100) % 10;

open (IMAGE, "<$image.gif");

$size = -s "$image.gif";

read IMAGE, $data, $size;

close IMAGE;

print 

$co->header(-type=>'image/gif'),

$data;
================================================================================
#!/usr/local/bin/perl

use CGI;

$co = new CGI;

open (COUNT, "<count.dat") 
    or die "Could not open counter data file.";

$count = <COUNT>;

close COUNT;

$image = int($count / 10) % 10;

open (IMAGE, "<$image.gif");

$size = -s "$image.gif";

read IMAGE, $data, $size;

close IMAGE;

print 

$co->header(-type=>'image/gif'),

$data;
================================================================================
#!/usr/local/bin/perl

use CGI;

$co = new CGI;

open (COUNT, "<count.dat") 
    or die "Could not open counter data file.";

$count = <COUNT>;

close COUNT;

$image = $count % 10;

open (IMAGE, "<$image.gif");

$size = -s "$image.gif";

read IMAGE, $data, $size;

close IMAGE;

print 

$co->header(-type=>'image/gif'),

$data;
================================================================================
<HTML>

<HEAD>
<TITLE>Add to the guest book</TITLE>
</HEAD>

<BODY>

<H1>Please add to my guest book...</H1>

<FORM METHOD = POST ACTION =
"http://www.yourserver.com/user/cgi/guestbook.cgi">

<BR>

<CENTER>

Please enter your name: 

<P>
<INPUT TYPE = "TEXT" NAME = "username">
</INPUT>

<BR>
Please enter your comments: 

<P>
<TEXTAREA ROWS = 8 COLS = 40 NAME = "comments">
</TEXTAREA>

<BR>
<BR>

<INPUT TYPE = SUBMIT VALUE = "Send">
<INPUT TYPE = RESET VALUE = "Reset">

</CENTER>

</FORM>

</BODY>

</HTML>
================================================================================
#!/usr/bin/perl

use CGI;                             

$co = new CGI;                        

open (BOOK, "+<book.htm") 
    or die "Could not open guest book.";

seek (BOOK, -length($co->end_html), 2);

$date = `date`;

chop($date); 

$username = $co->param('username');

$username =~ s/</&lt;/g;

$text = $co->param('comments');

$text =~ s/</&lt;/g;

print BOOK 

$co->h3
(
    "New comments by ", $username, " on ", $date,
    $co->p,
    $text,
),

$co->hr,

$co->end_html;

close BOOK;

print $co->header,                    

$co->start_html
(
    -title=>'Guest Book Example', 
    -author=>'Steve', 
    -BGCOLOR=>'white', 
    -LINK=>'red'
);

print

$co->center
(
    $co->h1('Thanks for adding to the guest book!')
),

"If you want to take a look at the guest book, ", 

$co->a
(
    {href=>"http://www.yourserver.com/user/cgi/book.htm"},
    "click here"
), 

".",

$co->hr,

$co->end_html;  
================================================================================
<HTML>

<HEAD>

<TITLE>
The Guest Book
</TITLE>

</HEAD>

<BODY>

<CENTER>

<H1>Here is the guest book...</H1>

<HR>

</BODY></HTML>
================================================================================
<HTML>

<HEAD>

<TITLE>Send me some email</TITLE>

</HEAD>

<BODY BGCOLOR="white" LINK="red">

<CENTER>
<H1>Send me some email!</H1>
</CENTER>

<HR>

<FORM METHOD="POST" 
ACTION="http://www.yourserver.com/username/cgi/email.cgi" 
ENCTYPE="application/x-www-form-urlencoded">

Please enter your email address: 
<INPUT TYPE="text" NAME="name" VALUE="">

<P>
Please enter the email's subject: 
<INPUT TYPE="text" NAME="subject" VALUE="">

<P>
Please enter the email you want to send: 

<P>
<TEXTAREA NAME="text" ROWS=10 COLS=60>
Dear you:
</TEXTAREA>

<P>
<CENTER>
<INPUT TYPE="submit" NAME="submit" VALUE="Send email"> 
<INPUT TYPE="reset">
</CENTER>

<HR>

</FORM>

</BODY>

</HTML>
================================================================================
#!/usr/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header,                    

$co->start_html
(
    -title=>'Email Example', 
    -author=>'Steve', 
    -BGCOLOR=>'white', 
    -LINK=>'red'
);

if ($co->param()) {

    $from = $co->param('name');

    $from =~ s/@/\@/; 

    $subject = $co->param('subject');

    $text = $co->param('text');

    $text =~ s/</&lt;/g;

    open(MAIL, '| /usr/lib/sendmail -t -oi');

    print MAIL <<EOF;
To: steve\@yourserver.com
From: $from
Subject: $subject
$text
EOF

    close MAIL;
}

print

$co->center($co->h1('Thanks for sending me email!')),

$co->hr,

$co->end_html;     
================================================================================
!!!CODE23!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
================================================================================
$co->textarea
(
    -name=>'textarea', 
    -default=>'',
    -override=>1,
    -rows=>4, 
    -columns=>40
)
================================================================================
<HTML>

<HEAD>

<TITLE>Chat</TITLE>

<FRAMESET ROWS="150,*">

    <NOFRAMES>Sorry, you need frames to use chat.</NOFRAMES>

    <FRAME NAME="_display" SRC="chat1.cgi">
    <FRAME NAME="_data" SRC="chat2.cgi">

</FRAMESET>

</HTML>
================================================================================
#!/usr/bin/perl

use CGI;     
                        
use Fcntl;

$co = new CGI; 
                       
open (DATA1, "<chat1.dat") 
    or die "Could not open data file.";

lockfile(DATA1);

$text1 = <DATA1>;

unlockfile(DATA1);

close DATA1;

open (DATA2, "<chat2.dat") 
    or die "Could not open data file.";

lockfile(DATA2);

$text2 = <DATA2>;

unlockfile(DATA2);

close DATA2;

print

$co->header,

"<meta HTTP-EQUIV=\"Refresh\" CONTENT=\"5\">",

$co->start_html
(
    -title=>'Chat Example', 
    -author=>'Steve', 
    -target=>'_display',
    -BGCOLOR=>'white', 
    -LINK=>'red'
),

$co->center
(
    $co->h1('Multi-User Chat')
),

$co->p,
$co->p,

$co->center
(
    $text1
),

$co->p,

$co->center($text2),

$co->end_html;

exit;

sub lockfile
{
    my $count = 0;
    my $handle = shift;

    until (flock($handle, 2)) {

        sleep .10;

        if(++$count > 50) {

            print
               $co->header,

               "<meta HTTP-EQUIV=\"Refresh\" CONTENT=\"5\">",

               $co->start_html
               (
                   -title=>'Chat Example', 
                   -author=>'Steve', 
                   -target=>'_display',
                   -BGCOLOR=>'white', 
               ),

               $co->center($co->h1('Server too busy')),

               $co->end_html;

            exit;
        }
    }
}

sub unlockfile
{

    my $handle = shift;

    flock($handle, 8);

}
================================================================================
#!/usr/bin/perl

use CGI;                             

use Fcntl;

$co = new CGI;    

if ($co->param()) {

    $name = $co->param('username');

    $name =~ s/</&lt;/g;

    $text = $co->param('textarea');
    $text =~ s/</&lt;/g;

    if ($text) {

        my $oldtext;

        open (OLDDATA, "<chat2.dat") 
            or die "Could not open data file.";

        lockfile(OLDDATA);

        $oldtext = <OLDDATA>; 

        unlockfile(OLDDATA);

        close OLDDATA;

        open (DATA, ">chat1.dat") 
            or die "Could not open data file.";

        lockfile(DATA);

        print DATA $oldtext; 

        unlockfile(DATA);

        close DATA;

        open (NEWDATA, ">chat2.dat") 
            or die "Could not open data file.";

        lockfile(NEWDATA);

        print NEWDATA "<B>", $name, ": ", "</B>", $text; 

        unlockfile(NEWDATA);

        close NEWDATA;
    }
}

&printpage;

sub printpage 
{
    print
    $co->header,

    $co->start_html
    (
        -title=>'Chat Example', 
        -author=>'Steve', 
        -BGCOLOR=>'white', 
        -LINK=>'red'
    ),

    $co->startform,

    $co->center("Please enter your name: ",

    $co->textfield(-name=>'username'), 

    "and type your comments below."),

    $co->p,

    $co->center
    (
        $co->textarea
        (
            -name=>'textarea', 
            -default=>'',
            -override=>1,
            -rows=>4, 
            -columns=>40
        )
    ),

    $co->center
    (
        $co->submit(-value=>'Send text'),  
        $co->reset,
    ),

    $co->hidden(-name=>'hiddendata'),

    $co->endform,

    $co->end_html;
}

sub lockfile
{
    my $count = 0;

    my $handle = shift;

    until (flock($handle, 2)) {

       sleep .10;

       if(++$count > 50) {
            &printpage;
            exit;
        }
    }
}

sub unlockfile
{
    my $handle = shift;

    flock($handle, 8);
}
================================================================================
#!/usr/bin/perl

use CGI::Push;

$co = new CGI::Push;

$co->do_push(-next_page=>\&page);

sub page
{
    my($obj, $counter) = @_;
    return undef if $counter > 50;
    return
        $co->start_html,
        $co->br,
        $co->center($co->h1('Server Push Example')),
        $co->br,
        $co->center($co->h1('Counter: ', $counter)),
        $co->end_html;
}
================================================================================
#!/usr/bin/perl

use CGI::Push;

$co = new CGI::Push;

$co->do_push(-next_page=>\&page);

sub page
{
    my($obj, $counter) = @_;
    return undef if $counter > 50;
    return
        $co->start_html,
        $co->br,
        $co->center($co->h1('Server Push Example')),
        $co->br,
        $co->center($co->h1('Counter: ', $counter)),
        $co->end_html;
}
================================================================================
<HTML>

<HEAD>

<TITLE>Server Side Includes</TITLE>

</HEAD>

<BODY>

<CENTER>

<H1>Server Side Includes</H1>

</CENTER>

<H3>

<P>
Document name: <!--#echo var="DOCUMENT_NAME" -->

<P>
Document path: <!--#echo var="DOCUMENT_URI" -->

<P>
Server name: <!--#echo var="SERVER_NAME" -->

<P>
Local date: <!--#echo var="DATE_LOCAL" -->

<P>
Up time: <!--#exec cmd="uptime" -->

</H3>

</BODY>

</HTML>
================================================================================
#!/usr/bin/perl

use CGI;

$co = new CGI;

%greetings = $co->cookie('greetings');

if ($co->param('name')) {
    $greetings{'name'} = $co->param('name')
}

if ($co->param('birthday')) {
    $greetings{'birthday'} = $co->param('birthday')
}

($day, $month, $year) = (localtime)[3, 4, 5];

$date = join ("/", $month + 1, $day);

if(exists($greetings{'name'})) {
    $greetingstring = "Hello " . $greetings{'name'}; 

    $greetingstring .= ", happy birthday!" if ($date eq 
        $greetings{'birthday'});

    $greetingstring  =~ s/</&lt;/g;

    $prompt = "If you want to change this page's settings, just enter 
        new data below.";

} else {

    $prompt = "To have this page greet you next time, enter your data below.";

}

$greetingcookie = $co->cookie
(
    -name=>'greetings',
    -value=>\%greetings,
    -expires=>'+365d'
);

if($co->param('name') || $co->param('birthday')) {

    print $co->header(-cookie=>$greetingcookie);

} else {

    print $co->header;

}

print

$co->start_html
(
    -title=>"Cookie Example",
),

$co->center
(
    $co->h1("Cookie Example"),

    $co->p,
    $co->h1($greetingstring),

    $prompt,

    $co->startform,
    "Your name: ",

    $co->textfield
    (
        -name=>'name',
        -default=>'',
        -override=>1
    ),

    $co->p,
    "Your birthday (month/day): ",

    $co->textfield
    (
        -name=>'birthday',
        -default=>'',
        -override=>1
    ),

    $co->p, 
    $co->submit (-value=>'Submit'),
    $co->reset,

    $co->endform,
),

$co->end_html;
================================================================================
$text = "hello there!";

print "$text\n";

$text =~ tr/a-z/d-za-c/;

print "$text\n";

$text =~ tr/d-za-c/a-z/;

print "$text\n";
================================================================================
#!/usr/bin/perl

use CGI;

$co = new CGI;

if ($co->param('newgame') eq "yes" || !$co->param('newgame')){

    newgame();

} else {

    if($co->param('newgameyesno') eq "yes"){   

         newgame();

    } else {

        $theanswer = $co->param('answer');
        $theguess = getguess();

        if($theguess eq "-"){                  

            $thehits = $co->param('hits');
            $themisses = $co->param('misses');
            displayresult();

        } else {

            $thehits = gethits();
            if (index($thehits, "-") eq -1){   

                youwin();

            } else {

                $themisses = getmisses();
                if(length($themisses) >= 9){   
                    youlose();

                } else {

                    displayresult();   

                }
            }
        }
    }
}

sub newgame
{
    $datafile = "answers.dat";

    open ANSWERDATA, $datafile;

    @answers = <ANSWERDATA>;

    close (ANSWERDATA);

    srand(time ^ $$);

    $index1 = $#answers * rand;

    $theanswer = $answers[$index1];

    chomp($theanswer);

    $themisses = "-";

    $thehits = "";

    for($loopindex = 0; $loopindex < length($theanswer); $loopindex++){

        $thehits .= "-";

    }

    displayresult();
}

sub getguess
{
    $theguess = "-";

    if ($co->param('letters')){
        $theguess = lc($co->param('letters'));
    }

    return $theguess;
}

sub displayresult
{
    print 

    $co->header,

    $co->start_html(-title=>'Word Game', -author=>'Steve', 
    -bgcolor=>'black', -text=>'#ffff00', -link=>'#ff0000', 
    -alink=>'#ffffff', -vlink=>'#ffff00'),

    $co->center
    (
        "<font color = #ffff00>", 
        $co->h1('Word Game!'),
        $co->hr
    );

    $len = length($themisses);

    if (-e "hang${len}.gif") {

        print $co->img({-src=>"hang${len}.gif", 
            -align=>left, -vspace=>10, -hspace=>1});

    }

    print
    $co->center
    (
        $co->h1($thehits),

        "<cont color = #ffff00>",

        $co->h2("Misses (8 max): " . substr($themisses, 1)),

        $co->startform,

        $co->hidden(-name=>'newgame', -default=>"no", 
            -override=>1),

        $co->hidden(-name=>'answer', -default=>"$theanswer", 
            -override=>1),

        $co->hidden(-name=>'hits', -default=>"$thehits", 
            -override=>1),

        $co->hidden(-name=>'misses', -default=>"$themisses", 
            -override=>1),

        $co->br,

        "Guess a letter:",

        $co->br,
    ),

    "<center>",

    "A<input type = radio name = \"letters\" value = \"A\" 
        checked>";

    for ($loopindex = ord('B'); $loopindex <= ord('M'); 
        $loopindex++) {
        $c = chr($loopindex);

        print "${c}<input type = radio name = \"letters\" 
        value = \"${c}\" >";
    }

    print $co->br;

    for ($loopindex = ord('N'); $loopindex <= ord('Z'); $loopindex++) {

        $c = chr($loopindex);

        print "${c}<input type = radio name = \"letters\" 
        value = \"${c}\" >";
    }

    print $co->br,

    "Then submit your guess by clicking ",

    $co->submit(-value=>'this button'),

    $co->br, 
    $co->br,

    "Start new game?",
    "<input type = radio name = \"newgameyesno\" value = 
        \"yes\"> Yes",

    "<input type = radio name = \"newgameyesno\" value = 
        \"no\" checked> No",

    "</center>",

    $co->endform,

    "</font>",

    $co->end_html;
}

sub gethits             
{
    $temphits = $co->param('hits');
    $thehits = "";

    for($loopindex = 0; $loopindex < length($theanswer); 
        $loopindex++){
        $thechar = substr($temphits, $loopindex, 1);
        $theanswerchar = substr($theanswer, $loopindex, 1);
        if($theguess eq $theanswerchar){
            $thechar = $theguess;
        }

        $thehits .= $thechar;

    }

    return $thehits;
}

sub getmisses           
{
    $themisses = $co->param('misses');

    if(index($theanswer, $theguess) eq -1){
        if(index($themisses, $theguess) eq -1){
            $themisses .= $theguess;
        }
    }

    return $themisses;

} 

sub youwin
{
    print 

    $co->header,

    $co->start_html(-title=>'Word Game', -author=>'Steve', 
    -bgcolor=>'black', -text=>'#ffff00', -link=>'#ff0000', 
    -alink=>'#ffffff', -vlink=>'#ffff00'),

    "<center>",

    "<font color = #ffff00>",

    $co->h1('Word Game!'),

    $co->hr,

    $co->br,

    "</font>",

    "<font color = #ffffff>";

    if (-e "hang10.gif") {
        print $co->img({-src=>"hang10.gif", 
            -align=>left, -vspace=>10, -hspace=>1});
    }
    print

    $co->h1("You got it: ", $theanswer),

    $co->h1("You win!"),

    $co->br, $co->br,

    $co->startform,

    $co->hidden
    (
        -name=>'newgame', 
        -default=>"yes", 
        -override=>1
    ),

    $co->br, 
    $co->br,

    $co->submit(-value=>'New Game'),

    $co->endform,           

    "</font>",

    "</center>",

    $co->end_html;
}

sub youlose
{
    print 

    $co->header,

    $co->start_html(-title=>'Word Game', -author=>'Steve', 
    -bgcolor=>'black', -text=>'#ffff00', 
    -link=>'#ff0000', -alink=>'#ffffff', 
    -vlink=>'#ffff00'),

    "<center>",

    "<font color = #ffff00>",
    $co->h1('Word Game!'),

    $co->hr,
    $co->br,

    "</font>",

    "<font color = #ffffff>";

    if (-e "hang9.gif") {
        print $co->img({-src=>"hang9.gif", 
            -align=>left, -vspace=>10, -hspace=>1});
    }
    print

    $co->h1("The answer: ", $theanswer),

    $co->h1("Sorry, too many guesses taken!", $co->br, 

    $co->br, "Better luck next time."),

    $co->br, 

    $co->br,

    $co->startform,

    $co->hidden(-name=>'newgame', -default=>"yes", 
        -override=>1),

    $co->br, 

    $co->br,

    $co->submit(-value=>'New Game'),

    $co->br,

    $co->endform,

    "</font>",

    "</center>",

    $co->end_html;
}
================================================================================
!!!CODE24!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
================================================================================
$co->textfield(-name=>'key',-default=>'', -override=>1);
================================================================================
#!/usr/local/bin/perl

use CGI;

$co = new CGI;    

print 
    $co->header,
    $co->start_html('CGI Environment Variables Example'),

    $co->center($co->h1('CGI Environment Variables Example'));

foreach $key (sort keys %ENV) {

    print $co->b("$key=>$ENV{$key}"), 
    $co->br;

}

print $co->end_html;
================================================================================
#!/usr/bin/perl

use CGI; 
$co = new CGI;    

print 

$co->header, 

$co->start_html("Check if someone is logged in"), 

$co->center
(
    $co->h1("Check if someone is logged in...")
),

$co->p,
$co->start_form, 

$co->center
(
    "Please enter the person's login name: ", 

    $co->textfield('person'), 

    $co->p,
    $co->submit('Check'), 
    $co->reset
),
$co->end_form;

if ($person = $co->param('person')) {

    foreach (`who`) {

        if (/^$person\s/) {

            print
            $co->center
            (
                $co->h2
                (
                    "Yes, $person is logged in.",
                )
            ),
            $co->end_html;

            exit;
        } 
    }

    print 
        $co->center
        (
            $co->h2
            (
                "$person is not logged in, sorry.",
            )
        );
}

print $co->end_html;
================================================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->redirect('http://www.cpan.org');

print $co->start_html, 

$co->end_html;
=============================================================
#!/usr/local/bin/perl

use Fcntl;
use NDBM_File;
use CGI;

$co = new CGI;    

print 

$co->header,
$co->start_html('CGI Functions Example'),
$co->center($co->h1('CGI Database Example')),
$co->hr,

$co->b("Add a key/value pair to the database..."),

$co->start_form,

"Key to add to the database: ",

$co->textfield(-name=>'key',-default=>'', -override=>1),

$co->br,
"Value to add to the database: ",
$co->textfield(-name=>'value',-default=>'', -override=>1),

$co->br,
$co->hidden(-name=>'type',-value=>'write', -override=>1),

$co->br,
$co->center(
    $co->submit('Add to database'), 
    $co->reset
),

$co->end_form,

$co->hr,

$co->b("Look up a value in the database..."),

$co->start_form,

"Key to search for: ",$co->textfield(-name=>'key',-default=>'', -override=>1),

$co->br,
$co->hidden(-name=>'type',-value=>'read', -override=>1),

$co->br,
$co->center(
    $co->submit('Look up value'), 
    $co->reset
),

$co->end_form,

$co->hr;

if($co->param()) {

    print $co->b("Results...");

    if($co->param('type') eq 'write') {

        tie %dbhash, "NDBM_File", "dbdata", O_RDWR|O_CREAT, 0644;

        $key = $co->param('key');
        $value = $co->param('value');
        $dbhash{$key} = $value;

        untie %dbhash;

        if ($!) {

            print $co->center($co->h3("There was an error: $!"));

        } else {

            print $co->center($co->h3("$key=>$value stored in the database"));

        }

    } else {

        tie %dbhash, "NDBM_File", "dbdata", O_RDWR|O_CREAT, 0644;
        $key = $co->param('key');
        $value = $dbhash{$key};

        if ($value) {

           if ($!) {
                print $co->center($co->h3("There was an error: $!"));
            } else {
                print $co->center($co->h3("$key=>$value"));
            }

        } else {

            print $co->center($co->h3("No match found for that key"));

        }

        untie %dbhash;
    }

    print $co->hr;

}

print $co->end_html;
=============================================================
#!/usr/local/bin/perl

use CGI;

$co = new CGI;    

if (!$co->param())
{
    print 
        $co->header,

        $co->start_html('CGI File Upload Example'),

        $co->center
        (

            $co->br,
            $co->center($co->h1('CGI File Upload Example')),

            $co->start_multipart_form,

            $co->filefield(-name=>'filename', -size=>30),

            $co->br,
            $co->submit(-value=>'Upload'), 
            $co->reset,

            $co->end_form

    ),

    $co->hr;

} else {

    print 

        $co->header,

        $co->start_html('CGI File Upload Example'),
        $co->center($co->h1('CGI File Upload Example'));

    $file = $co->param('filename');

    @data = <$file>;

    foreach (@data) {

        s/\n/<br>/g;

    }

    print 
        $co->center($co->h2("Here's the contents of $file...")),

        "@data";
}

print $co->end_html;
=============================================================
#!/usr/local/bin/perl

use CGI;
use File::Find;

$base_address = '/www/username/search';
$base_url = 'http://www.yourserver.com/~username/search';

$co = new CGI;    

if (!$co->param())
{

    print 
    $co->header,

    $co->start_html('CGI Site Search Example'),

    $co->center
    (
        $co->br,

        $co->h1('CGI Site Search Example'),

        $co->start_form,

        "String to search for: ",$co->textfield('key'),

        $co->p,
        $co->submit(-value=>'Search'), 
        $co->reset,

        $co->end_form
    ),

    $co->hr;

} else {
    print 
    $co->header,

    $co->start_html('CGI Site Search Example'),

    $co->center
    (
        $co->h1('CGI Site Search Example')
    );

    $key = $co->param('key');

    find \&finder, $base_address;

    if (keys %hash) {

        @sorted = sort {sorter($a, $b)} keys %hash;

        $number_found = $#sorted + 1;

        print $co->center($co->h1("Found $number_found matches"));

        foreach $file (@sorted) {

        print 
        
        $co->a
        (
            {-href => "$base_url/$file"}, $file
        ), 

        " Number of matches: ", 
        $hash{$file}, 

        $co->p;
        }
    }

print $co->end_html;

}

sub sorter
{
   $a = shift;
   $b = shift;

   return ($hash{$b} <=> $hash{$a});
}

sub finder
{
    if (!-d $File::Find::name) {

        open FILEHANDLE, "<$File::Find::name";

        $size = -s $File::Find::name;
        $_ = '';

        read FILEHANDLE, $_, $size;

        close FILEHANDLE;

        $number = 0;
        $number++ while /${key}/g;

        $file = $File::Find::name;

        $length = length ($base_address) + 1;

        $file =~ /^.{${length}}(.*)/;

        if ($number) {$hash{$1} = $number}
    }
}
=============================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header,                    

$co->start_html
(
    -title=>'CGI Example', 
    -author=>'Steve', 
    -meta=>{'keywords'=>'CGI Perl'}, 
    -BGCOLOR=>'white', 
    -LINK=>'red'
),

$co->center
(
    $co->h1
    (
        'Welcome to our store!'
    )
),

$co->center
(
    $co->h2
    (
        'Home Products'
    )
),         

$co->hr,

$co->start_form
(
    -name=>'form1',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cgicart.cgi"
),

"Please check the items you want to buy: ", 

$co->p,

$co->center
(
    $co->checkbox_group
    (
        -name=>'checkboxes',
        -values=>['Shampoo','Toothpaste','Detergent','Lotion']
    )

), 

$co->p,
$co->p,

$co->center
(
    $co->submit('Add to Shopping Cart'),  
    $co->reset,
),

$co->p,

$co->hr, 

$co->end_form,

$co->start_form
(
    -name=>'form2',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cgishop2.cgi"
),

$co->center
(
    $co->submit('Go to Office Products Page'),  
),

$co->end_form,

$co->start_form
(
    -name=>'form3',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cgicart.cgi"
),

$co->center
(
    $co->submit('See Your Shopping Cart'),  
),

$co->end_form,

$co->end_html;                  
=============================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header,                    

$co->start_html
(
    -title=>'CGI Example', 
    -author=>'Steve', 
    -meta=>{'keywords'=>'CGI Perl'}, 
    -BGCOLOR=>'white', 
    -LINK=>'red'
),

$co->center
(
    $co->h1
    (
        'Welcome to our store!'
    )
),

$co->center
(
    $co->h2
    (
        'Office Products'
    )
),         

$co->hr,

$co->start_form
(
    -name=>'form1',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cgicart.cgi"
),

"Please check the items you want to buy: ", 

$co->p,
$co->center
(
    $co->checkbox_group
    (
        -name=>'checkboxes',
        -values=>['Stapler','Eraser','Desk','Shelves']
    )
), 

$co->p,
$co->p,

$co->center
(
    $co->submit('Add to Shopping Cart'),  
    $co->reset,
),

$co->p,
$co->hr, 

$co->end_form,

$co->start_form
(
    -name=>'form2',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cgishop1.cgi"
),

$co->center
(
    $co->submit('Go to Home Products Page'),  
),

$co->end_form,

$co->start_form
(
    -name=>'form3',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cgicart.cgi"
),

$co->center
(
    $co->submit('See Your Shopping Cart'),  
),

$co->end_form,

$co->end_html;                  
=============================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

$purchases = $co->cookie('cart');

if ($co->param('checkboxes')) {

    $purchases .=
    join('<p>',$co->param('checkboxes')) . '<p>';

}

$cookie1 = $co->cookie(-name=>'cart', -value=>$purchases);

if ($co->param('delete_field')) {

   $cookie1 = $co->cookie(-name=>'cart', -value=>'');

}

if($co->param('checkboxes') || $co->param('delete_field')) {

    print $co->header(-cookie=>$cookie1);

} else {

    print $co->header;

}

print

$co->start_html
(
    -title=>'CGI Example', 
    -author=>'Steve', 
    -meta=>{'keywords'=>'CGI Perl'}, 
    -BGCOLOR=>'white', 
    -LINK=>'red'
),

$co->center
(
    $co->h1
    (
        'Thanks for letting us serve you...'
    )
),

$co->h3('Here are your purchases...'),

$co->hr;

if ($purchases eq '<p>' || $purchases eq '' || $co->param('delete_field')) {

    print "Your shopping cart is empty.";

} 

else {

    print $purchases;

}

print 

$co->hr,

$co->start_form
(
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cgishop1.cgi"
),

$co->center
(
    $co->submit('Go to Home Products'),  
),

$co->end_form,

$co->start_form
(
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cgishop2.cgi"
),

$co->center
(
    $co->submit('Go to Office Products'),  
),

$co->end_form,

$co->start_form
(
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cgicart.cgi"
),

$co->center
(
    $co->submit('Delete All Items'),  
    $co->hidden(-name=>delete_field,-value=>1,-override=>1)
),

$co->end_form,

$co->end_html;                  
=============================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

if ($co->param()) {

    $shoppingcart = $co->param('shoppingcart');
}

print $co->header,                    

$co->start_html
(
    -title=>'CGI Example', 
    -author=>'Steve', 
    -meta=>{'keywords'=>'CGI Perl'}, 
    -BGCOLOR=>'white', 
    -LINK=>'red'
),

$co->center
(
    $co->h1
    (
        'Welcome to our store!'
    )
),

$co->center
(
    $co->h2
    (
        'Home Products'
    )
),         

$co->hr,

$co->start_form
(
    -name=>'form1',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cart.cgi"
),

"Please check the items you want to buy: ", 

$co->p,

$co->center
(
    $co->checkbox_group
    (
        -name=>'checkboxes',
        -values=>['Shampoo','Toothpaste','Detergent','Lotion']
    )
), 

$co->p,

$co->hidden
(
    -name=>'shoppingcart', 
    -override => 1, 
    -default => $shoppingcart
),

$co->p,

$co->center
(
    $co->submit('Add to Shopping Cart'),  
    $co->reset,
),

$co->p,

$co->hr, 

$co->end_form,

$co->start_form
(
    -name=>'form2',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/shop2.cgi"
),

$co->hidden
(
    -name=>'shoppingcart', 
    -override => 1, 
    -default => $shoppingcart
),

$co->center
(
    $co->submit('Go to Office Products Page'),  
),

$co->end_form,

$co->start_form
(
    -name=>'form3',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cart.cgi"
),

$co->hidden
(
    -name=>'shoppingcart', 
    -override => 1, 
    -default => $shoppingcart
),

$co->center
(
    $co->submit('See Your Shopping Cart'),  
),

$co->end_form,

$co->end_html;                  
=============================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

if ($co->param()) {

    $shoppingcart = $co->param('shoppingcart');
}

print $co->header,                    

$co->start_html
(
    -title=>'CGI Example', 
    -author=>'Steve', 
    -meta=>{'keywords'=>'CGI Perl'}, 
    -BGCOLOR=>'white', 
    -LINK=>'red'
),

$co->center
(
    $co->h1
    (
        'Welcome to our store!'
    )
),

$co->center
(
    $co->h2
    (
        'Office Products'
    )
),         

$co->hr,

$co->start_form
(
    -name=>'form1',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cart.cgi"
),

"Please check the items you want to buy: ", 

$co->p,

$co->center
(
    $co->checkbox_group
    (
        -name=>'checkboxes',
        -values=>['Stapler','Eraser','Desk','Shelves']
    )
), 

$co->p,

$co->hidden
(
    -name=>'shoppingcart', 
    -override => 1, 
    -default => $shoppingcart
),

$co->p,

$co->center
(
    $co->submit('Add to Shopping Cart'),  

    $co->reset,
),

$co->p,

$co->hr, 

$co->end_form,

$co->start_form
(
    -name=>'form2',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/shop1.cgi"
),

$co->hidden
(
    -name=>'shoppingcart', 
    -override => 1, 
    -default => $shoppingcart
),

$co->center
(
    $co->submit
    (
        'Go to Home Products Page'
    ),  
),

$co->end_form,

$co->start_form
(
    -name=>'form3',
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cart.cgi"
),

$co->hidden
(
    -name=>'shoppingcart', 
    -override => 1, 
    -default => $shoppingcart
),

$co->center
(
    $co->submit('See Your Shopping Cart'),  
),

$co->end_form,

$co->end_html;                  
=============================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header,                    

$co->start_html
(
    -title=>'CGI Example', 
    -author=>'Steve', 
    -meta=>{'keywords'=>'CGI Perl'}, 
    -BGCOLOR=>'white', 
    -LINK=>'red'
),

$co->center
(
    $co->h1
    (
        'Thanks for letting us serve you...'
    )
),

$co->h3('Here are your purchases...'),

$co->hr;

if ($co->param()) {

    $purchases = $co->param('shoppingcart') . 
    join('<p>',$co->param('checkboxes')) . '<p>';

    if ($purchases ne '<p>') {

        print $purchases;

    } 

    else {

        print "Your shopping cart is empty.";

    }

} else {

    print "Your shopping cart is empty.";

}

print 

$co->hr,

$co->start_form
(
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/shop1.cgi"
),

$co->hidden(-name=>'shoppingcart', -override => 1, -value => $purchases),

$co->center
(
    $co->submit('Go to Home Products'),  
),

$co->end_form,

$co->start_form
(
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/shop2.cgi"
),

$co->hidden
(
    -name=>'shoppingcart', 
    -override => 1, 
    -value => $purchases
),

$co->center
(
    $co->submit('Go to Office Products'),  
),

$co->end_form,

$co->start_form
(
    -method=>'POST', 
    -action=>"http://www.yourserver.com/~username/cgi/cart.cgi"
),

$co->hidden
(
    -name=>'shoppingcart', 
    -override => 1, 
    -value => ""
),

$co->center
(
    $co->submit('Delete All Items in Shopping Cart'),  
),

$co->end_form,

$co->end_html;                  
=============================================================
!!!CODE25!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=============================================================
<?xml version = "1.0"?>
<DOCUMENT>
    <CUSTOMER TYPE="Good">
        <NAME>
            <LAST_NAME>Thomson</LAST_NAME>
            <FIRST_NAME>Susan</FIRST_NAME>
        </NAME>
        <DATE>September 1, 2001</DATE>
        <ORDERS>
            <ITEM>                <PRODUCT>Video tape</PRODUCT>
                <NUMBER>5</NUMBER>
                <PRICE>$1.25</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Shovel</PRODUCT>
                <NUMBER>2</NUMBER>
                <PRICE>$4.98</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
    <CUSTOMER>
        <NAME>
            <LAST_NAME>Smithson</LAST_NAME>
            <FIRST_NAME>Nancy</FIRST_NAME>
        </NAME>
        <DATE>September 2, 2001</DATE>
        <ORDERS>
            <ITEM>
                <PRODUCT>Ribbon</PRODUCT>
                <NUMBER>12</NUMBER>
                <PRICE>$2.95</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Goldfish</PRODUCT>
                <NUMBER>6</NUMBER>
                <PRICE>$1.50</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
</DOCUMENT>
=============================================================
<?xml version = "1.0"?>
<DOCUMENT>
    <CUSTOMER TYPE="Good">
        <NAME>
            <LAST_NAME>Thomson</LAST_NAME>
            <FIRST_NAME>Susan</FIRST_NAME>
        </NAME>
        <DATE>September 1, 2001</DATE>
        <ORDERS>
            <ITEM>                <PRODUCT>Video tape</PRODUCT>
                <NUMBER>5</NUMBER>
                <PRICE>$1.25</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Shovel</PRODUCT>
                <NUMBER>2</NUMBER>
                <PRICE>$4.98</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
    <CUSTOMER TYPE="Poor">
        <NAME>
            <LAST_NAME>Smithson</LAST_NAME>
            <FIRST_NAME>Nancy</FIRST_NAME>
        </NAME>
        <DATE>September 2, 2001</DATE>
        <ORDERS>
            <ITEM>
                <PRODUCT>Ribbon</PRODUCT>
                <NUMBER>12</NUMBER>
                <PRICE>$2.95</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Goldfish</PRODUCT>
                <NUMBER>6</NUMBER>
                <PRICE>$1.50</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
</DOCUMENT>
=============================================================
<?XML version = "1.0" ?>
<!DOCTYPE DOCUMENT [                            
<!ELEMENT DOCUMENT (CUSTOMER)*>                 
<!ELEMENT CUSTOMER (NAME,DATE,ORDERS)>          
<!ELEMENT NAME (LAST_NAME,FIRST_NAME)>            
<!ELEMENT LAST_NAME (#PCDATA)>                   
<!ELEMENT FIRST_NAME (#PCDATA)>                  
<!ELEMENT DATE (#PCDATA)>                       
<!ELEMENT ORDERS (ITEM)*>                       
<!ELEMENT ITEM (PRODUCT,NUMBER,PRICE)>          
<!ELEMENT PRODUCT (#PCDATA)>                    
<!ELEMENT NUMBER (#PCDATA)>                     
<!ELEMENT PRICE (#PCDATA)>                      
]>                                              
<DOCUMENT>
    <CUSTOMER>
        <NAME>
            <LAST_NAME>Thomson</LAST_NAME>
            <FIRST_NAME>Susan</FIRST_NAME>
        </NAME>
        <DATE>September 1, 2001</DATE>
        <ORDERS>
            <ITEM>
                <PRODUCT>Video tape</PRODUCT>
                <NUMBER>5</NUMBER>
                <PRICE>$1.25</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Shovel</PRODUCT>
                <NUMBER>2</NUMBER>
                <PRICE>$4.98</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
    <CUSTOMER>
        <NAME>
            <LAST_NAME>Smithson</LAST_NAME>
            <FIRST_NAME>Nancy</FIRST_NAME>
        </NAME>
        <DATE>September 2, 2001</DATE>
        <ORDERS>
            <ITEM>
                <PRODUCT>Ribbon</PRODUCT>
                <NUMBER>12</NUMBER>
                <PRICE>$2.95</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Goldfish</PRODUCT>
                <NUMBER>6</NUMBER>
                <PRICE>$1.50</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
</DOCUMENT>
=============================================================
<?xml version="1.0"?>
<!DOCTYPE DOCUMENT [
    <!ELEMENT p (#PCDATA)>
    <!ELEMENT DOCUMENT     (TITLE,SUBTITLE?,PREFACE?,(SECTION | PART)+)>
    <!ELEMENT TITLE        (TITLE2)*>
    <!ELEMENT TITLE2       (#PCDATA)>
    <!ELEMENT SUBTITLE     (p)+>
    <!ELEMENT PREFACE      (HEADING, p+)+>
    <!ELEMENT PART         (HEADING, CHAPTER+)>
    <!ELEMENT SECTION      (HEADING, p+)>
    <!ELEMENT HEADING      (#PCDATA)>
    <!ELEMENT CHAPTER      (CHAPTERTITLE, p+)>
    <!ELEMENT CHAPTERTITLE (#PCDATA)>
]>
<DOCUMENT>
    <TITLE>My Novel</TITLE>
    <PART>
        <HEADING>Ice Cream Consumption</HEADING>
        <CHAPTER>
            <CHAPTERTITLE>CHAPTER 1</CHAPTERTITLE>
            <p>I enjoy fishing.</p>
            <p>And I enjoy travel.</p>
            <p>How about you?</p>
        </CHAPTER>
    </PART>
</DOCUMENT>
=============================================================
<?xml version = "1.0"?>
<!DOCTYPE DOCUMENT [
<!ELEMENT DOCUMENT (CUSTOMER)*>
<!ELEMENT CUSTOMER (NAME,DATE,ORDERS)>    
<!ELEMENT NAME (LASTNAME,FIRSTNAME)>
<!ELEMENT LASTNAME (#PCDATA)>
<!ELEMENT FIRSTNAME (#PCDATA)>
<!ELEMENT DATE (#PCDATA)>
<!ELEMENT ORDERS (ITEM)*>
<!ELEMENT ITEM (PRODUCT,NUMBER,PRICE)>
<!ELEMENT PRODUCT (#PCDATA)>
<!ELEMENT NUMBER (#PCDATA)>
<!ELEMENT PRICE (#PCDATA)>
<!ATTLIST CUSTOMER                        
    CITIZENSHIP CDATA "US"
    AGE CDATA #IMPLIED
    TYPE CDATA #REQUIRED>                  
]>
<DOCUMENT>
    <CUSTOMER TYPE="Good">
        <NAME>
            <LAST_NAME>Thomson</LAST_NAME>
            <FIRST_NAME>Susan</FIRST_NAME>
        </NAME>
        <DATE>September 1, 2001</DATE>
        <ORDERS>
            <ITEM>
                <PRODUCT>Video tape</PRODUCT>
                <NUMBER>5</NUMBER>
                <PRICE>$1.25</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Shovel</PRODUCT>
                <NUMBER>2</NUMBER>
                <PRICE>$4.98</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
    <CUSTOMER TYPE="Poor">
        <NAME>
            <LAST_NAME>Smithson</LAST_NAME>
            <FIRST_NAME>Nancy</FIRST_NAME>
        </NAME>
        <DATE>September 2, 2001</DATE>
        <ORDERS>
            <ITEM>
                <PRODUCT>Ribbon</PRODUCT>
                <NUMBER>12</NUMBER>
                <PRICE>$2.95</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Goldfish</PRODUCT>
                <NUMBER>6</NUMBER>
                <PRICE>$1.50</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
</DOCUMENT>
=============================================================
<?xml version="1.0"?>
<library>
   <book>
        <title>
            Earthquakes for Lunch
        </title>
        <title>
            Volcanoes for Dinner
        </title>
   </book>
</library>
=============================================================
<?xml version="1.0"?>
<?xml-stylesheet type="text/xml" href="planets.xsl"?>
<PLANETS>

    <PLANET>
        <NAME>Mercury</NAME>
        <MASS UNITS="(Earth = 1)">.0553</MASS>
        <DAY UNITS="days">58.65</DAY>
        <RADIUS UNITS="miles">1516</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.983</DENSITY>
        <DISTANCE UNITS="million miles">43.4</DISTANCE><!--At perihelion-->
    </PLANET>

    <PLANET>
        <NAME>Venus</NAME>
        <MASS UNITS="(Earth = 1)">.815</MASS>
        <DAY UNITS="days">116.75</DAY>
        <RADIUS UNITS="miles">3716</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.943</DENSITY>
        <DISTANCE UNITS="million miles">66.8</DISTANCE><!--At perihelion-->
    </PLANET>

    <PLANET>
        <NAME>Earth</NAME>
        <MASS UNITS="(Earth = 1)">1</MASS>
        <DAY UNITS="days">1</DAY>
        <RADIUS UNITS="miles">2107</RADIUS>
        <DENSITY UNITS="(Earth = 1)">1</DENSITY>
        <DISTANCE UNITS="million miles">128.4</DISTANCE><!--At perihelion-->
    </PLANET>

</PLANETS>
=============================================================
use XML::DOM;

my $parser = new XML::DOM::Parser;
my $doc = $parser->parsefile ("planets.xml");

$numberTextLines = 0;

createDisplay($doc, "");

for ($loopIndex = 0; $loopIndex < $numberTextLines; $loopIndex++){
    print $textToDisplay[$loopIndex] . "\n";
}

sub createDisplay 
{

    my $node = $_[0];
    my $indent = $_[1];

    if ($node == null) {
        return;
    }

    my $type = $node->getNodeType();

    if($type == DOCUMENT_NODE) {
        $textToDisplay[$numberTextLines] = $indent;
        $textToDisplay[$numberTextLines] .= 
            "<?xml version=\"1.0\"?>";
        $numberTextLines++;
        createDisplay($node->getFirstChild(), "");
        break;
     }

     if($type == ELEMENT_NODE) {
         $textToDisplay[$numberTextLines] = $indent;
         $textToDisplay[$numberTextLines] .= "<";
         $textToDisplay[$numberTextLines] .= $node->getNodeName();

         $numberAttributes = 0;
         if($node->getAttributes() != null){
             $numberAttributes = 
                 $node->getAttributes()->getLength();
         }

         for ($loopIndex = 0; $loopIndex < $numberAttributes; 
             $loopIndex++) {

             $attribute = 
                 ($node->getAttributes())->item($loopIndex);
             $textToDisplay[$numberTextLines] .= " ";
             $textToDisplay[$numberTextLines] .= 
                 $attribute->getNodeName();
             $textToDisplay[$numberTextLines] .= "=\"";
             $textToDisplay[$numberTextLines] .= 
                 $attribute->getNodeValue();
             $textToDisplay[$numberTextLines] .= "\"";
         }

         $textToDisplay[$numberTextLines] .= ">";

         $numberTextLines++;

         my @childNodes = $node->getChildNodes();
         if (@childNodes != null) {
             my $numberChildNodes = $#childNodes + 1;
             $indent .= "    ";
             my $loopIndex;
             for ($loopIndex = 0; $loopIndex < $numberChildNodes; 
                 $loopIndex++ ) 
             {
                createDisplay($childNodes[$loopIndex], $indent);
             }
         }
     }

     if($type == TEXT_NODE) {
         $textToDisplay[$numberTextLines] = $indent;
         $nodeText = $node->getNodeValue();
         if(($nodeText =~ /[^ \n\t\r]/g) && length($nodeText) > 0) {
             $textToDisplay[$numberTextLines] .= $nodeText;
             $numberTextLines++;
         }
     }

     if($type == PROCESSING_INSTRUCTION_NODE) {
         $textToDisplay[$numberTextLines] = $indent;
         $textToDisplay[$numberTextLines] .= "<?";
         $textToDisplay[$numberTextLines] .= $node->getTarget();
         $PItext = $node->getData();
         $textToDisplay[$numberTextLines] .= " " . $PItext;
         $textToDisplay[$numberTextLines] .= "?>";
         $numberTextLines++;
         createDisplay($node->getNextSibling(), $indent);
    }    

    if ($type == ELEMENT_NODE) {
        $textToDisplay[$numberTextLines] = substr($indent, 0, 
            $indent.length() - 4);
        $textToDisplay[$numberTextLines] .= "</";
        $textToDisplay[$numberTextLines] .= $node->getNodeName();
        $textToDisplay[$numberTextLines] .= ">";
        $numberTextLines++;
        $indent .= "    ";
    }
} 
=============================================================
!!!CODE26!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=============================================================
<?xml version = "1.0"?>
<DOCUMENT>
    <CUSTOMER TYPE="good">
        <NAME>
            <LAST_NAME>Thomson</LAST_NAME>
            <FIRST_NAME>Susan</FIRST_NAME>
        </NAME>
        <DATE>September 1, 2001</DATE>
        <ORDERS>
            <ITEM>
                <PRODUCT>Video tape</PRODUCT>
                <NUMBER>5</NUMBER>
                <PRICE>$1.25</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Shovel</PRODUCT>
                <NUMBER>2</NUMBER>
                <PRICE>$4.98</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
    <CUSTOMER TYPE="poor">
        <NAME>
            <LAST_NAME>Smithson</LAST_NAME>
            <FIRST_NAME>Nancy</FIRST_NAME>
        </NAME>
        <DATE>September 2, 2001</DATE>
        <ORDERS>
            <ITEM>
                <PRODUCT>Ribbon</PRODUCT>
                <NUMBER>12</NUMBER>
                <PRICE>$2.95</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Goldfish</PRODUCT>
                <NUMBER>6</NUMBER>
                <PRICE>$1.50</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
</DOCUMENT>
=============================================================
use XML::DOM;

my $parser = new XML::DOM::Parser;
my $doc = $parser->parsefile ("customers.xml");

$documentElementNode = $doc->getDocumentElement();
$textNode = $documentElementNode->getFirstChild();

$customer1Node = $textNode->getNextSibling();
$textNode = $customer1Node->getNextSibling();

$customer2Node = $textNode->getNextSibling();
$textNode = $customer2Node->getFirstChild();

$nameNode = $textNode->getNextSibling();
$textNode = $nameNode->getFirstChild();

$lastNameNode = $textNode->getNextSibling();
$textNode = $lastNameNode->getNextSibling();

$firstNameNode = $textNode->getNextSibling();
$textNode = $firstNameNode->getFirstChild();

print("First name: " . $textNode->getNodeValue() . "\n");
=============================================================
<?xml version="1.0"?>
<?xml-stylesheet type="text/xml" href="planets.xsl"?>
<PLANETS>

    <PLANET>
        <NAME NICKNAME="The Hottest Planet">Mercury</NAME>
        <MASS UNITS="(Earth = 1)">.0553</MASS>
        <DAY UNITS="days">58.65</DAY>
        <RADIUS UNITS="miles">1516</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.983</DENSITY>
        <DISTANCE UNITS="million miles">43.4</DISTANCE><!--At perihelion-->
    </PLANET>

    <PLANET>
        <NAME NICKNAME="The Planet of Love">Venus</NAME>
        <MASS UNITS="(Earth = 1)">.815</MASS>
        <DAY UNITS="days">116.75</DAY>
        <RADIUS UNITS="miles">3716</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.943</DENSITY>
        <DISTANCE UNITS="million miles">66.8</DISTANCE><!--At perihelion-->
    </PLANET>

    <PLANET>
        <NAME NICKNAME="The Blue Planet">Earth</NAME>
        <MASS UNITS="(Earth = 1)">1</MASS>
        <DAY UNITS="days">1</DAY>
        <RADIUS UNITS="miles">2107</RADIUS>
        <DENSITY UNITS="(Earth = 1)">1</DENSITY>
        <DISTANCE UNITS="million miles">128.4</DISTANCE><!--At perihelion-->
    </PLANET>

</PLANETS>
=============================================================
use XML::DOM;

$parser = new XML::DOM::Parser;
$doc = $parser->parsefile ("planets.xml");

$nodes = $doc->getElementsByTagName ("NAME");
$numberNodes = $nodes->getLength;

for (my $loop_index = 0; $loop_index < $numberNodes; $loop_index++)
{
    $node = $nodes->item($loop_index);
    $name = $nodes->item($loop_index)->getFirstChild()->getNodeValue();
    $nickname = $node->getAttributeNode ("NICKNAME")->getValue();
    print $name . " is also called " . $nickname . "\n";
}
=============================================================
<?xml version="1.0"?>
<?xml-stylesheet type="text/xml" href="planets.xsl"?>
<PLANETS>

    <PLANET>
        <NAME>Mercury</NAME>
        <MASS UNITS="(Earth = 1)">.0553</MASS>
        <DAY UNITS="days">58.65</DAY>
        <RADIUS UNITS="miles">1516</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.983</DENSITY>
        <DISTANCE UNITS="million miles">43.4</DISTANCE><!--At perihelion-->
        <COPYRIGHT>(c)2002</COPYRIGHT>
    </PLANET>

    <PLANET>
        <NAME>Venus</NAME>
        <MASS UNITS="(Earth = 1)">.815</MASS>
        <DAY UNITS="days">116.75</DAY>
        <RADIUS UNITS="miles">3716</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.943</DENSITY>
        <DISTANCE UNITS="million miles">66.8</DISTANCE><!--At perihelion-->
        <COPYRIGHT>(c)2002</COPYRIGHT>
    </PLANET>

    <PLANET>
        <NAME>Earth</NAME>
        <MASS UNITS="(Earth = 1)">1</MASS>
        <DAY UNITS="days">1</DAY>
        <RADIUS UNITS="miles">2107</RADIUS>
        <DENSITY UNITS="(Earth = 1)">1</DENSITY>
        <DISTANCE UNITS="million miles">128.4</DISTANCE><!--At perihelion-->
        <COPYRIGHT>(c)2002</COPYRIGHT>
    </PLANET>

</PLANETS>
=============================================================
use XML::DOM;

$dom = new XML::DOM::Parser;                     
$doc= $dom->parsefile("planets.xml");

$nodes= $doc->getElementsByTagName("PLANET");
$numberNodes = $nodes->getLength;

for ($loop_index = 0; $loop_index < $numberNodes; $loop_index++){
    $node = $nodes->item($loop_index);
    $copyright = $doc->createElement("COPYRIGHT");          
    $node->insertBefore($copyright);    
    $text = $doc->createTextNode("(c)2002");      
    $copyright->appendChild($text);               
}

$doc->printToFile("planets2.xml");
=============================================================
use XML::DOM;

$dom = new XML::DOM::Parser;                     

$doc= $dom->parsefile("planets.xml");

$nodes= $doc->getElementsByTagName("PLANET");
$numberNodes = $nodes->getLength;

for ($loop_index = 0; $loop_index < $numberNodes; $loop_index++){
    $node = $nodes->item($loop_index);
    $node->setAttribute("NUMBER" => $loop_index + 1);       
    $copyright= $doc->createElement("COPYRIGHT");          
    $node->insertBefore($copyright);    
    $text = $doc->createTextNode("(c)2002");      
    $copyright->appendChild($text);               
}

$doc->printToFile("planets2.xml");
=============================================================
<?xml version="1.0"?>
<?xml-stylesheet type="text/xml" href="planets.xsl"?>
<PLANETS>

    <PLANET NUMBER="1">
        <NAME>Mercury</NAME>
        <MASS UNITS="(Earth = 1)">.0553</MASS>
        <DAY UNITS="days">58.65</DAY>
        <RADIUS UNITS="miles">1516</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.983</DENSITY>
        <DISTANCE UNITS="million miles">43.4</DISTANCE><!--At perihelion-->
        <COPYRIGHT>(c)2002</COPYRIGHT>
    </PLANET>

    <PLANET NUMBER="2">
        <NAME>Venus</NAME>
        <MASS UNITS="(Earth = 1)">.815</MASS>
        <DAY UNITS="days">116.75</DAY>
        <RADIUS UNITS="miles">3716</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.943</DENSITY>
        <DISTANCE UNITS="million miles">66.8</DISTANCE><!--At perihelion-->
        <COPYRIGHT>(c)2002</COPYRIGHT>
    </PLANET>

    <PLANET NUMBER="3">
        <NAME>Earth</NAME>
        <MASS UNITS="(Earth = 1)">1</MASS>
        <DAY UNITS="days">1</DAY>
        <RADIUS UNITS="miles">2107</RADIUS>
        <DENSITY UNITS="(Earth = 1)">1</DENSITY>
        <DISTANCE UNITS="million miles">128.4</DISTANCE><!--At perihelion-->
        <COPYRIGHT>(c)2002</COPYRIGHT>
    </PLANET>

</PLANETS>
=============================================================
<?xml version="1.0"?>
<?xml-stylesheet type="text/xml" href="planets.xsl"?>
<PLANETS>

    <PLANET>
        <NAME>Mercury</NAME>
        <SHAPE>Round</SHAPE>
        <DAY UNITS="days">58.65</DAY>
        <RADIUS UNITS="miles">1516</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.983</DENSITY>
        <DISTANCE UNITS="million miles">43.4</DISTANCE><!--At perihelion-->
    </PLANET>

    <PLANET>
        <NAME>Venus</NAME>
        <SHAPE>Round</SHAPE>
        <DAY UNITS="days">116.75</DAY>
        <RADIUS UNITS="miles">3716</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.943</DENSITY>
        <DISTANCE UNITS="million miles">66.8</DISTANCE><!--At perihelion-->
    </PLANET>

    <PLANET>
        <NAME>Earth</NAME>
        <SHAPE>Round</SHAPE>
        <DAY UNITS="days">1</DAY>
        <RADIUS UNITS="miles">2107</RADIUS>
        <DENSITY UNITS="(Earth = 1)">1</DENSITY>
        <DISTANCE UNITS="million miles">128.4</DISTANCE><!--At perihelion--
    </PLANET>

</PLANETS>
=============================================================
use XML::DOM;

$dom = new XML::DOM::Parser;                     
$doc = $dom->parsefile("planets.xml");

$nodes = $doc->getElementsByTagName("PLANET");
$numberNodes = $nodes->getLength;

for (my $loop_index = 0; $loop_index < $numberNodes; $loop_index++){
    $node = $nodes->item($loop_index);
    
    $shape = $doc->createElement("SHAPE");          
    $text = $doc->createTextNode("Round");      
    $shape->appendChild($text);            

    @childNodes = $node->getChildNodes();

    if (@childNodes != null) {
        $numberChildNodes = $#childNodes + 1;
        for ($loopIndex = 0; $loopIndex < $numberChildNodes; $loopIndex++ ) 
        {
            if(($childNodes[$loopIndex])->getNodeName() eq "MASS"){
                $node->replaceChild($shape, $childNodes[$loopIndex]);
            }
        }
    }
}

$doc->printToFile("planets2.xml");
=============================================================
use XML::DOM;

$dom = new XML::DOM::Parser;                     

$doc= $dom->parsefile("planets.xml");

$nodes= $doc->getElementsByTagName("PLANET");
$numberNodes = $nodes->getLength();

for ($loop_index = 0; $loop_index < $numberNodes; $loop_index++){
    $node = $nodes->item($loop_index);
    
    @childNodes = $node->getChildNodes();
    if (@childNodes != null) {
        $numberChildNodes = $#childNodes + 1;
        for ($loopIndex = 0; $loopIndex < $numberChildNodes; $loopIndex++ ) 
        {
            if(($childNodes[$loopIndex])->getNodeName() eq "MASS"){
                $node->removeChild($childNodes[$loopIndex]);
            }
        }
    }
}

$doc->printToFile("planets2.xml");
=============================================================
<?xml version="1.0"?>
<?xml-stylesheet type="text/xml" href="planets.xsl"?>
<PLANETS>

    <PLANET>
        <NAME>Mercury</NAME>
        <DAY UNITS="days">58.65</DAY>
        <RADIUS UNITS="miles">1516</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.983</DENSITY>
        <DISTANCE UNITS="million miles">43.4</DISTANCE><!--At perihelion-->
    </PLANET>

    <PLANET>
        <NAME>Venus</NAME>
        <DAY UNITS="days">116.75</DAY>
        <RADIUS UNITS="miles">3716</RADIUS>
        <DENSITY UNITS="(Earth = 1)">.943</DENSITY>
        <DISTANCE UNITS="million miles">66.8</DISTANCE><!--At perihelion-->
    </PLANET>

    <PLANET>
        <NAME>Earth</NAME>
        <DAY UNITS="days">1</DAY>
        <RADIUS UNITS="miles">2107</RADIUS>
        <DENSITY UNITS="(Earth = 1)">1</DENSITY>
        <DISTANCE UNITS="million miles">128.4</DISTANCE><!--At perihelion--
    </PLANET>

</PLANETS>
=============================================================
use XML::DOM;

my $parser = new XML::DOM::Parser;

eval {
    $file = "planet.xml";
    my $doc = $parser->parsefile ($file);

    createDisplay($doc , "");
};

if($@) {
    print "Error in $file: " . (substr $@, 0, index($@, ", byte")) . "\n";
    exit(1);    
};

for ($loopIndex = 0; $loopIndex < $numberTextLines; $loopIndex++){
    print $textToDisplay[$loopIndex] . "\n";
}

sub createDisplay 
{
    eval {
        my $node = $_[0];
        my $indent = $_[1];
    
        if ($node == null) {
            return;
        }
    
        my $type = $node->getNodeType();
    
        if($type == DOCUMENT_NODE) {
            $textToDisplay[$numberTextLines] = $indent;
            $textToDisplay[$numberTextLines] .= 
                "<?xml version=\"1.0\"?>";
            $numberTextLines++;
            createDisplay($node->getFirstChild(), "");
            break;
         }
    
         if($type == ELEMENT_NODE) {
             $textToDisplay[$numberTextLines] = $indent;
             $textToDisplay[$numberTextLines] .= "<";
             $textToDisplay[$numberTextLines] .= $node->getNodeName();
    
             $numberAttributes = 0;
             if($node->getAttributes() != null){
                 $numberAttributes = 
                     $node->getAttributes()->getLength();
             }
    
             for ($loopIndex = 0; $loopIndex < $numberAttributes; 
                 $loopIndex++) {
    
                 $attribute = 
                     ($node->getAttributes())->item($loopIndex);
                 $textToDisplay[$numberTextLines] .= " ";
                 $textToDisplay[$numberTextLines] .= 
                     $attribute->getNodeName();
                 $textToDisplay[$numberTextLines] .= "=\"";
                 $textToDisplay[$numberTextLines] .= 
                     $attribute->getNodeValue();
                 $textToDisplay[$numberTextLines] .= "\"";
             }
    
             $textToDisplay[$numberTextLines] .= ">";
    
             $numberTextLines++;
    
             my @childNodes = $node->getChildNodes();
             if (@childNodes != null) {
                 my $numberChildNodes = $#childNodes + 1;
                 $indent .= "    ";
                 my $loopIndex;
                 for ($loopIndex = 0; $loopIndex < $numberChildNodes; 
                     $loopIndex++ ) 
                 {
                    createDisplay($childNodes[$loopIndex], $indent);
                 }
             }
         }
    
         if($type == TEXT_NODE) {
             $textToDisplay[$numberTextLines] = $indent;
             $nodeText = $node->getNodeValue();
             if(($nodeText =~ /[^ \n\t\r]/g) && length($nodeText) > 0) {
                 $textToDisplay[$numberTextLines] .= $nodeText;
                 $numberTextLines++;
             }
         }
    
         if($type == PROCESSING_INSTRUCTION_NODE) {
             $textToDisplay[$numberTextLines] = $indent;
             $textToDisplay[$numberTextLines] .= "<?";
             $textToDisplay[$numberTextLines] .= $node->getTarget();
             $PItext = $node->getData();
             $textToDisplay[$numberTextLines] .= " " . $PItext;
             $textToDisplay[$numberTextLines] .= "?>";
             $numberTextLines++;
             createDisplay($node->getNextSibling(), $indent);
        }    
    
        if ($type == ELEMENT_NODE) {
            $textToDisplay[$numberTextLines] = substr($indent, 0, 
                $indent.length() - 4);
            $textToDisplay[$numberTextLines] .= "</";
            $textToDisplay[$numberTextLines] .= $node->getNodeName();
            $textToDisplay[$numberTextLines] .= ">";
            $numberTextLines++;
            $indent .= "    ";
        }
    };

    if($@) {
        print "Error: $@\n";
        exit(1);    
    };
} 
=============================================================
use XML::Parser;

$numberTextLines = 0;

$parser = new XML::Parser(Handlers => {Start => \&start_handler,
        End   => \&end_handler,
        Char  => \&char_handler,
        Proc  => \&proc_handler,
        XMLDecl => \&XMLDecl_handler,
        Final => \&final_handler});
          
$parser->parsefile("planets.xml");
  
sub XMLDecl_handler
{
    $textToDisplay[$numberTextLines++] = "<?xml version=\"$_[1]\"?>";
}

sub start_handler
{
    $textToDisplay[$numberTextLines] = $indent . "<$_[1]";
    for ($loop_index = 2; $loop_index <= $#_ - 1; $loop_index += 2){
        $textToDisplay[$numberTextLines] .= 
            " " . $_[$loop_index] . "=\"". $_[$loop_index + 1] . "\"";
    }
    $textToDisplay[$numberTextLines++] .= ">";
    $indent .= "    ";
}

sub end_handler
{
    $indent = substr($indent, 0, length($indent) - 4);
    $textToDisplay[$numberTextLines++] = $indent . "</$_[1]>";
}

sub char_handler
{
    if($_[1] =~ /[^ \n\t\r]/g) {
        $textToDisplay[$numberTextLines++] = $indent . "$_[1]";
    }
}

sub proc_handler
{
    $textToDisplay[$numberTextLines++] = "<?$_[1] $_[2]?>";
}

sub final_handler
{
    for ($loopIndex = 0; $loopIndex < $numberTextLines; $loopIndex++){
        print $textToDisplay[$loopIndex] . "\n";
    }
}
=============================================================
<?xml version = "1.0"?>
<DOCUMENT>
    <CUSTOMER TYPE="good">
        <NAME>
            <LAST_NAME>Thomson</LAST_NAME>
            <FIRST_NAME>Susan</FIRST_NAME>
        </NAME>
        <DATE>September 1, 2001</DATE>
        <ORDERS>
            <ITEM>
                <PRODUCT>Video tape</PRODUCT>
                <NUMBER>5</NUMBER>
                <PRICE>$1.25</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Shovel</PRODUCT>
                <NUMBER>2</NUMBER>
                <PRICE>$4.98</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
    <CUSTOMER TYPE="poor">
        <NAME>
            <LAST_NAME>Smithson</LAST_NAME>
            <FIRST_NAME>Nancy</FIRST_NAME>
        </NAME>
        <DATE>September 2, 2001</DATE>
        <ORDERS>
            <ITEM>
                <PRODUCT>Ribbon</PRODUCT>
                <NUMBER>12</NUMBER>
                <PRICE>$2.95</PRICE>
            </ITEM>
            <ITEM>
                <PRODUCT>Goldfish</PRODUCT>
                <NUMBER>6</NUMBER>
                <PRICE>$1.50</PRICE>
            </ITEM>
        </ORDERS>
    </CUSTOMER>
</DOCUMENT>
=============================================================
use XML::Parser;

$parser = new XML::Parser(Handlers => {Start => \&start_handler,
        Char  => \&char_handler});
          
$parser->parsefile("customers.xml");
  
$customer = 0;
$data_ok = 0;

sub start_handler
{
    $data_ok = 0;

    if ($_[1] eq "CUSTOMER"){
        $customer++;
    }

    if ($customer == 2){
        if($_[1] eq "FIRST_NAME"){
            $data_ok++;
        }
    }
}

sub char_handler
{
    if(($_[1] =~ /[^ \n\t\r]/g) && $data_ok){
        print "First name: $_[1]\n";
    }
}
=============================================================
use XML::Parser;

$numberTextLines = 0;

$parser = new XML::Parser(Handlers => {Start => \&start_handler,
        End   => \&end_handler,
        Char  => \&char_handler,
        Proc  => \&proc_handler,
        XMLDecl => \&XMLDecl_handler,
        Final => \&final_handler});
          
$file = "planet.xml";

eval {
    $parser->parsefile($file);
};

if($@) {
    print "Error in $file: " . (substr $@, 0, index($@, ", byte")) . "\n";
    exit(1);    
};
  
sub XMLDecl_handler
{
    $textToDisplay[$numberTextLines++] = "<?xml version=\"$_[1]\"?>";
}

sub start_handler
{
    $textToDisplay[$numberTextLines] = $indent . "<$_[1]";
    for ($loop_index = 2; $loop_index <= $#_ - 1; $loop_index += 2){
        $textToDisplay[$numberTextLines] .= 
            " " . $_[$loop_index] . "=\"". $_[$loop_index + 1] . "\"";
    }
    $textToDisplay[$numberTextLines++] .= ">";
    $indent .= "    ";
}

sub end_handler
{
    $indent = substr($indent, 0, length($indent) - 4);
    $textToDisplay[$numberTextLines++] = $indent . "</$_[1]>";
}

sub char_handler
{
    if($_[1] =~ /[^ \n\t\r]/g) {
        $textToDisplay[$numberTextLines++] = $indent . "$_[1]";
    }
}

sub proc_handler
{
    $textToDisplay[$numberTextLines++] = "<?$_[1] $_[2]?>";
}

sub final_handler
{
    for ($loopIndex = 0; $loopIndex < $numberTextLines; $loopIndex++){
        print $textToDisplay[$loopIndex] . "\n";
    }
}
=============================================================

!!!CODE27!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=============================================================
POST /StockQuote HTTP/1.1
Host: www.starpowder.com
Content-Type: text/xml; charset="utf-8"
Content-Length: 1024
SOAPAction: "www.starpowder.com"
<SOAP-ENV:Envelope
  xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
  SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">

    <SOAP-ENV:Header>
        <starpowder:Transaction 
            xmlns:starpowder="www.starpowder.com">5</starpowder:Transaction>
    </SOAP-ENV:Header>

    <SOAP-ENV:Body>
        <starpowder:Data xmlns:starpowder="www.starpowder.com">
            <Price>34.5</Price>
        </starpowder:Data>
    </SOAP-ENV:Body>

</SOAP-ENV:Envelope>
=============================================================
<?xml version="1.0"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="Card1" title="Welcome to WML">
        <!-- This is card 1-->
        <p>
            Hello from WML
        </p>
    </card>
</wml> 
=============================================================
<?xml version="1.0"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 
    "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="Card1" title="Formatting Text">
        <p>
            WML supports 
            <b>bold</b>,
            <big>big</big>,
            <em>emphasis</em>,
            <i>italic</i>,
            <small>small</small>,
            and <u>underline</u> text.
        </p>
    </card>
</wml>
=============================================================
<?xml version="1.0"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 
    "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="Card1" title="Aligning Text">
        <p align="center"><b>Aligning Text</b></p>
        <p align="left">Hello</p>
        <p align="center">from</p>
        <p align="right">WML.</p>
    </card>
</wml>
=============================================================
<?xml version="1.0"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 
    "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="Card1" title="Using Buttons">
        <p align="center"><b>Using Buttons</b></p>
        <do type="accept" label="Navigate to the Starpowder site.">
            <go href="http://www.starpowder.com/welcome.wml"/>
        </do>
    </card>
</wml>
=============================================================
<?xml version="1.0"?>
 <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
 <wml>
    <card id="Card1" title="Two Card Example"> 
        <p align="center"><b>Two Card Example</b></p>
        <p> 
            Welcome to card 1.
        </p> 
        <do type="accept" label="Navigate to Card 2">
            <go href="#Card2"/>
        </do>
    </card> 
    <card id="Card2" title="Card 2"> 
        <p> 
            Welcome to card 2.
        </p> 
    </card> 
</wml> 
=============================================================
<?xml version="1.0" ?> 
<data> 
    <key>sandwich</key> 
    <value>cheeseburger</value> 
</data>
=============================================================
#!/usr/bin/perl
use Fcntl;
use NDBM_File;
use CGI;
$co = new CGI;    

if(!$co->param()) {
    print $co->header,
        $co->start_html('XML Database Example'),
        $co->center(
            $co->h2("Store a key/value pair"),
            $co->start_form,
            "Key: ",
            $co->textfield(-name=>'key',-default=>", -override=>1),
            $co->br,
            "Value: ",
            $co->textfield(-name=>'value',-default=>", -override=>1),
            $co->br,
            $co->hidden(-name=>'type',-value=>'write', -override=>1),
            $co->br,
            $co->submit('Store'), 
            $co->reset,
            $co->end_form,
            $co->h2("Retrieve a value by key"),
            $co->start_form,
            "Key: ",
            $co->textfield(-name=>'key',-default=>", -override=>1),
            $co->br,
            $co->hidden(-name=>'type',-value=>'read', -override=>1),
            $co->br,
            $co->submit('Retrieve'), 
            $co->reset,
            $co->end_form,
        );
    print $co->end_html;
}

if($co->param()) {
    print $co->header(-type=>"application/xml");
    print "<?xml version = \"1.0\"?>";
    print "<data>";

    if($co->param('type') eq 'write') {
        tie %dataHash, "NDBM_File", "xmldb", O_RDWR|O_CREAT, 0644;

        $key = $co->param('key');
        $value = $co->param('value');

        $dataHash{$key} = $value;
        untie %dataHash;

        if ($!) {
            print "Error: $!";
        } else {
            print "Stored $key => $value";
        }
    } else {
        tie %dataHash, "NDBM_File", "xmldb", O_RDWR|O_CREAT, 0644;

        $key = $co->param('key');
        $value = $dataHash{$key};

        print "<key>";
        print $key;
        print "</key>";

        print "<value>";
        print $value;
        print "</value>";

        if ($value) {
           if ($!) {
                print "Error: $!";
            }
        } else {
            print "There was no match for that key.";
        }
        untie %dataHash;
    }
    print "</data>";
}
=============================================================
<?xml version="1.0" ?> 
<data> 
    <key>sandwich</key> 
    <value>cheeseburger</value> 
</data>
=============================================================
use CGI::XMLForm;
$co = new CGI::XMLForm;

if ($co->param) {
    print $co->toXML;
}
=============================================================
%perl cgixmlform.cgi "/document/section/topic/text"="Hello"
<?xml version="1.0" encoding="ISO-8859-1"?>
<document>
        <section>
                <topic>
                        <text>Hello</text>
                </topic>
        </section>
</document>
=============================================================
<?xml version="1.0"?>
<document>The Document
    <section>Section 1
        <p>Hello</p>
        <p>there.</p>
    </section>
    <section>Section 2
        <p>Hello</p>
        <p>again.</p>
    </section>
    <footer>Footer 1</footer>
</document>
=============================================================
use CGI::XMLForm;
$co = new CGI::XMLForm;

if ($co->param) {
    print $co->toXML;
}
else {
    open(FILE, "cgixmlform.xml") or die "Error!";
    @queries = ('/document', '/document/section*', 'p*', '/document/footer');
    @a = $co->readXML(*FILE, @queries);
    for ($loop_index = 0; $loop_index < $#a + 1; $loop_index += 2){
        print $a[$loop_index] . ": " . $a[$loop_index + 1] . "\n";
    }
}
=============================================================
<SOAP-ENV:Envelope
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">

    <SOAP-ENV:Header>
        <starpowder:Transaction 
            xmlns:starpowder="www.starpowder.com">5</starpowder:Transaction>
    </SOAP-ENV:Header>

    <SOAP-ENV:Body>
        <starpowder:Data xmlns:starpowder="www.starpowder.com">
            <Price>34.5</Price>
        </starpowder:Data>
    </SOAP-ENV:Body>

</SOAP-ENV:Envelope>
=============================================================
<SOAP-ENV:Envelope
xmlns:SOAP-ENV="urn:schemas-xmlsoap-org:soap.v1"
SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">

    <SOAP-ENV:Header>
        <starpowder:Transaction 
        xmlns:starpowder="www.starpowder.com">5</starpowder:Transaction>
    </SOAP-ENV:Header>

    <SOAP-ENV:Body>
        <starpowder:Data xmlns:starpowder="www.starpowder.com">
            <Price>34.5</Price>
        </starpowder:Data>
    </SOAP-ENV:Body>

</SOAP-ENV:Envelope>
=============================================================
use SOAP::Parser;

$parser = SOAP::Parser->new();
$parser->parsefile('soap.xml');

$headers = $parser->get_headers();
$body = $parser->get_body();

$hashref = $$headers[0];

while(($key, $value) = each(%$hashref)) {
    print "head: $key => $value\n";
}

while(($key, $value) = each(%$body)) {
    print "body: $key => $value\n";
}
=============================================================
<?xml version="1.0"?>
 <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
 <wml>
    <card id="Card1" title="Using Hyperlinks"> 
        <p align="center"><b>Using Hyperlinks</b></p>
        <p>
            Want to see some see the Apache Software WML home page?
            Just click 
            <a href="http://www.apachesoftware.com/wml/index.wml">
                here
            </a>.
        </p>
    </card> 
</wml>
=============================================================
<?xml version="1.0"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 
    "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="Card1" title="Using Text Input">
        <p align="center"><b>Using Text Input</b></p>
        <p>
             Enter some text and click Go:
             <input type="text" name="data"/>
             <do type="accept" label="Go">
                 <go href="#Card2"/>
             </do>
        </p>
    </card>
    <card id="Card2" title="Using Text Input">
        <p align="center"><b>Using Text Input</b></p>
            You entered: $(data).
        </p>
    </card>
 </wml>  
=============================================================
<?xml version="1.0"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 
    "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="Card1" title="Using Select Controls">
        <p align="center"><b>Using Select Controls</b></p>
        <p>Make a selection and click Go.</p>
        <select name="data">
            <option value="pizza">Pizza</option>
            <option value="steak">Steak</option>
            <option value="tacos">Tacos</option>
        </select>
        <do type="accept" label="Go">
            <go href="#card2"/>
        </do>
    </card>
    <card id="card2" title="Card 2">
        <p align="center"><b>Using Select Controls</b></p>
        <p>
            You chose $(data) for dinner.
        </p>
    </card>
</wml>
=============================================================
<?xml version="1.0"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 
    "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="Card1" title="Using onpick">
        <p align="center"><b>"Using onPick"</b></p>
        <select name="selection">
           <option onpick="#Card2">
               Card 2
           </option>
           <option onpick="#Card3">
               Card 3
           </option>
           <option onpick="#Card4">
               Card 4
           </option>
        </select>
    </card>
    <card id="Card2" title="Using onpick">
        <p align="center"><b>"Card 2"</b></p>
    </card>
        
    <card id="Card3" title="Using onpick">
        <p align="center"><b>"Card 3"</b></p>
    </card>
        
    <card id="Card4" title="Using onpick">
        <p align="center"><b>"Card 4"</b></p>
    </card>
</wml>
=============================================================
<?xml version="1.0"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 
    "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="Card1" title="Using Tables">
        <p align="center"><b>Using Tables</b></p>
        <p align="center">
            <table columns="3">
                <tr>
                    <td><b>First Name</b></td>
                    <td><b>Last Name</b></td>
                    <td><b>Title</b></td>
                </tr>
                <tr>
                    <td>Fred</td>
                    <td>Simpson</td>
                    <td>Tycoon</td>
                </tr>
                <tr>
                    <td>Edward</td>
                    <td>Collingsworth</td>
                    <td>Adventurer</td>
                </tr>
                <tr>
                    <td>Nancy</td>
                    <td>Sherringford</td>
                    <td>Author</td>
                </tr>
            </table>
        </p>
    </card>
</wml>
=============================================================
<?xml version="1.0"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 
    "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="Card1" ontimer="#Card2" title="Using Timers">
        <p align="center"><b>Using Timers</b></p>
        <timer value="50"/>
        <p>
            In five seconds, you'll see card 2!
        </p>
    </card>
    <card id="Card2" title="Welcome">
        <p>
            This is card 2! 
        </p>
    </card>
</wml> 
=============================================================
<?xml version="1.0"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 
    "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="Card1" title="Using Images">
        <p align="center"><b>Using Images</b></p>
        <p align="center">
            <img alt="WML Image" src="wml.wbmp" width="253" height="120"/>
        </p>
    </card>
</wml>
=============================================================
<?xml version="1.0"?>
 <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
 <wml>
    <card id="Card1" title="Interfacing to Perl"> 
        <p align="center"><b>Interfacing to Perl</b></p>
        <p>
            Want to have Perl read some text?
        </p>
        <p>
            Enter your text here:
            <input type="text" name="data"/>
            <do type="accept" label="Go">
                <go href=
            "http://www.starpowder.com/steve/cgi/wmlreader.cgi?text1=$(data)"/>
            </do>
        </p>
    </card> 
</wml> 
=============================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header(-type=>"application/xml");
print "<?xml version = \"1.0\"?>",
"<!DOCTYPE wml PUBLIC '-//WAPFORUM//DTD WML 1.1//EN' 'http://www.wapforum.org/DTD/wml_1.1.xml'>",
"<wml>",
"<card id='Card1' title='Results'>";

if ($co->param()) {
       print "<p align='center'><b>Perl Interface</b></p>",
        "You entered this text: ", 
        $co->param('text1'); 
} else {
    print "Sorry, I did not see any text.";
}

print "</card></wml>"; 
=============================================================
<?xml version="1.0"?>
 <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
 <wml>
    <card id="Card1" title="Interfacing to Perl"> 
        <p align="center"><b>Interfacing to Perl</b></p>
        <p>
            Want to have Perl read some text?
        </p>
        <p>
            Enter your text here:
            <input type="text" name="data"/>
            <do type="accept" label="Go">
                <go method="post" 
                    href="http://www.starpowder.com/steve/cgi/wmlreader.cgi">
                    <postfield name="text1" value="$(data)"/>
                </go>
            </do>
        </p>
    </card> 
</wml>
=============================================================
<?xml version="1.0"?>
 <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
 <wml>
    <card id="Card1" title="Interfacing to Perl"> 
        <p align="center"><b>Interfacing to Perl</b></p>
        <p>
            Want to have Perl read some text?
        </p>
        <p>
             Enter your text here:
             <input type="text" name="data"/>
             <do type="accept" label="Go">
            <go method="post" 
                href="http://www.starpowder.com/steve/cgi/wmlreader2.cgi">
                <postfield name="text1" value="$(data)"/>
                <postfield name="text2" value="Hello again!"/>
            </go>
             </do>
        </p>
    </card> 
</wml> 
=============================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header(-type=>"application/xml");
print "<?xml version = \"1.0\"?>",
"<!DOCTYPE wml PUBLIC '-//WAPFORUM//DTD WML 1.1//EN' 'http://www.wapforum.org/DTD/wml_1.1.xml'>",
"<wml>",
"<card id='Card1' title='Results'>";

if ($co->param()) {
       print "<p align='center'><b>Perl Interface</b></p>",
        "You entered this text: ", 
        $co->param('text1'),
        " and ", 
        $co->param('text2'); 
} else {
    print "Sorry, I did not see any text.";
}

print "</card></wml>";  
=============================================================
!!!CODE28!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=============================================================
use LWP::Simple;
use HTML::TreeBuilder;
use HTML::FormatText;

$html = get("http://www.cpan.org");

$formatter = HTML::FormatText->new;

$tree_builder = HTML::TreeBuilder->new;

$tree_builder->parse($html);

$text = $formatter->format($tree_builder);

print $text;
=============================================================
use LWP::Simple;
use HTML::LinkExtor;

$html = get("http://www.cpan.org");

$link_extor = HTML::LinkExtor->new(\&handle_links);

$link_extor->parse($html);

sub handle_links
{
    ($tag, %links) = @_;

    if ($tag eq 'a') {

        foreach $key (keys %links) {

            if ($key eq 'href') {

                print "Found a hyperlink to $links{$key}.\n";

            }

        }
    }
}
=============================================================
use LWP::UserAgent;

$user_agent = new LWP::UserAgent;

$request = new HTTP::Request('GET', 
    'http://www.cpan.org/doc/FAQs/index.html');

$response = $user_agent->request($request);

open FILEHANDLE, ">file.txt";

print FILEHANDLE $response->{_content};

close FILEHANDLE;
=============================================================
use IO::Socket;

$socket = IO::Socket::INET->new
(
    Proto     => "tcp",
    PeerAddr  => "reference.perl.com",
    PeerPort  => 80,
);

$socket->autoflush(1);

print $socket "GET /query.cgi?cgi HTTP/1.0\015\012\015\012";

open FILEHANDLE, ">local.html";

while (<$socket>) {

    print FILEHANDLE;

}

close FILEHANDLE;

close $socket;
=============================================================
use LWP::Simple;
require HTML::Parser;

require HTML::LinkExtor;

$html = get("http://www.yourserver.com/~username/index.html");

$link_extor = HTML::LinkExtor->new(\&handle_links);

$link_extor->parse($html);

sub handle_links 
{

     ($tag, %links) = @_;

     if ($tag = 'a href' && $links{href} ne '') {

        $url = $links{href};

        $file = $url;
        $file =~ s/http:\/\/www\.//;
        $file =~ s/http:\/\///g;
        $file =~ tr/\//-/;

        print "Creating $file.\n";

        mirror ($url, $file);
     };
}
=============================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header,                    

$co->start_html(
    -title=>'CGI Example', 
    -author=>'Steve', 
    -BGCOLOR=>'white', 
    -LINK=>'red'
);

if ($co->param()) {

    print 

        "You entered this text: ", 

        $co->em($co->param('text1')), 

        " ",

        $co->em($co->param('text2')), 

        ".";

} else {

    print "Sorry, I did not see any text.";

}

print $co->end_html; 
=============================================================
use LWP::Simple;
use URI::URL;

$url = url('http://www.yourserver.com/~username/cgi/cgireader.cgi');

$url->query_form(text1 => 'Hello', text2 => 'there');

$html = get($url);

print $html;
=============================================================
use LWP::Simple;

$html = get
(
    'http://www.yourserver.com/~username/cgi/' .
    'cgireader.cgi?text1=Hello&text2=there'
);

print $html;
=============================================================
use HTTP::Request::Common; 
use LWP::UserAgent;

$user_agent = LWP::UserAgent->new;

$request = POST
    'http://www.yourserver.com/~username/cgi/cgireader.cgi',
    [text1 => 'Hello', text2 => 'there'];

$response = $user_agent->request($request);

print $response->as_string;
=============================================================
use IO::Socket;

print "Enter a value for text1: ";
chomp($text1 = <>);

print "Enter a value for text2: ";
chomp($text2 = <>);

$string = '?' . "text1=" . $text1 . "&" . "text2=" . $text2;

$string =~ tr/ /+/;

$socket = IO::Socket::INET->new
(
    Proto     => "tcp",
    PeerAddr  => "yourserver.com",
    PeerPort  => 80,
);

$socket->autoflush(1);

print $socket "GET /username/cgi/cgireader.cgi$string ',
    'HTTP/1.0\015\012\015\012";

while ($line = <$socket>){

    $html .= $line

}

close $socket;

print $html;
=============================================================
use HTTP::Daemon;  

$HTTPserver = HTTP::Daemon->new(Timeout => 600);

print "My URL is: ", $HTTPserver->url, ".\n";

while ($HTTPclient = $HTTPserver->accept) {

    $HTTPclient->autoflush(1);

    print $HTTPclient 
'<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<HTML>
<HEAD>
<TITLE>Welcome to my Web server!</TITLE>
</HEAD>

<BODY>

<CENTER>

<H1>Welcome to my Web server!</H1>

<p>
Do you like my Web server? Let me know...

</CENTER>

<FORM METHOD="POST" ENCTYPE="application/x-www-form-urlencoded">

<CENTER>
<TEXTAREA NAME="textarea" ROWS=10 COLS=60>
</TEXTAREA>

</CENTER>

</FORM>

</BODY>

</HTML>';

    $HTTPclient->close;
}
=============================================================
#!/usr/local/bin/perl

use CGI;                             

$co = new CGI;                        

print $co->header,                    

$co->start_html(
    -title=>'CGI Example', 
    -author=>'Steve', 
    -meta=>{'keywords'=>'CGI Perl'}, 
    -BGCOLOR=>'white', 
    -LINK=>'red'
);

if ($co->param()) {
    $! = 0;

    open FILEHANDLE, ">>reg.log";

    print FILEHANDLE "Date: " . `date`;
    print FILEHANDLE "Name: " . $co->param('name') . "\n";
    print FILEHANDLE "email: " . $co->param('email') . "\n";

    close FILEHANDLE;

    unless ($!) {
        print "Thanks for registering.";
    } else {
        print "Sorry, there was an error: $!";
    }
}

    print $co->end_html;                  

=========================================================================
use IO::Socket;

print "Type your name: ";
chomp($name = <>);

print "Type your email: ";
chomp($email = <>);

$string = '?' . "name=" . $name . "&" . "email=" . $email;
$string =~ tr/ /+/;

$socket = IO::Socket::INET->new
( 
    Proto     => "tcp",
    PeerAddr  => "yourserver.com",
    PeerPort  => 80,
);

$socket->autoflush(1);

print $socket "GET /~username/reg.cgi$string ',
    'HTTP/1.0\015\012\015\012";

while ($line = <$socket>) {
    $results .= $line
}

close $socket;
print $results;
if ($results =~ /Thanks for registering./mg) {

    print "Thanks for registering."

} else {

    print "Sorry, there was an error."

}


!!!CODEE1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
==================================================================
sub sig_handler {
    my $signal = shift;
    die "I got signal $signal";
}

$SIG{INT} = \&sig_handler;  

while(<>) {
    print;
}
==================================================================
$SIG{INT} = sub {
    my $signal = shift;
    die "I got signal $signal";
}

while(<>) {
    print;
}
==================================================================
sub do_not_interrupt_me 
{
    local $SIG{INT} = 'IGNORE';
    store(@bigdata);
}
==================================================================
@a= ("unlink", "delete_me.txt");

if(exec(@a)) {die "exec call failed: $?"}
==================================================================
@array= ("unlink", "delete_me.txt");

if(system(@array)) {die "The system call failed with this error: $?"}
==================================================================
require 'syscall.ph';               

$text = "Hello!";    

syscall(&SYS_write, fileno(STDOUT), $text, length $text);
==================================================================
open(FILEHANDLE, "printem |");

while (<FILEHANDLE>) {
    print;
}

close(FILEHANDLE);
==================================================================
$return_value = `program_name 1>&2`;

print $return_value;
==================================================================
open(PIPEHANDLE, "program_name 1>&2 |") or die "Could not open pipe.";

while (<PIPEHANDLE>) { 
    print;
}         
==================================================================
$return_value = `program_name 2>/dev/null`;

print $return_value;
==================================================================
$return_value = `program_name 2>&1 1>/dev/null`;

print $return_value;
==================================================================
if (open(CHILDHANDLE, "|-")) {

    print CHILDHANDLE "Here is the text.";
    close(CHILDHANDLE);

} else {

    print <>;
    exit;

}
==================================================================
use IO::Handle;

pipe(READHANDLE, WRITEHANDLE);

WRITEHANDLE->autoflush(1);
READHANDLE->autoflush(1);

if ($process_id = fork) {

    close READHANDLE;

    print WRITEHANDLE "Here ";
    print WRITEHANDLE "is ";
    print WRITEHANDLE "the ";
    print WRITEHANDLE "text.\n";

    close WRITEHANDLE;

    waitpid($process_id, 0);
==================================================================
use IO::Handle;

pipe(READHANDLE, WRITEHANDLE);

WRITEHANDLE->autoflush(1);
READHANDLE->autoflush(1);

if ($process_id = fork) {

    close READHANDLE;

    print WRITEHANDLE "Here ";
    print WRITEHANDLE "is ";
    print WRITEHANDLE "the ";
    print WRITEHANDLE "text.\n";

    close WRITEHANDLE;

    waitpid($process_id, 0);

} else {

    close WRITEHANDLE;

    while(defined($text = <READHANDLE>)) {
        print $text;
    }

    exit;
}
==================================================================
if (open(CHILDHANDLE, "-|")) {

    print <CHILDHANDLE>;
    close(CHILDHANDLE);
==================================================================
if (open(CHILDHANDLE, "-|")) {

    print <CHILDHANDLE>;
    close(CHILDHANDLE);

} else {

    print "Here is the text.";
    exit;

}
==================================================================
use IO::Handle;

pipe(READHANDLE, WRITEHANDLE);

WRITEHANDLE->autoflush(1);
READHANDLE->autoflush(1);

if ($process_id = fork) {

    close WRITEHANDLE;

    while (defined ($text = <READHANDLE>)) {
        print $text;
    }

    close READHANDLE;

    waitpid($process_id, 0);

} else {

    close READHANDLE;

    print WRITEHANDLE "Here ";
    print WRITEHANDLE "is ";
    print WRITEHANDLE "the ";
    print WRITEHANDLE "text.\n";

    exit;
}
==================================================================
if (open(CHILDHANDLE, "|-")) {

    $SIG{INT} = sub {print "Got the message.\n"};

    print CHILDHANDLE "$$";
    close(CHILDHANDLE);

} else {

    chomp($parentpid = <>);

    kill INT => $parentpid;

    exit;
}
==================================================================
if (kill 0 => $process_id) {

    print "Process $process_id is still alive!";

}
==================================================================
use IPC::Open2;
$process_id = open2(*READHANDLE, *WRITEHANDLE, "sender" );
==================================================================
use IPC::Open2;
$process_id = open2(*READHANDLE, *WRITEHANDLE, "sender" );

print WRITEHANDLE "Hello!\n";
$text = <READHANDLE>;

print $text;
==================================================================
use IO::Handle;

pipe(READFROMCHILD, WRITETOPARENT);
pipe(READFROMPARENT, WRITETOCHILD);

WRITETOPARENT->autoflush(1);
WRITETOCHILD->autoflush(1);
READFROMPARENT->autoflush(1);
READFROMCHILD->autoflush(1);

if ($pid = fork) {

    close READFROMPARENT;
    close WRITETOPARENT;

    print WRITETOCHILD "Parent says hi!\n";

    $data = <READFROMCHILD>;
    print "Parent read: $data";

    close READFROMCHILD;
    close WRITETOCHILD;

    waitpid(-1,0);

} else {

    close READFROMCHILD;
    close WRITETOCHILD;

    $data = <READFROMPARENT>;
    print "Child read: $data";

    print WRITETOPARENT "Child says hello!\n";

    close READFROMPARENT;
    close WRITETOPARENT;

    exit;
}
==================================================================
#!/usr/local/bin/perl
use IO::Handle;
STDOUT->autoflush(1);
STDERR->autoflush(1);

print STDERR "uh oh\n";

while (<>) {
    print;
}
==================================================================
use IPC::Open3;
$process_id = open3(*WRITEHANDLE, *READHANDLE, *ERRORHANDLE, "sender" );

print WRITEHANDLE "Hello!\n";

$text = <READHANDLE>;
print "STDOUT says: $text";

$errtext = <ERRORHANDLE>;
print "STDERR says: $errtext";
==================================================================
use POSIX "sys_wait_h";
use POSIX "signal_h";

$SIG{CHLD} = \$reaper;

sub reaper 
{
    $process_id = waitpid(-1, &WNOHANG);
    if (WIFEXITED($?)) {
        print "Child process exited.\n";
    }
    elsif (WIFSTOPPED($?)) {
        print "Child process stopped.\n";
    }
    $SIG{CHLD} = \$reaper;
}
==================================================================
$named_pipe = 'file.txt';

system('mknod', $named_pipe, 'p');

open (named_pipe, "> $named_pipe") or die "Can not create named pipe.";

print named_pipe "Hello!\n";

close named_pipe;
==================================================================
$named_pipe = 'file.txt';

while (1) {

    system('mknod', $named_pipe, 'p');

    open (named_pipe, "> $named_pipe") or die "Can not create named pipe.";

    print named_pipe "Hello!\n";

    close named_pipe;
}
==================================================================
==================================================================
use Win32::OLE;

$operand1 = '2';
$operand2 = '2';

$excelobject = Win32::OLE->new('Excel.Sheet');

$excelobject->Cells(1,1)->{Value} = $operand1;
$excelobject->Cells(2,1)->{Value} = $operand2;

$excelobject->Cells(3,1)->{Formula} = '=R1C1 + R2C1';

$sum = $excelobject->Cells(3,1)->{Value};

$excelobject->Quit();
print "According to Microsoft Excel, $operand1 + $operand2 = $sum.\n";
==================================================================
Option Explicit

Public NewValue As Single

Private Sub Class_Initialize()
    NewValue = 1
End Sub
==================================================================
Public Property Get SafeValue() As Variant

End Property

Public Property Let SafeValue(ByVal vNewValue As Variant)

End Property
==================================================================
Public Property Get SafeValue() As Single
    SafeValue = sngInternalSafeValue
End Property
==================================================================
Public Property Let SafeValue(ByVal vNewValue As Single)

    If vNewValue > 0 Then
        sngInternalSafeValue = vNewValue
    End If

End Property
==================================================================
Public Function ReturnSafeValue() As Single
    ReturnSafeValue = sngInternalSafeValue
End Function
==================================================================
Public Function Addem(Operand1 As Integer, Operand2 As Integer) As Integer
    Addem = Operand1 + Operand2
End Function
==================================================================
Public Sub ShowForm()
    Form1.Show
End Sub
==================================================================
use Win32::OLE;

$object = Win32::OLE->new('NewClass.ExampleClass');
==================================================================
$s = $object->{NewValue};
print "NewValue property returns: $s\n";
==================================================================
$object->{SafeValue} = 5;
$s2 = $object->SafeValue;
print "SafeValue was set to 5 and returns: $s2\n";
==================================================================
$s3 = $object->addem(2, 2);
print "addem(2, 2) = $s3\n";
==================================================================
$object->ShowForm;
==================================================================

!!!CODEE2!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=====================================================================
prinbt "Hello";

=====================================================================
@array = (1, 2, 3);

Dump(@array);
=====================================================================
$a = 1;

$b = 0;

$c = $a / $b;
=====================================================================
eval {

    $a = 1;

    $b = 0;

    $c = $a / $b;

};

if ($@) {print "Error: $@";}
=====================================================================
@array = (1, 2, 3);

$sum = 0;

for ($loop_index = 1; $loop_index <= $#array; $loop_index++) {

    $sum += $array[$loop_index];

}

print "The average value = ", $sum / ($#array + 1);
=====================================================================
@array = (1, 2, 3);

$sum = 0;

for ($loop_index = 0; $loop_index <= $#array; $loop_index++) {

    $sum += $array[$loop_index];

}

print "The average value = ", $sum / ($#array + 1);
=====================================================================
@array = (1, 2, 3);

$sum = 0;

foreach $element (@array) {

    $sum += $element;

}

print "The average value = ", $sum / ($#array + 1);
=====================================================================
$variable1 = 5;

$variable2 = 10;

$variable1 += 5;

print "\$variable1 = $variable1\n";

print "\$variable2 = $variable2\n";
=====================================================================
eval {

    $a = 1;

    $b = 0;

    $c = $a / $b;

};

if ($@) {print "Error: $@";}
=====================================================================
sub try (&) {

    my $code = shift;
    eval {&$code};
    if ($@) {print "Error: $@";}

};

try {

    $operand1 = 1;
    $operand2 = 0;
    $result = $operand1 / $operand2;

};
=====================================================================
local $SIG{__WARN__} = sub {print "Error!\n"}; 
=====================================================================
open (FILEHANDLE, "file.txt") or die ("Cannot open file.txt");
=====================================================================

!!!CODEE3!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
====================================================================
&ReadParse(*in);

print 
    "Here is the text: <EM>", 
    $in{'text'}, 
    "</EM>."; 
====================================================================
print &HtmlBot;
====================================================================
#!/usr/local/bin/perl

require 'cgi-lib.pl';

print &PrintHeader;

print &HtmlTop ("CGI Example Using cgi-lib.pl");

print 
'<BODY BGCOLOR="white" LINK="red"><P>

<CENTER>
<IMG SRC = "welcome.gif">,
</CENTER>

<CENTER>
<H1>Here is the Survey!</H1>
</CENTER>

<H2>Please fill out our survey...</H2>

Reasons for filling out our survey:
<P>
<UL>
<LI>Fame</LI> 
<LI>Fortune</LI> 
<LI>Fun</LI>
</UL>

If you would rather not fill out our survey, you might 
be interested in 
<A HREF="http://www.cpan.org/">CPAN</A>.

<HR>

<FORM METHOD="POST" 
ACTION="http://www.yourserver.com/~username/cgi/lib2.cgi" 
ENCTYPE="application/x-www-form-urlencoded">

Please enter your name: 
<INPUT TYPE="text" NAME="text" VALUE="">

<P>
Please enter your opinion: <P><TEXTAREA NAME="textarea" 
ROWS=10 COLS=60>No opinion</TEXTAREA>

<P>
Please indicate what products you use: 

<P>
<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Shampoo">
Shampoo 

<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Toothpaste">
Toothpaste 

<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Bread" CHECKED>
Bread 

<INPUT TYPE="checkbox" NAME="checkboxes" 
VALUE="Cruise missles" CHECKED>
Cruise missles 

<P>
Please indicate your income level: 

<P>
<SELECT NAME="list" SIZE=4>

<OPTION VALUE="Highest">
Highest

<OPTION SELECTED VALUE="High">
High

<OPTION VALUE="Medium">
Medium

<OPTION VALUE="Low">
Low

</SELECT>

<P>
Please indicate the day of the week: 

<P>
<INPUT TYPE="radio" NAME="radios" VALUE="1" CHECKED>
Sunday

<INPUT TYPE="radio" NAME="radios" VALUE="2">
Monday 

<INPUT TYPE="radio" NAME="radios" VALUE="3">
Tuesday 

<INPUT TYPE="radio" NAME="radios" VALUE="4">
Wednesday

<INPUT TYPE="radio" NAME="radios" VALUE="5">
Thursday 

<INPUT TYPE="radio" NAME="radios" VALUE="6">
Friday 

<INPUT TYPE="radio" NAME="radios" VALUE="7">
Saturday 

<P>
Please enter your password: 

<P>
<INPUT TYPE="password" NAME="password" VALUE="open sesame" SIZE=30>

<P>
Thank you for filling out our Survey. Please indicate how  
much unsolicited mail you like to get: 

<SELECT NAME="popupmenu">

<OPTION  VALUE="Very much">
Very much

<OPTION  VALUE="A lot">
A lot

<OPTION  VALUE="Not so much">
Not so much

<OPTION  VALUE="None">
None

</SELECT>

<P>
<INPUT TYPE="hidden" NAME="hiddendata" VALUE="Rosebud">

<CENTER>

<INPUT TYPE="submit" NAME="submit"> 

<INPUT TYPE="reset">

</CENTER>

<HR>

</FORM>';

print &HtmlBot;
====================================================================
#!/usr/local/bin/perl

require 'cgi-lib.pl';

print &PrintHeader;

print &HtmlTop ("CGI Example Using cgi-lib.pl");

print 

'<BODY BGCOLOR="white" LINK="red">

<CENTER>

<H1>Thanks for filling out our survey.</H1>

</CENTER>

<H3>Here are your responses...</H3><HR>';

if (&ReadParse(*in)) {

print 
    "Your name is: <EM>", $in{'text'}, 
    "</EM>.", 
    "<p>", 

    "Your opinions are: <EM>", $in{'textarea'}, 
    "</EM>.", 
    "<p>",

    "You use these products: <EM>", 
    join(", ", &SplitParam($in{'checkboxes'})), 
    "</EM>.", 
    "<p>",

    "Your income level is: <EM>",$in{'list'}, 
    "</EM>.", 
    "<p>",

    "Today is day <EM>", $in{'radios'}, 
    "</EM> of the week.", 
    "<p>",

    "Your password is <EM>", $in{'password'}, 
    "</EM>.", 
    "<p>",

    "How much unsolicited mail you like: <EM>", $in{'popupmenu'}, 
    "</EM>.", 
    "<p>",

    "The hidden data is <EM>", $in{'hiddendata'}, 
    "</EM>."; 
}
     
print &HtmlBot;
====================================================================
<html>

<head>

<title>CGI Example Using cgi-lib.pl</title>

</head>

<body>

<h1>CGI Example Using cgi-lib.pl</h1>

<BODY BGCOLOR="white" LINK="red">

<P>

<CENTER>
<IMG SRC = "welcome.gif">,
</CENTER>

<CENTER>
<H1>Here is the Survey!</H1>
</CENTER>

<H2>Please fill out our survey...</H2>

Reasons for filling out our survey:
<P>

<UL>

<LI>Fame</LI> 
<LI>Fortune</LI> 
<LI>Fun</LI>

</UL>

If you would rather not fill out our survey, you might 
be interested in 
<A HREF="http://www.cpan.org/">CPAN</A>.

<HR>

<FORM METHOD="POST" 
ACTION="http://www.yourserver.com/~username/cgi/lib2.cgi" 
ENCTYPE="application/x-www-form-urlencoded">

Please enter your name: 
<INPUT TYPE="text" NAME="text" VALUE="">

<P>
Please enter your opinion: 
<P>
<TEXTAREA NAME="textarea" ROWS=10 COLS=60>
No opinion
</TEXTAREA>

<P>
Please indicate what products you use: 

<P>
<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Shampoo">
Shampoo 

<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Toothpaste">
Toothpaste 

<INPUT TYPE="checkbox" NAME="checkboxes" VALUE="Bread" 
CHECKED>Bread 

<INPUT TYPE="checkbox" NAME="checkboxes" VALUE=
"Cruise missles" CHECKED>Cruise missles 

<P>
Please indicate your income level: 
<P>
<SELECT NAME="list" SIZE=4>

<OPTION VALUE="Highest">
Highest

<OPTION SELECTED VALUE="High">
High

<OPTION VALUE="Medium">
Medium

<OPTION VALUE="Low">
Low

</SELECT>

<P>
Please indicate the day of the week: 

<P>
<INPUT TYPE="radio" NAME="radios" VALUE="1" CHECKED>
Sunday

<INPUT TYPE="radio" NAME="radios" VALUE="2">
Monday 

<INPUT TYPE="radio" NAME="radios" VALUE="3">
Tuesday 

<INPUT TYPE="radio" NAME="radios" VALUE="4">
Wednesday

<INPUT TYPE="radio" NAME="radios" VALUE="5">
Thursday 

<INPUT TYPE="radio" NAME="radios" VALUE="6">
Friday 

<INPUT TYPE="radio" NAME="radios" VALUE="7">
Saturday 

<P>
Please enter your password: 

<P>
<INPUT TYPE="password" NAME="password" VALUE="open sesame" SIZE=30>

<P>
Thank you for filling out our Survey. Please indicate how  
much unsolicited mail you like to get: 

<SELECT NAME="popupmenu">

<OPTION  VALUE="Very much">
Very much

<OPTION  VALUE="A lot">
A lot

<OPTION  VALUE="Not so much">
Not so much

<OPTION  VALUE="None">
None

</SELECT>

<P>
<INPUT TYPE="hidden" NAME="hiddendata" VALUE="Rosebud">

<CENTER>
<INPUT TYPE="submit" NAME="submit"> 
<INPUT TYPE="reset">
</CENTER>

<HR>

</FORM>

</body>

</html>
====================================================================
<html>

<head>

<title>CGI Example Using cgi-lib.pl</title>

</head>

<body>

<h1>CGI Example Using cgi-lib.pl</h1>

<BODY BGCOLOR="white" LINK="red">

<CENTER>
<H1>Thanks for filling out our survey.</H1>
</CENTER>

<H3>Here are your responses...</H3>

<HR>

Your name is: <EM>George</EM>.

<p>
Your opinions are: <EM>No opinion</EM>.

<p>
You use these products: <EM>Bread, Cruise missles</EM>.

<p>
Your income level is: <EM>High</EM>.

<p>
Today is day <EM>1</EM> of the week.

<p>
Your password is <EM>open sesame</EM>.

<p>
How much unsolicited mail you like: <EM>Very much</EM>.

<p>
The hidden data is <EM>Rosebud</EM>.

</body>

</html>
====================================================================
#!/usr/local/bin/perl

require 'cgi-lib.pl';

print &PrintHeader;

print &HtmlTop ("CGI Example Using cgi-lib.pl");

if (&ReadParse(*in)) {

    print &PrintVariables;

}

print &HtmlBot;
====================================================================
