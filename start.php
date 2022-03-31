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



echo '<style>
.two-two {
  display: grid;
  grid-template-columns: auto auto; // 20vw 40vw for me because I have dt and dd
  padding: 10px;
  text-align: left;
  margin:15px;
  column-gap:15px;
  background-color:lightyellow;
}
</style>';

//required to show student details when delete

if(isset($_POST['tname']))
{
	if($_POST['tname']=='bed_allocation' && $_POST['action']=='delete')
	{
		$_POST['student_id']=isset($_POST['student_id'])?$_POST['student_id']:get_student_id($link,$_POST['id']);
	}
}

show_manage_single_table_button('student','Manage Students');
show_manage_single_table_button('hostel_beds','Manage Beds');

single_table_button_with_action('bed_allocation','View Student History','search');

/*
echo '<div class="two-two">';
	echo '<div>';
		echo '<h4>Available Hostel Beds</h4>';
		add_direct($link,'hostel_beds',$header='no');
	echo '</div>';
	echo '<div>';
		echo '<h4>Students</h4>';
		add_direct($link,'student',$header='no');
	echo '</div>';
echo '</div>';

echo '<div class="two-two">';
	echo '<div>';
		echo '<h4>Hostel Beds Allocation</h4>';
		add_direct($link,'bed_allocation',$header='no');
	echo '</div>';
	echo '<div>';
		echo '<h4>History</h4>';
		add_direct($link,'bed_allocation',$header='no');
	echo '</div>';	
echo '</div>';
*/

if($_POST['action']=='save_insert' &&  $_POST['tname'] == 'bed_allocation')
{
	if(function_exists('__f__validate_insert_hostel_beds'))
		{
			__f__validate_insert_hostel_beds($link,$_POST);
		} 
	select_with_condition($link,'bed_allocation',$join='and',array('student_id'=>$_POST['student_id']), ' order by date_of_allocation ');
	add_direct_with_default($link,'bed_allocation','yes',array('student_id'=>$_POST['student_id']),array('student_id'=>'readonly'));	
}

if(isset($_POST['tname']))
{		

	if(in_array($_POST['tname'],array('student','hostel_beds')))
	{
		manage_stf($link,$_POST,$show_crud='yes');
	}
	
	
	if(in_array($_POST['action'],array('edit','update','delete')) && in_array($_POST['tname'],array('bed_allocation')))
	{
		manage_stf($link,$_POST,$show_crud='no');		
	}
}

if($_POST['action']=='search' && in_array($_POST['tname'],array('bed_allocation')))
{
	echo '<h1>Choose Student</h1>';
	
	echo '<form method=post>';
		read_field($link,'bed_allocation','student_id','',$search='no');
		echo '<input type=hidden name=session_name value=\''.$_POST['session_name'].'\'>
				<input type=hidden name=tname value=bed_allocation>
				<input type=submit name=action value=display_search>
	</form></div>';
}

if(in_array($_POST['action'],array('update','display_search','delete')) && in_array($_POST['tname'],array('bed_allocation')))
{
	echo '<h1>Student History</h1>';
	select_with_condition($link,'bed_allocation',$join='and',array('student_id'=>$_POST['student_id']), ' order by date_of_allocation ');
	add_direct_with_default($link,'bed_allocation','yes',array('student_id'=>$_POST['student_id']),array('student_id'=>'readonly'));
}

//////////////user code ends////////////////
tail();
echo '<pre>start:post';print_r($_POST);echo '</pre>';
//echo '<pre>start:session';print_r($_SESSION);echo '</pre>';

?>
