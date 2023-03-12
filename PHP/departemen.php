<?php
    require "../Koneksi/koneksi.php";

    // if(isset($_SESSION['tipe_akun'])){
    //     if($_SESSION['tipe_akun'] == 'admin'){
    //         mysqli_change_user($con, "root", "", "repo_fasilkom");
    //     }elseif($_SESSION['tipe_akun'] == 'staff'){
    //         mysqli_change_user($con, "staff", "1324", "repo_fasilkom");
    //     }elseif($_SESSION['tipe_akun'] == 'dosen'){
    //         mysqli_change_user($con, "dosen", "2468", "repo_fasilkom");
    //     }
    // }
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

            <?php 
                $id_prodi = $_GET['id_prodi'];
                $sql = "SELECT * FROM prodi WHERE id = $id_prodi";
                $query = mysqli_query($con,$sql);
                $row = mysqli_fetch_array($query);
            ?>

            <!-- Departemen Ilmu Komputer -->
            <a href="departemen.php?id_prodi=<?=$row['id']?>" class="flex items-center mx-6">
                <p>Departemen <?=$row['nama_prodi']?></p>
            </a>
        </div>
    </div>
    <!-- E Current Opened Window -->

    <!-- S Main Content -->
    <div class="w-full h-screen px-4 py-8 md:px-24 md:py-8">
        <div class="flex mb-20">
            <!-- Left content -->
            <div class="lg:w-3/4 lg:pr-24">
                <!-- Departemen ilmu komputer -->
                <h4 class="font-bold border-b-2 border-gray-500">DEPARTEMEN <?=strtoupper($row['nama_prodi'])?></h4>

                <!-- Browse by -->
                <div class="w-full my-4">
                    <p>BROWSE BY</p>
                    <ul class="w-1/2 flex flex-col lg:flex-row mt-2">
                        <li class="bg-gray-300 hover:text-sky-600 px-2 py-1">
                            <a href="katakunci.php?keyword=keyword&id_prodi=<?=$id_prodi?>">Keywords</a>
                        </li>
                        <li class="bg-gray-300 hover:text-sky-600 px-2 py-1 lg:border-l-2 border-gray-400">
                            <a href="katakunci.php?keyword=judul&id_prodi=<?=$id_prodi?>">Judul</a>
                        </li>
                        <li class="bg-gray-300 hover:text-sky-600 px-2 py-1 lg:border-l-2 border-gray-400">
                            <a href="katakunci.php?keyword=tipe&id_prodi=<?=$id_prodi?>">Tipe</a>
                        </li>
                    </ul>
                </div>
                
                <?php 
                    $sql1 = "SELECT id,nama_kategori,id_prodi, if(kategori_repo.id = 4 or kategori_repo.id = 8, 
                    jlh_judul_penelitian(kategori_repo.id),
                    jlh_judul_kategori_repo(kategori_repo.id)
                    ) AS jlh_judul FROM kategori_repo WHERE id_prodi = $id_prodi";
                    $query1 = mysqli_query($con,$sql1);
                ?>

                <!-- Kategori -->
                <div class="w-full flex flex-col">
                    <h4 class="font-bold">KATEGORI</h4>
                    <ul class="text-[#006633] font-semibold">
                        <?php
                            while($row1 = mysqli_fetch_array($query1)){
                        ?>
                        <li class="max-w-fit hover:text-sky-600 my-1">
                            <a href="kategori.php?id_prodi=<?=$row1['id_prodi']?>&id_kategori=<?=$row1['id']?>"><?= $row1['nama_kategori']?> [<?= $row1['jlh_judul'] ?>]</a>
                        </li>
                        <?php } ?>
                    </ul>
                </div>

                <?php 
                    $sql2 = "SELECT * FROM tugas_akhir WHERE id_prodi = $id_prodi ORDER BY tgl_upload DESC LIMIT 2";
                    $query2 = mysqli_query($con,$sql2);
                ?>

                <!-- Pengajuan terbaru -->
                <div>
                    <h4 class="font-bold mt-6 mb-2">PENGAJUAN TERBARU</h4>
                    <!-- Berkas -->
                    <?php 
                        while($row2 = mysqli_fetch_array($query2)){
                    ?>
                    <div class="mb-5">
                        <h5 class="font-bold text-[#006633]"><a href="viewberkas.php?id_prodi=<?=$row2['id_prodi']?>&id_tugasakhir=<?=$row2['id']?>"><?= $row2['judul'] ?></a></h5>
                        <p class="text-justify"><?= $row2['abstract'] ?></p>
                    </div>
                    <?php } ?>
                </div>
                <button class="font-bold text-[#006633] hover:text-sky-600">View more...</button>
            </div>

            <!-- Right content -->
            <?php include("sidebar.php"); ?>
        </div>

        <!-- S Footer -->
        <?php include("footer.php"); ?>
        <!-- E Footer -->
    </div>
    <!-- E Main Content -->

    <script src="https://unpkg.com/flowbite@1.5.5/dist/flowbite.js"></script>

</body>
</html>