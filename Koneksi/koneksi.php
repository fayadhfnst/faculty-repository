<?php
    if(!isset($_SESSION)){
        session_start();
    }

    $con = mysqli_connect('localhost' , 'mahasiswa' , '1357', 'repo_fasilkom');

    if(isset($_SESSION['tipe_akun'])){
        $sql10 = "SELECT DISTINCT User FROM mysql.db WHERE db = 'repo_fasilkom'";
        $query10 = mysqli_query($con,$sql10);
        while($row10 = mysqli_fetch_array($query10)){
            if($_SESSION['tipe_akun'] == $row10['User']){
                $sql20 = "SELECT * FROM mysql.user WHERE User = '{$row10['User']}'";
                try{
                    $query20 = mysqli_query($con,$sql20);
                }catch(Exception $e){
                    echo "<script> alert('Maaf tipe akun anda tidak ditemukan') </script>";
                    echo "<script type='text/javascript'> document.location = 'logout.php'; </script>";
                }
                $row20 = mysqli_fetch_array($query20);
                if($row20['User'] == 'admin'){
                    $pass = 1234;
                }elseif($row20['User'] == 'staff'){
                    $pass = 1324;
                }elseif($row20['User'] == 'dosen'){
                    $pass = 2468;
                }elseif($row20['User'] == 'mahasiswa'){
                    $pass = 1357;
                }
                elseif($row20['User'] == 'test'){
                    $pass = "abcd";
                }
                try{
                    $con = mysqli_connect('localhost' , $row20['User'] , $pass , 'repo_fasilkom');
                }catch(Exception $e){
                    echo "<script> alert('Maaf tipe akun anda belum dikonfigurasi oleh admin agar bisa terhubung pada website. Tolong hubungi admin agar bisa dikonfigurasi') </script>";
                    echo "<script type='text/javascript'> document.location = 'logout.php'; </script>";
                }
            }
        }
    }else{
        $con = mysqli_connect('localhost' , 'mahasiswa' , '1357', 'repo_fasilkom');
    }
?>