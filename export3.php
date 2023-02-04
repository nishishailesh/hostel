<?php
$GLOBALS['nojunk']='';
require_once 'base/verify_login.php';

//my_print_r($_POST);
////////User code below/////////////////////	

	$link=get_link($GLOBALS['main_user'],$GLOBALS['main_pass']);

prepare_result_for_export($link,$_POST['id']);
//////////////user code ends////////////////
tail();



function prepare_result_for_export($link,$id)
{

         if(!$result_id=run_query($link,$GLOBALS['database'],'select * from view_info_data where id=\''.$id.'\''))
         {
			 //echo '<h1>Problem</h1>';
		 }
		 else
		 {
			// echo '<h1>Success</h1>';
		 }
        $array_id=get_single_row($result_id);

        $sql=$array_id['sql'].'';
        $info=$array_id['info'];

		//echo $sql.'<br>';
        ////modify sql
        //print_r($_POST);
        
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
		//echo $sql;


        if(!$result=run_query($link,$GLOBALS['database'],$sql))
        {
			 echo '<h1>Problem</h1>';
		}
		 else
		 {
			 //echo '<h1>Success</h1>';
		 }


		export_data($result);
}



function export_data($result)
{
	    $fp = fopen('php://output', 'w');
	    if ($fp && $result) 
	    {
		    header('Content-Type: text/csv');
		    header('Content-Disposition: attachment; filename="export.csv"');
		
	    	$first='yes';
		
		   while ($row = get_single_row($result))
		   {
			    if($first=='yes')
			    {
				  fputcsv($fp, array_keys($row));
				  $first='no';
			    }
			
			fputcsv($fp, array_values($row));
		  }
	   }
}


?>
