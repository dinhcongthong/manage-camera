<?php

$page_title = "Chi tiết sản phẩm";

$base_filename = basename(__FILE__, '.php');
$page_body_file = "$base_filename/$base_filename.body.tpl";

if(!isset($_GET["masp"])){
	header('Location: index.php');
}

include 'view/_layout.php';

