<?php 
	//khởi tạo session 
	session_start();
	if (!isset($_SESSION["dang_nhap_chua"])) {
		$_SESSION["dang_nhap_chua"] = 0;
	}

	require_once './lib/db.php';
	// nếu btnLogin được nhấn thì ta lấy thông tin nhập từ form lên xử lý
	if (isset($_POST["btnLogin"])) {
		$username = $_POST["txtUserName"];
		$password = $_POST["txtPassword"];
		$enc_password = md5($password);

		// kiểm tra thông tin đăng nhập có giống với thông tin có dưới database ko
		$sql = "select * from khachhang where TaiKhoan = '$username' and MatKhau = '$enc_password'";
		$rs = load($sql);
		// nếu có thông tin dưới database kq rs-> sẽ >0 vì có dữ liệu được duyệt
		if ($rs->num_rows > 0) {
			// gán session[tentaikhoan] cho object lưu các dữ liệu đc truy vấn
			$_SESSION["ten_taikhoan"] = $rs->fetch_object();
			$_SESSION["dang_nhap_chua"] = 1;

			// nếu có check vào nhớ mk thì
			if(isset($_POST["NhoMatKhau"])) {
				// ta lưu id khách hàng bằng với ss[tentaikhoan] trỏ tới mã của khách hàng
				$khach_hang_id = $_SESSION["ten_taikhoan"]->MaKH;

				// và lưu id_kh và thời gian nhớ mk vào cookie có tên "xác_nhận_id" 
				setcookie("xac_nhan_id", $khach_hang_id, time() + 86400);
			} 

			header("Location: index.php");
		} else {
?>
			<script>
				alert('Vui lòng kiểm tra thông tin đăng nhập!');
			</script>
<?php
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
	<div class="alert" role="alert" style="text-align: center; background-color: #337AB7;">
		<b style="font-size: 20pt; color: #FFF;">ĐĂNG NHẬP</b>
	</div>
	<!-- <div class="row"> -->
		<div class="container-fluid">
			<div class="col-md-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Hệ thống</h3>
					</div>
					<ul class="list-group" style="list-style: none;">
						<li class="list-group-item">
							<a href="index.php" style="text-decoration: none;">Trang chủ</a>
						</li>
						<li class="list-group-item">
							<a href="dangky.php" style="text-decoration: none;">Đăng ký</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-9">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Đăng nhập</h3>
					</div>
					<div class="panel-body">
						<div class="col-md-4 col-md-offset-4">
							<form method="post" action="">
								<div class="form-group">
									<label for="txtUserName">Tên đăng nhập</label>
									<input type="text" class="form-control" id="txtUserName" name="txtUserName">
								</div>
								<div class="form-group">
									<label for="txtPassword">Mật khẩu</label>
									<input type="password" class="form-control" id="txtPassword" name="txtPassword">
								</div>
								<div class="checkbox">
									<label>
										<input type="checkbox" name="NhoMatKhau">Nhớ mật khẩu
									</label>
								</div>
								<div>
									<button type="submit" class="btn btn-success btn-block" name="btnLogin">
										<span class="glyphicon glyphicon-log-in"></span>
										&nbsp;Đăng nhập
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- </div> -->
	<script src="assets/jquery-3.1.1.min.js"></script>
	<script src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>