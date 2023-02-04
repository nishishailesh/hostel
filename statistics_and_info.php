<?php

require_once 'base/verify_login.php';
	////////User code below/////////////////////
require_once 'single_table_edit_common.php';
$link=get_link($GLOBALS['main_user'],$GLOBALS['main_pass']);

$user=get_user_info($link,$_SESSION['login']);

show_dashboard($link);
if(isset($_POST['action']))
{
	if( $_POST['action']=='display_data')
	{
		$result=prepare_result_from_view_data_id($link,$_POST['id']);
	}
}

	//////////////user code ends////////////////
tail();
//echo '<pre>';print_r($_POST);echo '</pre>';



function show_dashboard($link)
{
	get_sql($link);
	
}

function get_sql($link)
{
        if(!$result=run_query($link,$GLOBALS['database'],'select * from view_info_data')){return false;}

		echo '<span data-toggle="collapse" 
		class="sh badge badge-warning d-inline" href=#statistics >Statistics and Info</span>';

        echo '
        <table border=1 id=statistics class="table-striped table-hover  hide"><tr><th colspan=20>Select the data to view</th></tr>';

        $first_data='yes';

        while($array=get_single_row($result))
        {
                if($first_data=='yes')
                {
                        echo '<tr>';
                        foreach($array as $key=>$value)
                        {
							    if($key!='sql'){
                                echo '<th bgcolor=lightgreen>'.$key.'</th>';}
                        }
                        echo '</tr>';
                        $first_data='no';
                }

				echo'<form style="margin-bottom:0;" method=post>';
                echo '<tr>';
                foreach($array as $key=>$value)
                {
					echo'<input type=hidden name=session_name value=\''.$_SESSION['login'].'\'>';
					echo '<input type=hidden name=session_name value=\''.$_POST['session_name'].'\'>';
                       if($key=='id')
                        { 
                         echo '<td>
							<input type=hidden name=action value=display_data>
							<button class="btn btn-danger" type=submit name=id value=\''.$value.'\'>'.$value.'</button></td>';
                        }
                        elseif($key=='sql'){}
                        elseif($key=='Fields')
                        {
							$ex=explode(":",$value);
							if($ex[0]=='table_field_specification')
							{
								echo '<td>';
								if(isset($ex[1]))
								{
									read_field_as_per_tfs($link,$ex[1],'__p1');
								}
								echo '</td>';
							}
							else
							{
                                echo '<td class="badge badge-warning">'.$value.'</td>';
							}
						}
                        else
                        {
                                echo '<td>'.$value.'</td>';
                        }
                }
				echo '</tr>';
				echo '</form>';

        }
        echo '</table>';
    
}


function prepare_result_from_view_data_id($link,$id)
{

         if(!$result_id=run_query($link,$GLOBALS['database'],'select * from view_info_data where id=\''.$id.'\''))
         {
			 echo '<h1>Problem</h1>';
		 }
		 else
		 {
			 //echo '<h1>Success</h1>';
		 }
        $array_id=get_single_row($result_id);

        $sql=$array_id['sql'].'';
        $info=$array_id['info'];

		//echo $sql.'<br>';
        ////modify sql
        //print_r($_POST);

	$sql=str_replace('__session_name',$_POST['session_name'],$sql);			

        if(isset($_POST['__p1'])) 
        {
			if(strlen($_POST['__p1'])>0)
			{
				$sql=str_replace('__p1',$_POST['__p1'],$sql);			
				$p1=$_POST['__p1'];
			}
			else
			{
				$p1='';
			}
		}
		else
		{
			$p1='';
		}


        if(isset($_POST['__p2'])) 
        {
			if(strlen($_POST['__p2'])>0)
			{
				$sql=str_replace('__p2',$_POST['__p2'],$sql);			
				$p2=$_POST['__p2'];
			}
			else
			{
				$p2='';
			}
		}
		else
		{
			$p2='';
		}

        if(isset($_POST['__p3'])) 
        {
			if(strlen($_POST['__p3'])>0)
			{
				$sql=str_replace('__p3',$_POST['__p3'],$sql);			
				$p3=$_POST['__p3'];
			}
			else
			{
				$p3='';
			}
		}
		else
		{
			$p3='';
		}

        if(isset($_POST['__p4'])) 
        {
			if(strlen($_POST['__p4'])>0)
			{
				$sql=str_replace('__p4',$_POST['__p4'],$sql);			
				$p4=$_POST['__p4'];
			}
			else
			{
				$p4='';
			}
		}
		else
		{
			$p4='';
		}
        //////////////
		echo $sql;


        if(!$result=run_query($link,$GLOBALS['database'],$sql))
        {
			 echo '<h1>Problem</h1>';
		}
		 else
		 {
			 echo '<h1>'.$info.'</h1>';
		 }


		echo_export_button_dashboard($link,$id,$p1,$p2,$p3,$p4);
		display_sql_result_data($result);

}


