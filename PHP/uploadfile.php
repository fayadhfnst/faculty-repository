<?php
    require '../Koneksi/koneksi.php';

    if(strlen($_SESSION['email'] == 0)){
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }

    if($_SESSION['tipe_akun'] == 'mahasiswa'){
        header("Location:index.php");
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
    <?php include("navbar.php");
        $sql11 = "SELECT nip FROM dosen_pembimbing WHERE nama_lengkap = '{$nama_akun}'";
        $query11 = mysqli_query($con,$sql11);
        $row11 = mysqli_fetch_array($query11);    
    ?>
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

            <!-- Upload file -->
            <a href="" class="flex items-center mx-6">
                <p>Upload file</p>
            </a>
        </div>
    </div>
    <!-- E Current Opened Window -->

    <?php
        if($_GET['type'] == 'tugas_akhir'){
            $name = "Tugas Akhir";
        }elseif($_GET['type'] == 'penelitian_dosen'){
            $name = "Penelitian";
        }else{
            $name = "Ebook";
        }
    ?>

    <!-- S Main Content -->
    <div class="w-full h-screen px-4 py-8 md:px-24 md:py-8">
        <form method="post" enctype="multipart/form-data">
            <?php
                if(isset($_POST['save'])){
                    $tipe = $_POST['tipe'];
                    if($tipe == 'tugas_akhir'){
                        $judul = $_POST['judul'];
                        $abstract = $_POST['abstract'];
                        $kategori_repo = $_POST['kategori_repo'];
                        $nim_mhs = $_POST['nim_mhs'];
                        $nip_doping1 = $_POST['nip_doping1'];
                        $nip_doping2 = $_POST['nip_doping2'];
                        $nip_dosen_penguji1 = $_POST['nip_dosen_penguji1'];
                        $nip_dosen_penguji2 = $_POST['nip_dosen_penguji2'];
                        $keyword = $_POST['keyword'];
                        $tgl_pengesahan = $_POST['tgl_pengesahan'];
                        $sql2 = "SELECT * FROM kategori_repo WHERE id = '$kategori_repo'";
                        $query2 = mysqli_query($con,$sql2);
                        $row2 = mysqli_fetch_array($query2);
                        $prodi = $row2['id_prodi'];
                        $nama_file = $_FILES["filename"]["name"];
                    }elseif($tipe == 'penelitian_dosen'){
                        $judul = $_POST['judul'];
                        $abstract = $_POST['abstract'];
                        $nama_anggota = $_POST['nama_anggota'];
                        $prodi = $_POST['id_prodi'];
                        $sql3 = "SELECT * FROM kategori_repo WHERE id_prodi = '$prodi' and nama_kategori = 'Penelitian'";
                        $query3 = mysqli_query($con,$sql3);
                        $row3 = mysqli_fetch_array($query3);
                        $kategori_repo = $row3['id'];
                        $nama_file = $_FILES["filename"]["name"];
                    }else{
                        $judul = $_POST['judul'];
                        $abstract = $_POST['abstract'];
                        $penulis = $_POST['penulis'];
                        $tgl_terbit = $_POST['tgl_terbit'];
                        $nama_file = $_FILES["filename"]["name"];
                    }
                        
                    if(strlen($nama_file) != 0){
                        $allowed_extensions = array("pdf");
                        if(!in_array(pathinfo($nama_file,PATHINFO_EXTENSION),$allowed_extensions)){
                            echo "<script> alert('Extension File hanya boleh pdf') </script>";
                            echo "<script type='text/javascript'> document.location = 'uploadfile.php?type=$tipe'; </script>";
                        }else{
                                            
                            if(!file_exists('file/uploadedfile/'.$tipe)){
                                mkdir('file/uploadedfile/'.$tipe,0777,true);
                            }

                            $path = 'file/uploadedfile/'.$tipe;
                            $files = array_diff(scandir($path), array('.', '..'));

                            if(file_exists('file/uploadedfile/'.$tipe.'/'.$nama_file)){
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

                                move_uploaded_file($_FILES["filename"]["tmp_name"], "file/uploadedfile/".$tipe."/".$name." (".$x.").".$extension);
                                $nama_file = $name." (".$x.").".$extension;
                            }else{
                                move_uploaded_file($_FILES["filename"]["tmp_name"], "file/uploadedfile/".$tipe."/".$nama_file);
                            }

                            if($tipe == 'tugas_akhir'){
                                $sql5 = "SELECT * FROM tugas_akhir WHERE judul = '$judul'";
                                $query5 = mysqli_query($con,$sql5);
                                $row5 = mysqli_fetch_array($query5);
                                if($judul != $row5['judul']){      
                                    if($nip_doping1 == $row11['nip']|| $nip_doping2 == $row11['nip']){
                                        $sql1 = "INSERT INTO tugas_akhir(id,judul,nim_mhs,tgl_pengesahan,tgl_upload,nip_dosen_pembimbing1,nip_dosen_pembimbing2,nip_dosen_penguji1,nip_dosen_penguji2,id_kategori_repo,abstract,id_keyword,file_link,id_prodi) 
                                        VALUES ('','$judul','$nim_mhs','$tgl_pengesahan',CURRENT_DATE(),'$nip_doping1','$nip_doping2','$nip_dosen_penguji1','$nip_dosen_penguji2','$kategori_repo','$abstract','$keyword','$nama_file','$prodi')";
                                    }else{
                                        echo "<script> alert('NIP dosen pembimbing yang dimasukkan tidak memiliki nip user yang mengupload') </script>";
                                        echo "<script type='text/javascript'> document.location = 'uploadfile.php?type=tugas_akhir'; </script>";
                                    }
                                }else{
                                    echo "<script> alert('Judul Sudah ada') </script>";
                                    echo "<script type='text/javascript'> document.location = 'uploadfile.php?type=tugas_akhir'; </script>";
                                }
                            }elseif($tipe == 'penelitian_dosen'){
                                $sql5 = "SELECT * FROM penelitian_dosen WHERE judul = '$judul'";
                                $query5 = mysqli_query($con,$sql5);
                                $row5 = mysqli_fetch_array($query5);
                                if($judul != $row5['judul']){
                                    $sql1 = "INSERT INTO penelitian_dosen(id,judul,nama_anggota,tgl_upload,id_kategori_repo,abstract,file_url,id_prodi) VALUES ('','$judul','$nama_anggota',CURRENT_DATE(),'$kategori_repo','$abstract','$nama_file','$prodi')";
                                }else{
                                    echo "<script> alert('Judul Sudah ada') </script>";
                                    echo "<script type='text/javascript'> document.location = 'uploadfile.php?type=penelitian_dosen'; </script>";
                                }
                            }else{
                                $sql1 = "INSERT INTO ebook(id,judul,penulis,tgl_terbit,tgl_upload,abstract,file_url) VALUES ('','$judul','$penulis','$tgl_terbit',CURRENT_DATE(),'$abstract','$nama_file')";
                            }

                        }
                    }else{
                        if($tipe == 'tugas_akhir'){
                            $sql5 = "SELECT * FROM tugas_akhir WHERE judul = '$judul'";
                            $query5 = mysqli_query($con,$sql5);
                            $row5 = mysqli_fetch_array($query5);
                            if($judul != $row5['judul']){
                                if($nip_doping1 == $row11['nip']|| $nip_doping2 == $row11['nip']){
                                    $sql1 = "INSERT INTO tugas_akhir(id,judul,nim_mhs,tgl_pengesahan,tgl_upload,nip_dosen_pembimbing1,nip_dosen_pembimbing2,nip_dosen_penguji1,nip_dosen_penguji2,id_kategori_repo,abstract,id_keyword,id_prodi) 
                                    VALUES ('','$judul','$nim_mhs','$tgl_pengesahan',CURRENT_DATE(),'$nip_doping1','$nip_doping2','$nip_dosen_penguji1','$nip_dosen_penguji2','$kategori_repo','$abstract','$keyword','$prodi')";
                                }else{
                                    echo "<script> alert('NIP dosen pembimbing yang dimasukkan tidak memiliki nip user yang mengupload') </script>";
                                    echo "<script type='text/javascript'> document.location = 'uploadfile.php?type=tugas_akhir'; </script>";
                                }
                            }else{
                                echo "<script> alert('Judul Sudah ada') </script>";
                                echo "<script type='text/javascript'> document.location = 'uploadfile.php?type=tugas_akhir'; </script>";
                            }
                        }elseif($tipe == 'penelitian_dosen'){
                            $sql5 = "SELECT * FROM penelitian_dosen WHERE judul = '$judul'";
                            $query5 = mysqli_query($con,$sql5);
                            $row5 = mysqli_fetch_array($query5);
                            if($judul != $row5['judul']){
                                $sql1 = "INSERT INTO penelitian_dosen(id,judul,nama_anggota,tgl_upload,id_kategori_repo,abstract,id_prodi) VALUES ('','$judul','$nama_anggota',CURRENT_DATE(),'$kategori_repo','$abstract','$prodi')";
                            }else{
                                echo "<script> alert('Judul Sudah ada') </script>";
                                echo "<script type='text/javascript'> document.location = 'uploadfile.php?type=penelitian_dosen'; </script>";
                            }
                        }else{
                            $sql1 = "INSERT INTO ebook(id,judul,penulis,tgl_terbit,tgl_upload,abstract) VALUES ('','$judul','$penulis','$tgl_terbit',CURRENT_DATE(),'$abstract')";
                        }
                    }

                    try{
                        $query1 = mysqli_query($con,$sql1);
                    }catch(Exception $e){
                        echo "<script> alert('Error. Terjadi Kesalahan') </script>";
                        echo "<script type='text/javascript'> document.location = 'uploadfile.php?type=$tipe'; </script>";
                    }

                    if($query1){
                        echo "<script> alert('Berhasil') </script>";
                        echo "<script type='text/javascript'> document.location = 'databerkas.php?tipe=$tipe'; </script>";
                    }
                }
                
            ?>
        <div class="flex mb-20">
            <!-- Content -->
            <div class="w-full">
                <!-- Upload file -->
                <h4 class="font-bold border-b-2 border-gray-500 pb-4 mb-8">Upload <?=$name?></h4>

                <!-- Upload file -->
                <!-- Judul -->
                <div class="w-full flex">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-start">
                        <h2>Judul</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <Textarea required class="w-full border-2 border-gray-400 rounded-md shadow-md focus:shadow-2xl p-2" cols="30" rows="6" name="judul" placeholder="Masukkan Judul"></Textarea>
                    </div>
                </div>

                <!-- Abstrak -->
                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-start">
                        <h2>Abstrak</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <Textarea required class="w-full border-2 border-gray-400 rounded-md shadow-md focus:shadow-2xl p-2" cols="30" rows="6" name="abstract" placeholder="Masukkan Judul"></Textarea>
                    </div>
                </div>

                <?php
                    if($_GET['type'] == 'tugas_akhir'){
                        $sql = "SELECT * FROM kategori_repo WHERE nama_kategori != 'Penelitian'";
                        $query = mysqli_query($con,$sql);

                        $sql1 = "SELECT * FROM keyword ORDER BY nama_keyword";
                        $query1 = mysqli_query($con,$sql1);
                ?>
                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>Jenis Tugas Akhir</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <select class="max-w-fit h-10 my-4 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white" name="kategori_repo">
                            <?php 
                                while($row = mysqli_fetch_array($query)){
                                    $sql7 = "SELECT * FROM prodi WHERE id = {$row['id_prodi']}";
                                    $query7 = mysqli_query($con,$sql7);
                                    $row7 = mysqli_fetch_array($query7);
                            ?>
                                <option value="<?=$row['id']?>"><?=$row['nama_kategori']?> <?=$row7['nama_prodi']?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>

                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>Nim Mahasiswa</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <input required class="max-w-fit h-10 my-4 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white" type="text" name="nim_mhs">
                    </div>
                </div>

                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>NIP Dosen Pembimbing 1</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <input required class="max-w-fit h-10 my-4 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white" type="text" name="nip_doping1">
                    </div>
                </div>

                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>NIP Dosen Pembimbing 2</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <input required class="max-w-fit h-10 my-4 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white" type="text" name="nip_doping2">
                    </div>
                </div>

                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>NIP Dosen Penguji 1</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <input required class="max-w-fit h-10 my-4 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white" type="text" name="nip_dosen_penguji1">
                    </div>
                </div>

                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>NIP Dosen Penguji 2</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <input required class="max-w-fit h-10 my-4 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white" type="text" name="nip_dosen_penguji2">
                    </div>
                </div>

                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>Keyword</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <select class="max-w-fit h-10 my-4 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white" name="keyword">
                            <?php 
                                while($row1 = mysqli_fetch_array($query1)){
                            ?>
                                <option value="<?=$row1['id']?>"><?=$row1['nama_keyword']?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>

                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>Tanggal Pengesahan</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <input required class="max-w-fit h-10 my-4 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white" type="date" name="tgl_pengesahan" id="file">
                    </div>
                </div>
                <?php }elseif($_GET['type'] == 'penelitian_dosen'){ 
                    $sql = "SELECT * FROM prodi";
                    $query = mysqli_query($con,$sql);    
                ?>
                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>Nama Anggota</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <Textarea required class="w-full border-2 border-gray-400 rounded-md shadow-md focus:shadow-2xl p-2" cols="30" rows="6" name="nama_anggota" placeholder="Masukkan Judul"></Textarea>
                    </div>
                </div>

                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>Prodi</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <select class="max-w-fit h-10 my-4 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white" name="id_prodi">
                            <?php 
                                while($row = mysqli_fetch_array($query)){
                            ?>
                                <option value="<?=$row['id']?>"><?=$row['nama_prodi']?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <?php }else{ ?>
                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>Penulis</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <Textarea required class="w-full border-2 border-gray-400 rounded-md shadow-md focus:shadow-2xl p-2" cols="30" rows="6" name="penulis" placeholder="Masukkan Judul"></Textarea>
                    </div>
                </div>

                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>Tanggal Terbit</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <input required class="max-w-fit h-10 my-4 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white" type="date" name="tgl_terbit">    
                    </div>
                </div>
                <?php } ?>

                <input type="text" value="<?=$_GET['type']?>" name="tipe" hidden>

                <!-- Lampiran -->
                <div class="w-full flex mt-4">
                    <div class="w-1/4 text-lg px-4 py-2 flex justify-center items-center">
                        <h2>File</h2>
                    </div>
                    <div class="w-3/4 px-4 py-2">
                        <input required type="file" name="filename" id="file">
                    </div>
                </div>
                <div class="w-full flex items-center justify-center">
                    <button class="max-w-fit h-10 mx-auto mt-4 md:mt-16 px-4 rounded-md shadow-md bg-[#006633] hover:bg-green-700 text-white" name="save">Submit</button>
                </div>
            </div>
            </form>
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