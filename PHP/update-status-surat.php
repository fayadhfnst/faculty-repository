<?php
    require '../Koneksi/koneksi.php';

    if(strlen($_SESSION['email'] == 0)){
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }

    $status = $_GET['status'];
    $id = $_GET['id']; 

    $sql = "UPDATE surat SET status = '$status' WHERE id = '$id'";
    $query = mysqli_query($con,$sql);

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