<?php
    require '../Koneksi/koneksi.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post">
        <?php
            // // if(isset($_POST['click'])){
            //     // echo $_GET['file-name'];
            //     // if(strlen($_POST['file-name']) != 0){
            //     //     echo "Filename: " . $_FILES['file-name']['name']."<br>";
            //     // }
            //     // echo $nama_file;
            // // }
            // // echo $_POST['file-name'];
            // $path = 'file/uploadedfile/Surat';
            // $files = array_diff(scandir($path), array('.', '..'));
            // // $files = scandir($path);
            // $count = count($files);
            // echo $count;
            // for($i = $count + 1;$i > 1;$i--){
            //     // if($nama_file == $files[$i]){
            //     //     $x++;
            //     //     $nama_file = $files[$i-1];
            //     // }
            //     // echo $files[$i];
            // }
            // print_r($files);

            // $name = pathinfo($files[5],PATHINFO_FILENAME);
            // $text = substr_replace($name,"",-3);
            // echo $text;
        ?>
        <!-- <input type="file" name="file-name" id="">
        <button type="submit" name="click">click Me</button> -->
    </form>
           
    <?php echo $_SESSION['previous_url'] ?>

</body>
</html>