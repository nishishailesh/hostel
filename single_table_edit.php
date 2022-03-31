<?php
//$GLOBALS['nojunk']='';
require_once 'base/verify_login.php';
require_once 'single_table_edit_common.php';
	////////User code below/////////////////////
echo '		  <link rel="stylesheet" href="project_common.css">
		  <script src="project_common.js"></script>';	
$link=get_link($GLOBALS['main_user'],$GLOBALS['main_pass']);
$user=get_user_info($link,$_SESSION['login']);
$auth=explode(',',$user['authorization']);
//print_r($auth);

list_available_tables($link);

manage_stf($link,$_POST);

echo '
<h5 class="bg-warning">Help</h5>
<ul>
	<li><b>Add Blank:</b> Add new empty record. </li>
	<li>Click pencil icon <img width=30 src=img/edit.png>to edit blank record / existing record </li>
	<li>Click BIN icon <img width=30 src=img/delete.png> to delete  it</li>
	<li><b>search:</b> Find existing records.</li>
	<li><b>list:</b> List records.(Max 100)</li>
	<li><b>How do I edit old record?:</b> Click list/search. Go to record. Click pencil icon <img width=30 src=img/edit.png>to edit  </li>
	
</ul>


';
//////////////user code ends////////////////
tail();

//echo '<pre>';print_r($_POST);print_r($_FILES);echo '</pre>';

//////////////Functions///////////////////////

?>
