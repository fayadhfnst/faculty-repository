<div class="w-1/4 hidden lg:flex flex-col px-4 py-6">
                <!-- Ajukan surat -->
                <a href="myletters.php" class="flex justify-center items-center w-full h-10 mb-5 bg-[#006633] hover:bg-green-700 text-white py-2 px-6 border border-gray-500 rounded-md shadow-md cursor-pointer">
                    <span class="text-lg"><i class="fas fa-envelope"></i></span>
                    <p class="ml-4 text-md">SURAT SAYA</p>
                </a>

                <!-- Search  -->
                <form action="search.php" method="get">
                    <div class="w-full h-10 mb-5 flex justify-center items-center relative">
                        <input type="text" class="w-full h-full bg-gray-200 focus:outline-green-700 focus:bg-white p-4 rounded-md shadow-md" name="search" id="search" placeholder="Search">
                        <button for="search" class="w-12 h-full bg-[#006633] text-white cursor-pointer flex justify-center items-center rounded-md absolute right-0">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>

                <!-- Filter -->
                <div class="w-full mb-5 flex flex-col">
                    <h4 class="w-full h-10 p-2 bg-[#006633] rounded-t-md text-white text-md">FILTER</h4>
                    <ul class="w-full bg-gray-200 rounded-b-md">
                        <li class="w-full h-10 p-2 border-t-2 border-gray-300">
                            <a href="katakunci.php?keyword=keyword" class="flex hover:text-sky-600">
                                Keywords
                            </a>
                        </li>
                        <li class="w-full h-10 p-2 border-t-2 border-gray-300">
                            <a href="katakunci.php?keyword=judul" class="flex hover:text-sky-600">
                                Judul
                            </a>
                        </li>
                        <li class="w-full h-10 p-2 border-t-2 border-gray-300">
                            <a href="katakunci.php?keyword=tipe" class="flex hover:text-sky-600">
                                Tipe
                            </a>
                        </li>
                    </ul>
                </div>

                <?php
                    $sql2 = "SELECT id,nama_keyword,id_prodi, jlh_judul_keyword(keyword.id) AS jlh_judul FROM keyword ORDER BY jlh_judul DESC LIMIT 4";
                    $query2 = mysqli_query($con,$sql2);
                ?>

                <!-- Kata kunci -->
                <div class="w-full mb-5 flex flex-col">
                    <h4 class="w-full h-10 p-2 bg-[#006633] rounded-t-md text-white text-md">KATA KUNCI</h4>
                    <ul class="w-full bg-gray-200 rounded-b-md">
                        <?php
                            while($row2 = mysqli_fetch_array($query2)){
                        ?>
                        <li class="w-full h-10 p-2 border-t-2 border-gray-300">
                            <a href="katakunci.php?keyword=keyword&id_prodi=<?=$row2['id_prodi']?>&id_keyword=<?=$row2['id']?>" class="flex hover:text-sky-600">
                                <?=$row2['nama_keyword'] ?> (<?=$row2['jlh_judul']?>)
                            </a>
                        </li>
                        <?php } ?>
                    </ul>
                </div>

                <?php
                    $sql3 = "SELECT nip,nama_lengkap, jlh_bimbingan_doping(dosen_pembimbing.nip) AS jlh_bimbingan FROM dosen_pembimbing ORDER BY jlh_bimbingan DESC LIMIT 4";
                    $query3 = mysqli_query($con,$sql3);
                ?>

                <!-- Penulis -->
                <div class="w-full mb-5 flex flex-col">
                    <h4 class="w-full h-10 p-2 bg-[#006633] rounded-t-md text-white text-md">DOSEN PEMBIMBING</h4>
                    <ul class="w-full bg-gray-200 rounded-b-md">
                        <?php
                            while($row3 = mysqli_fetch_array($query3)){
                        ?>
                        <li class="w-full h-10 p-2 border-t-2 border-gray-300">
                            <a href="filter-doping.php?nip_doping=<?=$row3['nip']?>" class="flex hover:text-sky-600">
                                <?= $row3['nama_lengkap'] ?> (<?= $row3['jlh_bimbingan']?>)
                            </a>
                        </li>
                        <?php } ?>
                    </ul>
                </div>

                <div class="w-full mb-5 flex flex-col">
                    <h4 class="w-full h-10 p-2 bg-[#006633] rounded-t-md text-white text-md">ANGKATAN</h4>
                    <ul class="w-full bg-gray-200 rounded-b-md">
                        <?php 
                            $tahun = date("y");
                            for($i = $tahun; $i > 9;$i--){
                                
                                    $sql6 = "SELECT COUNT(judul) AS jlh FROM tugas_akhir WHERE nim_mhs LIKE '$i%'";
                                
                                $query6 = mysqli_query($con,$sql6);
                                $row6 = mysqli_fetch_array($query6);
                        ?>
                        <li class="w-full h-10 p-2 border-t-2 border-gray-300">
                            <a href="katakuncii.php?angkatan=<?=$i?>" class="flex hover:text-sky-600">
                            <?= ($i < 10) ? "200" : "20" ?><?= $i ?> (<?= $row6['jlh']?>)
                            </a>
                        </li>
                        <?php } ?>
                    </ul>
                </div>

                <div class="w-full mb-5 flex flex-col">
                    <h4 class="w-full h-10 p-2 bg-[#006633] rounded-t-md text-white text-md">TAHUN SIDANG</h4>
                    <ul class="w-full bg-gray-200 rounded-b-md">
                        <?php 
                            $tahun = date("Y");
                            for($i = $tahun; $i > 2006;$i--){
                                $sql5 = "SELECT COUNT(judul) AS jlh FROM tugas_akhir WHERE tgl_pengesahan LIKE '$i%'";
                                $query5 = mysqli_query($con,$sql5);
                                $row5 = mysqli_fetch_array($query5);
                        ?>
                        <li class="w-full h-10 p-2 border-t-2 border-gray-300">
                            <a href="katakuncii.php?thn_sidang=<?=$i?>" class="flex hover:text-sky-600">
                                <?= $i ?> (<?= $row5['jlh']?>)
                            </a>
                        </li>
                        <?php } ?>
                    </ul>
                </div>
            </div>