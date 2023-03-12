<div class="w-full h-20 flex justify-between items-center bg-[#006633] text-white px-4 md:px-12">
        <div class="flex items-center w-full h-14">
            <!-- Logo Image -->
            <div class="w-12">
                <img src="img/usu-logo.png" alt="">
            </div>

            <!-- Repository Description -->
            <div class="ml-6">
                <!-- Display on medium - large size -->
                <h4 class="hidden md:flex">REPOSITORI UNIVERSITAS SUMATERA UTARA</h4>
                <p class="hidden md:flex">FAKULTAS ILMU KOMPUTER DAN TEKNOLOGI INFORMASI</p>

                <!-- Display on small size -->
                <h4 class="flex md:hidden">REPOSITORI USU</h4>
                <p class="flex md:hidden">FASILKOM-TI</p>
            </div>
        </div>

        <?php if(!isset($_SESSION['email'])){ ?>
        <!-- S Login Button -->
        <div class="hidden md:flex">
            <a href="login.php" class="w-full bg-white font-semibold hover:bg-gray-200 text-gray-600 py-2 px-6 border border-gray-500 rounded-md shadow-md cursor-pointer">
                Login
            </a>
        </div>
        <!-- E Login Button -->
        <?php }else{
                    $sql4 = "SELECT * FROM akun WHERE email = '{$_SESSION['email']}'";
                    $query4 = mysqli_query($con,$sql4);
                    $row4 = mysqli_fetch_array($query4);    
                    $nama_akun = $row4['nama_lengkap'];
        ?>
                <!-- S Account info Button -->
            <div class="hidden md:flex justify-center items-center">
                
                <!-- Dropdown button -->
                <button id="dropdownInformationButton" data-dropdown-toggle="dropdownInformation" class="min-w-34 text-gray-600 bg-white hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-green-600 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center" type="button"><?=$row4['nama_lengkap']?><svg class="ml-2 w-4 h-4" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg></button>

                <!-- Dropdown menu -->
                <div id="dropdownInformation" class="hidden z-10 w-44 bg-white rounded divide-y divide-gray-100 shadow">
                    <div class="py-3 px-4 text-sm text-[#006633]">
                        <h5><?=$row4['nama_lengkap']?></h5>
                    </div>
                    <ul class="py-1 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownInformationButton">
                        <?php if($_SESSION['tipe_akun'] == 'admin'){ ?>
                        <li>
                            <a href="dashboard.php" class="block py-2 px-4 hover:bg-gray-100">Dashboard</a>
                        </li>    
                        <li>
                            <a href="daftardata.php" class="block py-2 px-4 hover:bg-gray-100">Report</a>
                        </li>
                        <li>
                            <a href="daftarsurat.php" class="block py-2 px-4 hover:bg-gray-100">Surat</a>
                        </li>
                        <?php }
                         elseif($_SESSION['tipe_akun'] == 'staff'){ ?>
                        <li>
                            <a href="daftardata.php" class="block py-2 px-4 hover:bg-gray-100">Report</a>
                        </li>
                        <li>
                            <a href="daftarsurat.php" class="block py-2 px-4 hover:bg-gray-100">Surat</a>
                        </li>
                        <?php }elseif($_SESSION['tipe_akun'] == 'dosen'){
                            // $sql11 = "SELECT nip FROM dosen_pembimbing WHERE nama_lengkap = {$nama_akun}";
                            // $query11 = mysqli_query($con,$sql11);
                            // $row11 = mysqli_fetch_array($query11);    
                        ?>
                        <li>
                            <a href="databerkas.php?tipe=tugas_akhir" class="block py-2 px-4 hover:bg-gray-100">My Files (Tugas Akhir)</a>
                        </li>
                        <li>
                            <a href="databerkas.php?tipe=penelitian_dosen" class="block py-2 px-4 hover:bg-gray-100">My Files (Penelitian)</a>
                        </li>
                        <li>
                            <a href="databerkas.php?tipe=ebook" class="block py-2 px-4 hover:bg-gray-100">My Files (Ebook)</a>
                        </li>
                        <li>
                            <a href="uploadfile.php?type=tugas_akhir" class="block py-2 px-4 hover:bg-gray-100">Upload Tugas Akhir</a>
                        </li>
                        <li>
                            <a href="uploadfile.php?type=penelitian_dosen" class="block py-2 px-4 hover:bg-gray-100">Upload Penelitian</a>
                        </li>
                        <li>
                            <a href="uploadfile.php?type=ebook" class="block py-2 px-4 hover:bg-gray-100">Upload Ebook</a>
                        </li>
                        <li>
                            <a href="myletters.php" class="block py-2 px-4 hover:bg-gray-100">Surat Saya</a>
                        </li>
                        <li>
                            <a href="letters.php" class="block py-2 px-4 hover:bg-gray-100">Ajukan Surat</a>
                        </li>
                        <?php }else{ ?>
                        <li>
                            <a href="myletters.php" class="block py-2 px-4 hover:bg-gray-100">Surat Saya</a>
                        </li>
                        <li>
                            <a href="letters.php" class="block py-2 px-4 hover:bg-gray-100">Ajukan Surat</a>
                        </li>
                        <?php } ?> 
                    </ul>
                    <div class="py-1">
                        <a href="logout.php" class="block py-2 px-4 text-sm text-red-500 hover:bg-gray-100">Sign out</a>
                    </div>
                </div>

            </div>
        <?php } ?>
        
        <!-- S NavBar Button in small size -->
        <div class="flex md:hidden">
            <button class="bg-white font-semibold hover:bg-gray-200 text-gray-600 py-2 px-4 border border-gray-500 rounded-md shadow-md">
                <i class="fas fa-bars"></i>
            </button>

            <button class="hidden bg-white font-semibold hover:bg-gray-200 text-gray-600 py-2 px-4 border border-gray-500 rounded-md shadow-md">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <!-- E NavBar Button in small size -->
    </div>