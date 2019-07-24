###################################################################################################################
# FUNCTION: parse following files:
#             信道繁忙率.log
#           to abstract or calculator performance indicators,
#             apname, name of AP
#             apipaddr, ip address of AP
#             apnode, node of AP
#             dirname, dirname of AP, such as 9点
#             ctlbusy, channel busy indicator
#             txbusy, transmittion busy indicator
#             rxbusy, receiver busy indicator
# PARAMETERS: NONE
# INPUT: file path to be analysis
# OUTPUT: CSV file with results
###################################################################################################################
#
# AUTHOR: chengan, Chinatelecom, Zhejiang
# VERSION: 2013/2/25 0.1
#
###################################################################################################################

BEGIN {

    acdir      = ".\\AClist";
    resultdir  = ".\\outputs";
    collectdir = trim(ARGV[ARGC-1]);  # channel busy original data

    outfn="data_output_" dirname ".csv"
    logfn="logfn.txt"
    dbgfn="debug"
    printf "" > dbgfn;

    printlog("\n################" strftime("%Y/%m/%d %H:%M:%S - ", systime()) "######################");

    # abstract values from input file
    progidx = 0;
    step    = 10;

    # get aclist
    printlog("get AC list ");
    idx = 1;
    tcmd = "DIR \/B " acdir;
    while(tcmd | getline line)
    {
        line = trim(line);
        if(toupper(line)!~/^.+\.CSV$/)
        {
            printlog(line " - is not a *.CSV file, skip it!");
            continue;
        }
        match(line,"[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}");
        if(RSTART==0)
        {
            printlog(line " - filename is not contain AC IP address, skip it!");
            continue;
        }

        acipArr[idx] = substr(line,RSTART,RLENGTH);
        acfnArr[idx] = acdir "\\" line;

        idx ++;
    }
    numac = idx-1;
    printlog("find " numac " AC files");

    # parse collection original channel busy data files
    printlog("parse collection original channel busy data files");
    tcmd = "DIR \/B " collectdir;
    # specified the output results filename and clean the file content
    resultfn  = resultdir "\\" collectdir "_channelbusy.csv"; printf "" > resultfn;
    printlog("resultfn - " resultfn);
    # print header of results file
    print "#城市名称,区县,分局,热点名称,厂家,型号,AP编号,设备名称,IP地址," \
          "采集时间,信道繁忙率,发送繁忙率,接收繁忙率" \
          >> resultfn;
    space = ""; # XXXXX ONLY TO FIXED THE AWK'S BUG, THE SAME WHILE COMMAND ONLY EXECUTE ONETIME,SEE D:SCRIPTS\TESTWHILE.AWK
    while (tcmd | getline line)
    {
        line = trim(line);

        match(line,/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/);
        if(RSTART==0)
        {
            printlog(collectdir "\\" line " - channel busy filename is not contain AC IP address, skip it!");
            continue;
        }

        collectfn = collectdir "\\" line;
        collectip = substr(line,RSTART,RLENGTH); # AC ip
        #resultfn  = resultdir "\\ac_" collectip "_channelbusy.csv"; printf "" > resultfn;

        # find ac file
        for(i=1;i<=numac;i++)
        {
            if(collectip==acipArr[i])
            {
                iacfn = acfnArr[i];
                break;
            }
        }

        space = space " "; # XXXXX ONLY TO FIXED THE AWK'S BUG, THE SAME WHILE COMMAND ONLY EXECUTE ONETIME,SEE D:SCRIPTS\TESTWHILE.AWK
        printlog("\nstart parse AC file - " iacfn " ... ");
        parseAcFile(iacfn space);
        printlog("start parse AC file... ");

        printlog("\nstart parse Channel busy file - " acip " ... ");
        parseChannelBusyFile(collectfn);
        printlog("finish parse Channel busy file - ... ");

        printlog("\nstart print Channel Busy File ...");
        printChannelBusyFile(resultfn);
        printlog("finish print Channel Busy File ...");

        printlog("\nstart freeMemory ...");
        freeMem();
        printlog("finish freeMemory ...\n");
    }
}

