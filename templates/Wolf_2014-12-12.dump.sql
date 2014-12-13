
-- Table: secure_token
CREATE TABLE secure_token ( 
    id       INTEGER         NOT NULL
                             PRIMARY KEY,
    username VARCHAR( 40 )   DEFAULT NULL,
    url      VARCHAR( 255 )  DEFAULT NULL,
    time     VARCHAR( 100 )  DEFAULT NULL 
);


-- Table: cron
CREATE TABLE cron ( 
    id      INTEGER NOT NULL
                    PRIMARY KEY,
    lastrun TEXT 
);

INSERT INTO [cron] ([id], [lastrun]) VALUES (1, 0);

-- Table: layout
CREATE TABLE layout ( 
    id            INTEGER         NOT NULL
                                  PRIMARY KEY,
    name          VARCHAR( 100 )  DEFAULT NULL,
    content_type  VARCHAR( 80 )   DEFAULT NULL,
    content       TEXT,
    created_on    DATETIME        DEFAULT NULL,
    updated_on    DATETIME        DEFAULT NULL,
    created_by_id INT( 11 )       DEFAULT NULL,
    updated_by_id INT( 11 )       DEFAULT NULL,
    position      MEDIUMINT( 6 )  DEFAULT NULL 
);

INSERT INTO [layout] ([id], [name], [content_type], [content], [created_on], [updated_on], [created_by_id], [updated_by_id], [position]) VALUES (5, 'MySB', 'MySB', '<?php require_once ''/etc/MySB/web/pages/Layout.php''; ?>', '2014-11-27 07:51:41', '2014-12-02 07:10:24', 1, 1, null);

-- Table: page
CREATE TABLE page ( 
    id            INTEGER         NOT NULL
                                  PRIMARY KEY,
    title         VARCHAR( 255 )  DEFAULT NULL,
    slug          VARCHAR( 100 )  NOT NULL
                                  DEFAULT '',
    breadcrumb    VARCHAR( 160 )  DEFAULT NULL,
    keywords      VARCHAR( 255 )  DEFAULT NULL,
    description   TEXT,
    parent_id     INT( 11 )       DEFAULT NULL,
    layout_id     INT( 11 )       DEFAULT NULL,
    behavior_id   VARCHAR( 25 )   NOT NULL
                                  DEFAULT '',
    status_id     INT( 11 )       NOT NULL
                                  DEFAULT '100',
    created_on    DATETIME        DEFAULT NULL,
    published_on  DATETIME        DEFAULT NULL,
    valid_until   DATETIME        DEFAULT NULL,
    updated_on    DATETIME        DEFAULT NULL,
    created_by_id INT( 11 )       DEFAULT NULL,
    updated_by_id INT( 11 )       DEFAULT NULL,
    position      MEDIUMINT( 6 )  DEFAULT '0',
    is_protected  TINYINT( 1 )    NOT NULL
                                  DEFAULT '0',
    needs_login   TINYINT( 1 )    NOT NULL
                                  DEFAULT '2' 
);

INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (1, 'Home', '', 'Home', '', '', 0, 5, '', 100, '2014-11-26 16:43:49', '2014-11-26 16:43:50', '', '2014-12-13 01:08:22', 1, 1, 0, 1, 0);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (2, 'User', 'user', 'User', '', '', 1, 0, 'Redirect_to_first_child', 100, '2014-11-27 09:34:31     ', '2014-11-27 09:34:31     ', '', '2014-12-08 13:43:24', 1, 1, 1, 0, 2);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (3, 'Logs', 'logs', 'Logs Files', '', '', 12, 0, '', 101, '2014-11-27 14:29:40', '2014-11-27 14:29:58', '', '2014-12-13 01:12:05', 1, 1, 11, 1, 1);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (4, 'Change Password', 'change-password', 'Change Password', '', '', 2, 0, '', 100, '2014-11-29 11:58:16', '2014-11-29 11:58:16', '', '2014-12-05 09:00:47', 1, 1, 3, 0, 2);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (5, 'Manage Addresses', 'manage-addresses', 'Manage Addresses', '', '', 2, 0, '', 100, '2014-11-29 11:59:14', '2014-11-29 11:59:14', '', '2014-12-05 09:01:06', 1, 1, 4, 0, 2);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (6, 'Trackers', 'trackers', 'Trackers', '', '', 1, 0, 'Redirect_to_first_child', 101, '2014-11-29 12:00:04     ', '2014-11-29 12:00:04     ', '', '2014-12-08 13:43:24', 1, 1, 2, 1, 1);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (8, 'Add new trackers', 'add-new-trackers', 'Add new trackers', '', '', 6, 0, '', 101, '2014-11-30 00:54:22  ', '2014-11-30 00:54:22  ', '', '2014-12-08 11:16:20', 1, 1, 4, 1, 1);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (9, 'Trackers List', 'trackers-list', 'Global Trackers List', '', '', 6, 0, '', 101, '2014-11-30 00:58:45  ', '2014-11-30 00:58:45  ', '', '2014-12-08 11:16:20', 1, 1, 3, 1, 1);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (10, 'User Infos', 'user-infos', 'User Informations', '', '', 2, 0, '', 100, '2014-11-30 01:00:01', '2014-11-30 01:00:01', '', '2014-12-13 01:08:10', 1, 1, 2, 0, 2);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (11, 'OpenVPN Config File', 'openvpn-config-file', 'OpenVPN Config File', '', '', 2, 0, '', 100, '2014-11-30 01:17:50', '2014-11-30 01:17:50', '', '2014-12-05 09:01:32', 1, 1, 5, 0, 2);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (12, 'Main User', 'main-user', 'Main user', '', '', 1, 0, 'Redirect_to_first_child', 101, '2014-12-01 22:30:46     ', '2014-12-01 22:30:46     ', '', '2014-12-08 13:43:24', 1, 1, 4, 1, 1);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (13, 'Renting Infos', 'renting-infos', 'Renting Infos', '', '', 12, 0, '', 101, '2014-12-01 22:31:59', '2014-12-01 22:31:59', '', '2014-12-13 01:11:59', 1, 1, 10, 1, 1);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (14, 'Help', 'help', 'Help', '', '', 1, 0, '', 100, '2014-12-07 08:12:24', '2014-12-07 08:12:24', '', '2014-12-13 01:12:15', 1, 1, 5, 0, 2);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (15, 'IP restriction', 'ip-restriction', 'IP restriction', '', '', 14, 0, '', 100, '2014-12-07 15:46:09', '2014-12-07 15:46:09', '', '2014-12-07 15:46:47', 1, 1, 0, 0, 2);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (16, 'Trackers', 'trackers', 'Trackers', '', '', 14, 0, '', 100, '2014-12-07 15:52:45', '2014-12-07 15:52:45', '', '2014-12-13 01:12:49', 1, 1, 0, 0, 2);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (17, 'Blocklists', 'blocklists', 'Blocklists', '', '', 1, 0, 'Redirect_to_first_child', 101, '2014-12-08 10:18:13', '2014-12-08 10:18:13', '', '2014-12-13 01:08:45', 1, 1, 3, 1, 1);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (18, 'PeerGuardian BlockLists', 'peerguardian-blocklists', 'PeerGuardian Blocklists', '', '', 17, 0, '', 101, '2014-12-08 10:20:00', '2014-12-08 10:20:00', '', '2014-12-13 01:11:19', 1, 1, 7, 1, 1);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (19, 'rTorrent Blocklists', 'rtorrent-blocklists', 'rTorrent Blocklists', '', '', 17, 0, '', 101, '2014-12-08 10:40:57', null, null, '2014-12-13 01:10:49', 1, 1, 6, 1, 1);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (20, 'Blocklists', 'blocklists', 'Blocklists', '', '', 14, 0, '', 100, '2014-12-08 11:17:28', '2014-12-08 11:17:28', '', '2014-12-13 01:12:22', 1, 1, 0, 0, 2);
INSERT INTO [page] ([id], [title], [slug], [breadcrumb], [keywords], [description], [parent_id], [layout_id], [behavior_id], [status_id], [created_on], [published_on], [valid_until], [updated_on], [created_by_id], [updated_by_id], [position], [is_protected], [needs_login]) VALUES (21, 'Apply configuration', 'apply-configuration', 'Apply configuration', '', '', 1, 0, '', 100, '2014-12-08 13:43:17', '2014-12-08 13:48:46', '', '2014-12-13 01:13:09', 1, 1, 6, 1, 2);

