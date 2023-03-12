<?php
    require '../Koneksi/koneksi.php';

    if(strlen($_SESSION['email'] == 0)){
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }

    if($_SESSION['tipe_akun'] == 'admin'){
        
    }else{
        header("Location:index.php");
    }
    
    $nama_tabel = $_GET['nama_tabel'];

    if($nama_tabel == 'role_akun'){
        $sql1 = "SELECT * FROM role_akun WHERE id = '{$_GET['id']}'";
        $query1 = mysqli_query($con,$sql1);
        $row1 = mysqli_fetch_array($query1);

        $sql2 = "SELECT * FROM role_akun WHERE email_akun = '{$row1['email_akun']}'";
        $query2 = mysqli_query($con,$sql2);
        $num_row = mysqli_num_rows($query2);

        if($num_row <= 1){
            echo "<script> alert('Tidak bisa dihapus karena 1 akun harus ada setidaknya 1 role') </script>";
            echo "<script type='text/javascript'> document.location = 'dashboard-details.php?nama_tabel=$nama_tabel'; </script>";
        }else{
            if (isset ($_GET['email'])) {
                $email = $_GET['email'];
        
                $sql = "DELETE FROM $nama_tabel WHERE email = '$email'";

            } elseif (isset ($_GET['nip'])) {
                $nip = $_GET['nip'];
        
                $sql = "DELETE FROM $nama_tabel WHERE nip = '$nip'";

            } elseif (isset ($_GET['nim'])) {
                $nim = $_GET['nim'];
        
                $sql = "DELETE FROM $nama_tabel WHERE nim = '$nim'";

            } elseif (isset ($_GET['id_surat'])) {
                $id_surat = $_GET['id_surat'];
        
                $sql = "DELETE FROM $nama_tabel WHERE id_surat = '$id_surat'";

            } else {
                $id = $_GET['id'];
        
                $sql = "DELETE FROM $nama_tabel WHERE id = '$id'";

            }
        }
    }else{
        if (isset ($_GET['email'])) {
            $email = $_GET['email'];
    
            $sql = "DELETE FROM $nama_tabel WHERE email = '$email'";
 
        } elseif (isset ($_GET['nip'])) {
            $nip = $_GET['nip'];
    
            $sql = "DELETE FROM $nama_tabel WHERE nip = '$nip'";

        } elseif (isset ($_GET['nim'])) {
            $nim = $_GET['nim'];
    
            $sql = "DELETE FROM $nama_tabel WHERE nim = '$nim'";

        } elseif (isset ($_GET['id_surat'])) {
            $id_surat = $_GET['id_surat'];
    
            $sql = "DELETE FROM $nama_tabel WHERE id_surat = '$id_surat'";

        } else {
            $id = $_GET['id'];
    
            $sql = "DELETE FROM $nama_tabel WHERE id = '$id'";

        }
    }

    try{
        $query = mysqli_query($con,$sql);
    }catch(Exception $e){
        echo "<script> alert('Error. Data tidak bisa didelete karena data masih digunakan') </script>";
        echo "<script type='text/javascript'> document.location = 'dashboard-details.php?nama_tabel=$nama_tabel'; </script>";
    }

    if($query){
        echo "<script> alert('Berhasil') </script>";
        echo "<script type='text/javascript'> document.location = 'dashboard-details.php?nama_tabel=$nama_tabel'; </script>";
    }
    
?>