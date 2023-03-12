<?php
    require "../Koneksi/koneksi.php";

    if(strlen($_SESSION['email'] == 0)){
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }

    if($_SESSION['tipe_akun'] == 'mahasiswa' || $_SESSION['tipe_akun'] == 'dosen'){
        echo "<script type='text/javascript'> document.location = 'index.php'; </script>";
    }

    $id = $_GET['id'];
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
    <?php include("navbar.php"); ?>
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

            <a href="daftarsurat.php" class="flex items-center lg:ml-6 mr-6">
                <p>Daftar Surat</p>
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
                                $nama_file = $_FILES["name-file"]["name"];
                                $allowed_extensions = array("pdf");
                                if(!in_array(pathinfo($nama_file,PATHINFO_EXTENSION),$allowed_extensions)){
                                    echo "<script> alert('Extension File hanya boleh pdf') </script>";
                                    echo "<script type='text/javascript'> document.location = 'balas-surat.php?id=$id'; </script>";
                                }else{
                                
                                    if(!file_exists('file/uploadedfile/BalasanSurat')){
                                        mkdir('file/uploadedfile/BalasanSurat',0777,true);
                                    }

                                    $path = 'file/uploadedfile/BalasanSurat';
                                    $files = array_diff(scandir($path), array('.', '..'));

                                    if(file_exists('file/uploadedfile/BalasanSurat/'.$nama_file)){
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

                                        move_uploaded_file($_FILES["name-file"]["tmp_name"], "file/uploadedfile/BalasanSurat/".$name." (".$x.").".$extension);
                                        $nama_file = $name." (".$x.").".$extension;
                                    }else{
                                        move_uploaded_file($_FILES["name-file"]["tmp_name"], "file/uploadedfile/BalasanSurat/".$nama_file);
                                    }

                                    $sql2 = "SELECT * FROM balasan_surat WHERE id_surat = '$id'";
                                    $query2 = mysqli_query($con,$sql2);
                                    $num_row = mysqli_num_rows($query2);

                                    if($num_row == 0){
                                        $sql1 = "INSERT INTO balasan_surat VALUES ('$id','{$row4['email']}','$nama_file')";
                                    }else{
                                        $sql1 = "UPDATE balasan_surat SET file_surat = '$nama_file' WHERE id_surat = '$id'"; 
                                    }

                                    try{
                                        $query1 = mysqli_query($con,$sql1);
                                    }catch(Exception $e){
                                        echo "<script> alert('Error. Terjadi Kesalahan') </script>";
                                        echo "<script type='text/javascript'> document.location = 'balas-surat.php?id=$id'; </script>";
                                    }

                                    if($query1){
                                        echo "<script> alert('Berhasil') </script>";
                                        echo "<script type='text/javascript'> document.location = 'daftarsurat.php'; </script>";
                                    }
                                }
                            }
                        ?>

                        <?php
                            $sql3 = "SELECT * FROM surat WHERE id = $id";
                            $query3 = mysqli_query($con,$sql3);
                            $row3 = mysqli_fetch_array($query3);
                        ?>
                        <div class="max-w-md flex flex-col justify-center items-center px-4 md:py-6">
                            <div class="w-full">
                                <input class="w-full h-10 rounded-md shadow-md px-4 bg-gray-200 focus:outline-green-700 focus:bg-white" type="text" name="judul" id="" placeholder="Judul" value="<?=$row3['judul']?>" disabled>
                                <input class="w-full h-10 rounded-md shadow-md mt-8 px-4 bg-gray-200 focus:outline-green-700 focus:bg-white" type="date" id="start" name="tgl_diperlukan" value="<?=$row3['tgl_diperlukan']?>" disabled>
                                <select disabled name="jenis_surat" id="letters" class="w-full h-10 mt-8 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white">
                                    <?php
                                        while($row = mysqli_fetch_array($query)){
                                            if($row['id'] == $row3['id_jenis_surat']){
                                    ?>
                                        <option value="<?=$row['id']?>" selected><?=$row['nama_jenis']?></option>
                                    <?php }else{ ?>
                                        <option value="<?=$row['id']?>"><?=$row['nama_jenis']?></option>
                                    <?php }} ?>        
                                </select>
                                <textarea class="w-full h-60 mt-8 rounded-md shadow-md px-4 py-2 bg-gray-200 focus:outline-green-700 focus:bg-white" name="keterangan" id="" cols="30" rows="10" placeholder="Keterangan" disabled><?=$row3['keterangan']?></textarea>
                                <input type="file" name="name-file" id="">
                            </div>
                            <button class="w-1/2  h-10 mt-4 md:mt-16 px-4 rounded-md shadow-md bg-[#006633] hover:bg-green-700 text-white" name="save">Submit</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>

        <!-- S Footer -->
        <?php include("footer.php"); ?>
        <!-- E Footer -->
    </div>
    <!-- E Main Content -->
    <script src="https://unpkg.com/flowbite@1.5.5/dist/flowbite.js"></script>


</body>
</html>