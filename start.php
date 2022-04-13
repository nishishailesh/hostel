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


//show_crud_button('hostel_beds','search');
//show_crud_button('hostel_beds','list');

//show_button('hostel_beds','show_empty_beds','Show Empty Beds');
show_button('hostel_beds','allot_bed','Allot/Empty Bed');


if($_POST['action']=='allot_bed' || $_POST['action']=='next' || $_POST['action']=='previous')
{
	allot_bed($link);
}

if($_POST['action']=='edit')
{
	edit_with_readonly_view_batch($link,'hostel_beds',$_POST['id'],'yes',array('hostel','room_number','allowed_sex','allowed_course', 'bed_number'));
	show_history($link,$_POST['id']);
	allot_bed($link);
}


if($_POST['action']=='update')
{			
	$chk_sql='select * from hostel_beds where id=\''.$_POST['id'].'\'';
	$chk_result=run_query($link,$GLOBALS['database'],$chk_sql);
	$chk_ar=get_single_row($chk_result);

	if(strlen($_POST['alloted_to'])==0)
	{
		$usql='update hostel_beds set alloted_to=null where id=\''.$_POST['id'].'\'';
	}
	else if($chk_ar['alloted_to']==$_POST['alloted_to'])
	{
		$usql='update hostel_beds set alloted_to=\''.$_POST['alloted_to'].'\'  , last_allotment_date=\''.$_POST['last_allotment_date'].'\' where id=\''.$_POST['id'].'\'';
	}
	else
	{
			if($chk_ar['alloted_to']==null)
			{
				$usql='update hostel_beds set alloted_to=\''.$_POST['alloted_to'].'\'  , last_allotment_date=\''.$_POST['last_allotment_date'].'\' where id=\''.$_POST['id'].'\'';
			}
			else
			{
				$usql=false;
				echo '<h3>Hostel Bed ID '.$chk_ar['id'].' is not vacant. Vacant it first then, try again</h3>';
			}
	}

	//echo '$usql:'.$usql;
	
	if($usql!=false)
	{
		if(!$result=run_query($link,$GLOBALS['database'],$usql))
		{
			echo '<h2>Error:(Possible Reasons)</h2>';
			echo '<ol>
					<li>This student may have been alloted another room. Vacate that room.</li>
					<li>Date of allotment not entered</li>
				</ol>';
			$duplicate_sql='select * from hostel_beds where alloted_to=\''.$_POST['alloted_to'].'\'';
			$duplicate_result=run_query($link,$GLOBALS['database'],$duplicate_sql);
			$ar=get_single_row($duplicate_result);
			//print_r($ar);
			echo '<h3>Hostel Bed ID '.$ar['id'].' is alloted to student_id '.$ar['alloted_to'].'</h3>';
		}
		else if(rows_affected($link)==0)
		{
			echo '<h3>No change. Transaction not recorded</h3>';
		}
		else
		{
		$ato=is_str_empty($_POST['alloted_to'])?' null ':$_POST['alloted_to'];	
		$tsql='insert into transaction (student_id,hostel_bed_id,date_of_allotment,recording_date,recorded_by)
						values(
						'. $ato .',
						\''.$_POST['id'].'\',
						\''.$_POST['last_allotment_date'].'\',
						now(),
						\''.$_SESSION['login'].'\'
						)';
		//echo $tsql;
		$tresult=run_query($link,$GLOBALS['database'],$tsql);
		}
	}
	allot_bed($link);
}


function show_history($link,$hostel_bed_id)
{
	$sql='select * from hostel_beds where id=\''.$hostel_bed_id.'\'';
	$result=run_query($link,$GLOBALS['database'],$sql);
	$ar=get_single_row($result);
	echo '<h3>Student History</h3>';
	$ssql='select *  from transaction where student_id=\''.$ar['alloted_to'].'\' order by date_of_allotment';
	view_sql_result_as_table($link,$ssql,'hide');
	$hsql='select *  from transaction where hostel_bed_id=\''.$ar['id'].'\'  order by date_of_allotment';
	echo '<h3>Hostel Bed History</h3>';
	view_sql_result_as_table($link,$hsql,'hide');
	
}


