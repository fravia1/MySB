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

function Form() {
	global $MySB_DB;

	echo '<form class="form_settings" method="post" action="">
			<div align="center"><table border="0">
				<tr>
					<td>Username :</td>
					<td><input name="username" type="text" /></td>
				</tr>
				<tr>
					<td>User e-mail :</td>
					<td><input name="email" type="text" /></td>
				</tr>
				<tr>
					<td>Confirm :</td>
					<td><input name="confirm_email" type="text" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="submit" name="submit" type="submit" value="Submit"">
					</td>
				</tr>
			</table></div>
		</form>';
}

if ( isset($_POST['submit']) ) {
	$username = $_POST['username'];
	$email = $_POST['email'];
	$confirm_email = $_POST['confirm_email'];

	if ( ($username != '') && ($email != '') && ($confirm_email != '') ) {
			if ( ValidateEmail($email) != false ) {
				if ( $email == $confirm_email ) {
					$type = 'success';
					$args = "$username";
				} else {
					$type = 'error';
					$message = 'Error between the typed email and verification.';
				}
			} else {
				$type = 'error';
				$message = 'The given e-mail address is not valid!';
			}
	} else {
		$type = 'information';
		$message = 'Please, complete all fields.';
	}

	GenerateMessage('MySB_CreateUser', $type, $message, $args);
}

Form();

<?php
//#################### LAST LINE ######################################
?>