-- Table: page_part
CREATE TABLE page_part ( 
    id           INTEGER         NOT NULL
                                 PRIMARY KEY,
    name         VARCHAR( 100 )  DEFAULT NULL,
    filter_id    VARCHAR( 25 )   DEFAULT NULL,
    content      LONGTEXT,
    content_html LONGTEXT,
    page_id      INT( 11 )       DEFAULT NULL 
);

INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (1, 'body', '', '<?php require_once ''/etc/MySB/web/pages/Home.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/Home.php''; ?>', 1);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (10, 'body', '', '', '', 2);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (11, 'body', '', '<?php require_once ''/etc/MySB/web/pages/Logs.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/Logs.php''; ?>', 3);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (12, 'body', '', '<?php require_once ''/etc/MySB/web/pages/ChangePassword.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/ChangePassword.php''; ?>', 4);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (13, 'body', '', '<?php require_once ''/etc/MySB/web/pages/ManageAddresses.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/ManageAddresses.php''; ?>', 5);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (14, 'body', '', '', '', 6);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (16, 'body', '', '<?php require_once ''/etc/MySB/web/pages/TrackersAdd.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/TrackersAdd.php''; ?>', 8);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (17, 'body', '', '<?php require_once ''/etc/MySB/web/pages/TrackersList.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/TrackersList.php''; ?>', 9);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (18, 'body', '', '<?php require_once ''/etc/MySB/web/pages/UserInfo.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/UserInfo.php''; ?>', 10);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (19, 'body', '', '<?php require_once ''/etc/MySB/web/pages/OpenVPN.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/OpenVPN.php''; ?>', 11);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (20, 'body', 'textile', '', '', 12);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (21, 'body', '', '<?php require_once ''/etc/MySB/web/pages/RentingInfo.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/RentingInfo.php''; ?>', 13);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (22, 'body', 'textile', '* "IP restriction(IP restriction)":?help/ip-restriction.html
* "Trackers(Trackers)":?help/trackers.html
* "Blocklists(Blocklists)":?help/blocklists.html', '	<ul>
		<li><a href="?help/ip-restriction.html" title="IP restriction">IP restriction</a></li>
		<li><a href="?help/trackers.html" title="Trackers">Trackers</a></li>
		<li><a href="?help/blocklists.html" title="Blocklists">Blocklists</a></li>
	</ul>', 14);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (23, 'body', 'textile', 'IP restriction is applied for access to the MySB portal.
In case you do not have a fixed IP address, you can use a service such as ''No-IP'' or ''DynDNS''.
You can add a host name instead of an IP address "here(here)":?user/manage-addresses.html.

"http://www.noip.com/(No-IP.com)":http://www.noip.com/
"http://www.dyndns.fr/(DynDNS.fr)":http://www.dyndns.fr/
"https://account.dyn.com/entrance/(DynDNS.com)":https://account.dyn.com/entrance/', '	<p>IP restriction is applied for access to the MySB portal.<br />
In case you do not have a fixed IP address, you can use a service such as &#8216;No-IP&#8217; or &#8216;DynDNS&#8217;.<br />
You can add a host name instead of an IP address <a href="?user/manage-addresses.html" title="here">here</a>.</p>

	<p><a href="http://www.noip.com/" title="No-IP.com">http://www.noip.com/</a><br />
<a href="http://www.dyndns.fr/" title="DynDNS.fr">http://www.dyndns.fr/</a><br />
<a href="https://account.dyn.com/entrance/" title="DynDNS.com">https://account.dyn.com/entrance/</a></p>', 15);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (24, 'body', 'textile', 'You have an existing list of trackers generated from ruTorrent.
Trackers in this list are not deletable. It is only possible to enable or disable it.

You also have the option to add your own trackers "here(here)":?trackers/add-new-trackers.html.
Your trackers will also be displayed in the global list available "here(here)":?trackers/trackers-list.html.', '	<p>You have an existing list of trackers generated from ruTorrent.<br />
Trackers in this list are not deletable. It is only possible to enable or disable it.</p>

	<p>You also have the option to add your own trackers <a href="?trackers/add-new-trackers.html" title="here">here</a>.<br />
Your trackers will also be displayed in the global list available <a href="?trackers/trackers-list.html" title="here">here</a>.</p>', 16);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (25, 'body', '', '', '', 17);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (26, 'body', '', '<?php require_once ''/etc/MySB/web/pages/BlockLists_PGL.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/BlockLists_PGL.php''; ?>', 18);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (27, 'body', '', '<?php require_once ''/etc/MySB/web/pages/BlockLists_rTorrent.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/BlockLists_rTorrent.php''; ?>', 19);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (28, 'body', 'textile', 'It is possible to use a blocklist with rTorrent.
Similarly, if you have decided to use PeerGuardian, a second blocklist will also be available.
Although PeerGuardian is installed, it''s still a good idea to also select the lists for rTorrent.
For if PeerGuardian has a problem and can not be launched, the blacklist of rTorrent will take over.
"rTorrent blocklists(rTorrent blocklists)":?blocklists/rtorrent.html
"PeerGuardian blocklists(PeerGuardian blocklists)":?blocklists/peerguardian.html', '	<p>It is possible to use a blocklist with rTorrent.<br />
Similarly, if you have decided to use PeerGuardian, a second blocklist will also be available.<br />
Although PeerGuardian is installed, it&#8217;s still a good idea to also select the lists for rTorrent.<br />
For if PeerGuardian has a problem and can not be launched, the blacklist of rTorrent will take over.<br />
<a href="?blocklists/rtorrent.html" title="rTorrent blocklists">rTorrent blocklists</a><br />
<a href="?blocklists/peerguardian.html" title="PeerGuardian blocklists">PeerGuardian blocklists</a></p>', 20);
INSERT INTO [page_part] ([id], [name], [filter_id], [content], [content_html], [page_id]) VALUES (29, 'body', '', '<?php require_once ''/etc/MySB/web/pages/ApplyConfig.php''; ?>', '<?php require_once ''/etc/MySB/web/pages/ApplyConfig.php''; ?>', 21);

-- Table: page_tag
CREATE TABLE page_tag ( 
    page_id INT( 11 )  NOT NULL,
    tag_id  INT( 11 )  NOT NULL 
);


-- Table: permission
CREATE TABLE permission ( 
    id   INTEGER        NOT NULL
                        PRIMARY KEY,
    name VARCHAR( 25 )  NOT NULL 
);

INSERT INTO [permission] ([id], [name]) VALUES (2, 'admin_edit');
INSERT INTO [permission] ([id], [name]) VALUES (1, 'admin_view');
INSERT INTO [permission] ([id], [name]) VALUES (26, 'backup_restore_view');
INSERT INTO [permission] ([id], [name]) VALUES (24, 'file_manager_chmod');
INSERT INTO [permission] ([id], [name]) VALUES (25, 'file_manager_delete');
INSERT INTO [permission] ([id], [name]) VALUES (21, 'file_manager_mkdir');
INSERT INTO [permission] ([id], [name]) VALUES (22, 'file_manager_mkfile');
INSERT INTO [permission] ([id], [name]) VALUES (23, 'file_manager_rename');
INSERT INTO [permission] ([id], [name]) VALUES (20, 'file_manager_upload');
INSERT INTO [permission] ([id], [name]) VALUES (19, 'file_manager_view');
INSERT INTO [permission] ([id], [name]) VALUES (8, 'layout_add');
INSERT INTO [permission] ([id], [name]) VALUES (10, 'layout_delete');
INSERT INTO [permission] ([id], [name]) VALUES (9, 'layout_edit');
INSERT INTO [permission] ([id], [name]) VALUES (7, 'layout_view');
INSERT INTO [permission] ([id], [name]) VALUES (16, 'page_add');
INSERT INTO [permission] ([id], [name]) VALUES (18, 'page_delete');
INSERT INTO [permission] ([id], [name]) VALUES (17, 'page_edit');
INSERT INTO [permission] ([id], [name]) VALUES (15, 'page_view');
INSERT INTO [permission] ([id], [name]) VALUES (12, 'snippet_add');
INSERT INTO [permission] ([id], [name]) VALUES (14, 'snippet_delete');
INSERT INTO [permission] ([id], [name]) VALUES (13, 'snippet_edit');
INSERT INTO [permission] ([id], [name]) VALUES (11, 'snippet_view');
INSERT INTO [permission] ([id], [name]) VALUES (4, 'user_add');
INSERT INTO [permission] ([id], [name]) VALUES (6, 'user_delete');
INSERT INTO [permission] ([id], [name]) VALUES (5, 'user_edit');
INSERT INTO [permission] ([id], [name]) VALUES (3, 'user_view');

-- Table: role
CREATE TABLE role ( 
    id   INTEGER        NOT NULL
                        PRIMARY KEY,
    name VARCHAR( 25 )  NOT NULL 
);

INSERT INTO [role] ([id], [name]) VALUES (1, 'administrator');
INSERT INTO [role] ([id], [name]) VALUES (2, 'developer');
INSERT INTO [role] ([id], [name]) VALUES (3, 'editor');

-- Table: setting
CREATE TABLE setting ( 
    name  VARCHAR( 40 )  NOT NULL,
    value TEXT           NOT NULL 
);

INSERT INTO [setting] ([name], [value]) VALUES ('admin_title', 'MySB');
INSERT INTO [setting] ([name], [value]) VALUES ('admin_email', '');
INSERT INTO [setting] ([name], [value]) VALUES ('language', 'en');
INSERT INTO [setting] ([name], [value]) VALUES ('theme', 'black_and_white');
INSERT INTO [setting] ([name], [value]) VALUES ('default_status_id', 100);
INSERT INTO [setting] ([name], [value]) VALUES ('default_filter_id', 'textile');
INSERT INTO [setting] ([name], [value]) VALUES ('default_tab', 'page');
INSERT INTO [setting] ([name], [value]) VALUES ('allow_html_title', 'off');
INSERT INTO [setting] ([name], [value]) VALUES ('plugins', 'a:2:{s:23:"redirect_to_first_child";i:1;s:7:"textile";i:1;}');

-- Table: plugin_settings
CREATE TABLE plugin_settings ( 
    plugin_id VARCHAR( 40 )   NOT NULL,
    name      VARCHAR( 40 )   NOT NULL,
    value     VARCHAR( 255 )  NOT NULL 
);

INSERT INTO [plugin_settings] ([plugin_id], [name], [value]) VALUES ('file_manager', 'umask', 0022);
INSERT INTO [plugin_settings] ([plugin_id], [name], [value]) VALUES ('file_manager', 'dirmode', 0755);
INSERT INTO [plugin_settings] ([plugin_id], [name], [value]) VALUES ('file_manager', 'filemode', 0644);
INSERT INTO [plugin_settings] ([plugin_id], [name], [value]) VALUES ('file_manager', 'show_hidden', 0);
INSERT INTO [plugin_settings] ([plugin_id], [name], [value]) VALUES ('file_manager', 'show_backups', 1);
INSERT INTO [plugin_settings] ([plugin_id], [name], [value]) VALUES ('archive', 'use_dates', 1);

-- Table: snippet
CREATE TABLE snippet ( 
    id            INTEGER         NOT NULL
                                  PRIMARY KEY,
    name          VARCHAR( 100 )  NOT NULL
                                  DEFAULT '',
    filter_id     VARCHAR( 25 )   DEFAULT NULL,
    content       TEXT,
    content_html  TEXT,
    created_on    DATETIME        DEFAULT NULL,
    updated_on    DATETIME        DEFAULT NULL,
    created_by_id INT( 11 )       DEFAULT NULL,
    updated_by_id INT( 11 )       DEFAULT NULL,
    position      MEDIUMINT( 6 )  DEFAULT NULL 
);


-- Table: tag
CREATE TABLE tag ( 
    id    INTEGER        NOT NULL
                         PRIMARY KEY,
    name  VARCHAR( 40 )  NOT NULL,
    count INT( 11 )      NOT NULL 
);


-- Table: user
CREATE TABLE user ( 
    id            INTEGER          NOT NULL
                                   PRIMARY KEY,
    name          VARCHAR( 100 )   DEFAULT NULL,
    email         VARCHAR( 255 )   DEFAULT NULL,
    username      VARCHAR( 40 )    NOT NULL,
    password      VARCHAR( 1024 )  DEFAULT NULL,
    salt          VARCHAR( 1024 )  DEFAULT NULL,
    language      VARCHAR( 5 )     DEFAULT NULL,
    last_login    DATETIME         DEFAULT NULL,
    last_failure  DATETIME         DEFAULT NULL,
    failure_count INT( 11 )        DEFAULT NULL,
    created_on    DATETIME         DEFAULT NULL,
    updated_on    DATETIME         DEFAULT NULL,
    created_by_id INT( 11 )        DEFAULT NULL,
    updated_by_id INT( 11 )        DEFAULT NULL,
    CONSTRAINT uc_email UNIQUE ( email ) 
);

INSERT INTO [user] ([id], [name], [email], [username], [password], [salt], [language], [last_login], [last_failure], [failure_count], [created_on], [updated_on], [created_by_id], [updated_by_id]) VALUES (1, '', '', '', '', '', 'en', '', '', 0, '', '', 1, '');

-- Table: user_role
CREATE TABLE user_role ( 
    user_id INT( 11 )  NOT NULL,
    role_id INT( 11 )  NOT NULL 
);

INSERT INTO [user_role] ([user_id], [role_id]) VALUES (1, 1);

-- Table: role_permission
CREATE TABLE role_permission ( 
    role_id       INT( 11 )  NOT NULL,
    permission_id INT( 11 )  NOT NULL 
);

INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 1);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 2);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 3);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 4);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 5);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 6);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 7);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 8);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 9);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 10);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 11);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 12);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 13);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 14);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 15);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 16);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 17);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 18);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 19);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 20);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 21);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 22);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 23);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 24);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 25);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (1, 26);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 1);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 7);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 8);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 9);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 10);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 11);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 12);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 13);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 14);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 15);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 16);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 17);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 18);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 19);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 20);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 21);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 22);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 23);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 24);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 25);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (2, 26);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 1);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 15);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 16);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 17);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 18);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 19);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 20);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 21);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 22);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 23);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 24);
INSERT INTO [role_permission] ([role_id], [permission_id]) VALUES (3, 25);

