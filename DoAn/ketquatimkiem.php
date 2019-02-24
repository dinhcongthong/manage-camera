<?php

$page_title = "Kết quả tìm kiếm";

$base_filename = basename(__FILE__, '.php');
$page_body_file = "$base_filename/$base_filename.body.tpl";

if(!isset($_REQUEST["btntimkiem"])){
	header('Location: index.php');
}

include 'view/_layout.php';