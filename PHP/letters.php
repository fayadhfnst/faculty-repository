<?php
    require "../Koneksi/koneksi.php";

    if(strlen($_SESSION['email'] == 0)){
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }
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
    <?php include("navbar.php") ?>
    <!-- E NavBar -->

    <!-- S Current Opened Window -->
    <div class="w-full h-10 flex justify-start items-center bg-[#969696] px-6 md:px-24">
        <div class="w-full flex items-center font-semibold">
            <!-- Home -->
            <!-- Hidden when under laptop display -->
            <a href="index.php" class="hidden lg:flex items-center mr-6">
                <span class="text-lg"><i class="fas fa-home"></i></span>
                <p class="ml-2">Home</p>
            </a>

            <span class="hidden lg:flex">/</span>

            <a href="myletters.php" class="flex items-center lg:ml-6 mr-6">
                <p>Surat Saya</p>
            </a>

            <span class="hidden lg:flex">/</span>

            <!-- Departemen Ilmu Komputer -->
            <!-- Hidden when under laptop display -->
            <a href="" class="hidden lg:flex items-center mx-6">
                <p>Ajukan surat</p>
            </a>

        </div>
    </div>
    <!-- E Current Opened Window -->

    <!-- S Main Content -->
    <div class="w-full px-4 py-8 md:px-24 md:py-8">
        <div class="w-full min-h-fit flex mb-16 md:mb-36">
            <!-- Content -->
            <div class="w-full">
                <!-- Ajukan surat -->
                <h4 class="w-full font-bold border-b-2 border-gray-500">Ajukan surat</h4>
                
                <!-- Isi surat -->
                <h3 class="text-3xl text-center mt-4">Silahkan isi surat</h3>

                <?php
                    $sql = "SELECT * FROM jenis_surat";
                    $query = mysqli_query($con,$sql);
                ?>

                <!-- Surat -->
                <div class="w-full h-full flex justify-center items-center">
                    <!-- Content -->
                    <form method="post" enctype="multipart/form-data">
                        <?php
                            if(isset($_POST['save'])){
                                $judul = $_POST['judul'];
                                $tgl_diperlukan = $_POST['tgl_diperlukan'];
                                $jenis_surat = $_POST['jenis_surat'];
                                $keterangan = $_POST['keterangan'];
                                $email = $_SESSION['email'];
                                $nama_file = $_FILES["name-file"]["name"];

                                if(strlen($nama_file) != 0){$allowed_extensions = array("pdf");
                                    if(!in_array(pathinfo($nama_file,PATHINFO_EXTENSION),$allowed_extensions)){
                                        echo "<script> alert('Extension File hanya boleh pdf') </script>";
                                        echo "<script type='text/javascript'> document.location = 'letters.php'; </script>";
                                    }else{
                                    
                                        if(!file_exists('file/uploadedfile/Surat')){
                                            mkdir('file/uploadedfile/Surat',0777,true);
                                        }

                                        $path = 'file/uploadedfile/Surat';
                                        $files = array_diff(scandir($path), array('.', '..'));

                                        if(file_exists('file/uploadedfile/Surat/'.$nama_file)){
                                            $x = 0;
                                            $count = count($files);
                                            $pattern = '/\s+[(][\d+][)]/i';
                                            $name = pathinfo($nama_file,PATHINFO_FILENAME);
                                            for($i = $count + 1;$i > 1;$i--){
                                                $files[$i] = pathinfo($files[$i],PATHINFO_FILENAME);
                                                $files[$i] = preg_replace($pattern, '', $files[$i]);
                                                if($name == $files[$i]){
                                                    $x++;
                                                }
                                            }
                                            
                                            $extension = pathinfo($nama_file,PATHINFO_EXTENSION);

                                            move_uploaded_file($_FILES["name-file"]["tmp_name"], "file/uploadedfile/Surat/".$name." (".$x.").".$extension);
                                            $nama_file = $name." (".$x.").".$extension;
                                        }else{
                                            move_uploaded_file($_FILES["name-file"]["tmp_name"], "file/uploadedfile/Surat/".$nama_file);
                                        }

                                        $sql1 = "INSERT INTO surat(id,judul,id_jenis_surat,dokumen,keterangan,tgl_diperlukan,email_akun,status) VALUES ('','$judul',$jenis_surat,'$nama_file','$keterangan','$tgl_diperlukan','$email','pending')";
                                    }
                                }else{
                                    $sql1 = "INSERT INTO surat(id,judul,id_jenis_surat,keterangan,tgl_diperlukan,email_akun,status) VALUES ('','$judul',$jenis_surat,'$keterangan','$tgl_diperlukan','$email','pending')";

                                }

                                try{
                                    $query1 = mysqli_query($con,$sql1);
                                }catch(Exception $e){
                                    echo "<script> alert('Error. Terjadi Kesalahan') </script>";
                                    echo "<script type='text/javascript'> document.location = 'letters.php'; </script>";
                                }

                                if($query1){
                                    echo "<script> alert('Berhasil') </script>";
                                    echo "<script type='text/javascript'> document.location = 'myletters.php'; </script>";
                                }
                            }
                        ?>
                        <div class="max-w-md flex flex-col justify-center items-center px-4 md:py-6">
                            <div class="w-full">
                                <input required class="w-full h-10 rounded-md shadow-md px-4 bg-gray-200 focus:outline-green-700 focus:bg-white" type="text" name="judul" id="" placeholder="Judul">
                                <div class="mt-8 space-y-2">
                                    <label for="start">Tanggal diperlukan</label>
                                    <input required class="w-full h-10 rounded-md shadow-md px-4 bg-gray-200 focus:outline-green-700 focus:bg-white" type="date" id="start" name="tgl_diperlukan">
                                </div>
                                <div class="mt-8 space-y-2">
                                    <label for="input-file">Dokumen</label>
                                    <input required type="file" name="name-file" id="input-file" class="w-full h-10">
                                </div>
                                <select name="jenis_surat" id="letters" class="w-full h-10 mt-8 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white">
                                    <?php
                                        while($row = mysqli_fetch_array($query)){
                                    ?>
                                        <option value="<?=$row['id']?>"><?=$row['nama_jenis']?></option>
                                    <?php } ?>        
                                </select>
                                <textarea required class="w-full h-60 mt-8 rounded-md shadow-md px-4 py-2 bg-gray-200 focus:outline-green-700 focus:bg-white" name="keterangan" id="" cols="30" rows="10" placeholder="Keterangan"></textarea>
                            </div>
                            <button class="w-1/2  h-10 mt-4 md:mt-16 px-4 rounded-md shadow-md bg-[#006633] hover:bg-green-700 text-white" name="save">Submit</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>

        <!-- S Footer -->
        <div class="w-full h-20 border-t-2 border-gray-500">
            <p class="mt-6">
                Repositori FASILKOM-TI Universitas Sumatera Utara
                <br>
                &copy;ENNIFA, 2022
            </p>
        </div>
        <!-- E Footer -->
    </div>
    <!-- E Main Content -->
    <script src="https://unpkg.com/flowbite@1.5.5/dist/flowbite.js"></script>


</body>
</html>