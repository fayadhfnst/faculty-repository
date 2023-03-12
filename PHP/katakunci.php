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
                

 
                <!-- List kata kunci -->

                <div>
                    <ul class="space-y-4 text-green-700">
                        <?php
                        if(isset($_GET['keyword'])){
                            if($_GET['keyword'] == 'keyword'){
                            if(isset($_GET['id_prodi'])){
                                if(isset($_GET['id_keyword'])){
                                    $sql1 = "SELECT * FROM tugas_akhir WHERE id_keyword = '{$_GET['id_keyword']}'";
                                    $query1 = mysqli_query($con,$sql1);
                                    while($row1 = mysqli_fetch_array($query1)){
                        ?>
                        <li>
                            <a href="viewberkas.php?keyword=<?=$_GET['keyword']?>&id_prodi=<?=$row1['id_prodi']?>&id_tugasakhir=<?=$row1['id']?>" class="hover:text-sky-700 p-2"><?=$row1['judul']?></a>
                        </li>
                        <?php }}else{
                            $sql2 = "SELECT id,nama_keyword,id_prodi, jlh_judul_keyword(keyword.id) AS jlh_judul FROM keyword WHERE id_prodi = '{$_GET['id_prodi']}'";    
                            $query2 = mysqli_query($con,$sql2);
                            while($row2 = mysqli_fetch_array($query2)){
                        ?>
                        <li>
                            <a href="katakunci.php?keyword=<?=$_GET['keyword']?>&id_prodi=<?=$row2['id_prodi']?>&id_keyword=<?=$row2['id']?>" class="hover:text-sky-700 p-2"><?=$row2['nama_keyword']?> (<?=$row2['jlh_judul']?>)</a>
                        </li>
                            <?php } ?>
                            <?php }}else{
                                $sql3 = "SELECT id,nama_keyword,id_prodi, jlh_judul_keyword(keyword.id) AS jlh_judul FROM keyword";
                                $query3 = mysqli_query($con,$sql3);
                                while($row3 = mysqli_fetch_array($query3)){    
                            ?>
                        <li>
                            <a href="katakunci.php?keyword=<?=$_GET['keyword']?>&id_prodi=<?=$row3['id_prodi']?>&id_keyword=<?=$row3['id']?>" class="hover:text-sky-700 p-2"><?=$row3['nama_keyword']?> (<?=$row3['jlh_judul']?>)</a>
                        </li> 
                            <?php }}}elseif($_GET['keyword'] == 'judul'){
                                if(isset($_GET['id_prodi'])){
                                        $sql1 = "SELECT * FROM tugas_akhir WHERE id_prodi = '{$_GET['id_prodi']}' ORDER BY judul";
                                        $query1 = mysqli_query($con,$sql1);
                                        while($row1 = mysqli_fetch_array($query1)){
                            ?>
                        <li>
                            <a href="viewberkas.php?id_prodi=<?=$row1['id_prodi']?>&id_tugasakhir=<?=$row1['id']?>" class="hover:text-sky-700 p-2"><?=$row1['judul']?></a>
                        </li>
                            <?php }}else{
                                $sql1 = "SELECT * FROM tugas_akhir ORDER BY judul";
                                $query1 = mysqli_query($con,$sql1);
                                while($row1 = mysqli_fetch_array($query1)){
                            ?>
                        <li>
                            <a href="viewberkas.php?id_prodi=<?=$row1['id_prodi']?>&id_tugasakhir=<?=$row1['id']?>" class="hover:text-sky-700 p-2"><?=$row1['judul']?></a>
                        </li>
                            <?php }}}else{
                                if(isset($_GET['id_prodi'])){
                                    if(isset($_GET['id_kategori_repo'])){
                                        if($_GET['id_kategori_repo'] == 4 || $_GET['id_kategori_repo'] == 8){
                                            $sql1 = "SELECT * FROM penelitian_dosen WHERE id_kategori_repo = '{$_GET['id_kategori_repo']}'";
                                        }else{
                                            $sql1 = "SELECT * FROM tugas_akhir WHERE id_kategori_repo = '{$_GET['id_kategori_repo']}'";
                                        }
                                        $query1 = mysqli_query($con,$sql1);
                                        while($row1 = mysqli_fetch_array($query1)){
                            ?>
                        <li>
                            <a href="viewberkas.php?id_prodi=<?=$row1['id_prodi']?>&id_penelitian=<?=$row1['id']?>" class="hover:text-sky-700 p-2"><?=$row1['judul']?></a>
                        </li>
                            <?php }}else{
                                $sql1 = "SELECT id,nama_kategori,id_prodi, if(kategori_repo.id = 4 or kategori_repo.id = 8, 
                                jlh_judul_penelitian(kategori_repo.id),
                                jlh_judul_kategori_repo(kategori_repo.id)
                                ) AS jlh_judul FROM kategori_repo WHERE id_prodi = '{$_GET['id_prodi']}'";
                                $query1 = mysqli_query($con,$sql1);
                                while($row1 = mysqli_fetch_array($query1)){
                            ?>
                        <li>
                            <a href="katakunci.php?keyword=<?=$_GET['keyword']?>&id_prodi=<?=$row1['id_prodi']?>&id_kategori_repo=<?=$row1['id']?>" class="hover:text-sky-700 p-2"><?=$row1['nama_kategori']?> <?=($row1['id_prodi'] == 1) ? 'Ilmu Komputer' : 'Teknologi Informasi'?> (<?=$row1['jlh_judul']?>)</a>
                        </li>
                            <?php }}}else{
                                $sql1 = "SELECT id,nama_kategori,id_prodi, if(kategori_repo.id = 4 or kategori_repo.id = 8, 
                                        jlh_judul_penelitian(kategori_repo.id),
                                        jlh_judul_kategori_repo(kategori_repo.id)
                                ) AS jlh_judul FROM kategori_repo";
                                $query1 = mysqli_query($con,$sql1);
                                while($row1 = mysqli_fetch_array($query1)){
                            ?>
                        <li>
                            <a href="katakunci.php?keyword=<?=$_GET['keyword']?>&id_prodi=<?=$row1['id_prodi']?>&id_kategori_repo=<?=$row1['id']?>" class="hover:text-sky-700 p-2"><?=$row1['nama_kategori']?> <?=($row1['id_prodi'] == 1) ? 'Ilmu Komputer' : 'Teknologi Informasi'?> (<?=$row1['jlh_judul']?>)</a>
                        </li>
                            <?php }}}} ?>
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