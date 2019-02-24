<?php
	include_once 'lib/db.php';

	$Thongbao = 0;
	session_start();
	$makh = $_SESSION["ten_taikhoan"]->MaKH;

	if(isset($_POST["btnthaydoi"]))
	{
		$sql = "select * from khachhang where MaKH = $makh";
		$rs = load($sql);
		$row = $rs->fetch_assoc();

		$matkhauhientai = $_POST["matkhaucu"];
		$matkhauhientai_md5 = md5($matkhauhientai);

		$matkhau_sql = $row["MatKhau"];
		if($matkhau_sql === $matkhauhientai_md5)
		{
			$mkmoi = $_POST["matkhaumoi"];
			$mkmoi1 = $_POST["matkhaumoi1"];
			if($mkmoi === $mkmoi1)
			{
				$mkmoi_md5 = md5($mkmoi);
				$update_sql = "update khachhang set MatKhau = '$mkmoi_md5' where MaKH = $makh";
				$update_rs = load($update_sql);

				$Thongbao = 1;
			}
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Đổi mật khẩu</title>
	<link rel="stylesheet" type="text/css" href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
	<div class="alert" role="alert" style="text-align: center; background-color: #337AB7;">
		<b style="font-size: 20pt; color: #FFF;">ĐỔI MẬT KHẨU</b>
	</div>
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
							<a href="thongtincanhan.php?" style="text-decoration: none;">Thông tin cá nhân</a>
						</li>
					</ul>
				</div>
			</div>
		<div class="col-md-9">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Đổi mật khẩu</h3>
					</div>
					<div class="panel-body">
						<div class="col-md-4 col-md-offset-4">
							<form method="post" action="">
								<div class="form-group">
									<label for="txtPassword">Mật khẩu hiện tại</label>
									<input type="password" class="form-control" id="txtPassword" name="matkhaucu">
								</div>
								<div class="form-group">
									<label for="txtPassword">Mật khẩu mới</label>
									<input type="password" class="form-control" id="txtPassword" name="matkhaumoi">
								</div>
								<div class="form-group">
									<label for="txtPassword">Nhập lại mật khẩu</label>
									<input type="password" class="form-control" id="txtPassword" name="matkhaumoi1">
								</div>
								<?php if ($Thongbao == 1) : ?>
										<div class="alert alert-success" role="alert" style="text-align: center;">
											<strong>Hoàn tất !</strong> Đổi mật khẩu thành công.
										</div>
										<?php endif; ?>
								<div>
									<button type="submit" class="btn btn-success btn-block" name="btnthaydoi">
										&nbsp;Thay đổi
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
	</div>
</body>
</html>