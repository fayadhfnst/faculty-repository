<?php
    require "../Koneksi/koneksi.php";

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Css -->
    <link rel="stylesheet" href="css/index.css">
    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font awesome -->
    <script src="https://kit.fontawesome.com/bea7ede4c1.js" crossorigin="anonymous"></script>
    <title>Fasilkom-TI-Repository</title>
</head>
<body>
    <!-- S NavBar -->
    <div class="w-full h-20 flex justify-between items-center bg-[#006633] text-white px-4 md:px-12 ">
        <div class="flex items-center w-full h-14">
            <!-- Logo Image -->
            <div class="w-12">
                <a href="index.php"><img src="img/usu-logo.png" alt=""></a>
            </div>

            <!-- Repository Description -->
            <div class="ml-6">
                <!-- Display on medium - large size -->
                <h4 class="hidden md:flex">REPOSITORI UNIVERSITAS SUMATERA UTARA</h4>
                <p class="hidden md:flex">FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI</p>

                <!-- Display on small size -->
                <h4 class="flex md:hidden">REPOSITORI USU</h4>
                <p class="flex md:hidden">FASILKOM-TI</p>
            </div>
        </div>
    </div>
    <!-- E NavBar -->

    <!-- S Main Content -->
    <div class="w-full h-auto flex justify-center items-center md:px-24 md:py-12">
        <div class="w-full h-full flex justify-center items-center md:mx-auto">
            <!-- Login -->
            <div class="w-full lg:4/12 xl:w-5/12 h-full flex flex-col justify-evenly items-center py-4">
                <h1 class=" text-2xl lg:text-4xl">Forget Password</h1>
                <form action="" method="post">
                    <?php
                        if(isset($_POST['btncode'])){
                            $email = $_POST['email'];
                            $sql = "SELECT * FROM akun WHERE email = '{$email}'";
                            $query = mysqli_query($con,$sql);
                            $num_row = mysqli_num_rows($query);

                            if($num_row == 0){
                                echo "<script> alert('Email yang dimasukkan tidak terdaftar') </script>";
                                echo "<script type='text/javascript'> document.location = 'forgotpassword.php'; </script>";
                            }else{
                                $code = rand(999999,111111);
                                $sql1 = "UPDATE akun SET kode_otp = $code WHERE email = '{$email}'";
                                $query1 = mysqli_query($con,$sql1);

                                $_SESSION['email'] = $email;
                                $subject = "Password Reset Code";
                                $message = "Your password reset code is $code";
                                $sender = "From: tumbalmsbd@gmail.com";

                                if(mail($email,$subject,$message,$sender)){
                                    echo "<script> alert('Email telah dikirimkan kode') </script>";
                                    echo "<script type='text/javascript'> document.location = 'resetcode.php'; </script>";
                                }else{
                                    echo "<script> alert('Terjadi Kesalahan. Mohon dicoba lagi') </script>";
                                    echo "<script type='text/javascript'> document.location = 'forgotpassword.php'; </script>";
                                }
                                
                            }
                        }
                    ?>
                    
                <div class="lg::w-4/6 h-full mt-8 flex flex-col justify-around items-center">
                    <div class="w-full h-28 flex flex-col justify-around">
                        <input class="w-full h-10 rounded-md shadow-md px-4 bg-gray-200 focus:outline-green-700 focus:bg-white" required type="email" name="email" id="" placeholder="Email">
                    </div>
                    <!-- <div class="w-full h-10 flex justify-between items-center text-sm my-4">
                        <div>
                            <input class="w-4 h-4 accent-green-600" type="checkbox" name="remember-me" id="remember-me">
                            <label for="remember-me">Remember me</label>
                        </div>
                        <a href="forgetpassword.php" class="text-[#006633] hover:text-sky-600">
                            Forgot password?
                        </a>
                    </div> -->
                    <button class="w-full h-10 px-4 rounded-md shadow-md bg-[#006633] hover:bg-green-700 text-white" name="btncode">Request Code</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- E Main Content -->


</body>
</html>