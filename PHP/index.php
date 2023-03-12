<?php
    require "../Koneksi/koneksi.php";

    // $previous_url = $_SERVER['HTTP_REFERER'];
    // $_SESSION['previous_url'] = $previous_url;
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
            <a href="index.php" class="flex items-center">
                <span class="text-lg"><i class="fas fa-home"></i></span>
                <p class="ml-2">Home</p>
            </a>
        </div>
    </div>
    <!-- E Current Opened Window -->

    <?php
        $sql = "SELECT * FROM prodi";
        $query = mysqli_query($con,$sql);

        $sql2 = "SELECT COUNT(judul) AS jlh_judul FROM ebook";
        $query2 = mysqli_query($con,$sql2);
        $row2 = mysqli_fetch_array($query2);
    ?>

    <!-- S Main Content -->
    <div class="w-full h-screen px-4 py-8 md:px-24 md:py-8">
        <div class="flex mb-20">
            <!-- Left content -->
            <div class="lg:w-3/4 lg:pr-24">
                <!-- Program studi -->
                <div class="flex flex-col mb-5">
                    <h4 class="font-bold mb-3">PROGRAM STUDI</h4>
                    <ul>
                        <?php
                            while($row = mysqli_fetch_array($query)){
                                $sql3 = "SELECT jlh_judul_prodi({$row['id']}) AS jlh_judul FROM prodi WHERE id = {$row['id']}";
                                $query3 = mysqli_query($con,$sql3);
                                $row3 = mysqli_fetch_array($query3);
                        ?>
                        <li>
                            <a href="departemen.php?id_prodi=<?=$row['id']?>" class="text-[#006633] font-semibold hover:text-sky-600">Departemen <?= $row['nama_prodi'] ?> [<?=$row3['jlh_judul']?>]</a>
                        </li>
                        <?php } ?>
                        <li>
                            <a href="ebook.php" class="text-[#006633] font-semibold hover:text-sky-600">E-Book [<?=$row2['jlh_judul']?>]</a>
                        </li>
                    </ul>
                </div>

                <?php
                    $sql1 = "SELECT * FROM tugas_akhir ORDER BY tgl_upload DESC LIMIT 4";
                    $query1 = mysqli_query($con,$sql1);
                ?>

                <!-- Pengajuan terbaru -->
                <div>
                    <h4 class="font-bold mb-2">PENGAJUAN TERBARU</h4>
                    <!-- Berkas -->
                    <?php
                        while($row1 = mysqli_fetch_array($query1)){
                    ?>
                    <div class="mb-5">
                        <h5 class="font-bold text-[#006633]"><a href="viewberkas.php?id_prodi=<?=$row1['id_prodi']?>&id_tugasakhir=<?=$row1['id']?>"><?=$row1['judul']?></a></h5>
                        <p class="text-justify"><?=$row1['abstract']?></p>
                    </div>
                    <?php } ?>
                </div>
                <button class="font-bold text-[#006633] hover:text-sky-600">View more...</button>
            </div>

            <!-- Right content -->
            <?php include("sidebar.php") ?>
        </div>

        <!-- S Footer -->
        <?php include("footer.php"); ?>
        <!-- E Footer -->
    </div>
    <!-- E Main Content -->


    <script src="https://unpkg.com/flowbite@1.5.5/dist/flowbite.js"></script>
</body>
</html>