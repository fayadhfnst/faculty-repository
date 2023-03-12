<?php
    require "../Koneksi/koneksi.php";

    // echo $_SESSION['previous_url'];
    $url = $_SESSION['previous_url'];
    // echo $url;
    // echo $_SESSION['email'];
    
    if(isset($_POST['btnlogin'])){
        $email_login = $_POST['email'];
        $pass_login = md5($_POST['password']);
        $tipe_akun = $_POST['tipe_akun'];

        $sql = "SELECT * FROM akun WHERE email = '{$email_login}' && password = '{$pass_login}'";
        $query = mysqli_query($con, $sql);
        $row = mysqli_fetch_array($query);
        $nums_row = mysqli_num_rows($query);

        if($nums_row > 0){
            if($email_login == $row['email'] && $pass_login == $row['password']){
                $sql1 = "SELECT * FROM role_akun WHERE email_akun = '{$email_login}' && tipe_akun = '{$tipe_akun}'";
                $query1 = mysqli_query($con,$sql1);
                $nums_row1 = mysqli_num_rows($query1);
                if($nums_row1 > 0){
                    if($url == "http://localhost/Kelompok%203/MSBDfinal/PHP/newpassword.php"){
                        header("Location:index.php");
                    }elseif(strlen($url) != 0){
                        header("Location:$url");
                    }else{
                        header("Location:index.php");
                    }
                    $_SESSION['nama_lengkap'] = $row['nama_lengkap'];
                    $_SESSION['tipe_akun'] = $tipe_akun;
                    $_SESSION['email'] = $row['email']; 
                }else{
                    echo '<script> alert("Akun tidak memiliki tipe akses tersebut") </script>';
                    echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
                }
            }
        }
        else{
            echo '<script> alert("Incorrect email or password") </script>';
            echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
        }
    }
?>