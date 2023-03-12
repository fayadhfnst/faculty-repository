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
            <a href="" class="hidden lg:flex items-center mr-6">
                <span class="text-lg"><i class="fas fa-home"></i></span>
                <p class="ml-2">Home</p>
            </a>

            <span class="hidden lg:flex">/</span>

            <!-- Departemen Ilmu Komputer -->
            <!-- Hidden when under laptop display -->
            <a href="" class="hidden lg:flex items-center mx-6">
                <p>Search</p>
            </a>
        </div>
    </div>
    <!-- E Current Opened Window -->

    <!-- S Main Content -->
    <div class="w-full px-4 py-8 md:px-24 md:py-8">
        <div class="flex mb-20">
            <!-- Left content -->
            <div class="lg:w-3/4 lg:pr-24">
                <!-- Search -->
                <h4 class="font-bold border-b-2 border-gray-500">Search</h4>

                <!-- Search input -->
                <div class="w-full my-4 relative">
                    <p>Repositori</p>
                    <!-- Search -->
                    <form action="" method="get" role="search">
                    <div class="w-full my-4 flex flex-col lg:flex-row justify-center items-center">
                        <!-- Select major -->
                        <div class="w-full lg:w-2/6 h-10 mb-2 lg:mb-0 lg:px-4">
                            <select class="w-full h-full px-2 border-2 focus:border-green-700 bg-gray-200 focus:bg-white rounded-md shadow-md" name="faculties" id="faculties">
                                <option value="" disabled>---Skripsi---</option>
                                <?php 
                                    if($_GET['faculties'] == 3){
                                ?>
                                    <option value="3" selected="selected">Semua</option>
                                <?php }else{ ?>
                                    <option value="3">Semua</option>
                                <?php } ?>
                                <?php 
                                    if($_GET['faculties'] == 2){
                                ?>
                                    <option value="2" selected="selected">Teknologi Informasi</option>
                                <?php }else{ ?>
                                    <option value="2">Teknologi Informasi</option>
                                <?php } ?>
                                <?php 
                                    if($_GET['faculties'] == 1){
                                ?>
                                    <option value="1" selected="selected">Ilmu Komputer</option>
                                <?php }else{ ?>
                                    <option value="1">Ilmu Komputer</option>
                                <?php } ?>
                                <option value="" disabled>---Others---</option>
                                <?php 
                                    if($_GET['faculties'] == "Penelitian"){
                                ?>
                                    <option value="Penelitian" selected = "selected">Penelitian</option>
                                <?php }else{ ?>
                                    <option value="Penelitian">Penelitian</option>
                                <?php } ?>
                                <?php 
                                    if($_GET['faculties'] == "ebook"){
                                ?>
                                    <option value="ebook" selected = "selected">Ebook</option>
                                <?php }else{ ?>
                                    <option value="ebook">Ebook</option>
                                <?php } ?>
                            </select>
                        </div>

                        <!-- Search input -->
                            <div class="w-full lg:w-4/6 h-10 mt-2 lg:mt-0 flex justify-center items-center px-4 relative">
                            <?php
                                if(isset($_GET['search'])){
                            ?>    
                                <input type="text" class="w-full h-full absolute bg-gray-200 focus:outline-green-700 focus:bg-white p-4 rounded-md shadow-md" name="search" id="search" placeholder="Search" value="<?=$_GET['search']?>">
                            <?php }else{ ?>
                                <input type="text" class="w-full h-full absolute bg-gray-200 focus:outline-green-700 focus:bg-white p-4 rounded-md shadow-md" name="search" id="search" placeholder="Search">
                            <?php } ?>
                                <button for="search" class="w-12 h-full bg-[#006633] text-white cursor-pointer flex justify-center items-center rounded-md absolute right-0">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                    </div>
                    </form>

                    <!-- Show filters -->
                    <!-- <div class="w-full h-10">
                        <a href="" class="text-[#006633] hover:text-sky-600 right-0 bottom-0 absolute">Show filters</a>
                    </div> -->
                </div>
                
                <?php
                    if(isset($_GET['search'])){
                        if(isset($_GET['faculties'])){
                            if($_GET['faculties'] == 1 || $_GET['faculties'] == 2){
                                $sql = "SELECT id, judul, abstract, MATCH (judul,abstract) AGAINST ('{$_GET['search']}' IN NATURAL LANGUAGE MODE) AS score FROM tugas_akhir WHERE MATCH (judul,abstract) AGAINST ('{$_GET['search']}' IN NATURAL LANGUAGE MODE) > 0 and id_prodi = {$_GET['faculties']} ORDER BY score DESC LIMIT 3";
                                $num_row = mysqli_num_rows(mysqli_query($con,$sql));
                                if($num_row == 0){
                                    $sql = "SELECT * FROM tugas_akhir WHERE (judul REGEXP '^{$_GET['search']}' or abstract REGEXP '^{$_GET['search']}') and id_prodi = {$_GET['faculties']} ORDER BY tgl_upload DESC LIMIT 3";
                                    $num_row = mysqli_num_rows(mysqli_query($con,$sql));
                                    if($num_row == 0){
                                        $sql = "SELECT * FROM tugas_akhir WHERE (judul LIKE '%{$_GET['search']}%' or abstract LIKE '%{$_GET['search']}%') and id_prodi = {$_GET['faculties']} ORDER BY tgl_upload DESC LIMIT 3";
                                    }
                                }
                            }elseif($_GET['faculties'] == "Penelitian"){
                                $sql = "SELECT id,judul,abstract, MATCH (judul,abstract) AGAINST ('{$_GET['search']}' IN NATURAL LANGUAGE MODE) AS score FROM penelitian_dosen WHERE MATCH (judul,abstract) AGAINST ('{$_GET['search']}' IN NATURAL LANGUAGE MODE) > 0 ORDER BY score DESC LIMIT 3";
                                $num_row = mysqli_num_rows(mysqli_query($con,$sql));
                                if($num_row == 0){
                                    $sql = "SELECT * FROM penelitian_dosen WHERE judul REGEXP '^{$_GET['search']}' or abstract REGEXP '^{$_GET['search']}' ORDER BY tgl_upload DESC LIMIT 3";
                                    $num_row = mysqli_num_rows(mysqli_query($con,$sql));
                                    if($num_row == 0){
                                        $sql = "SELECT * FROM penelitian_dosen WHERE judul LIKE '%{$_GET['search']}%' or abstract LIKE '%{$_GET['search']}%' ORDER BY tgl_upload DESC LIMIT 3";
                                    }
                                }
                            }elseif($_GET['faculties'] == "ebook"){
                                $sql = "SELECT id,judul,abstract ,MATCH (judul,abstract) AGAINST ('{$_GET['search']}' IN NATURAL LANGUAGE MODE) AS score FROM ebook WHERE MATCH (judul,abstract) AGAINST ('{$_GET['search']}' IN NATURAL LANGUAGE MODE) > 0 ORDER BY score DESC LIMIT 3";
                                $num_row = mysqli_num_rows(mysqli_query($con,$sql));
                                if($num_row == 0){
                                    $sql = "SELECT * FROM ebook WHERE judul REGEXP '^{$_GET['search']}' or abstract REGEXP '^{$_GET['search']}' ORDER BY tgl_upload DESC LIMIT 3";
                                    $num_row = mysqli_num_rows(mysqli_query($con,$sql));
                                    if($num_row == 0){
                                        $sql = "SELECT * FROM ebook WHERE judul LIKE '%{$_GET['search']}%' or abstract LIKE '%{$_GET['search']}%' ORDER BY tgl_upload DESC LIMIT 3";
                                    }
                                }
                            }
                            else{
                                $sql = "SELECT id, judul, abstract, MATCH (judul,abstract) AGAINST ('{$_GET['search']}' IN NATURAL LANGUAGE MODE) AS score FROM tugas_akhir WHERE MATCH (judul,abstract) AGAINST ('{$_GET['search']}' IN NATURAL LANGUAGE MODE) > 0 ORDER BY score DESC LIMIT 3";
                                $num_row = mysqli_num_rows(mysqli_query($con,$sql));
                                if($num_row == 0){
                                    $sql = "SELECT * FROM tugas_akhir WHERE (judul REGEXP '^{$_GET['search']}' or abstract REGEXP '^{$_GET['search']}') ORDER BY tgl_upload DESC LIMIT 3";
                                    $num_row = mysqli_num_rows(mysqli_query($con,$sql));
                                    if($num_row == 0){
                                        $sql = "SELECT * FROM tugas_akhir WHERE judul LIKE '%{$_GET['search']}%' or abstract LIKE '%{$_GET['search']}%' ORDER BY tgl_upload DESC LIMIT 3";
                                    }
                                }
                            }}
                        else{
                            $sql = "SELECT id, judul, abstract, MATCH (judul,abstract) AGAINST ('{$_GET['search']}' IN NATURAL LANGUAGE MODE) AS score FROM tugas_akhir WHERE MATCH (judul,abstract) AGAINST ('{$_GET['search']}' IN NATURAL LANGUAGE MODE) > 0 ORDER BY score DESC LIMIT 3";
                                $num_row = mysqli_num_rows(mysqli_query($con,$sql));
                                if($num_row == 0){
                                    $sql = "SELECT * FROM tugas_akhir WHERE (judul REGEXP '^{$_GET['search']}' or abstract REGEXP '^{$_GET['search']}') ORDER BY tgl_upload DESC LIMIT 3";
                                    $num_row = mysqli_num_rows(mysqli_query($con,$sql));
                                    if($num_row == 0){
                                        $sql = "SELECT * FROM tugas_akhir WHERE judul LIKE '%{$_GET['search']}%' or abstract LIKE '%{$_GET['search']}%' ORDER BY tgl_upload DESC LIMIT 3";
                                    }
                                }
                        }
                    }else{
                        $sql = "SELECT * FROM tugas_akhir ORDER BY tgl_upload DESC LIMIT 3";
                    }

                    $query = mysqli_query($con,$sql);
                ?>

                <!-- Search result -->
                <div class="w-full my-4">
                    <!-- Berkas -->
                    <?php
                        while($row = mysqli_fetch_array($query)){
                    ?>
                    <div class="mb-5">
                        <a href="">
                            <h5 class="font-bold text-[#006633]"><a href=""><?=$row['judul']?></a></h5>
                            <p class="text-justify"><?=$row['abstract']?></p>
                        </a>
                    </div>
                    <?php } ?>
                    <!-- View more -->
                    <button class="font-bold text-[#006633] hover:text-sky-600">View more...</button>
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