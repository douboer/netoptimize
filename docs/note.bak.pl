$$telnet = new Net::Telnet( Timeout=>7, 
Errormode=> sub { &report_error($error_msg); },
) or die "Bang, ya got me...$!"; 



my $t = new Net::Telnet (Timeout => '30',
                         Errmode => 'return',
                        );
my $openResult = $t->open("$remoteHost");
  if ($openResult eq 1){
    my $loginResult = $t->login($username, $password);

    if ($loginResult eq 1){
      @lines = $t->cmd("your_command_here");
    } else {
      $lines[0] = "Error logging into device: '" . $t->errmsg . "' \n"
+;
    }
    $t->close;
  } else {
    $lines[0] = "Error connecting to device: '" . $t->errmsg . "' \n";
  }




my $connection;

while(1) {

    # the connect method either returns a valid connection object or undef, ERR_MSG
    print "Trying to connect.....";
    ($connection, my $error) = connect();

    if ( $connection ) {
        print "Connected OK!\n";
      last;
    }
    else {
        print "Connect failed error: $error, retry in 5 sec.\n";
        sleep 5;
    }
}
# now do stuff with your $connection



netgear 65
bell    84  wz
zte     95
h3c     40



perl时间差计算

看到网上有很多人在问，perl中计算时间差问题，很多人只介绍一种方法，我把我想到的方法都列一下，希望对大家有帮助。

一、time函数

time函数是返回距1970年1月1日0点到现在的秒数：

code:
#!/usr/bin/perl
use 5.12.0;
use warnings;
use strict;
my $now1 = time;
say "$now1";
for(my $i=0;$i<60000000;$i++){
}
my $now2 = time;
say "$now2";
my $diff = $now2 - $now1;
say "$diff";

[root@xxx ~]# perl test.pl
1308031555
1308031559
4

二、Time::Local模块

timelocal和time功能有点类似

code:
#!/usr/bin/perl
use 5.12.0;
use warnings;
use strict;
use Time::Local;
my $now1=timelocal(localtime());
say "$now1";
for(my $i=0;$i<60000000;$i++){
}
my $now2=timelocal(localtime());
say "$now2";
 
my $diff=$now2-$now1;
say "$diff";

[root@xxx ~]# perl test.pl
1308034537
1308034541
4

三、Time::Piece和Time::Seconds
这两个module和第二种差不多，但取数据可以多样化，按秒取，按小时取等等

#!/usr/bin/perl
use 5.12.0;
use warnings;
use strict;
#!/usr/bin/perl
use 5.12.0;
use warnings;
use strict;
use Time::Piece;
use Time::Seconds;
my $now1=localtime();
say "$now1";
for(my $i=0;$i<60000000;$i++){
}
my $now2=localtime();
say "$now2";
 
my $diff=$now2-$now1;
say "seconds diff:",$diff->seconds;
say "minutes diff:",$diff->minutes;

[root@xxx ~]# perl test.pl
Tue Jun 14 15:22:46 2011
Tue Jun 14 15:22:50 2011
seconds diff:4
minutes diff:0.0666666666666667

四、Time::HiRes

这个module厉害，能统计到百万分之一秒

#!/usr/bin/perl
use 5.12.0;
use warnings;
use strict;
use Time::HiRes qw(gettimeofday tv_interval);
 
my $now1=[gettimeofday];
say "$now1";
for(my $i=0;$i<60000000;$i++){
}
my $now2=[gettimeofday];
say "$now2";
 
my $diff = tv_interval $now1,$now2;
say "$diff";

[root@xxx ~]# perl test.pl
ARRAY(0x8b3d488) --内存中地址
ARRAY(0x8b3d4b8)
4.525164


