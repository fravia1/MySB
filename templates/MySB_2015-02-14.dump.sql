
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

INSERT INTO [vars] ([id_vars], [fail2ban_whitelist], [vpn_ip], [white_tcp_port_out], [white_udp_port_out]) VALUES (1, '127.0.0.1/32', '10.0.0.0/24,10.0.1.0/24,10.0.2.0/24', '80 443', null);

-- Table: trackers_list_ipv4
CREATE TABLE trackers_list_ipv4 ( 
    id_trackers_list_ipv4 INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                          NOT NULL ON CONFLICT ABORT
                                          UNIQUE ON CONFLICT ABORT,
    id_trackers_list      INTEGER         NOT NULL ON CONFLICT ABORT,
    ipv4                  VARCHAR( 128 )  NOT NULL ON CONFLICT ABORT 
);


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

INSERT INTO [smtp] ([id_smtp], [smtp_provider], [smtp_username], [smtp_passwd], [smtp_host], [smtp_port], [smtp_email]) VALUES (1, '', '', '', '', '', '');

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
                                     DEFAULT ( 1 ),
    ping             VARCHAR( 64 ) 
);


-- Table: commands
CREATE TABLE commands ( 
    id_commands INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                NOT NULL ON CONFLICT ABORT
                                UNIQUE ON CONFLICT ABORT,
    commands    VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT,
    reload      BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT,
    priority    INTEGER( 2 )    NOT NULL ON CONFLICT ABORT,
    args        VARCHAR( 128 ),
    user        VARCHAR( 16 )   NOT NULL ON CONFLICT ABORT 
);


-- Table: dnscrypt_resolvers
CREATE TABLE dnscrypt_resolvers ( 
    id_dnscrypt_resolvers          INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                                   NOT NULL ON CONFLICT ABORT
                                                   UNIQUE ON CONFLICT ABORT,
    name                           VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT
                                                   UNIQUE ON CONFLICT ABORT,
    full_name                      VARCHAR( 64 )   NOT NULL ON CONFLICT ABORT
                                                   UNIQUE ON CONFLICT ABORT,
    description                    VARCHAR( 128 ),
    location                       VARCHAR( 32 ),
    coordinates                    VARCHAR( 32 ),
    url                            VARCHAR( 128 )  NOT NULL ON CONFLICT ABORT,
    version                        VARCHAR( 2 ),
    dnssec                         BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                                   DEFAULT ( 0 ),
    no_logs                        BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                                   DEFAULT ( 0 ),
    namecoin                       BOOLEAN( 1 )    NOT NULL ON CONFLICT ABORT
                                                   DEFAULT ( 0 ),
    resolver_address               VARCHAR( 64 )   NOT NULL ON CONFLICT ABORT
                                                   UNIQUE ON CONFLICT ABORT,
    provider_name                  VARCHAR( 64 ),
    provider_public_key            VARCHAR( 128 ),
    provider_public_key_txt_record VARCHAR( 64 ),
    is_activated                   BOOLEAN( 1 )    DEFAULT ( 0 ),
    is_wished                      BOOLEAN( 1 )    DEFAULT ( 0 ) 
);


-- Table: blocklists
CREATE TABLE blocklists ( 
    id_blocklists           INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                            NOT NULL ON CONFLICT ABORT
                                            UNIQUE ON CONFLICT ABORT,
    author                  VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT,
    list_name               VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT,
    url_infos               VARCHAR( 256 )  NOT NULL ON CONFLICT ABORT
                                            UNIQUE ON CONFLICT ABORT,
    peerguardian_list       VARCHAR( 256 ),
    rtorrent_list           VARCHAR( 256 ),
    peerguardian_active     BOOLEAN( 1 )    DEFAULT ( 0 ),
    rtorrent_active         BOOLEAN( 1 )    DEFAULT ( 0 ),
    [default]               BOOLEAN( 1 )    DEFAULT ( 0 ),
    comments                VARCHAR( 32 ),
    peerguardian_lastupdate DATETIME,
    rtorrent_lastupdate     DATETIME 
);

INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (1, 'Abuse', 'ZeuS', 'https://www.iblocklist.com/list.php?list=ynkdjqsjyfmilsgbogqf', 'list.iblocklist.com/lists/abuse/zeus', 'http://list.iblocklist.com/?list=ynkdjqsjyfmilsgbogqf&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (2, 'Atma', 'Atma', 'https://www.iblocklist.com/list.php?list=tzmtqbbsgbtfxainogvm', 'list.iblocklist.com/lists/atma/atma', 'http://list.iblocklist.com/?list=tzmtqbbsgbtfxainogvm&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (3, 'Bluetack', 'Advertising Trackers and Bad Porn', 'https://www.iblocklist.com/list.php?list=dgxtneitpuvgqqcpfulq', 'list.iblocklist.com/lists/bluetack/ads-trackers-and-bad-pr0n', 'http://list.iblocklist.com/?list=dgxtneitpuvgqqcpfulq&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (4, 'Bluetack', 'Bad Peers', 'https://www.iblocklist.com/list.php?list=cwworuawihqvocglcoss', 'list.iblocklist.com/lists/bluetack/bad-peers', 'http://list.iblocklist.com/?list=cwworuawihqvocglcoss&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (5, 'Bluetack', 'Bogon', 'https://www.iblocklist.com/list.php?list=gihxqmhyunbxhbmgqrla', 'list.iblocklist.com/lists/bluetack/bogon', 'http://list.iblocklist.com/?list=gihxqmhyunbxhbmgqrla&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (6, 'Bluetack', 'Dshield', 'https://www.iblocklist.com/list.php?list=xpbqleszmajjesnzddhv', 'list.iblocklist.com/lists/bluetack/dshield', 'http://list.iblocklist.com/?list=xpbqleszmajjesnzddhv&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (7, 'Bluetack', 'Educational Institutions', 'https://www.iblocklist.com/list.php?list=imlmncgrkbnacgcwfjvh', 'list.iblocklist.com/lists/bluetack/edu', 'http://list.iblocklist.com/?list=imlmncgrkbnacgcwfjvh&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (8, 'Bluetack', 'For Non Lan Computers', 'https://www.iblocklist.com/list.php?list=jhaoawihmfxgnvmaqffp', 'list.iblocklist.com/lists/bluetack/for-non-lan-computers', 'http://list.iblocklist.com/?list=jhaoawihmfxgnvmaqffp&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (9, 'Bluetack', 'Forum Spam', 'https://www.iblocklist.com/list.php?list=ficutxiwawokxlcyoeye', 'list.iblocklist.com/lists/bluetack/forum-spam', 'http://list.iblocklist.com/?list=ficutxiwawokxlcyoeye&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (10, 'Bluetack', 'Hijacked', 'https://www.iblocklist.com/list.php?list=usrcshglbiilevmyfhse', 'list.iblocklist.com/lists/bluetack/hijacked', 'http://list.iblocklist.com/?list=usrcshglbiilevmyfhse&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (11, 'Bluetack', 'IANA-Multicast', 'https://www.iblocklist.com/list.php?list=pwqnlynprfgtjbgqoizj', 'list.iblocklist.com/lists/bluetack/iana-multicast', 'http://list.iblocklist.com/?list=pwqnlynprfgtjbgqoizj&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (12, 'Bluetack', 'IANA-Private', 'https://www.iblocklist.com/list.php?list=cslpybexmxyuacbyuvib', 'list.iblocklist.com/lists/bluetack/iana-private', 'http://list.iblocklist.com/?list=cslpybexmxyuacbyuvib&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (13, 'Bluetack', 'IANA-Reserved', 'https://www.iblocklist.com/list.php?list=bcoepfyewziejvcqyhqo', 'list.iblocklist.com/lists/bluetack/iana-reserved', 'http://list.iblocklist.com/?list=bcoepfyewziejvcqyhqo&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (14, 'Bluetack', 'Level 1', 'https://www.iblocklist.com/list.php?list=ydxerpxkpcfqjaybcssw', 'list.iblocklist.com/lists/bluetack/level-1', 'http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (15, 'Bluetack', 'Level 2', 'https://www.iblocklist.com/list.php?list=gyisgnzbhppbvsphucsw', 'list.iblocklist.com/lists/bluetack/level-2', 'http://list.iblocklist.com/?list=gyisgnzbhppbvsphucsw&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (16, 'Bluetack', 'Level 3', 'https://www.iblocklist.com/list.php?list=uwnukjqktoggdknzrhgh', 'list.iblocklist.com/lists/bluetack/level-3', 'http://list.iblocklist.com/?list=uwnukjqktoggdknzrhgh&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (17, 'Bluetack', 'Microsoft', 'https://www.iblocklist.com/list.php?list=xshktygkujudfnjfioro', 'list.iblocklist.com/lists/bluetack/microsoft', 'http://list.iblocklist.com/?list=xshktygkujudfnjfioro&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (18, 'Bluetack', 'Proxy', 'https://www.iblocklist.com/list.php?list=xoebmbyexwuiogmbyprb', 'list.iblocklist.com/lists/bluetack/proxy', 'http://list.iblocklist.com/?list=xoebmbyexwuiogmbyprb&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (19, 'Bluetack', 'Range Test', 'https://www.iblocklist.com/list.php?list=plkehquoahljmyxjixpu', 'list.iblocklist.com/lists/bluetack/range-test', 'http://list.iblocklist.com/?list=plkehquoahljmyxjixpu&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (20, 'Bluetack', 'Spider', 'https://www.iblocklist.com/list.php?list=mcvxsnihddgutbjfbghy', 'list.iblocklist.com/lists/bluetack/spider', 'http://list.iblocklist.com/?list=mcvxsnihddgutbjfbghy&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (21, 'Bluetack', 'Spyware', 'https://www.iblocklist.com/list.php?list=llvtlsjyoyiczbkjsxpf', 'list.iblocklist.com/lists/bluetack/spyware', 'http://list.iblocklist.com/?list=llvtlsjyoyiczbkjsxpf&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (22, 'Bluetack', 'Web Exploit', 'https://www.iblocklist.com/list.php?list=ghlzqtqxnzctvvajwwag', 'list.iblocklist.com/lists/bluetack/web-exploit', 'http://list.iblocklist.com/?list=ghlzqtqxnzctvvajwwag&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (23, 'Bluetack', 'Web Exploit Forum Spam', 'https://www.iblocklist.com/list.php?list=bimsvyvtgxeelunveyal', 'list.iblocklist.com/lists/bluetack/webexploit-forumspam', 'http://list.iblocklist.com/?list=bimsvyvtgxeelunveyal&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (24, 'CIDR-Report', 'Bogon', 'https://www.iblocklist.com/list.php?list=lujdnbasfaaixitgmxpp', 'list.iblocklist.com/lists/cidr-report/bogon', 'http://list.iblocklist.com/?list=lujdnbasfaaixitgmxpp&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (25, 'DCHubAd', 'Faker', 'https://www.iblocklist.com/list.php?list=dhuwlruzmglnfaneeizx', 'list.iblocklist.com/lists/dchubad/faker', 'http://list.iblocklist.com/?list=dhuwlruzmglnfaneeizx&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (26, 'DCHubAd', 'Hacker', 'https://www.iblocklist.com/list.php?list=qpuabqfzsykfvglktzkh', 'list.iblocklist.com/lists/dchubad/hacker', 'http://list.iblocklist.com/?list=qpuabqfzsykfvglktzkh&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (27, 'DCHubAd', 'Pedophiles', 'https://www.iblocklist.com/list.php?list=zchgtvitlwnwcjfuxovf', 'list.iblocklist.com/lists/dchubad/pedophiles', 'http://list.iblocklist.com/?list=zchgtvitlwnwcjfuxovf&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (28, 'DCHubAd', 'Spammer', 'https://www.iblocklist.com/list.php?list=falwwczjguruglzisxdr', 'list.iblocklist.com/lists/dchubad/spammer', 'http://list.iblocklist.com/?list=falwwczjguruglzisxdr&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (29, 'I-Blocklist', 'RapidShare', 'https://www.iblocklist.com/list.php?list=zfucwtjkfwkalytktyiw', 'list.iblocklist.com/lists/peerblock/rapidshare', 'http://list.iblocklist.com/?list=zfucwtjkfwkalytktyiw&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (30, 'Spamhaus', 'DROP', 'https://www.iblocklist.com/list.php?list=zbdlwrqkabxbcppvrnos', 'list.iblocklist.com/lists/spamhaus/drop', 'http://list.iblocklist.com/?list=zbdlwrqkabxbcppvrnos&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (31, 'TBG', 'Bogon', 'https://www.iblocklist.com/list.php?list=ewqglwibdgjttwttrinl', 'list.iblocklist.com/lists/tbg/bogon', 'http://list.iblocklist.com/?list=ewqglwibdgjttwttrinl&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (32, 'TBG', 'Business ISPs', 'https://www.iblocklist.com/list.php?list=jcjfaxgyyshvdbceroxf', 'list.iblocklist.com/lists/tbg/business-isps', 'http://list.iblocklist.com/?list=jcjfaxgyyshvdbceroxf&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (33, 'TBG', 'Educational Institutions', 'https://www.iblocklist.com/list.php?list=lljggjrpmefcwqknpalp', 'list.iblocklist.com/lists/tbg/educational-institutions', 'http://list.iblocklist.com/?list=lljggjrpmefcwqknpalp&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (34, 'TBG', 'General Corporate Ranges', 'https://www.iblocklist.com/list.php?list=ecqbsykllnadihkdirsh', 'list.iblocklist.com/lists/tbg/general-corporate-ranges', 'http://list.iblocklist.com/?list=ecqbsykllnadihkdirsh&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (35, 'TBG', 'Hijacked', 'https://www.iblocklist.com/list.php?list=tbnuqfclfkemqivekikv', 'list.iblocklist.com/lists/tbg/hijacked', 'http://list.iblocklist.com/?list=tbnuqfclfkemqivekikv&fileformat=p2p&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (36, 'TBG', 'Primary Threats', 'https://www.iblocklist.com/list.php?list=ijfqtofzixtwayqovmxn', 'list.iblocklist.com/lists/tbg/primary-threats', 'http://list.iblocklist.com/?list=ijfqtofzixtwayqovmxn&fileformat=cidr&archiveformat=gz', 1, 1, 1, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (37, 'TBG', 'Search Engines', 'https://www.iblocklist.com/list.php?list=pfefqteoxlfzopecdtyw', 'list.iblocklist.com/lists/tbg/search-engines', 'http://list.iblocklist.com/?list=pfefqteoxlfzopecdtyw&fileformat=cidr&archiveformat=gz', 0, 0, 0, null, null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (38, 'Abuse', 'Palevo', 'https://www.iblocklist.com/list.php?list=erqajhwrxiuvjxqrrwfj', null, 'http://list.iblocklist.com/?list=zvjxsfuvdhoxktpeiokq&fileformat=cidr&archiveformat=gz', 0, 0, 0, 'rTorrent only', null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (39, 'Abuse', 'SpyEye', 'https://www.iblocklist.com/list.php?list=zvjxsfuvdhoxktpeiokq', null, 'http://list.iblocklist.com/?list=zvjxsfuvdhoxktpeiokq&fileformat=cidr&archiveformat=gz', 0, 0, 0, 'rTorrent only', null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (40, 'Bluetack', 'Exclusions', 'https://www.iblocklist.com/list.php?list=mtxmiireqmjzazcsoiem', null, 'http://list.iblocklist.com/?list=mtxmiireqmjzazcsoiem&fileformat=cidr&archiveformat=gz', 0, 0, 0, 'rTorrent only', null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (41, 'CI Army', 'Malicious', 'https://www.iblocklist.com/list.php?list=npkuuhuxcsllnhoamkvm', null, 'http://list.iblocklist.com/?list=npkuuhuxcsllnhoamkvm&fileformat=cidr&archiveformat=gz', 0, 0, 0, 'rTorrent only', null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (42, 'I-Blocklist', 'Pedophiles', 'https://www.iblocklist.com/list.php?list=dufcxgnbjsdwmwctgfuj', null, 'http://list.iblocklist.com/?list=dufcxgnbjsdwmwctgfuj&fileformat=cidr&archiveformat=gz', 0, 0, 0, 'rTorrent only', null, null);
INSERT INTO [blocklists] ([id_blocklists], [author], [list_name], [url_infos], [peerguardian_list], [rtorrent_list], [peerguardian_active], [rtorrent_active], [default], [comments], [peerguardian_lastupdate], [rtorrent_lastupdate]) VALUES (43, 'Nexus23', 'ipfilterX', 'https://www.iblocklist.com/list.php?list=tqdjwkbxfurudwonprji', 'list.iblocklist.com/lists/nexus23/ipfilterx', null, 0, 0, 0, 'PeerGuardian Only, subscription needed', null, null);

-- Table: providers_monitoring
CREATE TABLE providers_monitoring ( 
    id_providers_monitoring INTEGER        PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                           NOT NULL ON CONFLICT ABORT
                                           UNIQUE ON CONFLICT ABORT,
    provider                VARCHAR( 16 ),
    ipv4                    VARCHAR( 25 ),
    hostname                VARCHAR( 32 ) 
);

INSERT INTO [providers_monitoring] ([id_providers_monitoring], [provider], [ipv4], [hostname]) VALUES (1, 'ONLINE', '62.210.16.0/24', null);
INSERT INTO [providers_monitoring] ([id_providers_monitoring], [provider], [ipv4], [hostname]) VALUES (2, 'OVH', null, 'proxy-rbx2.ovh.net');
INSERT INTO [providers_monitoring] ([id_providers_monitoring], [provider], [ipv4], [hostname]) VALUES (3, 'OVH', null, 'proxy-rbx.ovh.net');
INSERT INTO [providers_monitoring] ([id_providers_monitoring], [provider], [ipv4], [hostname]) VALUES (4, 'OVH', null, 'proxy.sbg.ovh.net');
INSERT INTO [providers_monitoring] ([id_providers_monitoring], [provider], [ipv4], [hostname]) VALUES (5, 'OVH', null, 'proxy.bhs.ovh.net');
INSERT INTO [providers_monitoring] ([id_providers_monitoring], [provider], [ipv4], [hostname]) VALUES (6, 'OVH', null, 'ping.ovh.net');

-- Table: repositories
CREATE TABLE repositories ( 
    id_repositories INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                    NOT NULL ON CONFLICT ABORT
                                    UNIQUE ON CONFLICT ABORT,
    type            VARCHAR( 5 )    NOT NULL ON CONFLICT ABORT,
    dir             VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT,
    name            VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT,
    version         VARCHAR( 8 ),
    file            VARCHAR( 32 ),
    old_file        VARCHAR( 32 ),
    url             VARCHAR( 256 )  NOT NULL ON CONFLICT ABORT,
    active          BOOLEAN( 1 ) 
);

INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (1, 'SVN', '/web/rutorrent', 'ruTorrent', '', '', null, 'http://rutorrent.googlecode.com/svn/trunk/rutorrent/', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (2, 'SVN', '/web/rutorrent/plugins', 'ruTorrents Official Plugins', '', '', null, 'http://rutorrent.googlecode.com/svn/trunk/plugins/', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (3, 'SVN', '/web/rutorrent/plugins/chat', 'ruTorrent Plugin Chat', null, null, null, 'http://rutorrent-chat.googlecode.com/svn/trunk/', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (4, 'SVN', '/web/rutorrent/plugins/logoff', 'ruTorrent Plugin Logoff', null, null, null, 'http://rutorrent-logoff.googlecode.com/svn/trunk/', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (5, 'TARGZ', '/web/rutorrent/plugins/lbll-suite', 'ruTorrent Plugin tAdd-Labels', '0.8.1', 'lbll-suite_0.8.1.tar.gz', null, 'https://rutorrent-tadd-labels.googlecode.com/files/lbll-suite_0.8.1.tar.gz', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (6, 'SVN', '/web/rutorrent/plugins/filemanager', 'ruTorrent Plugin FileManager', null, null, null, 'http://svn.rutorrent.org/svn/filemanager/trunk/filemanager', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (7, 'TARGZ', '/web/rutorrent/plugins/nfo', 'ruTorrent Plugin NFO', 1337, 'nfo_v1337.tar.gz', null, 'http://srious.biz/nfo.tar.gz', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (8, 'GIT', '/web/rutorrent/plugins/ratiocolor', 'ruTorrent Plugin RatioColor', null, null, null, 'https://github.com/Gyran/rutorrent-ratiocolor', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (9, 'SVN', '/web/rutorrent/plugins/fileupload', 'ruTorrent Plugin FileUpload', null, null, null, 'http://svn.rutorrent.org/svn/filemanager/trunk/fileupload', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (10, 'SVN', '/web/rutorrent/plugins/fileshare', 'ruTorrent Plugin FileShare', null, null, null, 'http://svn.rutorrent.org/svn/filemanager/trunk/fileshare', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (11, 'TARGZ', '/web/rutorrent/plugins/stream', 'ruTorrent Plugin Stream', 1.0, 'stream_v1.0.tar.gz', null, 'https://rutorrent-stream-plugin.googlecode.com/files/stream.tar.gz', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (12, 'SVN', '/web/rutorrent/plugins/mediastream', 'ruTorrent Plugin MediaStream', null, null, null, 'http://svn.rutorrent.org/svn/filemanager/trunk/mediastream', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (13, 'GIT', '/sources/plowshare', 'Plowshare4', 4, null, null, 'https://code.google.com/p/plowshare/', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (14, 'CURL', '/usr/bin/composer', 'Composer', null, 'composer.phar', null, 'http://getcomposer.org/installer', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (15, 'TARGZ', '/sources/nodejs', 'NodeJS', '0.10.35', 'node_v0.10.35.tar.gz', null, 'http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (16, 'GIT', '/web/seedbox-manager', 'Seedbox-Manager', null, null, null, 'https://github.com/Magicalex/seedbox-manager.git', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (17, 'GIT', '/web/rutorrent/plugins/linkseedboxmanager', 'ruTorrent Plugin Link Manager', null, null, null, 'https://github.com/Hydrog3n/linkseedboxmanager.git', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (18, 'GIT', '/web/Cakebox-light', 'Cakebox-Light', null, null, null, 'https://github.com/Cakebox/Cakebox-light.git', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (19, 'GIT', '/web/rutorrent/plugins/linkcakebox', 'ruTorrent Plugin Link Cakebox', null, null, null, 'https://github.com/Cakebox/linkcakebox.git', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (20, 'GIT', '/sources/libsodium', 'Libsodium', null, null, null, 'https://github.com/jedisct1/libsodium', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (21, 'TARGZ', '/sources/dnscrypt-proxy', 'DNScrypt-proxy', '1.4.3', 'dnscrypt-proxy_v1.4.3.tar.gz', 'dnscrypt-proxy_v1.4.2.tar.gz', 'http://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-1.4.3.tar.gz', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (22, 'WBM', '/files', 'OpenVPNadmin WebMin', 2.6, 'openvpn-2.6.wbm', null, 'http://www.openit.it/downloads/OpenVPNadmin/openvpn-2.6.wbm.gz', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (23, 'WBM', '/files', 'Nginx Webmin Module', '0.0.8', 'nginx-0.08.wbm', null, 'http://www.justindhoffman.com/sites/justindhoffman.com/files/nginx-0.08.wbm__0.gz', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (24, 'WBM', '/files', 'MiniDLNA Webmin Module', 'alpha1.12 svn26', 'minidlnawebmin_alpha1_12.wbm', null, 'http://downloads.sourceforge.net/project/minidlnawebmin/Webmin%20alpha1.12%20svn26/minidlnawebmin_alpha1_12.wbm?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fminidlnawebmin%2Ffiles%2FWebmin%2520alpha1.12%2520svn26%2F&ts=1420088634&use_mirror=freefr', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (25, 'TARGZ', '/sources/libtorrent', 'LibTorrent', '0.13.4', 'libtorrent_v0.13.4.tar.gz', null, 'http://libtorrent.rakshasa.no/downloads/libtorrent-0.13.4.tar.gz', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (26, 'TARGZ', '/sources/rtorrent', 'rTorrent', '0.9.4', 'rtorrent_v0.9.4.tar.gz', null, 'http://libtorrent.rakshasa.no/downloads/rtorrent-0.9.4.tar.gz', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (27, 'SVN', '/sources/xmlrpc-c', 'XMLRPC', null, null, null, 'http://svn.code.sf.net/p/xmlrpc-c/code/advanced', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (28, 'GIT', '/web/loadavg', 'LoadAvg', null, null, null, 'https://github.com/loadavg/loadavg.git', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (29, 'SVN', '/web/rutorrent/plugins/pausewebui', 'ruTorrent Plugin Pause WebUI', null, null, null, 'http://rutorrent-pausewebui.googlecode.com/svn/trunk/', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (30, 'GIT', '/web/rutorrent/plugins/mobile', 'ruTorrent Plugin Mobile', null, null, null, 'https://github.com/xombiemp/rutorrentMobile.git', 1);
INSERT INTO [repositories] ([id_repositories], [type], [dir], [name], [version], [file], [old_file], [url], [active]) VALUES (31, 'GIT', '/web/rutorrent/plugins/autodl-irssi', 'ruTorrent Plugin Autodl-irssi', null, null, null, 'https://github.com/autodl-community/autodl-rutorrent.git', 0);

-- Table: services
CREATE TABLE services ( 
    id_services    INTEGER        PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                  NOT NULL ON CONFLICT ABORT
                                  UNIQUE ON CONFLICT ABORT,
    serv_name      VARCHAR( 32 )  NOT NULL ON CONFLICT ABORT
                                  UNIQUE ON CONFLICT IGNORE,
    bin            VARCHAR( 32 ),
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

INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (1, 'Seedbox-Manager', '', '', '', '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (2, 'CakeBox-Light', '', '', '', '', '', '', '', '', '', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (3, 'Plex Media Server', '', '', '', '', '32400 32469', '', '', ' ', '1900 5353 32410 32412 32413 32414', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (4, 'Webmin', '', 8890, '', '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (5, 'OpenVPN', '', 8893, 8894, 8895, '', '', '', '', '', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (6, 'LogWatch', '', '', '', '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (7, 'Fail2Ban', '', '', '', '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (8, 'PeerGuardian', '', '', '', '', '', '', '', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (9, 'rTorrent Block List', '', '', '', '', '', '', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (10, 'DNScrypt-proxy', '', '', '', '', '', '', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (11, 'CRON', '', '', '', '', '', '', ' ', ' ', ' ', 1, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (12, 'NginX', '', 8889, 8888, '', '', '', '', '', '', 1, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (13, 'SSH', '', 8892, '', '', '', '', '', '', '', 1, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (14, 'VSFTPd', '', 8891, 8800, '65000:65535', '', '', '', '', '', 1, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (15, 'PHP5-FPM', '', '', '', '', '', '', ' ', ' ', ' ', 1, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (16, 'Postfix', '', '', '', '', '', '', ' ', ' ', ' ', 1, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (17, 'Networking', '', '', '', '', '', '', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (18, 'Samba', '', '', '', '', '', '', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (19, 'NFS', '', '', '', '', '', '', ' ', ' ', ' ', 1, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (20, 'BIND', '', '', '', '', '', '', ' ', ' ', ' ', 1, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (21, 'Stunnel', '', '', '', '', '', '', ' ', ' ', ' ', 0, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (22, 'rTorrent v0.9.2', '/usr/bin/rtorrent', null, null, null, null, null, null, null, null, 1, 0);
INSERT INTO [services] ([id_services], [serv_name], [bin], [port_tcp1], [port_tcp2], [port_tcp3], [ports_tcp_list], [port_udp1], [port_udp2], [port_udp3], [ports_udp_list], [to_install], [is_installed]) VALUES (23, 'rTorrent v0.9.4', '/usr/local/bin/rtorrent', null, null, null, null, null, null, null, null, 1, 0);

-- Table: users
CREATE TABLE users ( 
    id_users         INTEGER         PRIMARY KEY ON CONFLICT IGNORE AUTOINCREMENT
                                     NOT NULL ON CONFLICT ABORT
                                     UNIQUE ON CONFLICT ABORT,
    users_ident      VARCHAR( 32 )   NOT NULL ON CONFLICT ABORT
                                     UNIQUE ON CONFLICT IGNORE,
    users_email      VARCHAR( 260 )  NOT NULL ON CONFLICT ABORT,
    users_passwd     VARCHAR( 32 ),
    rpc              VARCHAR( 64 ),
    sftp             BOOLEAN( 1 )    DEFAULT ( 1 ),
    sudo             BOOLEAN( 1 )    DEFAULT ( 0 ),
    admin            BOOLEAN( 1 )    DEFAULT ( 0 ),
    scgi_port        INTEGER( 5 ),
    rtorrent_port    INTEGER( 5 ),
    home_dir         VARCHAR( 128 ),
    is_active        BOOLEAN( 1 )    DEFAULT ( 1 ),
    rtorrent_version VARCHAR( 10 )   DEFAULT ( 'v0.9.2' ),
    rtorrent_restart BOOLEAN( 1 )    DEFAULT ( '0' ) 
);


-- Table: system
CREATE TABLE system ( 
    id_system          INTEGER( 1, 1 )  PRIMARY KEY ON CONFLICT IGNORE
                                        NOT NULL ON CONFLICT ABORT,
    mysb_version       VARCHAR( 6 )     NOT NULL ON CONFLICT ABORT
                                        UNIQUE ON CONFLICT IGNORE,
    mysb_user          VARCHAR( 32 )    UNIQUE ON CONFLICT IGNORE,
    mysb_password      VARCHAR( 32 )    UNIQUE ON CONFLICT IGNORE,
    hostname           VARCHAR( 128 )   UNIQUE ON CONFLICT IGNORE,
    ipv4               VARCHAR( 15 )    UNIQUE ON CONFLICT IGNORE,
    primary_inet       VARCHAR( 16 )    UNIQUE ON CONFLICT IGNORE,
    timezone           VARCHAR( 64 )    UNIQUE ON CONFLICT IGNORE,
    cert_password      VARCHAR( 32 )    UNIQUE ON CONFLICT IGNORE,
    apt_update         BOOLEAN( 1 )     DEFAULT ( 1 ),
    apt_date           DATETIME,
    server_provider    VARCHAR( 16 ),
    ip_restriction     BOOLEAN( 1 )     DEFAULT ( 1 ),
    pgl_email_stats    BOOLEAN( 1 )     DEFAULT ( 0 ),
    pgl_watchdog_email BOOLEAN( 1 )     DEFAULT ( 0 ) 
);

INSERT INTO [system] ([id_system], [mysb_version], [mysb_user], [mysb_password], [hostname], [ipv4], [primary_inet], [timezone], [cert_password], [apt_update], [apt_date], [server_provider], [ip_restriction], [pgl_email_stats], [pgl_watchdog_email]) VALUES (1, '', '', '', '', '', '', '', '', 0, '', '', 1, 0, 0);
