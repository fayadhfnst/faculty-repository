<?php

require '../Koneksi/koneksi.php';
require_once __DIR__ . '\mp\vendor\autoload.php';

if(strlen($_SESSION['email'] == 0)){
  echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
}


$nama_tabel = $_GET['tabel'];
$kolom = $_GET['kolom'];

$kols = "";

// $sql2 = "SHOW COLUMNS FROM $nama_tabel";
// $query2 = mysqli_query($con,$sql2);

// $a=array();



$mpdf = new \Mpdf\Mpdf(['mode' => 'utf-8', 'format' => 'A4-L']);
$html = '
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/report.css">
    <title>Fasilkom-TI-Repository</title>
</head>

<body>
                  <div class="report-download">
                    <table border = "1" cellpading = "10" cellspacing = "0">
                        <thead id="table-head">
                          <tr>
                            <th>No</th>
                          ';

                            foreach($kolom as $kol){
                              $kols .= '`' . $kol . '`,';
                            $html .= '<th>'.$kol.'</th>';
                            }
                          $html .= '</tr>
                        </thead>
                        <tbody>';
                        $kols = substr($kols,0,strlen($kols)-1);
                        $sql3 = "SELECT " . $kols . "FROM $nama_tabel";
                        $query3 = mysqli_query($con,$sql3);
                        $count = count($kolom);
                        $x = 1;
                            while($row3 = mysqli_fetch_array($query3)){
                                $html .= '<tr>
                                            <td>' .$x++. '</td>
                                ';
                                for($i = 0;$i < $count; $i++){
                                $html .= '<td>'.$row3[$kolom[$i]].'</td>';
                            }
                            $html .= '</tr>';
                          } 
                        $html .= '</tbody>
                      </table>
                    </div>
</body>
</html>';
$mpdf->WriteHTML($html);
$mpdf->Output('report.pdf', \Mpdf\Output\Destination::INLINE);

?>