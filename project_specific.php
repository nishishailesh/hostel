<?php

function analyse_one_student_data($link,$student_id)
{
	$sql='select * from bed_allocation where student_id=\''.$student_id.'\' order by date_of_allocation';
	//echo $sql;
	$result=run_query($link,$GLOBALS['database'],$sql);
	$all_data=array();
	while($ar=get_single_row($result))
	{	
		$all_data[]=$ar;
	}
	//echo '<pre>';
	//print_r($all_data);
	//echo '</pre>';
	
	echo 'checking data integrity...<br>';
	
	return analyse_date_array($all_data);
}


function analyse_insert_data($link,$post)
{
	$sql='select * from bed_allocation where student_id=\''.$post['student_id'].'\' order by date_of_allocation';
	//echo $sql;
	$result=run_query($link,$GLOBALS['database'],$sql);
	$all_data=array();
	while($ar=get_single_row($result))
	{	
		$all_data[]=$ar;
	}

	
	$all_data[]=$post;
	
	//echo '<pre>';
	//print_r($all_data);
	//echo '</pre>';
	
	echo 'checking insert data integrity...<br>';
	
	return analyse_date_array($all_data);
}

function analyse_date_array($all_data)
{
	foreach($all_data as $k=>$one_data)
	{
		//echo '===================<br>';
		//echo '<pre>';
		//print_r($one_data);
		//echo '</pre>';
	
		$from=$one_data['date_of_allocation'];
		$to=$one_data['date_of_deallocation'];
		
		if(strlen($from)==0)
		{
			echo "From is null .. Not OK<br>";
			return "FromNull";
		}

		if(strlen($to)==0)
		{
			if(strlen($from)==0)
			{
				//echo "From is also null .. Not OK<br>";
				return "FromNullToNull";
			}
			else
			{
				//echo "to is null, From is not null.. testing if is this last entry or not ?<br>";
				$last_entry=isset($all_data[$k+1])?False:True;
				if($last_entry)
				{
					//echo "This is last entry. OK<br>";
					return "LastToNull";
				}
				else
				{
					//echo "This not last entry.But to is null.... Not OK<br>";
					return "NotLastToNull";
				}
			}
		}
		else
		{
			if($from <= $to)
			{
				//echo "OK<br>";
				//return "OK";
			}
			else
			{
				//echo "From date is newer than to date... Not OK<br>";
				return "From>To";
			}
		}
		
	}
	return "OK";
}


function __f__validate_insert_hostel_beds($link,$post)
{
	echo '<br>validating old entry...<br>';
	//print_r($post);
	//echo '<br>';
	$ret=analyse_one_student_data($link,$post['student_id']);
	echo '<h4>Final error code of old data is:'.$ret.'</h4>';
	
	if($ret=='OK')
	{
		$iret=analyse_insert_data($link,$post);
		echo '<h4>Final error code of insert data is:'.$iret.'</h4>';
		if($iret=='OK' || $iret=='LastToNull')
		{
			if(strlen($post['date_of_deallocation'])==0)
			{
				
			//Array ( [bed_id] => 35 [student_id] => 5 [date_of_allocation] => 2022-03-30 [date_of_deallocation] => 2022-03-30 
			//[action] => save_insert [session_name] => sn_1213596831 [tname] => bed_allocation )			
			$sql='insert into bed_allocation (bed_id,student_id,date_of_allocation,date_of_deallocation,
					recording_time,recorded_by)
					values(\''
					.$post['bed_id'].'\',\''
					.$post['student_id'].'\',\''
					.$post['date_of_allocation'].'\','
					.'null,now(),\''
					.$_SESSION['login'].'\')';
			}
			else
			{
			$sql='insert into bed_allocation (bed_id,student_id,date_of_allocation,date_of_deallocation,
					recording_time,recorded_by)
					values(\''
					.$post['bed_id'].'\',\''
					.$post['student_id'].'\',\''
					.$post['date_of_allocation'].'\',\''
					.$post['date_of_deallocation'].'\',now(),\''
					.$_SESSION['login'].'\')';
			}
			echo '<br>'.$sql;
			
			$result=run_query($link,$GLOBALS['database'],$sql);
		}
		else
		{
			echo '<h4>Correct new data error, then insert new data again</h4>';
		}
	}
	else
	{
		echo '<h4>Correct old data error, then insert new data</h4>';
	}
}

function get_student_id($link,$id)
{
	$sql='select student_id from bed_allocation where id=\''.$id.'\'';
	//echo $sql;
	$result=run_query($link,$GLOBALS['database'],$sql);
	$ar=get_single_row($result);
	return $ar['student_id'];
}
?>
