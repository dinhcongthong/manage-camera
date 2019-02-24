<?php
	require_once "./lib/db.php";


	$Thongbao = 0;

	if(isset($_POST["btndangky"]))
	{
		$taikhoan = $_POST["taikhoan"];
		
		$matkhau = $_POST["matkhau"];
		$md5_mk = md5($matkhau);

		$tenkh = $_POST["tenkh"];

		$nam = $_POST["nam"];
		$thang = $_POST["thang"];
		$ngay = $_POST["ngay"];

		$sdt = $_POST["sdt"];
		$diachi = $_POST["diachi"];
		$email = $_POST["email"];
		$dacquyen = 0;

		$sql = "Insert into khachhang (TaiKhoan,MatKhau,TenKH,Email,SDT,NgaySinh,DacQuyen,DiaChi) values ('$taikhoan','$md5_mk','$tenkh','$email','$sdt','$nam-$thang-$ngay','$dacquyen','$diachi')";
		write($sql);

		$Thongbao = 1;
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Đăng ký</title>
	<link rel="stylesheet" type="text/css" href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
	<div class="alert" role="alert" style="text-align: center; background-color: #337AB7;">
		<b style="font-size: 20pt; color: #FFF;">ĐĂNG KÝ TÀI KHOẢN</b>
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
							<a href="dangnhap.php" style="text-decoration: none;">Đăng nhập</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-9">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Đăng ký</h3>
					</div>
					<div class="row">
						<div class="container-fluid col-md-6 col-md-offset-3" style="margin-top: 20px;">
							<form method="post" action="" name="f_dk" onsubmit="return Kiemtra2();">
								<ul class="list-group" style="list-style: none;">
									<li>
										<span id="stk" style="float: right;"></span>
										<label for="usr">Tài khoản:</label>
										<input type="text" class="form-control" name="taikhoan" id="taikhoan">
									</li>
									<br>
									<li>
										<span id="smk" style="float: right;"></span>
										<label for="pwd">Mật khẩu:</label>
										<input type="password" class="form-control" name="matkhau" id="matkhau">
									</li>
									<br>
									<li>
										<span id="stkh" style="float: right;"></span>
										<label for="pwd">Họ tên:</label>
										<input type="text" class="form-control" name="tenkh" id="tenkh">
									</li>
									<br>
									<li>
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
									<br>
									<li>
										<span id="ssdt" style="float: right;"></span>
										<label for="usr">Số điện thoại:</label>
										<input type="text" class="form-control" name="sdt" id="sdt">
									</li>
									<br>
									<li>
										<span id="sdc" style="float: right;"></span>
										<label for="pwd">Địa chỉ:</label>
										<input type="text" class="form-control" name="diachi" id="diachi">
									</li>
									<br>
									<li>
										<span id="semail" style="float: right;"></span>
										<label for="pwd">Email:</label>
										<input type="text" class="form-control" name="email" id="email" placeholder="...@gmail.com | ...@yahoo.com">
									</li>
								</ul>
								<?php if ($Thongbao == 1) : ?>
								<div class="alert alert-success" role="alert" style="text-align: center;">
									<strong>Hoàn tất !</strong> Bạn đã đăng ký thành công.
								</div>
								<?php endif; ?>
								<div class="col-md-6 col-md-offset-3">
									<div class="row" style="margin-bottom: 20px;">
										<div class="container-fluid col-md-6">
											<button class="btn btn-warning" type="button" name="btnkiemtra" onclick="Kiemtra1()">
											Kiểm tra
											</button>
										</div>
										<div class="container-fluid col-md-6">
											<button class="btn btn-success" type="submit" name="btndangky">
											Đăng ký
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
	<!-- </div> -->
	<script src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="assets/jquery-3.1.1.min.js"></script>
	<script src="assets/kiemtradangky.js"></script>
</body>
</html>