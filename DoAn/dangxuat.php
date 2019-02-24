<?php
session_start();
if (isset($_SESSION["dang_nhap_chua"])) {
	unset($_SESSION["dang_nhap_chua"]);
	unset($_SESSION["ten_taikhoan"]);

	setcookie("xac_nhan_id", "", time() - 3600);
}

header('Location: index.php');