function is_str_empty($str)
{
	if(strlen($str)==0){return true;}
	else{return false;}
}
function update_with_batch($link,$tname)
{
	foreach($_POST as $k=>$v)
	{
		if(!in_array($k,array('action','tname','session_name','id','recording_time','recorded_by','offset')))
		{
			//echo $k.'#<br>';
			update_one_field($link,$tname,$k,$_POST['id']);
		}
	}
	foreach($_FILES as $k=>$v)
	{
		if(!in_array($k,array('action','tname','session_name','id','recording_time','recorded_by','offset')))
		{
			update_one_field_blob($link,$tname,$k,$k.'_name',$_POST['id']);
		}
	}	
}

function show_button($tname,$type,$label='')
{
	if(strlen($label)==0){$label=$type;}
	echo '<div class="d-inline-block" ><form method=post class=print_hide>
	<button class="btn btn-outline-primary btn-sm" name=action value=\''.$type.'\' >'.$label.'</button>
	<input type=hidden name=session_name value=\''.$_POST['session_name'].'\'>
	<input type=hidden name=tname value=\''.$tname.'\'>
	</form></div>';
}


function updown_data($offset)
{
	echo '<form method=post>';
		echo '<input type=hidden name=session_name value=\''.$_POST['session_name'].'\'>';
		echo '<input type=hidden name=offset value=\''.$offset.'\'>';
		echo '<button type=submit name=action value=previous><</button>';
		echo '<button type=submit name=action value=next>></button>';
	echo '</form>';
}

function allot_bed($link)
{
	//echo '<pre>';print_r($_POST);echo '</pre>';	


	if(isset($_POST['offset']))
	{
		if($_POST['action']=='previous')
		{
			$offset=max(0,$_POST['offset']-$GLOBALS['all_records_limit']);
		}
		else if($_POST['action']=='next')
		{
			$offset=$_POST['offset']+$GLOBALS['all_records_limit'];
		}
		else
		{
			$offset=$_POST['offset'];
		}
	}
	else
	{
		$offset=0;
	}
	updown_data($offset);
	$sql='select * from hostel_beds limit '.$offset.','.$GLOBALS['all_records_limit'];
	//echo $sql;
	$result=run_query($link,$GLOBALS['database'],$sql);
	
	echo '<table class="table table-striped table-sm table-bordered">';
	$first=true;
	while($ar=get_single_row($result))
	{	
		if($first==true)
		{
			echo '<tr>';
			foreach ($ar as $k=>$v)
			{
				echo '<th>'.$k.'</th>';
			}
			echo '</tr>';
			$first=false;
		}
		view_rows_for_allotment($link,$ar);
	}		
	echo '</table>';
}

function edit_with_readonly_view_batch($link,$tname,$pk,$header='no',$readonly_array=array())
{
	$sql='select * FROM `'.$tname.'` where id=\''.$pk.'\'';
	//echo $sql;
	$result=run_query($link,$GLOBALS['database'],$sql);
	$ar=get_single_row($result);
	
	echo '<form method=post class="d-inline" enctype="multipart/form-data">';
	echo '<input type=hidden name=offset value=\''.$_POST['offset'].'\'>';

	echo '<div class="two_column_one_by_two bg-light">';
			foreach($ar as $k =>$v)
			{
				if($k=='id')
				{
					echo '<div class="border">'.$k.'</div>';
					echo '<div class="border">';
						ste_id_update_button($link,$tname,$v);
					echo '</div>';
				}
				elseif(substr(get_field_type($link,$tname,$k),-4)=='blob')
				{
					echo '<div class="border">'.$k.'</div>';
					echo '<div class="border">';
						echo '<input type=file name=\''.$k.'\' >';
					echo '</div>';
				}
				elseif(in_array($k,array('recording_time','recorded_by')))
				{
					echo '<div class="border">'.$k.'</div>';
					echo '<div class="border">';
						echo $v;
					echo '</div>';
				}
				elseif(in_array($k,$readonly_array))
				{
					echo '<div class="border">'.$k.'</div>';
					echo '<div class="border">';
					echo '<input class="w-100" type=text  readonly name=\''.$k.'\' value=\''.htmlentities($v,ENT_QUOTES).'\'>';
					echo '</div>';
				}
				else
				{
					echo '<div class="border">'.$k.'</div>';
					echo '<div class="border">';
						read_field($link,$tname,$k,$v);
					echo '</div>';
				}
			}
			echo '</div>';
	echo'</form>';

}

