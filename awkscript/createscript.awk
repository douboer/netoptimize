###################################################################################################################
# FUNCTION: create AC script to collect channel busy
# PARAMETERS: NONE
# INPUT: AC ap information tables
# OUTPUT: txt
###################################################################################################################
#
# AUTHOR: chengan, Chinatelecom, Zhejiang
# VERSION: 2013/2/25 0.1
#
###################################################################################################################

BEGIN {

    indir     = ".\\AClist";
    scriptdir = ".\\scripts";
    resultdir = ".\\outputs";
    tcmd      = "DIR \/B " indir;

    logfn="logfn.txt"
    #debug="debug"
    #printf "" > logfn;
    #printf "" > debug;
    print "\n################" strftime("%Y/%m/%d %H:%M:%S - ", systime()) "######################" \
    >> logfn;

    # abstract values from input file
    #progidx = 0;
    #step    = 10;

    while(tcmd | getline inputfn)
    {
        if(toupper(inputfn)!~/^AC.*\.CSV$/) continue;
        inputfn = trim(inputfn);
        scriptfn = indir "\\" inputfn;

        resultfn = scriptdir "\\script_" substr(inputfn,0,length(inputfn)-3) "txt";

        match(inputfn,"[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}");
        acip = substr(inputfn,RSTART,RLENGTH);

        print "\nstart createScripts() for AC IP - " acip " ... ";
        printf "" > resultfn;
        createScripts("\"" scriptfn "\"");
        print "finish createScripts() ... \n";
    }
}

function createScripts(inputfn,_ARGVEND_,apname,apip,line,arr)
{
    while("TYPE " inputfn | getline line)
    {
        # skip lines start with #
        if (line~/^[ \t]*#.*$/) continue;

        # parse line
        split(line,arr,",");
        apname = arr[7];
        apip   = arr[9];

        printf apScript(apname,apip) >> resultfn;
    }
}

function apScript(apname, apip, _ARGVEND_, ret, i)
{
    ret="#\n\
sys\n\
_h\n\
wlan ap-execute " apname " telnet enable\n";
    ret = ret "wlan ap-execute " apname " exec-control enable\n";
    ret = ret "quit\n\
quit\n\
#\n\
telnet " apip "\n";
    for(i=1;i<=32;i++) ret = ret "#\n";
    ret = ret "sys\n\
_h\n\
display ar5drv 1 channelbusy\n\
#\n\
display ar5drv 2 channelbusy\n\
#\n\
quit\n\
quit\n\
quit\n"
    for(i=1;i<=80;i++) ret = ret "#\n";

    return ret;
}

function trim(str)
{
    sub("^[ \t]*", "", str);
    sub("[ \t]*$", "", str);
    return str
}