function parseAcFile(fn,_ARGVEND_,line,arr,idx)
{
    # parse AC file
    idx   = 1;
    numap = 1;
    while("TYPE \"" fn "\"" | getline line)
    {
        # skip lines start with # and blank line
        if (line~/^[ \t]*#.*$/ || line~/^[ \t]*$/) continue;

        # parse line
        split(line,arr,",");
        apinfoArr[idx] = line;
        apipArr[idx]   = trim(arr[9]);

        idx ++;
    }
    numap = idx - 1;
    printlog(numap " APs in AC file " fn);
}

function parseChannelBusyFile(fn,_ARGVEND_,line,i,ipadd,state)
{
    # abstract CtlBusy,TxBusy,RxBusy from "信道繁忙率.log"
    printlog("abstract CtlBusy,TxBusy,RxBusy from " fn " ...");
    numapcb = 1;          # number of APs in channel busy file
    state   = "initial";  # initialized state
    while("TYPE \"" fn "\"" | getline line)
    {
        # skip some lines
        if (line~/^\s*$/ || line~/^\*.*$/ || line~/^Trying.*$/ || line~/^Press.*$/ \
            || line~/^Connected.*$/ || line~/^System.*$/ || line~/^Now.*$/)
            continue;
        # parse ip address
        else if (state=="initial" && line~/^.+>telnet .+$/)
        {
            match(line,/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/);
            ipadd = substr(line,RSTART,RLENGTH);
            #printlog("ipadd " ipadd);

            # initialized apidx to -1;
            apidx = -1;
            for(i=1;i<=numap;i++)
            {
                if(ipadd==apipArr[i])
                {
                    # save found ap index
                    apidx = i;
                    break;
                }
            }

            # do not find the AP's ip in ac list, turn to "initial" state
            (apidx==-1)?(state="initial") \
                       :(state="telnet");

            printdbg("state " state);
        }
        else if (state=="telnet" && line~/^.*Date\/Month\/Year.*$/)
        {
            match(line,/[0-9]{2}\/[0-9]{2}\/[0-9]{4}/);
            dateArr[numapcb] = substr(line,RSTART,RLENGTH);

            # do not change the state
            continue;
        }
        # header of busy values
        else if (state=="telnet" && line~/^.+Time.+CtlBusy.+TxBusy.+RxBusy.+$/)
        {
            ctlbusyidx = 0;
            txbusyidx  = 0;
            rxbusyidx  = 0;

            ctlbusysum = 0;
            txbusysum  = 0;
            rxbusysum  = 0;

            # whether or not find the right channel busy record
            # initialized to 0
            flag = 0;

            state = "busyvalues";


            continue;
        }
        #  01     09:03:53            4           0        3
        else if (state=="busyvalues" && match(line,/[0-9]+ +.+ +[0-9]+ +[0-9]+ +[0-9]+/))
        {

            printlog("test.   ----");


            # only use the first 
            if (flag) continue;
            split(line,arr," ");

            if (arr[1]~/01/)  # save first record
            {
                timeArr0    = arr[2];
                ctlbusyArr0 = arr[3];
                txbusyArr0  = arr[4];
                rxbusyArr0  = arr[5];
            }

            # skip channel busy value is 100
            #if( arr[3]~/100/ || arr[4]~/100/ || arr[5]~/100/ ) # discard this record
            if(line!~/100/)
            {
                timeArr[numapcb]    = arr[2];
                ctlbusyArr[numapcb] = arr[3];
                txbusyArr[numapcb]  = arr[4];
                rxbusyArr[numapcb]  = arr[5];

                flag = 1; # find the record
            }

            if (arr[1]~/07/) # do not find the record, use first record
            {
                timeArr[numapcb]    = timeArr0;
                ctlbusyArr[numapcb] = ctlbusyArr0;
                txbusyArr[numapcb]  = txbusyArr0;
                rxbusyArr[numapcb]  = rxbusyArr0;

                flag = 1;
            }

            if(flag==1)
            {
                apidxArr[numapcb] = apidx;
                numapcb ++;

                # find the value, state turn to "initial"
                state="initial";
            }
            continue;

            ###############################################################
            # use average value, deleted
            ###############################################################
            if(0) { ## xxxx
            split(line,arr," ");
            if(arr[3]!=100)
            {
                ctlbusyidx ++;
                ctlbusysum += arr[3];
            }
            if(arr[4]!=100)
            {
                txbusyidx ++;
                txbusysum += arr[4];
            }
            if(arr[5]!=100)
            {
                rxbusyidx ++;
                rxbusysum += arr[5];
            }
            # to last busyvalues record
            if (arr[1]==20)
            {
                ctlbusyArr[numapcb] = ctlbusysum/ctlbusyidx;
                txbusyArr[numapcb] = txbusysum/txbusyidx;
                rxbusyArr[numapcb] = rxbusysum/rxbusyidx;

                ##DEBUG
                print apnameArr[numapcb] " " ctlbusyArr[numapcb] " " txbusyArr[numapcb] " " rxbusyArr[numapcb] >> dbgfn;
            }
            } ## xxxx
            ###############################################################
        }
        else
            continue;
    }
    printlog("abstract " numapcb " channel busy records!");
}

function printChannelBusyFile(fn,_ARGVEND_,idx)
{
    # print results to output file
    for(i=1;i<=numapcb;i++)
    {
        idx = apidxArr[i];
        printdbg("i " i " idx " idx);
        if(apinfoArr[idx]!~/^[ \t]*$/)
        {
            print \
                apinfoArr[idx] "," \
                dateArr[i] " " timeArr[i] "," \
                ctlbusyArr[i] "," \
                txbusyArr[i] "," \
                rxbusyArr[i] \
                >> fn;
        }
    }
    printlog("write channel busy information to file - " fn);
}

function printlog(str,_ARGVEND_,mlogfn)
{
    mlogfn = logfn;

    print str ;
    print str >> logfn;
}

function printdbg(str,_ARGVEND_,mdbgfn)
{
    mdbgfn = dbgfn;
    print str >> dbgfn;
}

####################################################################
## free memory after print output
####################################################################
function freeMem(_ARGVEND_,any)
{
    for(any in arr)          delete arr[any];

    for(any in apinfoArr)    delete apinfoArr[any];
    for(any in apipArr)      delete apipArr[any];

    for(any in dateArr)      delete dateArr[any];
    for(any in timeArr)      delete timeArr[any];
    for(any in ctlbusyArr)   delete ctlbusyArr[any];
    for(any in txbusyArr)    delete txbusyArr[any];
    for(any in rxbusyArr)    delete rxbusyArr[any];
    for(any in apidxArr)     delete apidxArr[any];
}

function trim(str)
{
    sub("^[ \t]*", "", str);
    sub("[ \t]*$", "", str);
    return str
}
