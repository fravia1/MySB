
-- Table: users_addresses
CREATE TABLE users_addresses ( 
    id_users_addresses INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                       NOT NULL ON CONFLICT ABORT
                                       UNIQUE ON CONFLICT ABORT,
    id_users           INTEGER         NOT NULL ON CONFLICT ABORT,
    ipv4               VARCHAR( 15 )   NOT NULL ON CONFLICT ABORT,
    hostname           VARCHAR( 256 )  NOT NULL ON CONFLICT ABORT,
    check_by           VARCHAR( 8 )    NOT NULL ON CONFLICT ABORT,
    is_active          BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                       DEFAULT ( 0 ) 
);


-- Table: ports
CREATE TABLE ports ( 
    id_ports INTEGER PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                     NOT NULL ON CONFLICT ABORT
                     UNIQUE ON CONFLICT ABORT,
    value    INTEGER NOT NULL ON CONFLICT ABORT
                     UNIQUE ON CONFLICT IGNORE 
);


-- Table: renting
CREATE TABLE renting ( 
    id_renting      INTEGER( 1, 1 )  PRIMARY KEY ON CONFLICT IGNORE
                                     NOT NULL ON CONFLICT ABORT,
    model           VARCHAR( 64 ),
    tva             NUMERIC,
    global_cost     NUMERIC,
    nb_users        NUMERIC( 2 ),
    price_per_users NUMERIC( 2 ) 
);

INSERT INTO [renting] ([id_renting], [model], [tva], [global_cost], [nb_users], [price_per_users]) VALUES (1, null, null, null, null, null);

-- Table: vars
CREATE TABLE vars ( 
    id_vars            INTEGER( 1, 1 )  PRIMARY KEY ON CONFLICT IGNORE
                                        NOT NULL ON CONFLICT ABORT,
    fail2ban_whitelist VARCHAR( 12 ),
    vpn_ip             VARCHAR( 37 ),
    white_tcp_port_out VARCHAR( 16 ),
    white_udp_port_out VARCHAR( 16 ) 
);

INSERT INTO [vars] ([id_vars], [fail2ban_whitelist], [vpn_ip], [white_tcp_port_out], [white_udp_port_out]) VALUES (1, '127.0.0.1/32', '10.0.0.0/24,10.0.1.0/24', '80 443', null);

-- Table: users
CREATE TABLE users ( 
    id_users      INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                  NOT NULL ON CONFLICT ABORT
                                  UNIQUE ON CONFLICT ABORT,
    users_ident   VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT
                                  UNIQUE ON CONFLICT IGNORE,
    users_email   VARCHAR( 260 )  NOT NULL ON CONFLICT ABORT
                                  UNIQUE ON CONFLICT IGNORE,
    users_passwd  VARCHAR( 32 ),
    rpc           VARCHAR( 64 ),
    sftp          BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                  DEFAULT ( 1 ),
    sudo          BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                  DEFAULT ( 0 ),
    admin         BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                  DEFAULT ( 0 ),
    scgi_port     INTEGER( 5 ),
    rtorrent_port INTEGER( 5 ),
    home_dir      VARCHAR( 128 ) 
);


-- Table: blocklists_peerguardian
CREATE TABLE blocklists_peerguardian ( 
    id_blocklists_peerguardian INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                               NOT NULL ON CONFLICT ABORT
                                               UNIQUE ON CONFLICT ABORT,
    name                       VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT
                                               UNIQUE ON CONFLICT IGNORE,
    blocklists                 VARCHAR( 256 )  NOT NULL ON CONFLICT ABORT
                                               UNIQUE ON CONFLICT IGNORE,
    url_info                   VARCHAR( 256 ),
    [default]                  BOOLEAN( 1 )    DEFAULT ( 0 ),
    is_active                  BOOLEAN( 1 )    DEFAULT ( 0 ) 
);

INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (1, 'Atma', 'list.iblocklist.com/lists/atma/atma', 'https://www.iblocklist.com/list.php?list=tzmtqbbsgbtfxainogvm', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (2, 'Bluetack - Ads and Trackers', 'list.iblocklist.com/lists/bluetack/ads-trackers-and-bad-pr0n', 'https://www.iblocklist.com/list.php?list=fruzekpkpzlmzozmuuhx', 1, 1);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (3, 'Bluetack - Bad Peers', 'list.iblocklist.com/lists/bluetack/bad-peers', 'https://www.iblocklist.com/list.php?list=cwworuawihqvocglcoss', 1, 1);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (4, 'Bluetack - Bogon', 'list.iblocklist.com/lists/bluetack/bogon', 'https://www.iblocklist.com/list.php?list=gihxqmhyunbxhbmgqrla', 1, 1);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (5, 'Bluetack - Dshield', 'list.iblocklist.com/lists/bluetack/dshield', 'https://www.iblocklist.com/list.php?list=xpbqleszmajjesnzddhv', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (6, 'Bluetack - Edu', 'list.iblocklist.com/lists/bluetack/edu', 'https://www.iblocklist.com/list.php?list=imlmncgrkbnacgcwfjvh', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (7, 'Bluetack - For Non Lan Computers', 'list.iblocklist.com/lists/bluetack/for-non-lan-computers', 'https://www.iblocklist.com/list.php?list=jhaoawihmfxgnvmaqffp', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (8, 'Bluetack - Forum Spam', 'list.iblocklist.com/lists/bluetack/forum-spam', 'https://www.iblocklist.com/list.php?list=ficutxiwawokxlcyoeye', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (9, 'Bluetack - Hijacked', 'list.iblocklist.com/lists/bluetack/hijacked', 'https://www.iblocklist.com/list.php?list=usrcshglbiilevmyfhse', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (10, 'Bluetack - IANA-Multicast', 'list.iblocklist.com/lists/bluetack/iana-multicast', 'https://www.iblocklist.com/list.php?list=pwqnlynprfgtjbgqoizj', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (11, 'Bluetack - IANA-Private', 'list.iblocklist.com/lists/bluetack/iana-private', 'https://www.iblocklist.com/list.php?list=cslpybexmxyuacbyuvib', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (12, 'Bluetack - IANA-Reserved', 'list.iblocklist.com/lists/bluetack/iana-reserved', 'https://www.iblocklist.com/list.php?list=bcoepfyewziejvcqyhqo', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (13, 'Bluetack - Level 1', 'list.iblocklist.com/lists/bluetack/level-1', 'https://www.iblocklist.com/list.php?list=ydxerpxkpcfqjaybcssw', 1, 1);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (14, 'Bluetack - Level 2', 'list.iblocklist.com/lists/bluetack/level-2', 'https://www.iblocklist.com/list.php?list=gyisgnzbhppbvsphucsw', 1, 1);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (15, 'Bluetack - Level 3', 'list.iblocklist.com/lists/bluetack/level-3', 'https://www.iblocklist.com/list.php?list=uwnukjqktoggdknzrhgh', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (16, 'Bluetack - Microsoft', 'list.iblocklist.com/lists/bluetack/microsoft', 'https://www.iblocklist.com/list.php?list=xshktygkujudfnjfioro', 1, 1);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (17, 'Bluetack - Proxy', 'list.iblocklist.com/lists/bluetack/proxy', 'https://www.iblocklist.com/list.php?list=xoebmbyexwuiogmbyprb', 1, 1);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (18, 'Bluetack - Range Test', 'list.iblocklist.com/lists/bluetack/range-test', 'https://www.iblocklist.com/list.php?list=plkehquoahljmyxjixpu', 1, 1);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (19, 'Bluetack - Spider', 'list.iblocklist.com/lists/bluetack/spider', 'https://www.iblocklist.com/list.php?list=mcvxsnihddgutbjfbghy', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (20, 'Bluetack - Spyware', 'list.iblocklist.com/lists/bluetack/spyware', 'https://www.iblocklist.com/list.php?list=llvtlsjyoyiczbkjsxpf', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (21, 'Bluetack - Web Exploit', 'list.iblocklist.com/lists/bluetack/web-exploit', 'https://www.iblocklist.com/list.php?list=ghlzqtqxnzctvvajwwag', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (22, 'Bluetack - Web Exploit Forum Spam', 'list.iblocklist.com/lists/bluetack/webexploit-forumspam', 'https://www.iblocklist.com/list.php?list=ficutxiwawokxlcyoeye', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (23, 'CIDR - Bogon', 'list.iblocklist.com/lists/cidr-report/bogon', 'https://www.iblocklist.com/list.php?list=lujdnbasfaaixitgmxpp', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (24, 'DCHubAd - Faker', 'list.iblocklist.com/lists/dchubad/faker', 'https://www.iblocklist.com/list.php?list=dcha_faker', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (25, 'DCHubAd - Hacker', 'list.iblocklist.com/lists/dchubad/hacker', 'https://www.iblocklist.com/list.php?list=dcha_hacker', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (26, 'DCHubAd - Pedophiles', 'list.iblocklist.com/lists/dchubad/pedophiles', 'https://www.iblocklist.com/list.php?list=dcha_pedophiles', 1, 1);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (27, 'DCHubAd - Spammer', 'list.iblocklist.com/lists/dchubad/spammer', 'https://www.iblocklist.com/list.php?list=dcha_spammer', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (28, 'Nexus23 - IPfilterX', 'list.iblocklist.com/lists/nexus23/ipfilterx', 'https://www.iblocklist.com/list.php?list=nxs23_ipfilterx', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (29, 'Peerblock - Rapidshare', 'list.iblocklist.com/lists/peerblock/rapidshare', 'https://www.iblocklist.com/list.php?list=zfucwtjkfwkalytktyiw', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (30, 'Spamhaus - DROP', 'list.iblocklist.com/lists/spamhaus/drop', 'https://www.iblocklist.com/list.php?list=zbdlwrqkabxbcppvrnos', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (31, 'TBG - Bogon', 'list.iblocklist.com/lists/tbg/bogon', 'https://www.iblocklist.com/list.php?list=ewqglwibdgjttwttrinl', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (32, 'TBG - Business ISPs', 'list.iblocklist.com/lists/tbg/business-isps', 'https://www.iblocklist.com/list.php?list=jcjfaxgyyshvdbceroxf', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (33, 'TBG - Educational Institutions', 'list.iblocklist.com/lists/tbg/educational-institutions', 'https://www.iblocklist.com/list.php?list=lljggjrpmefcwqknpalp', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (34, 'TBG - General Corporate Ranges', 'list.iblocklist.com/lists/tbg/general-corporate-ranges', 'https://www.iblocklist.com/list.php?list=ecqbsykllnadihkdirsh', 1, 1);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (35, 'TBG - Hijacked', 'list.iblocklist.com/lists/tbg/hijacked', 'https://www.iblocklist.com/list.php?list=tbnuqfclfkemqivekikv', 0, 0);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (36, 'TBG - Primary Threats', 'list.iblocklist.com/lists/tbg/primary-threats', 'https://www.iblocklist.com/list.php?list=ijfqtofzixtwayqovmxn', 1, 1);
INSERT INTO [blocklists_peerguardian] ([id_blocklists_peerguardian], [name], [blocklists], [url_info], [default], [is_active]) VALUES (37, 'TBG - Search Engines', 'list.iblocklist.com/lists/tbg/search-engines', 'https://www.iblocklist.com/list.php?list=pfefqteoxlfzopecdtyw', 1, 1);

-- Table: blocklists_rtorrent
CREATE TABLE blocklists_rtorrent ( 
    id_blocklists_rtorrent INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                           NOT NULL ON CONFLICT ABORT
                                           UNIQUE ON CONFLICT ABORT,
    name                   VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT
                                           UNIQUE ON CONFLICT IGNORE,
    blocklists             VARCHAR( 256 )  NOT NULL ON CONFLICT ABORT
                                           UNIQUE ON CONFLICT IGNORE,
    url_info               VARCHAR( 256 ),
    [default]              BOOLEAN( 1 )    DEFAULT ( 0 ),
    is_active              BOOLEAN( 1 )    DEFAULT ( 0 ) 
);

INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (1, 'BLUETACK_LEVEL1', 'http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=ydxerpxkpcfqjaybcssw', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (2, 'BLUETACK_SPYWARE', 'http://list.iblocklist.com/?list=llvtlsjyoyiczbkjsxpf&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=llvtlsjyoyiczbkjsxpf', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (3, 'BLUETACK_ADS', 'http://list.iblocklist.com/?list=dgxtneitpuvgqqcpfulq&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=dgxtneitpuvgqqcpfulq', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (4, 'BLUETACK_EDU', 'http://list.iblocklist.com/?list=imlmncgrkbnacgcwfjvh&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=imlmncgrkbnacgcwfjvh', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (5, 'BLUETACK_BADPEER', 'http://list.iblocklist.com/?list=cwworuawihqvocglcoss&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=cwworuawihqvocglcoss', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (6, 'BLUETACK_BOGON', 'http://list.iblocklist.com/?list=gihxqmhyunbxhbmgqrla&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=gihxqmhyunbxhbmgqrla', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (7, 'BLUETACK_DSHIELD', 'http://list.iblocklist.com/?list=xpbqleszmajjesnzddhv&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=xpbqleszmajjesnzddhv', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (8, 'BLUETACK_HIJACKED', 'http://list.iblocklist.com/?list=usrcshglbiilevmyfhse&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=usrcshglbiilevmyfhse', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (9, 'BLUETACK_IANAMULTICAST', 'http://list.iblocklist.com/?list=pwqnlynprfgtjbgqoizj&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=pwqnlynprfgtjbgqoizj', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (10, 'BLUETACK_IANAPRIVATE', 'http://list.iblocklist.com/?list=cslpybexmxyuacbyuvib&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=cslpybexmxyuacbyuvib', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (11, 'BLUETACK_IANARESERVED', 'http://list.iblocklist.com/?list=bcoepfyewziejvcqyhqo&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=bcoepfyewziejvcqyhqo', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (12, 'BLUETACK_LEVEL2', 'http://list.iblocklist.com/?list=gyisgnzbhppbvsphucsw&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=gyisgnzbhppbvsphucsw', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (13, 'BLUETACK_LEVEL3', 'http://list.iblocklist.com/?list=uwnukjqktoggdknzrhgh&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=uwnukjqktoggdknzrhgh', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (14, 'BLUETACK_MICROSOFT', 'http://list.iblocklist.com/?list=xshktygkujudfnjfioro&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=xshktygkujudfnjfioro', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (15, 'BLUETACK_PROXY', 'http://list.iblocklist.com/?list=xoebmbyexwuiogmbyprb&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=xoebmbyexwuiogmbyprb', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (16, 'BLUETACK_SPIDER', 'http://list.iblocklist.com/?list=mcvxsnihddgutbjfbghy&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=mcvxsnihddgutbjfbghy', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (17, 'BLUETACK_RANGETEST', 'http://list.iblocklist.com/?list=plkehquoahljmyxjixpu&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=plkehquoahljmyxjixpu', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (18, 'BLUETACK_FORUMSPAM', 'http://list.iblocklist.com/?list=ficutxiwawokxlcyoeye&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=ficutxiwawokxlcyoeye', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (19, 'BLUETACK_WEBEXPLOIT', 'http://list.iblocklist.com/?list=ghlzqtqxnzctvvajwwag&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=ghlzqtqxnzctvvajwwag', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (20, 'BLUETACK_FORNONLANCOMP', 'http://list.iblocklist.com/?list=jhaoawihmfxgnvmaqffp&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=jhaoawihmfxgnvmaqffp', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (21, 'BLUETACK_EXCLUSIONS', 'http://list.iblocklist.com/?list=mtxmiireqmjzazcsoiem&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=mtxmiireqmjzazcsoiem', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (22, 'TBG_BOGON', 'http://list.iblocklist.com/?list=ewqglwibdgjttwttrinl&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=ewqglwibdgjttwttrinl', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (23, 'TBG_BUSINESSISPS', 'http://list.iblocklist.com/?list=jcjfaxgyyshvdbceroxf&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=jcjfaxgyyshvdbceroxf', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (24, 'TBG_GENERALCORPORATE', 'http://list.iblocklist.com/?list=ecqbsykllnadihkdirsh&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=ecqbsykllnadihkdirsh', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (25, 'TBG_HIJACKED', 'http://list.iblocklist.com/?list=tbnuqfclfkemqivekikv&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=ijfqtofzixtwayqovmxn', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (26, 'TBG_PRIMTHREATS', 'http://list.iblocklist.com/?list=ijfqtofzixtwayqovmxn&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=ijfqtofzixtwayqovmxn', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (27, 'TBG_EDUINSTITUTUION', 'http://list.iblocklist.com/?list=lljggjrpmefcwqknpalp&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=lljggjrpmefcwqknpalp', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (28, 'TBG_SEARCHENGINE', 'http://list.iblocklist.com/?list=pfefqteoxlfzopecdtyw&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=pfefqteoxlfzopecdtyw', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (29, 'SPAMHAUS_DROP', 'http://list.iblocklist.com/?list=zbdlwrqkabxbcppvrnos&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=zbdlwrqkabxbcppvrnos', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (30, 'ABUSE_ZEUS', 'http://list.iblocklist.com/?list=ynkdjqsjyfmilsgbogqf&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=ynkdjqsjyfmilsgbogqf', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (31, 'ABUSE_SPYEYE', 'http://list.iblocklist.com/?list=zvjxsfuvdhoxktpeiokq&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=zvjxsfuvdhoxktpeiokq', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (32, 'ABUSE_PALEVO', 'http://list.iblocklist.com/?list=erqajhwrxiuvjxqrrwfj&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=erqajhwrxiuvjxqrrwfj', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (33, 'IBLOCK_PEDOPHILE', 'http://list.iblocklist.com/?list=dufcxgnbjsdwmwctgfuj&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=dufcxgnbjsdwmwctgfuj', 1, 1);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (34, 'CIARMY_MALICIOUS', 'http://list.iblocklist.com/?list=npkuuhuxcsllnhoamkvm&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=npkuuhuxcsllnhoamkvm', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (35, 'MALCODE_MALCODE', 'http://list.iblocklist.com/?list=pbqcylkejciyhmwttify&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=pbqcylkejciyhmwttify', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (36, 'YOYO_ADSERVERS', 'http://list.iblocklist.com/?list=zhogegszwduurnvsyhdf&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=zhogegszwduurnvsyhdf', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (37, 'PBLOCK_RAPIDSHARE', 'http://list.iblocklist.com/?list=zfucwtjkfwkalytktyiw&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=zfucwtjkfwkalytktyiw', 0, 0);
INSERT INTO [blocklists_rtorrent] ([id_blocklists_rtorrent], [name], [blocklists], [url_info], [default], [is_active]) VALUES (38, 'CIDR_BOGON', 'http://list.iblocklist.com/?list=lujdnbasfaaixitgmxpp&fileformat=cidr&archiveformat=gz', 'https://www.iblocklist.com/list.php?list=lujdnbasfaaixitgmxpp', 0, 0);

-- Table: trackers_list
CREATE TABLE trackers_list ( 
    id_trackers_list INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                     NOT NULL ON CONFLICT ABORT
                                     UNIQUE ON CONFLICT ABORT,
    tracker          VARCHAR( 128 )  NOT NULL ON CONFLICT IGNORE
                                     UNIQUE ON CONFLICT IGNORE,
    tracker_domain   VARCHAR( 128 )  NOT NULL ON CONFLICT ABORT
                                     UNIQUE ON CONFLICT IGNORE,
    origin           VARCHAR( 9 )    NOT NULL ON CONFLICT ABORT,
    is_ssl           BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                     DEFAULT ( 0 ),
    is_active        BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                     DEFAULT ( 0 ),
    to_check         BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                     DEFAULT ( 1 ) 
);


-- Table: trackers_list_ipv4
CREATE TABLE trackers_list_ipv4 ( 
    id_trackers_list_ipv4 INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                          NOT NULL ON CONFLICT ABORT
                                          UNIQUE ON CONFLICT ABORT,
    id_trackers_list      INTEGER         NOT NULL ON CONFLICT ABORT,
    ipv4                  VARCHAR( 128 )  NOT NULL ON CONFLICT ABORT 
);


-- Table: system
CREATE TABLE system ( 
    id_system         INTEGER( 1, 1 )  PRIMARY KEY ON CONFLICT IGNORE
                                       NOT NULL ON CONFLICT ABORT,
    mysb_version      VARCHAR( 6 )     NOT NULL ON CONFLICT ABORT
                                       UNIQUE ON CONFLICT IGNORE,
    mysb_user         VARCHAR( 32 )    UNIQUE ON CONFLICT IGNORE,
    mysb_password     VARCHAR( 32 )    UNIQUE ON CONFLICT IGNORE,
    hostname          VARCHAR( 128 )   UNIQUE ON CONFLICT IGNORE,
    ipv4              VARCHAR( 15 )    UNIQUE ON CONFLICT IGNORE,
    primary_inet      VARCHAR( 16 )    UNIQUE ON CONFLICT IGNORE,
    timezone          VARCHAR( 64 )    UNIQUE ON CONFLICT IGNORE,
    cert_password     VARCHAR( 32 )    UNIQUE ON CONFLICT IGNORE,
    apt_update        BOOLEAN( 1 )     DEFAULT ( 1 ),
    apt_date          DATETIME,
    dnscrypt_resolver VARCHAR( 32 ) 
);

INSERT INTO [system] ([id_system], [mysb_version], [mysb_user], [mysb_password], [hostname], [ipv4], [primary_inet], [timezone], [cert_password], [apt_update], [apt_date], [dnscrypt_resolver]) VALUES (1, '', '', '', '', '', '', '', '', 0, null, null);

-- Table: dnscrypt_resolvers
CREATE TABLE dnscrypt_resolvers ( 
    id_dnscrypt_resolvers          INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                                   NOT NULL ON CONFLICT ABORT
                                                   UNIQUE ON CONFLICT ABORT,
    name                           VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT
                                                   UNIQUE ON CONFLICT ABORT,
    full_name                      VARCHAR( 64 )   NOT NULL ON CONFLICT ABORT
                                                   UNIQUE ON CONFLICT ABORT,
    description                    VARCHAR( 128 )  NOT NULL ON CONFLICT ABORT,
    location                       VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT,
    coordinates                    VARCHAR( 32 ),
    url                            VARCHAR( 128 )  NOT NULL ON CONFLICT ABORT,
    version                        VARCHAR( 2 )    NOT NULL ON CONFLICT ABORT,
    dnssec                         BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                                   DEFAULT ( 0 ),
    no_logs                        BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                                   DEFAULT ( 0 ),
    namecoin                       BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                                   DEFAULT ( 0 ),
    resolver_address               VARCHAR( 64 )   NOT NULL ON CONFLICT ABORT
                                                   UNIQUE ON CONFLICT ABORT,
    provider_name                  VARCHAR( 64 )   NOT NULL ON CONFLICT ABORT,
    provider_public_key            VARCHAR( 128 )  NOT NULL ON CONFLICT ABORT,
    provider_public_key_txt_record VARCHAR( 64 ) 
);


-- Table: commands
CREATE TABLE commands ( 
    id_commands INTEGER        PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                               NOT NULL ON CONFLICT ABORT
                               UNIQUE ON CONFLICT ABORT,
    commands    VARCHAR( 32 )  NOT NULL ON CONFLICT ABORT
                               UNIQUE ON CONFLICT ABORT,
    reload      BOOLEAN( 1 )   NOT NULL ON CONFLICT ABORT
                               DEFAULT ( 0 ),
    priority    INTEGER( 2 )   NOT NULL ON CONFLICT ABORT
                               DEFAULT ( 0 ),
    args        VARCHAR( 32 ) 
);

INSERT INTO [commands] ([id_commands], [commands], [reload], [priority], [args]) VALUES (1, 'FirewallAndSecurity.bsh', 0, 1, null);
INSERT INTO [commands] ([id_commands], [commands], [reload], [priority], [args]) VALUES (2, 'GetTrackersCert.bsh', 0, 2, null);
INSERT INTO [commands] ([id_commands], [commands], [reload], [priority], [args]) VALUES (3, 'PaymentReminder.bsh', 0, 2, null);
INSERT INTO [commands] ([id_commands], [commands], [reload], [priority], [args]) VALUES (4, 'Postfix.bsh', 0, 2, null);
INSERT INTO [commands] ([id_commands], [commands], [reload], [priority], [args]) VALUES (5, 'BlocklistsRTorrent.bsh', 0, 2, null);
INSERT INTO [commands] ([id_commands], [commands], [reload], [priority], [args]) VALUES (6, 'MySB_ChangeUserPassword', 0, 2, null);

-- Table: smtp
CREATE TABLE smtp ( 
    id_smtp       INTEGER( 1, 1 )  PRIMARY KEY ON CONFLICT IGNORE
                                   NOT NULL ON CONFLICT ABORT,
    smtp_provider VARCHAR( 5 )     NOT NULL ON CONFLICT ABORT
                                   UNIQUE ON CONFLICT IGNORE
                                   DEFAULT ( 'LOCAL' ),
    smtp_username VARCHAR( 64 )    UNIQUE ON CONFLICT IGNORE,
    smtp_passwd   VARCHAR( 64 )    UNIQUE ON CONFLICT IGNORE,
    smtp_host     VARCHAR( 128 )   UNIQUE ON CONFLICT IGNORE,
    smtp_port     VARCHAR( 5 )     UNIQUE ON CONFLICT IGNORE,
    smtp_email    VARCHAR( 64 )    UNIQUE ON CONFLICT IGNORE 
);

INSERT INTO [smtp] ([id_smtp], [smtp_provider], [smtp_username], [smtp_passwd], [smtp_host], [smtp_port], [smtp_email]) VALUES (1, 'LOCAL', null, null, null, null, null);

-- Table: services
CREATE TABLE services ( 
    id_services    INTEGER        PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                  NOT NULL ON CONFLICT ABORT
                                  UNIQUE ON CONFLICT ABORT,
    serv_name      VARCHAR( 32 )  NOT NULL ON CONFLICT ABORT
                                  UNIQUE ON CONFLICT IGNORE,
    ident          VARCHAR( 64 ),
    bin            VARCHAR( 32 ),
    priority       INTEGER( 1 )   DEFAULT ( 1 ),
    port_tcp1      VARCHAR( 11 ),
    port_tcp2      VARCHAR( 11 ),
    port_tcp3      VARCHAR( 11 ),
    ports_tcp_list VARCHAR( 32 ),
    port_udp1      VARCHAR( 11 ),
    port_udp2      VARCHAR( 11 ),
    port_udp3      VARCHAR( 11 ),
    ports_udp_list VARCHAR( 32 ),
    to_install     BOOLEAN( 1 )   DEFAULT ( 0 ),
    is_installed   BOOLEAN        NOT NULL ON CONFLICT ABORT
                                  DEFAULT ( 0 ) 
);

INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (1, 'Seedbox-Manager', '', '', 1, '', '', '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (2, 'CakeBox-Light', '', '', 1, 8887, '', '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (3, 'Plex Media Server', '/etc/default/plexmediaserver', '/etc/init.d/plexmediaserver', 1, '', '', '', '32400 32469', '', '', ' ', '1900 5353 2410 32412 32413 32414', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (4, 'Webmin', '/etc/webmin', '/etc/init.d/webmin', 1, 8890, '', '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (5, 'OpenVPN', '/etc/openvpn', 'openvpn', 1, 8893, 8894, '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (6, 'LogWatch', '', '', 1, '', '', '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (7, 'Fail2Ban', '/etc/fail2ban', '/etc/init.d/fail2ban', 3, '', '', '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (8, 'PeerGuardian', '/etc/pgl', 'pglcmd', 4, '', '', '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (9, 'rTorrent Block List', '', '', 1, '', '', '', '', '', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (10, 'DNScrypt-proxy', 'dnscrypt-proxy', 'dnscrypt-proxy', 2, '', '', '', '', '53 54 443 2053 5353', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (11, 'CRON', 'crontab', 'cron', 1, '', '', '', '', '', ' ', ' ', ' ', 0, 1);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (12, 'NginX', '/etc/nginx', 'nginx', 1, 8889, 8888, '', '', '', ' ', ' ', ' ', 0, 1);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (13, 'SSH', '/etc/ssh', 'ssh', 1, 8892, '', '', '', '', ' ', ' ', ' ', 0, 1);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (14, 'VSFTPd', '/etc/vsftpd', 'vsftpd', 1, 8891, 8800, '65000:65535', '', '', ' ', ' ', ' ', 0, 1);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (15, 'PHP5-FPM', '/etc/php5', 'php5-fpm', 1, '', '', '', '', '', ' ', ' ', ' ', 0, 1);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (16, 'Postfix', '/etc/postfix', 'postfix', 1, '', '', '', '', '', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (17, 'Networking', '/etc/network', '/etc/init.d/networking', 1, '', '', '', '', '', ' ', ' ', ' ', 0, 1);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (18, 'Samba', '/etc/samba', 'samba', 1, '', '', '', '', '', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (19, 'NFS', '/etc/exports', 'nfs-kernel-server', 1, '', '', '', '', '', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (20, 'BIND', '/etc/bind/named.conf', 'bind9', 1, '', '', '', '', '', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (21, 'Stunnel', '/etc/stunnel', 'stunnel4', 1, '', '', '', '', '', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [ident], [bin], [priority], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (22, 'rTorrent', '/home/%user%', 'rtorrent', 1, null, null, null, null, null, null, null, null, 0, 1);
