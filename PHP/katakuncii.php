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

            <?php
                if(isset($_GET['id_prodi'])){
                    $id_prodi = $_GET['id_prodi'];
                    $sql = "SELECT * FROM prodi WHERE id = $id_prodi";
                    $query = mysqli_query($con,$sql);
                    $row = mysqli_fetch_array($query);
            ?>
                <span class="hidden lg:flex">/</span>

                <!-- Departemen Ilmu Komputer -->
                <a href="departemen.php?id_prodi=<?=$row['id']?>" class="flex items-center mx-6">
                    <p>Departemen <?=$row['nama_prodi']?></p>
                </a>
            <?php } ?>

                <span class="hidden lg:flex">/</span>

                <!-- Departemen Ilmu Komputer -->
                <a href="" class="flex items-center mx-6">
                    <p>Keywords</p>
                </a>
        </div>
    </div>
    <!-- E Current Opened Window -->

    <!-- S Main Content -->
    <div class="w-full h-screen px-4 py-8 md:px-24 md:py-8">
        <div class="flex mb-20">
            <!-- Left content -->
            <div class="lg:w-3/4 lg:pr-24">
                <!-- Pencarian berdasarkan kata kunci -->
                <h4 class="font-bold">Pencarian berdasarkan kata kunci</h4>

                <!-- List angka huruf kata kunci -->
                <!-- <div class="w-full my-4 py-2 border-b-2 border-gray-500">
                    <ul class="flex">
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">0-9</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">A</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">B</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">C</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">D</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">E</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">F</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">G</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">H</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">I</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">J</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">K</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">L</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">M</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">N</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">O</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">P</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">Q</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">R</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">S</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">T</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">U</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">V</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">W</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">X</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">Y</a>
                        </li>
                        <li class="hover:bg-gray-200 p-2">
                            <a href="">Z</a>
                        </li>
                    </ul>
                </div> -->

 
                <!-- List kata kunci -->

                <div>
                    <ul class="space-y-4 text-green-700">
                        <?php 
                            if(isset($_GET['angkatan'])){
                                $angkatan = $_GET['angkatan'];

                                $sql = "SELECT * FROM tugas_akhir WHERE nim_mhs LIKE '$angkatan%'";
                                $query = mysqli_query($con,$sql);                                
                            }elseif(isset($_GET['thn_sidang'])){
                                $thn_sidang = $_GET['thn_sidang'];

                                $sql = "SELECT * FROM tugas_akhir WHERE tgl_pengesahan LIKE '$thn_sidang%'";
                                $query = mysqli_query($con,$sql);
                            }
                            
                            while($row = mysqli_fetch_array($query)){
                        ?>
                            <li>
                                <a href="viewberkas.php?keyword=<?=$row['id_kategori_repo']?>&id_prodi=<?=$row['id_prodi']?>&id_tugasakhir=<?=$row['id']?>" class="hover:text-sky-700 p-2"><?=$row['judul']?></a>
                            </li>
                        <?php } ?>
                    </ul>
                </div>
                
            </div>

            <!-- Right content -->
            <?php include("sidebar.php"); ?>

        </div>
        <!-- S Footer -->
        <?php include("footer.php"); ?>
        <!-- E Footer -->
    </div>
    <!-- E Main Content -->


</body>
</html>