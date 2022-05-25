<?php
$GLOBALS['nojunk']='';
require_once 'base/verify_login.php';
	////////User code below/////////////////////
//require_once("dompdf/dompdf_config.inc.php");
require_once 'single_table_edit_common.php';
require_once 'project_specific.php';
require_once('tcpdf/tcpdf.php');

//echo '		  <link rel="stylesheet" href="project_common.css">
//		  <script src="project_common.js"></script>';
													

$link=get_link($GLOBALS['main_user'],$GLOBALS['main_pass']);

$user=get_user_info($link,$_SESSION['login']);
//print_r($user);
$auth=explode(',',$user['authorization']);

//echo '<pre>';

	$sql='select * from hostel_beds where id=\''.$_POST['id'].'\'';
	//echo $sql;
	$result=run_query($link,$GLOBALS['database'],$sql);
	$all_data=array();
	$ar=get_single_row($result);
	//print_r($ar);

	$ssql='select * from student where id=\''.$ar['alloted_to'].'\'';
	//echo $ssql;
	$sresult=run_query($link,$GLOBALS['database'],$ssql);
	$sall_data=array();
	$sar=get_single_row($sresult);
	//print_r($sar);
//echo '</pre>';


ob_start();
//echo '<html><head>
//<link rel="stylesheet" href="project_common.css">
//<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
//</head><body>';


echo '<!DOCTYPE html><h3>Government Medical College Surat</h3>';
echo '<h4>EST/Hostel/'.$ar['allowed_course'].'/'.$ar['last_allotment_date'].'</h4>';

echo '<p>'.$sar['fullname'].' , 
		admission year ['.$sar['year_of_admission'].
		'], is alloted hostel [ '.$ar['hostel'].
		'] room ['.$ar['room_number']. 
		'] bed ['.$ar['bed_number']. 
		'] from date '.$ar['last_allotment_date'].'</p>';

echo '<table border="1">';
echo '<tr><td>Signature of Hostel Superintendent<br></td><td></td></tr>';
echo '<tr><td>Signature of Student (Order Receipt)<br></td><td></td></tr>';
echo '<tr><td>Signature of Student (Key Receipt)<br></td><td></td></tr>';
echo '<tr><td>Signature of Student (Key Return)<br></td><td></td></tr>';
echo '<tr><td>Date of Key Return<br></td></tr>';
echo '</table>';

tail();

$html = ob_get_clean();
//echo $html;
//exit();

class myPDF extends TCPDF {
	
	public function Header() 
	{
	}
	
	public function Footer() 
	{

	}	
}

	     $pdf = new myPDF('P', 'mm', 'A4', true, 'UTF-8', false);
//	     $pdf->SetFont('dejavusans', '', 9);
	     //$pdf->SetFont('dejavusans', '', $_POST['fontsize']);
//	     $pdf->SetFont('courier', '', 8);
	     $pdf->SetMargins(25, 20, 10);
	     $pdf->AddPage();
	     $pdf->writeHTML($html, true, false, true, false, '');
	    $pdf->Output('print_dc.pdf', 'I');

//$dompdf = new DOMPDF();
//$dompdf->load_html($html);
//$dompdf->render();
//$dompdf->stream("sample.pdf");

//echo '<pre>start:post';print_r($_POST);echo '</pre>';
//echo '<pre>start:session';print_r($_SESSION);echo '</pre>';

?>
