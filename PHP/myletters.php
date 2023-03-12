<?php
    require "../Koneksi/koneksi.php";

    // echo "<p hidden>";
    if(isset($_SESSION['email'])){
        if(strlen($_SESSION['email'] == 0)){
            // $previous_url = $_SERVER['HTTP_REFERER'];
            // $_SESSION['previous_url'] = $previous_url;
            echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
        }
    }else{ 
        echo "<script type='text/javascript'> document.location = 'login.php'; </script>";
    }
    // echo "</p>";
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
    <title>Fasilkom-TI-Repositoryy</title>
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

            <!-- <span class="hidden lg:flex">/</span> -->

            <!-- Departemen Ilmu Komputer -->
            <!-- Hidden when under laptop display -->
            <!-- <a href="" class="hidden lg:flex items-center mx-6">
                <p>Ajukan Surat</p>
            </a> -->

            <span class="hidden lg:flex">/</span>

            <!-- Skripsi sarjana -->
            <a href="myletters.php" class="flex items-center lg:ml-6 mr-6">
                <p>Surat Saya</p>
            </a>
        </div>
    </div>
    <!-- E Current Opened Window -->

    <?php
        if(isset($_GET['status'])){
            // $sql = "SELECT (SELECT nama_lengkap FROM akun WHERE email = surat.email_akun) AS nama_mhs,id,judul,id_jenis_surat,dokumen,keterangan,tgl_diperlukan,email_akun,status FROM surat WHERE email_akun = '{$_SESSION['email']}' and status = '{$_GET['status']}' ORDER BY tgl_diperlukan";
            $sql = "SELECT * FROM surat WHERE email_akun = '{$_SESSION['email']}' and status = '{$_GET['status']}' ORDER BY tgl_diperlukan";
        }else{
            // $sql = "SELECT (SELECT nama_lengkap FROM akun WHERE email = surat.email_akun) AS nama_mhs,id,judul,id_jenis_surat,dokumen,keterangan,tgl_diperlukan,email_akun,status FROM surat WHERE email_akun = '{$_SESSION['email']}' ORDER BY tgl_diperlukan";
            $sql = "SELECT * FROM surat WHERE email_akun = '{$_SESSION['email']}' ORDER BY tgl_diperlukan";
        }
        $query = mysqli_query($con,$sql);
        $x = 1;
    ?>

    <!-- S Main Content -->
    <div class="w-full px-4 py-8 md:px-24 md:py-8">
        <div class="w-full flex mb-20">
            <!-- Left content -->
            <div class="lg:w-3/4 lg:pr-24">
                <!-- Skripsi sarjana -->
                <h4 class="font-bold border-b-2 border-gray-500">SURAT SAYA 
                    <?php
                        if(isset($_GET['status'])){
                            echo "(";
                            echo ucwords($_GET['status']);
                            echo ")";
                        }
                    ?>
                </h4>
                
                <!-- Letters -->
                <div class="w-full my-4">
                    <!-- My letter -->
                    <div class="w-full flex justify-start items-center mb-5">
                        <table class="w-full table-auto border-2">
                            <thead class="border-2 bg-gray-300">
                              <tr>
                                <th class="border-2 px-2">No</th>
                                <th class="border-2 px-2">Judul</th>
                                <th class="border-2 px-2">Keterangan</th>
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
                                ?>
                              <tr class="h-36">
                                <td class="border-2 px-2 text-center"><?=$x++?></td>
                                <td class="border-2 px-2"><?=$row['judul']?></td>
                                <td class="border-2 px-2"><?=$row['keterangan']?></td>
                                <td class="border-2 px-2"><a href="file/uploadedfile/Surat/<?=$row['dokumen']?>" download="<?=$row['dokumen']?>"><?=$row['dokumen']?></a></td>
                                <td class="border-2 px-2"><?=$row['tgl_diperlukan']?></td>
                                <td class="border-2 px-2"><?=$row['status'] ?></td>
                                <td class="border-2 px-2"><a href="file/uploadedfile/BalasanSurat/" download=""></a></td>
                                <td class="border-2 px-2">
                                    <div class="text-center">
                                        <a class="bg-blue-500 hover:bg-blue-700 text-white font-semibold px-4 py-2 rounded" href="letters-update.php?id=<?=$row['id']?>">
                                            Edit
                                        </a>
                                    </div>
                                    <div class="text-center mt-4">
                                        <a class="bg-red-500 hover:bg-red-700 text-white font-semibold px-4 py-2 rounded" href="letters-delete.php?id=<?=$row['id']?>" onclick="return confirm('Apakah anda yakin ingin menghapus surat?')">
                                            Delete
                                        </a>
                                    </div>
                                </td>
                              </tr>
                              <?php } ?>
                            </tbody>
                          </table>
                    </div>
                </div>
            </div>

            <?php
                $sql1 = "SELECT COUNT(status) AS jlh_pending FROM surat WHERE email_akun = '{$_SESSION['email']}' and status = 'pending'";
                $query1 = mysqli_query($con,$sql1);
                $row1 = mysqli_fetch_array($query1);

                $sql2 = "SELECT COUNT(status) AS jlh_approve FROM surat WHERE email_akun = '{$_SESSION['email']}' and status = 'approve'";
                $query2 = mysqli_query($con,$sql2);
                $row2 = mysqli_fetch_array($query2);

                $sql3 = "SELECT COUNT(status) AS jlh_denied FROM surat WHERE email_akun = '{$_SESSION['email']}' and status = 'denied'";
                $query3 = mysqli_query($con,$sql3);
                $row3 = mysqli_fetch_array($query3);
            ?>

            <!-- Right content -->
            <div class="w-1/4 hidden lg:flex flex-col px-4 py-6">
                <!-- Ajukan surat -->
                <a href="letters.php" class="flex justify-center items-center w-full h-10 mb-5 bg-[#006633] hover:bg-green-700 text-white py-2 px-6 border border-gray-500 rounded-md shadow-md cursor-pointer">
                    <span class="text-lg"><i class="fas fa-envelope"></i></span>
                    <p class="ml-4 text-md">AJUKAN SURAT</p>
                </a>

                <!-- Filter -->
                <div class="w-full mb-5 flex flex-col">
                    <h4 class="w-full h-10 p-2 bg-[#006633] rounded-t-md text-white text-md">Surat saya</h4>
                    <ul class="w-full bg-gray-200 rounded-b-md">
                        <li class="w-full h-10 p-2 border-t-2 border-gray-300">
                            <a href="myletters.php?status=pending" class="flex hover:text-sky-600">
                                Pending[<?=$row1['jlh_pending']?>]
                            </a>
                        </li>
                        <li class="w-full h-10 p-2 border-t-2 border-gray-300">
                            <a href="myletters.php?status=approve" class="flex hover:text-sky-600">
                                Approve[<?=$row2['jlh_approve']?>]
                            </a>
                        </li>
                        <li class="w-full h-10 p-2 border-t-2 border-gray-300">
                            <a href="myletters.php?status=denied" class="flex hover:text-sky-600">
                                Denied[<?=$row3['jlh_denied']?>]
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- S Footer -->
        <div class="w-full h-20 border-t-2 border-gray-500">
            <p class="mt-6">
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