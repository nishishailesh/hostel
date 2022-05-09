<?php
require_once 'base/verify_login.php';
	////////User code below/////////////////////

require_once 'single_table_edit_common.php';
require_once 'project_specific.php';

echo '		  <link rel="stylesheet" href="project_common.css">
		  <script src="project_common.js"></script>';
  

$link=get_link($GLOBALS['main_user'],$GLOBALS['main_pass']);

$user=get_user_info($link,$_SESSION['login']);
//print_r($user);
$auth=explode(',',$user['authorization']);


show_button_with_pk('hostel_beds','allotment',$_POST['id'],'allotment',$target=' target=_blank ',$action='action=print_allotment_letter.php');
show_button_with_pk('hostel_beds','residence',$_POST['id'],'residence proof',$target=' target=_blank ',$action='action=print_residence_proof.php');
tail();
echo '<pre>start:post';print_r($_POST);echo '</pre>';
//echo '<pre>start:session';print_r($_SESSION);echo '</pre>';

?>
