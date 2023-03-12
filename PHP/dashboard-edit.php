<?php
    require '../Koneksi/koneksi.php';

    if(strlen($_SESSION['email'] == 0)){
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }
    if($_SESSION['tipe_akun'] == 'admin'){
        
    }else{
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
    <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.5/dist/flowbite.min.css" />
    <!-- Font awesome -->
    <script src="https://kit.fontawesome.com/bea7ede4c1.js" crossorigin="anonymous"></script>
    <title>Fasilkom-TI-Repository</title>
</head>
<body>
    <!-- S NavBar -->
    <?php include("navbar.php") ?>
    <!-- E NavBar -->

    <!-- S Current Opened Window -->
    <div class="w-full h-16 flex justify-start items-center bg-[#969696] px-6 md:px-24">
        <div class="w-full flex justify-between items-center font-semibold">
            <div>
                <a href="dashboard.php" class="hidden lg:flex items-center mr-6">
                    <p class="ml-2">Dashboard</p>
                </a>
            </div>
            <div class="flex items-center">
                <div class="mr-2">
                    <!-- Dropdown bell -->
                    <button id="dropdownUserAvatarButton" data-dropdown-toggle="dropdownAvatar" class="text-black hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-green-600 font-medium rounded-full text-sm px-4 py-2.5 text-center inline-flex items-center" type="button">
                        <i class="fas fa-bell"></i>
                    </button>

                    <!-- Dropdown menu -->
                    <div id="dropdownAvatar" class="hidden z-10 w-44 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                        <ul class="py-1 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownUserAvatarButton">
                            <li>
                                <a href="#" class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Dashboard</a>
                            </li>
                            <li>
                                <a href="#" class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Settings</a>
                            </li>
                            <li>
                                <a href="#" class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Earnings</a>
                            </li>
                        </ul>
                    </div>

                </div>

                
                <div class="ml-2">
                    <!-- Dropdown button -->
                <button id="dropdownInformationButton" data-dropdown-toggle="dropdownInformation" class="min-w-34 text-black hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-green-600 font-medium rounded-full text-sm px-4 py-2.5 text-center inline-flex items-center" type="button"><svg class="ml-2 w-4 h-4" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg></button>

                <!-- Dropdown menu -->
                <div id="dropdownInformation" class="hidden z-10 w-44 bg-white rounded divide-y divide-gray-100 shadow">
                    <div class="py-3 px-4 text-sm text-[#006633]">
                        <h5></h5>
                    </div>
                    <ul class="py-1 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownInformationButton">
                        <li>
                            <a href="#" class="block py-2 px-4 hover:bg-gray-100"></a>
                        </li>
                        <li>
                            <a href="#" class="block py-2 px-4 hover:bg-gray-100"></a>
                        </li>
                        <li>
                            <a href="#" class="block py-2 px-4 hover:bg-gray-100"></a>
                        </li>
                    </ul>
                    <div class="py-1">
                        <a href="#" class="block py-2 px-4 text-sm text-red-500 hover:bg-gray-100">Sign out</a>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
    <!-- E Current Opened Window -->

    <?php 
        $sql1 = "SHOW TABLES FROM repo_fasilkom";
        $query1 = mysqli_query($con,$sql1);
        $row1 = mysqli_fetch_array($query1);    
    ?>

    <!-- S Main Content -->
    <div class="w-full flex">
        <!-- Sidebar -->
        <div class="hidden sm:flex min-h-full">
            <div class="h-full overflow-y-auto py-4 px-2 bg-[#757575]">
                <ul class="space-y-2">
                    <li>
                        <a href="dashboard.php" class="flex items-center p-2 text-base font-normal rounded-lg text-black hover:bg-gray-200 hover:ring-4 hover:outline-none hover:ring-green-600">
                            <span class="ml-3">Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <button type="button" class="flex items-center p-2 w-full text-base font-normal rounded-lg group transition duration-75 hover:bg-gray-200 hover:ring-4 hover:outline-none hover:ring-green-600" aria-controls="dropdown-example" data-collapse-toggle="dropdown-example">
                        <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item>Tabel</span>
                            <svg sidebar-toggle-item class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                        </button>
                        <ul id="dropdown-example" class="hidden py-2 space-y-2">
                        <?php
                        while($row1 = mysqli_fetch_array($query1)){
                        ?>
                            <li>
                                <a href="dashboard-details.php?nama_tabel=<?=$row1['Tables_in_repo_fasilkom']?>" class="flex items-center p-2 pl-11 w-full text-base font-normal hover:bg-gray-200 hover:ring-4 hover:outline-none hover:ring-green-600 text-gray-900 rounded-lg transition duration-75 group"><?=$row1['Tables_in_repo_fasilkom']?></a>
                            </li>
                        <?php } ?>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

        <?php
            $nama_tabel = $_GET['nama_tabel'];
            $sql2 = "SHOW COLUMNS FROM $nama_tabel";
            $query2 = mysqli_query($con,$sql2);

            $a = array();

            if($nama_tabel == 'akun'){
                $e = $_GET['email'];
                $sql = "SELECT * FROM akun WHERE email = '$e'";
                $query = mysqli_query($con,$sql);
            }elseif($nama_tabel == 'dosen_pembimbing'){
                $e = $_GET['nip'];
                $sql = "SELECT * FROM dosen_pembimbing WHERE nip = '$e'";
                $query = mysqli_query($con,$sql);
            }elseif($nama_tabel == 'mahasiswa'){
                $e = $_GET['nim'];
                $sql = "SELECT * FROM mahasiswa WHERE nim = '$e'";
                $query = mysqli_query($con,$sql);
            }elseif($nama_tabel == 'balasan_surat'){
                $e = $_GET['id_surat'];
                $sql = "SELECT * FROM balasan_surat WHERE id_surat = '$e'";
                $query = mysqli_query($con,$sql);
            }else{
                $e = $_GET['id'];
                $sql = "SELECT * FROM $nama_tabel WHERE id = '$e'";
                $query = mysqli_query($con,$sql);
            }

            $row = mysqli_fetch_array($query);
        ?>
 

        <!-- Dashboard -->
        <div class="w-full">
            <div class="w-full flex flex-col py-6 px-6">
                <!-- "Dashboard" -->
                <div class="w-full py-2 px-2">
                    <h2 class="font-bold text-lg">Dashboard</h2>
                </div>

                <!-- Dashboard card -->
                <form method="post" enctype="multipart/form-data">
                <div class="w-full py-2 mt-2 mb-12 flex flex-col space-y-4">
                    <!-- Row items -->
                    <?php while($row2 = mysqli_fetch_array($query2)){ array_push($a,$row2['Field'])?>
                    <div class="w-full flex gap-8">
                        <h2 class="w-1/6"><?=$row2['Field']?></h2>
                        <?php if($row2['Field'] == 'tgl_upload' || $row2['Field'] == 'tgl_pengesahan' || $row2['Field'] == 'tgl_diperlukan' || $row2['Field'] == 'tgl_terbit'){ ?>
                            <input class="rounded-md" type="date" name="<?=$row2['Field']?>" placeholder="Email" value=<?=$row[$row2['Field']]?>>
                        <?php }elseif($row2['Field'] == 'file_url' || $row2['Field'] == 'file_link' || $row2['Field'] == 'file_surat'){ ?>
                            <input class="rounded-md" type="file" name="filename">
                        <?php }elseif($row2['Field'] == 'tipe_akun'){ ?>
                            <select name="tipe_akun" required>
                            <?php 
                                    $sql8 = "SELECT DISTINCT User FROM mysql.db WHERE db = 'repo_fasilkom'";
                                    $query8 = mysqli_query($con,$sql8);
                                    while($row8 = mysqli_fetch_array($query8)){
                            ?>
                                <option value="<?=$row8['User']?>"><?=$row8['User']?></option>
                            <?php } ?>
                            </select>

                        <?php }else{ ?>
                            <!-- <input class="rounded-md" type="text" name="<?=$row2['Field']?>" placeholder="Email" value=<?=$row[$row2['Field']]?>> -->
                            <Textarea class="w-full border-2 border-gray-400 rounded-md shadow-md focus:shadow-2xl p-2" cols="30" rows="6" name="<?=$row2['Field']?>" placeholder="Masukkan Judul"><?=$row[$row2['Field']]?></Textarea>
                        <?php } ?>
                            <input type="text" value="<?=$nama_tabel?>" name="nama_tabel" hidden>
                    </div>
                    <?php } ?>
                    <button class="max-w-fit h-10 px-4 rounded-md shadow-md bg-[#006633] hover:bg-green-700 active:bg-sky-700 text-white" name="update">Update</button>
                    <?php
                        if(isset($_POST['update'])){
                            $count = count($a);
                            for($i = 0; $i < $count; $i++){
                                if($a[$i] == 'file_url' || $a[$i] == 'file_link' || $a[$i] == 'file_surat'){
                                    $nama_file = $_FILES["filename"]["name"];
                                }else{
                                    ${"$a[$i]"} = $_POST["$a[$i]"];
                                }
                            }

                            $nama_tabel = $_POST['nama_tabel'];

                            if($nama_tabel == 'tugas_akhir' || $nama_tabel == 'penelitian_dosen'){
                                $sql5 = "SELECT * FROM $nama_tabel WHERE judul = '$judul'";
                                $query5 = mysqli_query($con,$sql5);
                                $row5 = mysqli_fetch_array($query5);

                                if($judul == $row5['judul']){
                                    if($row5['id'] != $e){
                                        echo "<script> alert('Judul Sudah ada') </script>";
                                        echo "<script type='text/javascript'> document.location = 'dashboard-edit.php?nama_tabel=$nama_tabel&id=$e'; </script>";
                                    }
                                }
                            }

                            if(strlen($nama_file) > 0){
                                
                                if(!file_exists('file/uploadedfile/'.$nama_tabel)){
                                    mkdir('file/uploadedfile/'.$nama_tabel,0777,true);
                                }
        
                                $path = 'file/uploadedfile/'.$nama_tabel;
                                $files = array_diff(scandir($path), array('.', '..'));
        
                                if(file_exists('file/uploadedfile/'.$nama_tabel.'/'.$nama_file)){
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
        
                                    move_uploaded_file($_FILES["filename"]["tmp_name"], "file/uploadedfile/".$nama_tabel."/".$name." (".$x.").".$extension);
                                    $nama_file = $name." (".$x.").".$extension;
                                }else{
                                    move_uploaded_file($_FILES["filename"]["tmp_name"], "file/uploadedfile/".$nama_tabel."/".$nama_file);
                                }

                                if($nama_tabel == 'role_akun'){
                                    $sql7 = "SELECT * FROM role_akun WHERE email_akun = '{$email_akun}' && tipe_akun = '{$tipe_akun}'";
                                    $query7 = mysqli_query($con,$sql7);
                                    $num_row = mysqli_num_rows($query7);

                                    if($num_row > 0){
                                        echo "<script> alert('Role sudah ada pada akun tersebut.  Update gagal') </script>";
                                        echo "<script type='text/javascript'> document.location = 'dashboard-edit.php?nama_tabel=$nama_tabel&id=$id'; </script>";
                                    }else{
                                        $sql1 = "UPDATE $nama_tabel SET ";
                                        for($i = 0;$i < $count;$i++){
                                            if($a[$i] == 'file_url'){
                                                $sql1 .= "file_url = '$nama_file' ";
                                            }elseif($a[$i] == 'file_link'){
                                                $sql1 .= "file_link = '$nama_file' ";
                                            }elseif($a[$i] == 'file_surat'){
                                                $sql1 .= "file_surat = '$nama_file' ";
                                            }else{
                                                $sql1 .= "$a[$i] = '${$a[$i]}' ";
                                            }

                                            if(($count - $i) > 1){
                                                $sql1 .= ",";
                                            }
                                        }

                                        if (isset ($_POST['email'])) {
                                            $email = $_POST['email'];
                                    
                                            $sql1 .= "WHERE email = '$email'";
                                        } elseif (isset ($_POST['nip'])) {
                                            $nip = $_POST['nip'];
                                    
                                            $sql1 .= "WHERE nip = '$nip'";
                                        } elseif (isset ($_POST['nim'])) {
                                            $nim = $_POST['nim'];
                                    
                                            $sql1 .= "WHERE nim = '$nim'";
                                        } elseif (isset ($_POST['id_surat'])) {
                                            $id_surat = $_POST['id_surat'];
                                    
                                            $sql1 .= "WHERE id_surat = '$id_surat'";
                                        } else {
                                            $id = $_POST['id'];
                                    
                                            $sql1 .= "WHERE id = '$id'";
                                        }
                                    }
                                }else{
                                    $sql1 = "UPDATE $nama_tabel SET ";
                                        for($i = 0;$i < $count;$i++){
                                            if($a[$i] == 'file_url'){
                                                $sql1 .= "file_url = '$nama_file' ";
                                            }elseif($a[$i] == 'file_link'){
                                                $sql1 .= "file_link = '$nama_file' ";
                                            }elseif($a[$i] == 'file_surat'){
                                                $sql1 .= "file_surat = '$nama_file' ";
                                            }else{
                                                $sql1 .= "$a[$i] = '${$a[$i]}' ";
                                            }

                                            if(($count - $i) > 1){
                                                $sql1 .= ",";
                                            }
                                        }

                                        if (isset ($_POST['email'])) {
                                            $email = $_POST['email'];
                                    
                                            $sql1 .= "WHERE email = '$email'";
                                        } elseif (isset ($_POST['nip'])) {
                                            $nip = $_POST['nip'];
                                    
                                            $sql1 .= "WHERE nip = '$nip'";
                                        } elseif (isset ($_POST['nim'])) {
                                            $nim = $_POST['nim'];
                                    
                                            $sql1 .= "WHERE nim = '$nim'";
                                        } elseif (isset ($_POST['id_surat'])) {
                                            $id_surat = $_POST['id_surat'];
                                    
                                            $sql1 .= "WHERE id_surat = '$id_surat'";
                                        } else {
                                            $id = $_POST['id'];
                                    
                                            $sql1 .= "WHERE id = '$id'";
                                        }
                                }

                            }else{

                                if($nama_tabel == 'role_akun'){
                                    $sql7 = "SELECT * FROM role_akun WHERE email_akun = '{$email_akun}' && tipe_akun = '{$tipe_akun}'";
                                    $query7 = mysqli_query($con,$sql7);
                                    $num_row = mysqli_num_rows($query7);

                                    if($num_row > 0){
                                        echo "<script> alert('Role sudah ada pada akun tersebut.  Update gagal') </script>";
                                        echo "<script type='text/javascript'> document.location = 'dashboard-edit.php?nama_tabel=$nama_tabel&id=$id'; </script>";
                                    }else{
                                        $sql1 = "UPDATE $nama_tabel SET ";
                                        for($i = 0;$i < $count;$i++){
                                            
                                            if($a[$i] == 'file_url'){
                                                
                                            }elseif($a[$i] == 'file_link'){
                                                
                                            }elseif($a[$i] == 'file_surat'){
                                                
                                            }else{
                                                $sql1 .= "$a[$i] = '${$a[$i]}' ";
                                                if(($count - $i) > 1){
                                                    $sql1 .= ",";
                                                }
                                            }

                                        }

                                        if (isset ($_POST['email'])) {
                                            $email = $_POST['email'];
                                    
                                            $sql1 .= "WHERE email = '$email'";
                                        } elseif (isset ($_POST['nip'])) {
                                            $nip = $_POST['nip'];
                                    
                                            $sql1 .= "WHERE nip = '$nip'";
                                        } elseif (isset ($_POST['nim'])) {
                                            $nim = $_POST['nim'];
                                    
                                            $sql1 .= "WHERE nim = '$nim'";
                                        } elseif (isset ($_POST['id_surat'])) {
                                            $id_surat = $_POST['id_surat'];
                                    
                                            $sql1 .= "WHERE id_surat = '$id_surat'";
                                        } else {
                                            $id = $_POST['id'];
                                    
                                            $sql1 .= "WHERE id = '$id'";
                                        }
                                    }
                                }else{
                                    $sql1 = "UPDATE $nama_tabel SET ";
                                    for($i = 0;$i < $count;$i++){
                                        
                                        if($a[$i] == 'file_url'){
                                            
                                        }elseif($a[$i] == 'file_link'){
                                            
                                        }elseif($a[$i] == 'file_surat'){
                                            
                                        }else{
                                            $sql1 .= "$a[$i] = '${$a[$i]}' ";
                                            if(($count - $i) > 1){
                                                $sql1 .= ",";
                                            }
                                        }

                                    }

                                    if (isset ($_POST['email'])) {
                                        $email = $_POST['email'];
                                
                                        $sql1 .= "WHERE email = '$email'";
                                    } elseif (isset ($_POST['nip'])) {
                                        $nip = $_POST['nip'];
                                
                                        $sql1 .= "WHERE nip = '$nip'";
                                    } elseif (isset ($_POST['nim'])) {
                                        $nim = $_POST['nim'];
                                
                                        $sql1 .= "WHERE nim = '$nim'";
                                    } elseif (isset ($_POST['id_surat'])) {
                                        $id_surat = $_POST['id_surat'];
                                
                                        $sql1 .= "WHERE id_surat = '$id_surat'";
                                    } else {
                                        $id = $_POST['id'];
                                
                                        $sql1 .= "WHERE id = '$id'";
                                    }
                                }
                            }

                            // echo $sql1;

                            try{
                                $query1 = mysqli_query($con,$sql1);
                            }catch(Exception $e){
                                echo "<script> alert('Error. Terjadi Kesalahan') </script>";
                                echo "<script type='text/javascript'> document.location = 'dashboard-details.php?nama_tabel=$nama_tabel'; </script>";
                            }

                            if($query1){
                                echo "<script> alert('Berhasil') </script>";
                                echo "<script type='text/javascript'> document.location = 'dashboard-details.php?nama_tabel=$nama_tabel'; </script>";
                            }
                        }
                    ?>
                </div>
                </form>

                <!-- S Footer -->
                <?php include("footer.php") ?>
                <!-- E Footer -->
            </div>
            
        </div>
    </div>

    <!-- E Main Content -->

    <script src="https://unpkg.com/flowbite@1.5.5/dist/flowbite.js"></script>
</body>
</html>