-- Index: username_url
CREATE UNIQUE INDEX username_url ON secure_token ( 
    username,
    url 
);


-- Index: layout_name
CREATE UNIQUE INDEX layout_name ON layout ( 
    name 
);


-- Index: page_tag_page_id
CREATE UNIQUE INDEX page_tag_page_id ON page_tag ( 
    page_id,
    tag_id 
);


-- Index: permission_name
CREATE UNIQUE INDEX permission_name ON permission ( 
    name 
);


-- Index: role_name
CREATE UNIQUE INDEX role_name ON role ( 
    name 
);


-- Index: setting_id
CREATE UNIQUE INDEX setting_id ON setting ( 
    name 
);


-- Index: plugin_setting_id
CREATE UNIQUE INDEX plugin_setting_id ON plugin_settings ( 
    plugin_id,
    name 
);


-- Index: snippet_name
CREATE UNIQUE INDEX snippet_name ON snippet ( 
    name 
);


-- Index: tag_name
CREATE UNIQUE INDEX tag_name ON tag ( 
    name 
);


-- Index: user_username
CREATE UNIQUE INDEX user_username ON user ( 
    username 
);


-- Index: user_role_user_id
CREATE UNIQUE INDEX user_role_user_id ON user_role ( 
    user_id,
    role_id 
);


-- Index: role_permission_role_id
CREATE UNIQUE INDEX role_permission_role_id ON role_permission ( 
    role_id,
    permission_id 
);
