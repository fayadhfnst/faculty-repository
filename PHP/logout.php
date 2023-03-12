<?php
    require "../Koneksi/koneksi.php";

    session_destroy();

    header("Location:index.php");
?>