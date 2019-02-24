<?php
	include_once 'lib/db.php';

	// nếu không đăng nhập thì không dùng thể dùng chức năng cập nhật thông tin
	// loại những trường hợp coppy link mà chưa đăng nhập
	session_start();
	if(!isset($_SESSION["dang_nhap_chua"]))
	{
		$_SESSION["dang_nhap_chua"]==0;
	}
	if($_SESSION["dang_nhap_chua"]==0)
	{
		header("Location: dangnhap.php");
	}

	$Thongbao = 0;
	// ```````````````````SHOW THÔNG TIN HIỆN TẠI CỦA KHÁCH HÀNG`````````````````````````````
	$makh = $_SESSION["ten_taikhoan"]->MaKH;
	$sql = "select * from khachhang where MaKH = $makh";
	$rs = load($sql);
	$row = $rs->fetch_assoc();


	// ````````````````````KIỂM TRA NÚT BẤM CẬP NHẬT````````````````````````````````
	if (isset($_POST["btncapnhat"]))
	{
		$_tenkh = $_POST["tenkh"];
		$_email = $_POST["email"];
		$_sdt = $_POST["sdt"];

		$_nam = $_POST["nam"];
		$_thang = $_POST["thang"];
		$_ngay = $_POST["ngay"];

		$_diachi = $_POST["diachi"];

		$cn_sql = "update khachhang set TenKH = '$_tenkh', Email = '$_email', SDT = '$_sdt', NgaySinh = '$_nam-$_thang-$_ngay', DiaChi = '$_diachi' where MaKH = $makh";
		// $cn_rs = load($cn_sql);
		write($cn_sql);

		// ```````````````````````````SHOW THÔNG TIN MỚI CẬP NHẬT``````````````````````````
		$sql_1 = "select * from khachhang where MaKH = $makh";
		$rs_1 = load($sql_1);
		$row = $rs_1->fetch_assoc();

		$Thongbao = 1;
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Thông tin cá nhân</title>
	<link rel="stylesheet" type="text/css" href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
	<div class="alert" role="alert" style="text-align: center; background-color: #337AB7;">
		<b style="font-size: 20pt; color: #FFF;">THÔNG TIN CÁ NHÂN</b>
	</div>	
	<!-- <div class="row"> -->
		<div class="container-fluid">
			<div class="col-md-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Hệ thống</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item">
							<a href="index.php" style="text-decoration: none;">Trang chủ</a>
						</li>			
						<li class="list-group-item">
							<a href="doimatkhau.php?" style="text-decoration: none;">Đổi mật khẩu</a>
						</li>
						<li class="list-group-item">
							<a href="dangxuat.php" style="text-decoration: none;">Đăng xuất và trở lại trang chủ</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-9">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Cập nhật thông tin</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="container-fluid col-md-5">
								<div class="panel panel-default">
									<div class="panel-body" style="text-align: center;">
										<b>Thông tin hiện tại</b>
									</div>
									<ul class="list-group">
										<li class="list-group-item">
											<b>Tài khoản: </b><?= $row["TaiKhoan"] ?>
										</li>
										<li class="list-group-item">
											<b>Mật khẩu: </b>******
										</li>
										<li class="list-group-item">
											<b>Tên khách hàng: </b><?= $row["TenKH"] ?>
										</li>
										<li class="list-group-item">
											<b>Email: </b><?= $row["Email"] ?>
										</li>
										<li class="list-group-item">
											<b>Số điện thoại: </b><?= $row["SDT"] ?>
										</li>
										<li class="list-group-item">
											<b>Ngày sinh: </b><?= $row["NgaySinh"] ?>
										</li>
										<li class="list-group-item">
											<b>Địa chỉ: </b><?= $row["DiaChi"] ?>
										</li>
									</ul>									
								</div>
							</div>
							<div class="container-fluid col-md-7">
								<form method="post" action="" name="f_dk" onsubmit="return Kiemtra4();">
									<div class="panel panel-default">
										<div class="panel-body" style="text-align: center;">
											<b>Cập nhật thông tin</b>
										</div>
										<ul class="list-group">
											<li class="list-group-item">
												<span id="stkh" style="float: right;"></span>
												<b>Tên khách hàng: </b><input type="text" class="form-control" name="tenkh" value="<?= $row["TenKH"] ?>">
											</li>
											<li class="list-group-item">
												<span id="semail" style="float: right;"></span>
												<b>Email: </b><input type="text" class="form-control" name="email" value="<?= $row["Email"] ?>">
											</li>
											<li class="list-group-item">
												<span id="ssdt" style="float: right;"></span>
												<b>Số điện thoại: </b><input type="text" class="form-control" name="sdt" value="<?= $row["SDT"] ?>">
											</li>
											<li class="list-group-item">
												<div class="row">
													<div class="container-fluid col-md-3">
														<b>Ngày</b>
														<select name="ngay" id="" class="form-control">
															<script type="text/javascript">
																for (var i = 1; i <= 31; i++) {
																	document.write('<option value="' + i +'">' + i + '</option>' );
																	}
															</script>
														</select>
													</div>
													<div class="container-fluid col-md-3">
														<b>Tháng</b>
														<select name="thang" id="" class="form-control">
															<script type="text/javascript">
																for (var i = 1; i <= 12; i++) {
																	document.write('<option value="' + i +'">' + i + '</option>' );
																	}
															</script>
														</select>
													</div>
													<div class="container-fluid col-md-3">
														<span id="sns" style="float: right;"></span>
														<b>Năm</b>
														<input type="text" class="form-control" name="nam">
													</div>
												</div>
											</li>
											<li class="list-group-item">
												<span id="sdc" style="float: right;"></span>
												<b>Địa chỉ: </b><input type="text" class="form-control" name="diachi" value="<?= $row["DiaChi"] ?>">
											</li>
										</ul>
										<?php if ($Thongbao == 1) : ?>
										<div class="alert alert-success" role="alert" style="text-align: center;">
											<strong>Hoàn tất !</strong> Bạn đã cập nhật thành công.
										</div>
										<?php endif; ?>
									</div>
									<div class="col-md-6 col-md-offset-3">
										<div class="row">
											<div class="container-fluid col-md-6">
												<button class="btn btn-warning" type="button" name="btnkiemtra" onclick="Kiemtra3()">
													Kiểm tra
												</button>
											</div>
											<div class="container-fluid col-md-6">
												<button class="btn btn-success" type="submit" name="btncapnhat">
													Cập nhật
												</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- </div> -->
	<script src="assets/kiemtradangky.js"></script>
</body>
</html>