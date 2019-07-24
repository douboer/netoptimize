##################################################################################
### constant variables define in this file
### 
##################################################################################
### AUTHOR:  6/04/2013 Chengan
### VERSION: 6/04/2013 moved constant variables from other pl files
##################################################################################

package Mconstants;

use strict;
use File::Spec;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = (
    'DBG_FUNC',
    'DBG_AC_FH',
    'DBG_AP_FH',
    'DBG_HOT_FH',
    'DBG_APID_SERI',
    'DBG_AP',
    'DBG_ACAP',
    'DBG_CB',
    'DBG_KPI',

    'ENABLED_CHANNELBUSY',
    'ENABLED_AP_INFO',
    'ENABLED_AP_CLIENTS_INFO',
    'ENABLED_CONNECT_HISTORY',
    'ENABLED_RADIO_STATISTICS',
    'ENABLED_CLIENT_INFO',

    'ENABLED_PRINT_11N',

    '$acdir',
    '$exportdir',
    '$resultdir',
    '$bindir',

    '$logfn',
    '$dbgfn',
    '$telnetdbg',
    '$telnetlog',

    '$acexportfn',
    '$apexportfn',
    '$hotexportfn',

    '%ac_tab_cols',
    '%ap_tab_cols',
    '%hot_tab_cols',

    '@gap',
    '@gap2',
    '@gr',
    '@gr2',
    '@gr_cb',
    '@gr_frametype',
    '@gr_pkt_size',
    '@gr_transmit',
    '@gr_receive',
    '@gr_11grate',
    '@gr_11nrate',
);

our %EXPORT_TAGS = (
    const_switch=>
    [
    'DBG_FUNC',
    'DBG_AC_FH',
    'DBG_AP_FH',
    'DBG_HOT_FH',
    'DBG_APID_SERI',
    'DBG_AP',
    'DBG_ACAP',
    'DBG_CB',
    'DBG_KPI',

    'ENABLED_CHANNELBUSY',
    'ENABLED_AP_INFO',
    'ENABLED_AP_CLIENTS_INFO',
    'ENABLED_CONNECT_HISTORY',
    'ENABLED_RADIO_STATISTICS',
    'ENABLED_CLIENT_INFO',

    'ENABLED_PRINT_11N'
    ],

    const_var=>
    [
    '$acdir',
    '$exportdir',
    '$resultdir',
    '$bindir',

    '$logfn',
    '$dbgfn',
    '$telnetdbg',
    '$telnetlog',

    '$acexportfn',
    '$apexportfn',
    '$hotexportfn'
    ],

    const_col=>
    [
    '%ac_tab_cols',
    '%ap_tab_cols',
    '%hot_tab_cols',
    '@gap',
    '@gap2',
    '@gr',
    '@gr2',
    '@gr_cb',
    '@gr_frametype',
    '@gr_pkt_size',
    '@gr_transmit',
    '@gr_receive',
    '@gr_11grate',
    '@gr_11nrate',
    ]
);

use constant DBG_FUNC                 =>0;

# dump HASH information to dbgfn
use constant DBG_AC_FH                =>1;
use constant DBG_AP_FH                =>1;
use constant DBG_HOT_FH               =>1;
use constant DBG_APID_SERI            =>1;
use constant DBG_AP                   =>1;
use constant DBG_ACAP                 =>1;
use constant DBG_CB                   =>1;
use constant DBG_KPI                  =>1;

# enable/disable functions
use constant ENABLED_CHANNELBUSY      =>1;
use constant ENABLED_AP_INFO          =>0;
use constant ENABLED_AP_CLIENTS_INFO  =>0;
use constant ENABLED_CONNECT_HISTORY  =>0;
use constant ENABLED_RADIO_STATISTICS =>0;
use constant ENABLED_CLIENT_INFO      =>0;
use constant ENABLED_PRINT_11N        =>0;

our $acdir       = ".\\AClist";
our $exportdir   = ".\\exportfiles";
our $resultdir   = ".\\outputs";
our $bindir      = ".\\binfiles";

