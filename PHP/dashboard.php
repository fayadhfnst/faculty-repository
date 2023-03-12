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
                            <a href="#" class="block py-2 px-4 hover:bg-gray-100">Mending Ganyu</a>
                        </li>
                        <li>
                            <a href="#" class="block py-2 px-4 hover:bg-gray-100">Mending Ayaka</a>
                        </li>
                        <li>
                            <a href="#" class="block py-2 px-4 hover:bg-gray-100">Mending Turu</a>
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
                    <li>
                        <a href="dashboard-role.php" class="flex items-center p-2 text-base font-normal rounded-lg text-black hover:bg-gray-200 hover:ring-4 hover:outline-none hover:ring-green-600">
                            <span class="ml-3">Role</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
 

        <!-- Dashboard -->
        <div class="w-full">
            <div class="w-full flex flex-col py-6 px-6">
                <!-- "Dashboard" -->
                <div class="w-full py-2 px-2">
                    <h2 class="font-bold text-lg">Dashboard</h2>
                </div>

                <?php 

                    $sql2 = "SHOW TABLES FROM repo_fasilkom";
                    $query2 = mysqli_query($con,$sql2);
                    $row2 = mysqli_fetch_array($query2);    
                ?>

                <!-- Dashboard card -->
                <div class="w-full py-2 mt-2 mb-12 grid grid-cols-3 gap-10">
                    <!-- Row items -->
                    <?php
                        while($row2 = mysqli_fetch_array($query2)){
                    ?>
                    <div class="sm:w-44 lg:w-48 xl:w-80 min-h-32 px-4 py-2 rounded-lg bg-gray-200">
                        <h3 class="font-semibold text-lg mb-2">
                            <?=$row2['Tables_in_repo_fasilkom']?>
                        </h3>
                        <a href="dashboard-details.php?nama_tabel=<?=$row2['Tables_in_repo_fasilkom']?>" class="text-green-700 hover:text-sky-700">See Details</a>
                    </div>
                    <?php } ?>
                </div>

                <!-- S Footer -->
                <div class="w-full border-t-2 border-gray-500">
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
</body>
</html>