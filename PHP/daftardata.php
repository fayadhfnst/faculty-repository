<?php
    require '../Koneksi/koneksi.php';

    if(strlen($_SESSION['email'] == 0)){
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }
    
    if($_SESSION['tipe_akun'] == 'mahasiswa' || $_SESSION['tipe_akun'] == 'dosen'){
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
        $sql1 = "SHOW TABLES FROM repo_fasilkom WHERE Tables_in_repo_fasilkom LIKE 'view%'";
        $query1 = mysqli_query($con,$sql1);
    ?>

    <!-- S Main Content -->
    <div class="w-full min-h-screen">
        <!-- Letters-->
        <form action="" method="get">
        <div class="w-full">
            <div class="w-full py-6 px-8">
                <div class="w-full max-h-20 px-4 py-4 mb-8">
                    <h1 class="my-2">Pilih Tabel</h1>
                    <select name="nama_tabel" id="letters" class="max-w-fit h-10 my-4 rounded-md shadow-md px-4 bg-gray-200 focus:border-2 border-green-700 focus:outline-green-700 focus:bg-white">
                        <?php while($row1 = mysqli_fetch_array($query1)){
                            if($row1['Tables_in_repo_fasilkom'] == $_GET['nama_tabel']){    
                        ?>
                            <option value="<?=$row1['Tables_in_repo_fasilkom']?>" selected><?=$row1['Tables_in_repo_fasilkom']?></option>    
                        <?php }else{ ?>
                            <option value="<?=$row1['Tables_in_repo_fasilkom']?>"><?=$row1['Tables_in_repo_fasilkom']?></option>    
                        <?php }} ?>
                    </select>
                    <button class="max-w-fit h-10 px-4 rounded-md shadow-md bg-[#006633] hover:bg-green-700 text-white" type="submit" id="pilih1">Pilih</button>
                </div>
                <?php if(isset($_GET['nama_tabel'])){
                            $sql5 = "SHOW COLUMNS FROM {$_GET['nama_tabel']}";
                            $query5 = mysqli_query($con,$sql5);
                            $num_row = mysqli_num_rows($query5);
                ?>
                <div class="w-full max-h-20 px-4 py-4 mb-8">
                    <h1 class="my-2">Kolom :</h1>
                    <?php while($row5 = mysqli_fetch_array($query5)){ ?>
                        <input type="checkbox" value="<?=$row5['Field']?>" name="kolom[]"> <?=$row5['Field']?>
                    <?php } ?> 
                    <button class="max-w-fit h-10 px-4 rounded-md shadow-md bg-[#006633] hover:bg-green-700 text-white" type="submit" id="pilih2" >Pilih</button>
                </div>
                <?php } ?>
            </div>
        </form>
                
        <?php 
            if(isset($_GET['nama_tabel']) && isset($_GET['kolom'])){
                $nama_tabel = $_GET['nama_tabel'];
                $kolom = $_GET['kolom'];
                // $sql2 = "SHOW COLUMNS FROM $nama_tabel";
                // $query2 = mysqli_query($con,$sql2);
        ?>
        <div class="w-full py-6 px-8 mt-4">
            <table class="w-full table-auto border-2 px-4">
                <thead class="border-2 bg-gray-300">
                    <tr>
                        <th>No</th>
                        <?php
                            // $a=array();
                            // while($row2 = mysqli_fetch_array($query2)){
                            //     array_push($a,$row2['Field']);}
                            $kols = "";
                            foreach($kolom as $kol){
                                $kols .= '`' . $kol . '`,';
                        ?>
                        <th><?=$kol?></th>
                        <?php } ?>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                        $kols = substr($kols,0,strlen($kols)-1);
                        // print_r($kols);
                        $x = 1;
                        $nama_tabel = $_GET['nama_tabel'];
                        $sql3 = "SELECT ". $kols ." FROM $nama_tabel";
                        $query3 = mysqli_query($con,$sql3);
                        // $row2 = mysqli_fetch_array($query2)
                        $count = count($kolom);
                        // print_r($a);
                        while($row3 = mysqli_fetch_array($query3)){
                    ?>
                    <tr>
                        <td class="h-10 px-2 border-2 text-center"><?=$x++?></td>
                    <?php for($i = 0;$i < $count; $i++){
                    ?>
                        <td class="h-10 px-2 border-2 text-center"><?=$row3[$kolom[$i]]?></td>
                    <?php } ?>  
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
        <form class="w-full flex justify-end px-8 py-6" action="report.php" method="get">
            <?php 
                $counter = count($kolom);
                for($i = 0; $i < $counter;$i++){
            ?>
                <input type="checkbox" value="<?=$kolom[$i]?>" name="kolom[]" checked hidden>
            <?php } ?>
            <input type="text" value="<?=$_GET['nama_tabel']?>" name="tabel" hidden>
            <button class="max-w-fit h-10 px-4 rounded-md shadow-md bg-[#006633] hover:bg-green-700 text-white" name="print" type="submit">Print</button>
        </form>
        <?php } ?>



        <!-- S Footer -->
        <div class="w-full mt-6 border-t-2 border-gray-500">
            <p class="mt-6 py-6 px-8">
                Repositori FASILKOM-TI Universitas Sumatera Utara
                <br>
                &copy;ENNIFA, 2022
            </p>
        </div>
        <!-- E Footer -->

    </div>
    <!-- E Main Content -->

    <script src="https://unpkg.com/flowbite@1.5.5/dist/flowbite.js"></script>
</body>
</html>