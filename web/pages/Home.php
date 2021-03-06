<?php
// ----------------------------------
//  __/\\\\____________/\\\\___________________/\\\\\\\\\\\____/\\\\\\\\\\\\\___
//   _\/\\\\\\________/\\\\\\_________________/\\\/////////\\\_\/\\\/////////\\\_
//    _\/\\\//\\\____/\\\//\\\____/\\\__/\\\__\//\\\______\///__\/\\\_______\/\\\_
//     _\/\\\\///\\\/\\\/_\/\\\___\//\\\/\\\____\////\\\_________\/\\\\\\\\\\\\\\__
//      _\/\\\__\///\\\/___\/\\\____\//\\\\\________\////\\\______\/\\\/////////\\\_
//       _\/\\\____\///_____\/\\\_____\//\\\____________\////\\\___\/\\\_______\/\\\_
//        _\/\\\_____________\/\\\__/\\_/\\\______/\\\______\//\\\__\/\\\_______\/\\\_
//         _\/\\\_____________\/\\\_\//\\\\/______\///\\\\\\\\\\\/___\/\\\\\\\\\\\\\/__
//          _\///______________\///___\////__________\///////////_____\/////////////_____
//			By toulousain79 ---> https://github.com/toulousain79/
//
//#####################################################################
//
//	Copyright (c) 2013 toulousain79 (https://github.com/toulousain79/)
//	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//	--> Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
//
//#################### FIRST LINE #####################################

// Vars
global $CurrentUser;
$IsMainUser = (MainUser($CurrentUser)) ? true : false;

echo '<h1><div align="center">Hi '.$CurrentUser.', welcome to MySB portal !</div></h1>';

switch ($IsMainUser) {
	case true:
		echo '
			<p></p>
			<p>As the main user you have additional features, such as:</p>
			<ul style="margin-left: 100px">
				<li>The trackers activation</li>
				<li>The addition of new trackers</li>
				<li>Blocklists activation for rTorrent and/or PeerGuardian <span class="Comments">(if installed)</span></li>
				<li>Rental management</li>
				<li>SMTP management</li>
				<li>Users management</li>
				<li>Viewing logs</li>
			</ul>
			<p>More of the following:</p>
			<ul style="margin-left: 100px">
				<li>Display your account information</li>
				<li>Change your password</li>
				<li>Manage your authorized connection addresses <span class="Comments">(IP or dynamic DNS)</span></li>
				<li>Download the configuration files for OpenVPN <span class="Comments">(if installed)</span></li>
			</ul>
		';
		break;

	case false:
		echo '
			<p></p>
			<p>As a normal user, you have the following possibilities:</p>
			<ul style="margin-left: 100px">
				<li>Display your account information</li>
				<li>Change your password</li>
				<li>Manage your authorized connection addresses <span class="Comments">(IP or dynamic DNS)</span></li>
				<li>Download the configuration files for OpenVPN <span class="Comments">(if installed)</span></li>
			</ul>
		';
		break;
}

//#################### LAST LINE ######################################
?>