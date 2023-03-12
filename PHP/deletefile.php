<?php
    require '../Koneksi/koneksi.php';

    if(strlen($_SESSION['email'] == 0)){
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }

    if($_SESSION['tipe_akun'] != 'mahasiswa'){
        
    }else{
        echo "<script type='text/javascript'> document.location = 'index.php'; </script>";
    }

    $tipe = $_GET['type'];
    $id = $_GET['id'];

    $sql = "DELETE FROM $tipe WHERE id = '$id'";

    try{
        $query = mysqli_query($con,$sql);
    }catch(Exception $e){
        echo "<script> alert('Error. Terjadi Kesalahan') </script>";
        echo "<script type='text/javascript'> document.location = 'databerkas.php?tipe=$tipe'; </script>";
    }

    if($query){
        echo "<script> alert('Berhasil') </script>";
        echo "<script type='text/javascript'> document.location = 'databerkas.php?tipe=$tipe'; </script>";
    }

?>