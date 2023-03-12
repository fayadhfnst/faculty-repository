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
    <?php include("navbar.php") ?>
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

    <!-- S Main Content -->
    <div class="w-full min-h-screen flex">
        <!-- Sidebar -->
        <!-- <div class="w-64 min-h-full">
            <div class="h-full overflow-y-auto py-4 px-3 bg-[#757575]">
                <ul class="space-y-2">
                    <li>
                        <a href="#" class="flex items-center p-2 text-base font-normal rounded-lg text-black hover:bg-gray-200 hover:ring-4 hover:outline-none hover:ring-green-600">
                            <span class="ml-3">Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <button type="button" class="flex items-center p-2 w-full text-base font-normal rounded-lg group transition duration-75 hover:bg-gray-200 hover:ring-4 hover:outline-none hover:ring-green-600" aria-controls="dropdown-example" data-collapse-toggle="dropdown-example">
                            <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item>Ice cream</span>
                            <svg sidebar-toggle-item class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                        </button>
                        <ul id="dropdown-example" class="hidden py-2 space-y-2">
                            <li>
                                <a href="#" class="flex items-center p-2 pl-11 w-full text-base font-normal hover:bg-gray-200 hover:ring-4 hover:outline-none hover:ring-green-600 text-gray-900 rounded-lg transition duration-75 group">Bing Chilling</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div> -->

        <?php
            if(isset($_GET['status'])){
                // $sql = "SELECT (SELECT nama_lengkap FROM akun WHERE email = surat.email_akun) AS nama_mhs,id,judul,id_jenis_surat,dokumen,keterangan,tgl_diperlukan,email_akun,status FROM surat WHERE email_akun = '{$_SESSION['email']}' and status = '{$_GET['status']}' ORDER BY tgl_diperlukan";
                $sql = "SELECT * FROM surat WHERE status = '{$_GET['status']}' ORDER BY tgl_diperlukan";
            }else{
                // $sql = "SELECT (SELECT nama_lengkap FROM akun WHERE email = surat.email_akun) AS nama_mhs,id,judul,id_jenis_surat,dokumen,keterangan,tgl_diperlukan,email_akun,status FROM surat WHERE email_akun = '{$_SESSION['email']}' ORDER BY tgl_diperlukan";
                $sql = "SELECT * FROM surat ORDER BY tgl_diperlukan";
            }
            $query = mysqli_query($con,$sql);
            $x = 1;
        ?>

        <!-- Letters-->
        <div class="w-full">
            <div class="w-full py-6 px-8">
                <div class="w-full max-h-20 px-4 py-4 mb-8">
                    <h1>Daftar Surat <?php
                        if(isset($_GET['status'])){
                            echo "(";
                            echo ucwords($_GET['status']);
                            echo ")";
                        }
                    ?></h1>
                    <ul class="flex space-x-2 my-2">
                        <li class="w-44 h-10 p-2 text-center bg-gray-200 rounded-md text-green-600 hover:text-sky-700">
                            <a href="daftarsurat.php">Semua</a>
                        </li>
                        <li class="w-44 h-10 p-2 text-center bg-gray-200 rounded-md text-green-600 hover:text-sky-700">
                            <a href="daftarsurat.php?status=pending">Diproses</a>
                        </li>
                        <li class="w-44 h-10 p-2 text-center bg-gray-200 rounded-md text-green-600 hover:text-sky-700">
                            <a href="daftarsurat.php?status=approve">Diterima</a>
                        </li>
                        <li class="w-44 h-10 p-2 text-center bg-gray-200 rounded-md text-green-600 hover:text-sky-700">
                            <a href="daftarsurat.php?status=denied">Ditolak</a>
                        </li>
                    </ul>
                </div>
                <div class="w-full min-h-screen">
                    <table class="w-full table-auto border-2">
                        <thead class="border-2 bg-gray-300">
                          <tr>
                                <th class="border-2 px-2">No</th>
                                <th class="border-2 px-2">Judul</th>
                                <th class="border-2 px-2">Keterangan</th>
                                <th class="border-2 px-2">Pengaju</th>
                                <th class="border-2 px-2">Dokumen</th>
                                <th class="border-2 px-2">Tanggal diperlukan</th>
                                <th class="border-2 px-2">Status</th>
                                <th class="border-2 px-2">Balasan</th>
                                <th class="border-2 px-2">Action</th>
                          </tr>
                        </thead>
                        <tbody>
                            <?php
                                while($row = mysqli_fetch_array($query)){
                                    $sql1 = "SELECT nama_lengkap FROM akun WHERE email='{$row['email_akun']}'";
                                    $query1 = mysqli_query($con,$sql1);
                                    $row1 = mysqli_fetch_array($query1);

                                    $sql2 = "SELECT * FROM balasan_surat WHERE id_surat = '{$row['id']}'";
                                    $query2 = mysqli_query($con,$sql2);
                                    $num_row = mysqli_num_rows($query2);
                                    $row2 = mysqli_fetch_array($query2);
                            ?>
                          <tr class="h-56">
                                <td class="border-2 px-2 text-center"><?=$x++?></td>
                                <td class="border-2 px-2"><?=$row['judul']?></td>
                                <td class="border-2 px-2"><?=$row['keterangan']?></td>
                                <td class="border-2 px-2"><?=$row1['nama_lengkap']?></td>
                                <td class="border-2 px-2"><a href="file/uploadedfile/Surat/<?=$row['dokumen']?>" download="<?=$row['dokumen']?>"><?=$row['dokumen']?></a></td>
                                <td class="border-2 px-2"><?=$row['tgl_diperlukan']?></td>
                                <td class="border-2 px-2"><?=$row['status'] ?></td>
                                <td class="border-2 px-2">
                                <?php if($num_row == 0){}else{  ?>
                                <a href="file/uploadedfile/BalasanSurat/<?=$row2['file_surat']?>" download="<?=$row2['file_surat']?>"><?=$row2['file_surat']?></a>
                                <?php } ?>
                                </td>
                                <td class="border-2 px-2">
                                    <div class="text-center">
                                        <a class="bg-blue-500 hover:bg-blue-700 text-white font-semibold px-4 py-2 rounded" href="balas-surat.php?id=<?=$row['id']?>">Balas</a> 
                                    </div>
                                    <div class="text-center mt-4">
                                        <a class="bg-yellow-500 hover:bg-yellow-700 text-white font-semibold px-4 py-2 rounded" href="update-status-surat.php?id=<?=$row['id']?>&status=pending">Pending</a>
                                    </div>
                                    <div class="text-center mt-4">
                                        <a class="bg-green-500 hover:bg-green-700 text-white font-semibold px-4 py-2 rounded" href="update-status-surat.php?id=<?=$row['id']?>&status=approve">Approve</a>
                                    </div>
                                    <div class="text-center mt-4">
                                        <a class="bg-orange-500 hover:bg-orange-700 text-white font-semibold px-4 py-2 rounded" href="update-status-surat.php?id=<?=$row['id']?>&status=denied">Denied</a>
                                    </div>
                                    <div class="text-center mt-4">
                                        <a class="bg-red-500 hover:bg-red-700 text-white font-semibold px-4 py-2 rounded" href="delete-surat.php?id=<?=$row['id']?>" onclick="return confirm('Apakah anda yakin ingin menghapus surat?')">Delete</a></td>
                                    </div>
                          </tr>
                          <?php } ?>
                        </tbody>
                      </table>
                </div>

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
</body>
</html>