our $logfn       = "logfn";
our $dbgfn       = "dbgfn";
our $telnetdbg   = "telnetdbg";
our $telnetlog   = "telnetlog";

#our $acexportfn  = File::Spec->catfile($exportdir,"acexportzhoushan.csv");
#our $apexportfn  = File::Spec->catfile($exportdir,"apexportzhoushant.csv");
#our $apexportfn  = File::Spec->catfile($exportdir,"apexportzhoushan.csv");
#our $hotexportfn = File::Spec->catfile($exportdir,"hotexportzhoushan.csv");

#our $acexportfn  = File::Spec->catfile($exportdir,"compAC.csv");
#our $apexportfn  = File::Spec->catfile($exportdir,"compAP.csv");
#our $hotexportfn = File::Spec->catfile($exportdir,"compHOT.csv");

our $acexportfn  = File::Spec->catfile($exportdir,"tAC.csv");
our $apexportfn  = File::Spec->catfile($exportdir,"tAP.csv");
our $hotexportfn = File::Spec->catfile($exportdir,"tHOT.csv");


# the column number of needed information
our %ac_tab_cols =
(
    acnocol     =>0,
    acnamecol   =>1,
    acipaddcol  =>2,
    acusercol   =>8,
    acpwdcol    =>9
);
our %ap_tab_cols =
(
    apidcol     =>0,
    apsericol   =>38,
    apnamecol   =>1,
    apipcol     =>12,
    apmaccol    =>13,
    apacnamecol =>37,
    hotnamecol  =>19
);
our %hot_tab_cols =
(
    hotcitycol  =>6,
    hotnamecol  =>2,
    hotaccol    =>32
);

####################################################
# some kpi name constant list
####################################################
# for ap/ac/hot compute accumulation value
our @gap = (
    "assoc_hist",
    "reassoc_hist",
    "assoc_fail_hist",
    #"except_deauth_hist",
    "tran_data_pkts",
    "tran_ctl_pkts",
    "recv_data_pkts",
    "recv_ctl_pkts",
    "conn_cnt",
    #"num_client",
);
# only for ap
our @gap2 = (
    #"curr_num_radio",
    "max_num_radio",
    "numradio"
    #"priority_level",
    #"echo_interval",
    #"client_idle_interval",
);
# only for ap
our @gr = (
    "power",
    "channel_num",
    "wireless_mode",
);
# for ap/ac/hot  compute average value
our @gr2 = (
    "avg_rssi",
    "avg_rx_rate",
    "avg_tx_rate",
    "num_client",
    "opr_rate",
    "resource_ratio",
    "noise_floor"
);
# for ap/ac/hot compute average value
our @gr_cb = (
    #"date",
    #"time",
    #"channel",
    "channelbusy",
    "rxbusy",
    "txbusy"
);
our @gr_frametype = (
    "transmit",
    "receive"
);
# for ap/ac/hot compute accumuation value
our @gr_pkt_size = (
    "le_128",
    "between_128_512",
    "between_512_1024",
    "gt_1024"
);
# for ap/ac/hot compute accumuation value
our @gr_transmit = (
    "total_frame",
    "unicast_frame",
    "broad_multi_frame",
    "others_frame",
    "discard_frame",
    "retry_frame"
);
# for ap/ac/hot compute accumuation value
our @gr_receive = (
    "total_frame",
    "unicast_frame",
    "broad_multi_frame"
);
# for ap/ac/hot compute accumuation value
our @gr_11grate = ("1","2","5.5","6","9","11","12","18","24","36","48","54");
# for ap/ac/hot compute accumuation value
our @gr_11nrate = ("6.5","13","13.5","15","19.5","26","27","30","39","40.5",
    "45","52","54","58.5","60","65","72.2","78","81","90","104","108",
    "117","120","121.5","130","135","144.4","150","156","162","173.3",
    "175.5","180","195","216","216.7","240","243","270","300","324","360","364.5","405","450");

1;
