<?php
    require "../Koneksi/koneksi.php";

    // echo "<p hidden>";
    if(isset($_SESSION['email'])){
        if(strlen($_SESSION['email'] == 0)){
            // $previous_url = $_SERVER['HTTP_REFERER'];
            // $_SESSION['previous_url'] = $previous_url;
            echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
        }
    }else{ 
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }

    if($_SESSION['tipe_akun'] != 'mahasiswa'){
       
    }else{
        echo "<script type='text/javascript'> document.location = 'index.php'; </script>";
    }
    // echo "</p>";
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
    <title>Fasilkom-TI-Repositoryy</title>
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

            <!-- <span class="hidden lg:flex">/</span> -->

            <span class="hidden lg:flex">/</span>

            <!-- Skripsi sarjana -->
            <a href="databerkas.php" class="flex items-center lg:ml-6 mr-6">
                <p>Berkas Saya</p>
            </a>
        </div>
    </div>
    <!-- E Current Opened Window -->

    <?php
        if(isset($_GET['tipe'])){
            $tipe = $_GET['tipe'];
            if($_GET['tipe'] == 'tugas_akhir'){
                $sql = "SELECT * FROM tugas_akhir WHERE nip_dosen_pembimbing1 = (SELECT nip FROM dosen_pembimbing WHERE nama_lengkap = '$nama_akun') or nip_dosen_pembimbing2 = (SELECT nip FROM dosen_pembimbing WHERE nama_lengkap = '$nama_akun  ') ORDER BY tgl_upload";
                $query = mysqli_query($con,$sql);
            }elseif($_GET['tipe'] == 'penelitian_dosen'){
                $sql1 = "SELECT * FROM penelitian_dosen WHERE nama_anggota LIKE '%$nama_akun%' ORDER BY tgl_upload";
                $query1 = mysqli_query($con,$sql1);    
            }else{
                $sql2 = "SELECT * FROM ebook WHERE uploaded_by = '$nama_akun' ORDER BY tgl_upload";
                $query2 = mysqli_query($con,$sql2);    
            }
            
        }
        // }else{
        //     $sql = "SELECT * FROM tugas_akhir WHERE nip_dosen_pembimbing1 = (SELECT nip FROM dosen_pembimbing WHERE nama_lengkap = '$nama_lengkap') or nip_dosen_pembimbing2 = (SELECT nip FROM dosen_pembimbing WHERE nama_lengkap = '$nama_lengkap') ORDER BY tgl_upload";
        //     $sql1 = "SELECT * FROM penelitian_dosen WHERE nama_anggota LIKE '%$nama_lengkap%' ORDER BY tgl_upload";
        //     $sql2 = "SELECT * FROM ebook WHERE uploaded_by = '$nama_lengkap' ORDER BY tgl_upload";

        //     $query = mysqli_query($con,$sql);
        //     $query1 = mysqli_query($con,$sql1);
        //     $query2 = mysqli_query($con,$sql2);
        // }
        
        $x = 1;
    ?>

    <!-- S Main Content -->
    <div class="w-full px-4 py-8 md:px-24 md:py-8">
        <div class="w-full flex mb-20">
            <!-- Left content -->
            <div class="lg:w-3/4 lg:pr-24">
                <!-- Skripsi sarjana -->
                <h4 class="font-bold border-b-2 border-gray-500">Daftar Berkas
                    <?php
                        if(isset($_GET['tipe'])){
                            echo "(";
                            echo ucwords($_GET['tipe']);
                            echo ")";
                        }
                    ?>
                </h4>
                
                <!-- Letters -->
                <div class="w-full my-4">
                    <!-- My letter -->
                    <div class="w-full flex justify-start items-center mb-5 overflow-auto">
                        <table class="w-full table-auto border-2">
                            <thead class="border-2 bg-gray-300">
                                <tr>
                                    <th class="border-2 px-2">No</th>
                                        <?php
                                            $a = array();
                                            $sql3 = "SHOW COLUMNS FROM $tipe";
                                            $query3 = mysqli_query($con,$sql3);
                                            while($row3 = mysqli_fetch_array($query3)){
                                                array_push($a,$row3['Field']);
                                        ?>
                                        <th class="border-2 px-2"><?=$row3['Field']?></th>
                                        <?php } ?>
                                    <th class="border-2 px-2">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                        
                                <?php
                                    $count = count($a);
                                    if($tipe == 'tugas_akhir'){
                                        while($row = mysqli_fetch_array($query)){
                                ?>
                                <tr class="h-44">
                                    <td class="border-2 px-2 text-center"><?=$x++?></td>

                                    <?php for($i = 0;$i < $count;$i++){
                                        if($a[$i] == 'file_url'){    
                                    ?>
                                    <td class="border-2 px-2">
                                        <a href="file/uploadedfile/<?=$tipe?>/<?=$row['file_url']?>" download="<?=$row['file_url']?>">
                                            <?=$row['file_url']?>
                                        </a>
                                    </td>
                                    <?php }elseif($a[$i] == 'file_link'){ ?>
                                    <td class="border-2 px-2">
                                        <a href="file/uploadedfile/<?=$tipe?>/<?=$row['file_link']?>" download="<?=$row['file_link']?>">
                                            <?=$row['file_link']?>
                                        </a>
                                    </td>
                                    <?php }else{ ?>
                                    <td class="border-2 px-2">
                                        <?=$row[$a[$i]]?>
                                    </td>
                                    <?php } ?>
                                    <?php } ?>
                                    <td class="text-center border-2 px-2 space-y-4">
                                        <div>
                                            <a class="bg-blue-500 hover:bg-blue-700 text-white font-semibold px-4 py-2 rounded" href="updatefile.php?type=<?=$tipe?>&id=<?=$row['id']?>">
                                                Edit
                                            </a>
                                        </div>
                                        <div>
                                            <a class="bg-red-500 hover:bg-red-700 text-white font-semibold px-4 py-2 rounded" href="deletefile.php?type=<?=$tipe?>&id=<?=$row['id']?>" onclick="return confirm('Apakah anda yakin ingin menghapus data?')">
                                                Delete
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <?php }}elseif($tipe == 'penelitian_dosen'){
                                        while($row1 = mysqli_fetch_array($query1)){
                                ?>
                                <tr class="h-44">
                                    <td class="border-2 px-2 text-center">
                                        <?=$x++?>
                                    </td>
                                    <?php for($i = 0;$i < $count;$i++){
                                        if($a[$i] == 'file_url'){    
                                    ?>
                                    <td class="border-2 px-2">
                                        <a href="file/uploadedfile/<?=$tipe?>/<?=$row1['file_url']?>" download="<?=$row1['file_url']?>">
                                            <?=$row1['file_url']?>
                                        </a>
                                    </td>
                                    <?php }elseif($a[$i] == 'file_link'){ ?>
                                    <td class="border-2 px-2">
                                        <a href="file/uploadedfile/<?=$tipe?>/<?=$row1['file_link']?>" download="<?=$row1['file_link']?>">
                                            <?=$row1['file_link']?>
                                        </a>
                                    </td>
                                    <?php }else{ ?>
                                    <td class="border-2 px-2">
                                        <?=$row1[$a[$i]]?>
                                    </td>
                                    <?php } ?>
                                    <?php } ?>
                                    <td class="text-center border-2 px-2 space-y-4">
                                        <div>
                                            <a class="bg-blue-500 hover:bg-blue-700 text-white font-semibold px-4 py-2 rounded" href="updatefile.php?type=<?=$tipe?>&id=<?=$row['id']?>">
                                                Edit
                                            </a>
                                        </div>
                                        <div>
                                            <a class="bg-red-500 hover:bg-red-700 text-white font-semibold px-4 py-2 rounded" href="deletefile.php?type=<?=$tipe?>&id=<?=$row['id']?>" onclick="return confirm('Apakah anda yakin ingin menghapus data?')">
                                                Delete
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <?php }}else{
                                        while($row2 = mysqli_fetch_array($query2)){    
                                ?>
                                <tr class="h-44">
                                    <td class="border-2 px-2 text-center">
                                        <?=$x++?>
                                    </td>
                                    <?php for($i = 0;$i < $count;$i++){
                                        if($a[$i] == 'file_url'){    
                                    ?>
                                    <td class="border-2 px-2">
                                        <a href="file/uploadedfile/<?=$tipe?>/<?=$row2['file_url']?>" download="<?=$row2['file_url']?>">
                                            <?=$row2['file_url']?>
                                        </a>
                                    </td>
                                    <?php }elseif($a[$i] == 'file_link'){ ?>
                                    <td class="border-2 px-2">
                                        <a href="file/uploadedfile/<?=$tipe?>/<?=$row2['file_link']?>" download="<?=$row2['file_link']?>">
                                            <?=$row2['file_link']?>
                                        </a>
                                    </td>
                                    <?php }else{ ?>
                                    <td class="border-2 px-2">
                                        <?=$row2[$a[$i]]?>
                                    </td>
                                    <?php } ?>
                                    <?php } ?>
                                    <td class="text-center border-2 px-2 space-y-4">
                                        <div>
                                            <a class="bg-blue-500 hover:bg-blue-700 text-white font-semibold px-4 py-2 rounded" href="updatefile.php?type=<?=$tipe?>&id=<?=$row['id']?>">
                                                Edit
                                            </a>
                                        </div>
                                        <div>
                                            <a class="bg-red-500 hover:bg-red-700 text-white font-semibold px-4 py-2 rounded" href="deletefile.php?type=<?=$tipe?>&id=<?=$row['id']?>" onclick="return confirm('Apakah anda yakin ingin menghapus data?')">
                                                Delete
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <?php }} ?>
                            </tbody>
                          </table>
                    </div>
                </div>
            </div>

            <!-- Right content -->
            <?php include("sidebar.php"); ?>
        </div>

        <!-- S Footer -->
        <?php include("footer.php") ?>
        <!-- E Footer -->
    </div>
    <!-- E Main Content -->

    <script src="https://unpkg.com/flowbite@1.5.5/dist/flowbite.js"></script>

</body>
</html>