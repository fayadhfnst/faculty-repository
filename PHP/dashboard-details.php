<?php
    require "../Koneksi/koneksi.php";

    // $previous_url = $_SERVER['HTTP_REFERER'];
    // $_SESSION['previous_url'] = $previous_url;

    if(strlen($_SESSION['email'] == 0)){
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }
    if($_SESSION['tipe_akun'] == 'admin'){
        
    }else{
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
    <link href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" rel=" stylesheet">
	<!--Replace with your tailwind.css once created-->


	<!--Regular Datatables CSS-->
	<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
	<!--Responsive Extension Datatables CSS-->
	<link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" rel="stylesheet">

</head>
<body>
    <!-- S NavBar -->
    <?php include("navbar.php") ?>
    <!-- E NavBar -->

    <!-- S Current Opened Window -->
    <div class="w-full h-16 flex justify-start items-center bg-[#969696] px-6 md:px-24">
        <div class="w-full flex justify-between items-center font-semibold">
            <div>
                <a href="" class="hidden lg:flex items-center mr-6">
                    <p class="ml-2">Dashboard</p>
                </a>
            </div>
            <div class="flex items-center">
                <div class="mr-2">
                    <!-- Dropdown bell -->
                    <button id="dropdownUserAvatarButton" data-dropdown-toggle="dropdownAvatar" class="text-black hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-green-600 font-medium rounded-full text-sm px-4 py-2.5 text-center inline-flex items-center" type="button">
                        <i class="fas fa-bell"></i>
                    </button>

                    <!-- Dropdown menu -->
                    <div id="dropdownAvatar" class="hidden z-10 w-44 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                        <ul class="py-1 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownUserAvatarButton">
                            <li>
                                <a href="#" class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Dashboard</a>
                            </li>
                            <li>
                                <a href="#" class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Settings</a>
                            </li>
                            <li>
                                <a href="#" class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Earnings</a>
                            </li>
                        </ul>
                    </div>

                </div>

                <?php 
                    $sql = "SELECT * FROM akun WHERE email = '{$_SESSION['email']}'";
                    $query = mysqli_query($con,$sql);
                    $row = mysqli_fetch_array($query);    
                ?>
                <div class="ml-2">
                    <!-- Dropdown button -->
                <button id="dropdownInformationButton" data-dropdown-toggle="dropdownInformation" class="min-w-34 text-black hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-green-600 font-medium rounded-full text-sm px-4 py-2.5 text-center inline-flex items-center" type="button">
                    <?=$row['nama_lengkap']?><svg class="ml-2 w-4 h-4" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg></button>

                <!-- Dropdown menu -->
                <div id="dropdownInformation" class="hidden z-10 w-44 bg-white rounded divide-y divide-gray-100 shadow">
                    <div class="py-3 px-4 text-sm text-[#006633]">
                        <h5><?=$row['nama_lengkap']?></h5>
                    </div>
                    <ul class="py-1 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownInformationButton">
                        <li>
                            <a href="#" class="block py-2 px-4 hover:bg-gray-100"></a>
                        </li>
                        <li>
                            <a href="#" class="block py-2 px-4 hover:bg-gray-100"></a>
                        </li>
                        <li>
                            <a href="#" class="block py-2 px-4 hover:bg-gray-100"></a>
                        </li>
                    </ul>
                    <div class="py-1">
                        <a href="#" class="block py-2 px-4 text-sm text-red-500 hover:bg-gray-100">Sign out</a>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
    <!-- E Current Opened Window -->
    <?php 
        $sql1 = "SHOW TABLES FROM repo_fasilkom";
        $query1 = mysqli_query($con,$sql1);
        $row1 = mysqli_fetch_array($query1);    
    ?>
    <!-- S Main Content -->
    <div class="w-full flex">
        <!-- Sidebar -->
        <div class="min-h-full">
            <div class="h-full overflow-y-auto py-4 px-2 bg-[#757575]">
                <ul class="space-y-2">
                    <li>
                        <a href="dashboard.php" class="flex items-center p-2 text-base font-normal rounded-lg text-black hover:bg-gray-200 hover:ring-4 hover:outline-none hover:ring-green-600">
                            <span class="ml-3">Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <button type="button" class="flex items-center p-2 w-full text-base font-normal rounded-lg group transition duration-75 hover:bg-gray-200 hover:ring-4 hover:outline-none hover:ring-green-600" aria-controls="dropdown-example" data-collapse-toggle="dropdown-example">
                            <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item>Tabel</span>
                            <svg sidebar-toggle-item class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                        </button>
                        <ul id="dropdown-example" class="hidden py-2 space-y-2">
                        <?php
                        while($row1 = mysqli_fetch_array($query1)){
                        ?>
                            <li>
                                <a href="dashboard-details.php?nama_tabel=<?=$row1['Tables_in_repo_fasilkom']?>" class="flex items-center p-2 pl-11 w-full text-base font-normal hover:bg-gray-200 hover:ring-4 hover:outline-none hover:ring-green-600 text-gray-900 rounded-lg transition duration-75 group"><?=$row1['Tables_in_repo_fasilkom']?></a>
                            </li>
                        <?php } ?>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
 

        <!-- Dashboard -->
        <div class="w-full">
            <div class="w-full flex flex-col py-6 px-6">
                <!-- "Dashboard" -->
                <?php 
                    $nama_tabel = $_GET['nama_tabel'];
                    $sql2 = "SHOW COLUMNS FROM $nama_tabel";
                    $query2 = mysqli_query($con,$sql2);
                    // $row2 = mysqli_fetch_array($query2)
                ?>
                <div class="w-full flex flex-col py-2 px-2 space-y-2">
                    <h2 class="font-bold text-lg"><?=$nama_tabel?></h2>
                    <a href="dashboard-add.php?nama_tabel=<?=$nama_tabel?>"
                        class="w-fit bg-green-500 hover:bg-green-600 text-white font-semibold p-2 rounded">Add</a>
                </div>

            <!--Card-->
            <div id='recipients' class="p-8 mt-6 lg:mt-0 rounded shadow bg-white">
                <table id="example" class="stripe hover" style="width:100%; padding-top: 1em;  padding-bottom: 1em;">
                    <thead>
                        <tr>
                            <?php
                                $a=array();
                                while($row2 = mysqli_fetch_array($query2)){
                                    if($row2['Field'] == 'password'){continue;}
                                    array_push($a,$row2['Field']);
                            ?>
                            <th><?=$row2['Field']?></th>
                            <?php } ?>
                            <?php 
                                $pattern = '/log/i';
                                $pattern1 = '/view/i';
                                if(!preg_match($pattern,$nama_tabel)){
                                    if(!preg_match($pattern1,$nama_tabel)){
                            ?>    
                            <th>Aksi</th>
                            <?php }} ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            $nama_tabel = $_GET['nama_tabel'];
                            $sql3 = "SELECT * FROM $nama_tabel";
                            $query3 = mysqli_query($con,$sql3);
                            // $row2 = mysqli_fetch_array($query2)
                            $count = count($a);
                            // print_r($a);
                        ?>
                        <?php 
                            while($row3 = mysqli_fetch_array($query3)){
                                
                        ?>
                        <tr>
                        <?php for($i = 0;$i < $count; $i++){
                            if($a[$i] == 'password'){
                                continue;
                            }
                        ?>
                            <td><?=$row3[$a[$i]]?></td>
                        <?php } ?>  
                        <?php 
                            if(!preg_match($pattern,$nama_tabel)){
                                if(!preg_match($pattern1,$nama_tabel)){
                        ?>
                        <td class="text-center">
                            <?php
                                if($nama_tabel == 'akun'){
                            ?>
                                <a class="bg-blue-500 hover:bg-blue-700 text-white font-semibold p-2 rounded" href="dashboard-edit.php?email=<?=$row3['email']?>&nama_tabel=<?=$nama_tabel?>">Edit</a>
                                <a class="bg-red-500 hover:bg-red-700 text-white font-semibold p-2 rounded" href="dashboard-delete.php?email=<?=$row3['email']?>&nama_tabel=<?=$nama_tabel?>" onclick="return confirm('Apakah anda yakin ingin menghapus data?')">Delete</a>
                            <?php }elseif($nama_tabel == 'dosen_pembimbing'){ ?>
                                <a class="bg-blue-500 hover:bg-blue-700 text-white font-semibold p-2 rounded" href="dashboard-edit.php?nip=<?=$row3['nip']?>&nama_tabel=<?=$nama_tabel?>">Edit</a>
                                <a class="bg-red-500 hover:bg-red-700 text-white font-semibold p-2 rounded" href="dashboard-delete.php?nip=<?=$row3['nip']?>&nama_tabel=<?=$nama_tabel?>" onclick="return confirm('Apakah anda yakin ingin menghapus data?')">Delete</a>
                            <?php }elseif($nama_tabel == 'mahasiswa'){ ?>
                                <a class="bg-blue-500 hover:bg-blue-700 text-white font-semibold p-2 rounded" href="dashboard-edit.php?nim=<?=$row3['nim']?>&nama_tabel=<?=$nama_tabel?>">Edit</a>
                                <a class="bg-red-500 hover:bg-red-700 text-white font-semibold p-2 rounded" href="dashboard-delete.php?nim=<?=$row3['nim']?>&nama_tabel=<?=$nama_tabel?>" onclick="return confirm('Apakah anda yakin ingin menghapus data?')">Delete</a>    
                            <?php }elseif($nama_tabel == 'balasan_surat'){ ?>
                                <a class="bg-blue-500 hover:bg-blue-700 text-white font-semibold p-2 rounded" href="dashboard-edit.php?id_surat=<?=$row3['id_surat']?>&nama_tabel=<?=$nama_tabel?>">Edit</a>
                                <a class="bg-red-500 hover:bg-red-700 text-white font-semibold p-2 rounded" href="dashboard-delete.php?id_surat=<?=$row3['id_surat']?>&nama_tabel=<?=$nama_tabel?>" onclick="return confirm('Apakah anda yakin ingin menghapus data?')">Delete</a>
                            <?php }else{ ?>
                                <a class="bg-blue-500 hover:bg-blue-700 text-white font-semibold p-2 rounded" href="dashboard-edit.php?id=<?=$row3['id']?>&nama_tabel=<?=$nama_tabel?>">Edit</a>
                                <a class="bg-red-500 hover:bg-red-700 text-white font-semibold p-2 rounded" href="dashboard-delete.php?id=<?=$row3['id']?>&nama_tabel=<?=$nama_tabel?>" onclick="return confirm('Apakah anda yakin ingin menghapus data?')">Delete</a>
                            </td>  
                        <?php } ?>
                        </tr>
                        <?php }}} ?>
                    </tbody>
                </table>
            </div>
            <!--/Card-->

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
            
        </div>
        
    </div>

    <!-- E Main Content -->

    <script src="https://unpkg.com/flowbite@1.5.5/dist/flowbite.js"></script>
    <!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!--Datatables -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script>
    $(document).ready(function() {

        var table = $('#example').DataTable({
                responsive: true
            })
            .columns.adjust()
            .responsive.recalc();
    });
</script>
</body>
</html>