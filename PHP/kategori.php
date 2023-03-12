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

            <!-- Departemen -->
            <a href="departemen.php?id_prodi=<?=$row['id']?>" class="flex items-center mx-6">
                <p>Departemen <?=$row['nama_prodi']?></p>
            </a>

            <span class="hidden lg:flex">/</span>

            <!-- Kategori -->
            <?php 
                $id_kategori = $_GET['id_kategori'];
                $sql1 = "SELECT * FROM kategori_repo WHERE id = $id_kategori";
                $query1 = mysqli_query($con,$sql1);
                $row1 = mysqli_fetch_array($query1);
            ?>

            <a href="" class="flex items-center mx-6">
                <p><?=$row1['nama_kategori']?></p>
            </a>
        </div>
    </div>
    <!-- E Current Opened Window -->

    <!-- S Main Content -->
    <div class="w-full h-screen px-4 py-8 md:px-24 md:py-8">
        <div class="flex mb-20">
            <!-- Left content -->
            <div class="lg:w-3/4 lg:pr-24">
                <!-- Skripsi sarjana -->
                <h4 class="font-bold border-b-2 border-gray-500"><?=strtoupper($row1['nama_kategori'])?></h4>
                
                <?php 
                    if($id_kategori == 4 || $id_kategori == 8){
                        $sql2 = "SELECT * FROM penelitian_dosen WHERE id_prodi = $id_prodi and id_kategori_repo = $id_kategori ORDER BY tgl_upload DESC";
                    }else{
                        $sql2 = "SELECT * FROM tugas_akhir WHERE id_prodi = $id_prodi and id_kategori_repo = $id_kategori ORDER BY tgl_upload DESC";
                    }
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
                        <?php if($id_kategori == 4 || $id_kategori == 8){?>
                        <h5 class="font-bold text-[#006633]"><a href="viewberkas.php?id_prodi=<?=$row['id']?>&id_penelitian=<?=$row2['id']?>"><?= $row2['judul'] ?></a></h5>
                        <?php }else{ ?>
                        <h5 class="font-bold text-[#006633]"><a href="viewberkas.php?id_prodi=<?=$row['id']?>&id_tugasakhir=<?=$row2['id']?>"><?= $row2['judul'] ?></a></h5>
                        <?php } ?>
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