function echo_export_button_dashboard($link,$id,$p1,$p2,$p3,$p4)
{
	echo '<form method=post class="d-inline" action=export3.php>';
		echo '<input type=hidden name=session_name value=\''.$_SESSION['login'].'\'>';
		echo '<input type=hidden name=session_name value=\''.$_POST['session_name'].'\'>';			
		echo '<input type=hidden name=id value=\''.$id.'\'>';
		echo '<input type=hidden name=__p1 value=\''.$p1.'\'>		
			<input type=hidden name=__p2 value=\''.$p2.'\'>		
			<input type=hidden name=__p3 value=\''.$p3.'\'>		
			<input type=hidden name=__p4 value=\''.$p4.'\'>		
			
			<button class="btn btn-info"  
			formtarget=_blank
			type=submit
			name=action
			value=export>Export</button>
		</form>';
}

function read_field_as_per_tfs($link,$tfs_id,$form_fname)
{
	$sql='select * from table_field_specification  where id=\''.$tfs_id.'\'';
	$result=run_query($link,$GLOBALS['database'],$sql);
	$ar=get_single_row($result);	
	//print_r($ar);
	read_field_for_vd($link,$ar['tname'],$ar['fname'],'',$search='no',$readonly='',$form_fname);

}

function read_field_for_vd($link,$tname,$field,$value,$search='no',$readonly='',$form_fname)
{
	//echo '<h1>'.$form_fname.'</h1>';

	$ftype=get_field_details($link,$tname,$field);
	$fspec=get_field_spec($link,$tname,$field);
	//print_r($fspec);
	if($fspec)
	{
		if($fspec['ftype']=='table')
		{
			if($readonly!='readonly')
			{
				$sql='select distinct `'.$fspec['field'].'` from `'.$fspec['table'].'`';
				//echo $sql;
				mk_select_from_sql($link,$sql,
				$field,$form_fname,$form_fname,'',$value,$blank='yes');
			}
			else
			{
				echo '<input class="w-100" type=text  '.$readonly.' name=\''.$form_fname.'\' value=\''.htmlentities($value,ENT_QUOTES).'\'>';
			}
		}
		else if($fspec['ftype']=='dtable')
		{
			//if($readonly!='readonly')
			//{
			$sql='select 
				distinct `'.$fspec['field'].'` , 
				concat_ws("|",'.$fspec['field_description'].') as description
			from `'.$fspec['table'].'`
			order by '.$fspec['field_description'];
			//echo $sql;
			mk_select_from_sql_with_description($link,$sql,
													$form_fname,$form_fname,$form_fname,
													'',$value,$blank='yes',$readonly);
				echo '<input placeholder="enter search string" type=text id=\'input_for_'.$form_fname.'\' onchange="find_from_dd(this , \''.$form_fname.'\');">';

				
				?>


				<script>
//document.getElementById("alloted_to")[6].text.search(document.getElementById("input_for_alloted_to").value)
					function  find_from_dd(me,idd)
					{
						var option;
						target=document.getElementById(idd);
						//alert(me.value);
						var selectLength = document.getElementById(idd).length;
						for(i=0; i<selectLength;i++)
						{
							if (target[i].text.toLowerCase().search(me.value.toLowerCase())!=-1) 
							{
								//alert(target[i].text);
								//target.selectedIndex=i;
								//return;
								option = document.createElement("option");
								option.text = target[i].text
								option.value = target[i].value
								target.prepend(option); 
								i++;
							}
							else
							{

							}
						}
						target.selectedIndex=0;
						//alert("No record found having >>>>"+me.value+"<<<<");
					}
				</script>


<?php


				

		}
		elseif($fspec['ftype']=='date')
		{
			if($search=='yes')
			{
				echo '<input type=text '.$readonly.' name=\''.$form_fname.'\' value=\''.$value.'\'>';
			}
			else
			{
				echo '<input type=date id=\''.$field.'\' name=\''.$form_fname.'\' value=\''.$value.'\'>';
				$default=strftime("%Y-%m-%d");
				show_source_button($form_fname,$default);
			}
		}
		elseif($fspec['ftype']=='time')
		{
			if($search=='yes')
			{
				echo '<input type=text  name=\''.$form_fname.'\' value=\''.$value.'\'>';
			}
			else
			{
				echo '<input type=time id=\''.$form_fname.'\'  '.$readonly.' name=\''.$form_fname.'\' value=\''.$value.'\'>';
				$default=strftime("%H:%M");
				show_source_button($field,$default);
			}
		}				
		elseif($fspec['ftype']=='textarea')
		{
			echo '<pre><textarea class="w-100"  '.$readonly.' name=\''.$form_fname.'\' >'.$value.'</textarea></pre>';
		}	
		else
		{
			echo 'not implemented';
		}
	}
	else
	{
		echo '<input class="w-100" type=text  '.$readonly.' name=\''.$form_fname.'\' value=\''.htmlentities($value,ENT_QUOTES).'\'>';
	}
}


?>
