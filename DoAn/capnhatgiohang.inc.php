<!-- trang xử lý cập nhật giỏ hàng -->
<?php
require_once 'giohang.inc';

if (isset($_POST["txtCmd"])) {
	$cmd = $_POST["txtCmd"];
	$masp = $_POST["txtXoaSP"];
	$sl = $_POST["txtCapnhatSL"];

	
	if ($cmd == "Xoa") {
		delete_item($masp);
	} else { // $cmd == "capnhat"
		update_item($masp, $sl);
	}
	
	if (isset($_SERVER['HTTP_REFERER'])) {
	    $url = $_SERVER['HTTP_REFERER'];
	    header("location: $url");
	}
}