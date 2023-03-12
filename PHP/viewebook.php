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

            <a href="ebook.php" class="flex items-center lg:mx-6">
                <p>Ebook</p>
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
                    $id_ebook = $_GET['id_ebook'];
                    $sql2 = "SELECT * FROM ebook WHERE id = '$id_ebook'";
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
                            <p><a href="file/uploadedfile/ebook/<?=$row2['file_url']?>" download="<?=$row2['file_url']?>"><?=$row2['file_url']?></a></p>
                        </div>
                        <div class="mt-6">
                            <h5 class="text-[#006633] font-semibold">Tanggal Terbit</h5>
                            <p><?=$row2['tgl_terbit']?></p>
                        </div>
                        <div class="mt-6">
                            <h5 class="text-[#006633] font-semibold">Penulis</h5>
                            <p><?=$row2['penulis']?></p>
                        </div>
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