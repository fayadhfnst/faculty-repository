<?php
    require '../Koneksi/koneksi.php';

    if(strlen($_SESSION['email'] == 0)){
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }

    if($_SESSION['tipe_akun'] == 'staff' || $_SESSION['admin']){
        
    }else{
        header("Location:index.php");
    }

    $id = $_GET['id'];

    $sql = "DELETE FROM surat WHERE id = '$id'";

    try{
        $query = mysqli_query($con,$sql);
    }catch(Exception $e){
        echo "<script> alert('Error. Terjadi Kesalahan') </script>";
        echo "<script type='text/javascript'> document.location = 'daftarsurat.php'; </script>";
    }
    
    if($query){
        echo "<script> alert('Berhasil') </script>";
        echo "<script type='text/javascript'> document.location = 'daftarsurat.php'; </script>";
    }
    
?>