function allot_bed_with_edit($link,$id)
{
	//echo '<pre>';print_r($_POST);echo '</pre>';	


	if(isset($_POST['offset']))
	{
		if($_POST['action']=='previous')
		{
			$offset=max(0,$_POST['offset']-$GLOBALS['all_records_limit']);
		}
		else if($_POST['action']=='next')
		{
			$offset=$_POST['offset']+$GLOBALS['all_records_limit'];
		}
	}
	else
	{
		$offset=0;
	}
	updown_data($offset);
	$sql='select * from hostel_beds limit '.$offset.','.$GLOBALS['all_records_limit'];
	echo $sql;
	$result=run_query($link,$GLOBALS['database'],$sql);
	
	echo '<table class="table table-striped table-sm table-bordered">';
	while($ar=get_single_row($result))
	{	
		if($ar['id']!=$id)
		{
			view_rows_for_allotment($link,$ar);
		}
		else
		{
			edit_with_readonly($link,'hostel_beds',$id,'yes',array('hostel','room_number','allowed_sex','allowed_course', 'bed_number'));
		}
	}		
	echo '</table>';
}


function ste_id_edit_button_with_offset($link,$tname,$id)
{
	if(isset($_POST['offset']))
	{
		if($_POST['action']=='previous')
		{
			$offset=max(0,$_POST['offset']-$GLOBALS['all_records_limit']);
		}
		else if($_POST['action']=='next')
		{
			$offset=$_POST['offset']+$GLOBALS['all_records_limit'];
		}
		else
		{
			$offset=$_POST['offset'];
		}
	}
	else
	{
		$offset=0;
	}
	
	echo 
	'<div class="d-inline-block" >
		<form method=post>
			<button class="btn btn-outline-success btn-sm m-0 p-0" name=id value=\''.$id.'\' >
				<img class="m-0 p-0" src=img/edit.png alt=E width="25" height="25">
			</button>
			<input type=hidden name=session_name value=\''.$_POST['session_name'].'\'>
			<input type=hidden name=action value=edit>
			<input type=hidden name=tname value=\''.$tname.'\'>
			<input type=hidden name=offset value=\''.$offset.'\'>
		</form>
	</div>';
}

function view_rows_for_allotment($link,$ar)
{
	foreach($ar as $k =>$v)
	{
		if($k=='id')
		{
			echo '<td>';
			echo '<span class="round round-0 bg-warning" >'.$v.'</span>';
			ste_id_edit_button_with_offset($link,'hostel_beds',$v);
			echo '</td>';
		}
		else
		{
			echo '<td>';
			$fspec=get_field_spec($link,'hostel_beds',$k);
			if($fspec!==null)
			{
				if($fspec['ftype']=='dtable')
				{
					$sql='select 
					distinct `'.$fspec['field'].'` , 
						concat_ws("|",'.$fspec['field_description'].') as description
					from `'.$fspec['table'].'` where id=\''.$v.'\'';
					//echo $sql;
					$result=run_query($link,$GLOBALS['database'],$sql);
					$ar_spec=get_single_row($result);
					if($ar_spec!==null)
					{
						//mk_select_from_sql_with_description($link,$sql,
						//	$fspec['field'],$fspec['fname'],$fspec['fname'],'',$v,$blank='yes');
						echo '<pre>'.$ar_spec['description'].'('.htmlentities($v).')</pre></td>';
					}
					else
					{
						echo '<pre>('.htmlentities($v).')</pre></td>';
					}
				}
				else
				{
					echo '<pre>'.htmlentities($v).'</pre></td>';
				}
			}
			else
			{
				echo '<pre>'.htmlentities($v).'</pre></td>';
			}
		}
	}
	echo '</tr>';
}



//required to show student details when delete
/*
if(isset($_POST['tname']))
{
	if($_POST['tname']=='bed_allocation' && $_POST['action']=='delete')
	{
		$_POST['student_id']=isset($_POST['student_id'])?$_POST['student_id']:get_student_id($link,$_POST['id']);
	}
}
*/



//show_manage_single_table_button('student','Manage Students');
//show_manage_single_table_button('hostel_beds','Manage Beds');

//single_table_button_with_action('bed_allocation','View Student History','search');

/*
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
*/
//////////////user code ends////////////////
tail();
echo '<pre>start:post';print_r($_POST);echo '</pre>';
//echo '<pre>start:session';print_r($_SESSION);echo '</pre>';

?>
