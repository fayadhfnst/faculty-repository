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

            <a href="departemen.php?id_prodi=<?=$row['id']?>" class="flex items-center mx-6">
                <p>Departemen <?=$row['nama_prodi']?></p>
            </a>

            <span class="hidden lg:flex">/</span>

            <!-- Kategori -->
            <?php 
                if(isset($_GET['id_tugasakhir'])){
                    $id_tugasakhir = $_GET['id_tugasakhir'];
                    $sql1 = "SELECT * FROM kategori_repo WHERE id = (SELECT id_kategori_repo FROM tugas_akhir WHERE id = $id_tugasakhir)";
                }elseif(isset($_GET['id_penelitian'])){
                    $id_penelitian = $_GET['id_penelitian'];
                    $sql1 = "SELECT * FROM kategori_repo WHERE id = (SELECT id_kategori_repo FROM penelitian_dosen WHERE id = $id_penelitian)";
                }
                $query1 = mysqli_query($con,$sql1);
                $row1 = mysqli_fetch_array($query1);
            ?>

            <a href="kategori.php?id_prodi=<?=$row['id']?>&id_kategori=<?=$row1['id']?>" class="flex items-center mx-6">
                <p><?=$row1['nama_kategori']?></p>
            </a>

            <span class="hidden lg:flex">/</span>

            <!-- View item -->
            <a href="" class="flex items-center lg:mx-6">
                <p>View item</p>
            </a>
        </div>
    </div>
    <!-- E Current Opened Window -->

    <!-- S Main Content -->
    <div class="w-full px-4 py-8 md:px-24 md:py-8">
        <div class="flex mb-20">
            <!-- Left content -->
            <div class="lg:w-3/4 lg:pr-24">
                <!-- Judul -->
                <?php 
                    if(isset($_GET['id_tugasakhir'])){
                        $sql2 = "SELECT (SELECT nama FROM mahasiswa WHERE nim = tugas_akhir.nim_mhs) as nama_mhs, (SELECT nama_lengkap FROM dosen_pembimbing WHERE nip = tugas_akhir.nip_dosen_pembimbing1) as nama_dosping1, (SELECT nama_lengkap FROM dosen_pembimbing WHERE nip = tugas_akhir.nip_dosen_pembimbing2) as nama_dosping2, (SELECT nama_lengkap FROM dosen_pembimbing WHERE nip = tugas_akhir.nip_dosen_penguji1) as dosen_penguji1,(SELECT nama_lengkap FROM dosen_pembimbing WHERE nip = tugas_akhir.nip_dosen_penguji2) as dosen_penguji2, judul, file_link, tgl_pengesahan, abstract FROM `tugas_akhir` WHERE id = $id_tugasakhir;";
                    }elseif(isset($_GET['id_penelitian'])){
                        $sql2 = "SELECT * FROM penelitian_dosen WHERE id = '$id_penelitian'";
                    }
                    $query2 = mysqli_query($con,$sql2);
                    $row2 = mysqli_fetch_array($query2);
                ?>
                <h4 class="font-bold border-b-2 border-gray-500"><?=$row2['judul']?></h4>

                <!-- Berkas -->
                <div class="w-full flex my-14">
                    <!-- View -->
                    <div class="w-1/3 hidden lg:flex flex-col lg:pr-6">
                        <div>
                            <h5 class="text-[#006633] font-semibold">View</h5>
                            <?php if(isset($_GET['id_tugasakhir'])){ ?>
                            <p><a href="file/uploadedfile/tugas_akhir/<?=$row2['file_link']?>" download="<?=$row2['file_link']?>"><?=$row2['file_link']?></a></p>
                            <?php }elseif(isset($_GET['id_penelitian'])){ ?>
                            <p><a href="file/uploadedfile/penelitian_dosen/<?=$row2['file_url']?>" download="<?=$row2['file_url']?>"><?=$row2['file_url']?></a></p>
                            <?php } ?>
                        </div>
                        <div class="mt-6">
                            <?php if(isset($_GET['id_tugasakhir'])){ ?>
                            <h5 class="text-[#006633] font-semibold">Tanggal Sidang</h5>
                            <p><?=$row2['tgl_pengesahan']?></p>
                            <?php }elseif(isset($_GET['id_penelitian'])){ ?>
                            <h5 class="text-[#006633] font-semibold">Tanggal Upload</h5>
                            <p><?=$row2['tgl_upload']?></p>
                            <?php } ?>
                        </div>
                        <?php if(isset($_GET['id_tugasakhir'])){ ?>
                        <div class="mt-6">
                            <h5 class="text-[#006633] font-semibold">Penulis</h5>
                            <p><?=$row2['nama_mhs']?></p>
                        </div>
                        <div class="mt-6">
                            <h5 class="text-[#006633] font-semibold">Pembimbing</h5>
                            <p><?=$row2['nama_dosping1']?></p>
                            <p><?=$row2['nama_dosping2']?></p>
                        </div>
                        <div class="mt-6">
                            <h5 class="text-[#006633] font-semibold">Penguji</h5>
                            <p><?=$row2['dosen_penguji1']?></p>
                            <p><?=$row2['dosen_penguji2']?></p>
                        </div>
                        <?php }elseif(isset($_GET['id_penelitian'])){ ?>
                            <div class="mt-6">
                            <h5 class="text-[#006633] font-semibold">Nama Anggota</h5>
                            <p><?=$row2['nama_anggota']?></p>
                        </div>
                        <?php } ?>    
                    </div>

                    <!-- Abstract -->
                    <div class="w-full lg:w-2/3 flex flex-col lg:pl-6 text-justify">
                        <div>
                            <h5 class="text-[#006633] font-semibold">Abstract</h5>
                            <p><?=$row2['abstract']?></p>
                        </div>
                    </div>
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

    <script src="https://unpkg.com/flowbite@1.5.5/dist/flowbite.js"></script>

</body>
</html>