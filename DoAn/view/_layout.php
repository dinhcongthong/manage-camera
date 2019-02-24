<?php
	// gọi trang xử lý đọc ghi dữ liệu với database
	require_once "./lib/db.php";
	// gọi trang xử lý giỏ hàng
	require_once 'giohang.inc';

	// kiểm tra xem session[dang_nhap_chua] đã có hay chưa
	if (!isset($_SESSION["dang_nhap_chua"])) {
		// nếu chưa có thì khởi tạo và gán  = 0 (0 có nghĩa là chưa đăng nhập)
		$_SESSION["dang_nhap_chua"] = 0;
	}
	// kiểm tra tiếp nếu chưa đăng nhập nhưng có lưu mật khẩu ở lần đăng nhập trước hay không
	if ($_SESSION["dang_nhap_chua"] == 0) {
		if(isset($_COOKIE["xac_nhan_id"])) {
			
			// nếu có ta tái tạo session
			// lấy id của tài khoản đã ghi nhớ mật khẩu trong cookie
			// từ id đó truy vấn database để lấy thông tin tài khoản nhắm tái tạo sessoin
			$khach_hang_id = $_COOKIE["xac_nhan_id"];
			$sql = "select * from khachhang where MaKH = $khach_hang_id";
			$rs = load($sql);
			$_SESSION["ten_taikhoan"] = $rs->fetch_object();
			$_SESSION["dang_nhap_chua"] = 1;
		} 
	}
	// các session này được tạo ra khi ta đăng nhập ở trang đăng nhập
?>

<!DOCTYPE html>
<html>
<head>
	<title>Camera</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="assets/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css">
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color: #FFF; border-bottom-color: #337AB7;">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a href="index.php">
					<img src="imgs/logo-camera.png" width="150">
				</a>
			</div>
			<!-- ```````````````````````TÌM KIẾM ``````````````````````````````````-->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<form class="navbar-form navbar-left" role="search" method="get" action="ketquatimkiem.php">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Nhập tên sản phẩm, thương hiệu... cần tìm" size="40" style="border: 1px solid #337AB7;" name="timkiem">
						</div>
						<button type="submit" class="btn btn-default" style="background-color: #337AB7; color: #FFFFFF; border: 1px solid #337AB7;" name="btntimkiem">
							&nbsp;
							<i class="fa fa-search fa-lg" aria-hidden="true"></i>
							&nbsp;
						</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<!-- ``````````````````````````````SẢN PHẨM ```````````````````````````` -->
					<li class="dropdown" id="sp">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<b style="color: #337AB7;">Sản Phẩm</b>
							<span class="caret" style="color: #31708F;"></span>
						</a>
						<ul class="dropdown-menu" id="thesp" style="border: none;">
							<!-- <ul class="nav nav-pills nav-justified"> -->
							<?php
								$sql = "select * from danhmuc";
								$rs = load($sql);
								
								while ($row = $rs->fetch_assoc()) :
							?>
								<li>
									<a style="color: #337AB7;" href="indexSP.php?idsp=<?= $row["MaLoai"]?>&"> <?= $row["TenLoai"] ?></a>
								</li>

							<?php
								endwhile;
							?>
								
							<!-- </ul> -->
						</ul>
					</li>
					<!-- `````````````````````````````THƯƠNG HIỆU```````````````````````````````` -->
					<li class="dropdown" id="th">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<b style="color: #337AB7;">Thương Hiệu</b>
							<span class="caret" style="color: #31708F;"></span>
						</a>
						<ul class="dropdown-menu" id="theth" style="border: none;">
							<!-- <ul class="nav nav-pills nav-justified"> -->
							<?php
								$sql = "select * from nsx";
								$rs = load($sql);
								while ($row = $rs->fetch_assoc()) :
							?>
								<li>
									<a style="color: #337AB7;" href="indexTH.php?idth=<?= $row["MaNSX"]?>&"><?= $row["TenNSX"] ?></a>
								</li>
							<?php
								endwhile;
							?>
								
							<!-- </ul> -->
						</ul>
					</li>
					<!-- `````````````````````````````GIỎ HÀNG```````````````````````` -->
					<?php
						if($_SESSION["dang_nhap_chua"]==0):
					?>
					<li><a href="xemgiohang.php?">
							<span class="glyphicon glyphicon-shopping-cart" style="color: #337AB7;"></span>
							<!-- giỏ hàng sẽ hiển thị tổng số sp được thêm vào. ta gọi hàm tính tổng sp -->
							<b style="color: #337AB7;">Giỏ hàng	(<?= get_total_items() ?>) </b>
						</a>
					</li>
					<?php
						else:
					?>
					<li><a href="xemgiohang.php?">
							<span class="glyphicon glyphicon-shopping-cart" style="color: #337AB7;"></span>
							<!-- giỏ hàng sẽ hiển thị tổng số sp được thêm vào. ta gọi hàm tính tổng sp -->
							<b style="color: #337AB7;">Giỏ hàng	(<?= get_total_items() ?>) </b>
						</a>
					</li>
					<?php
						endif;
					?>
					<!-- ````````````````````````````````USER  KHI CHƯA ĐĂNG NHẬP````````````````````` -->
					<?php
						if($_SESSION["dang_nhap_chua"]==0):
					?>
					<li class="dropdown USER">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<!-- <span class="glyphicon glyphicon-user" style="color: #337AB7;"></span> -->
							<i class="fa fa-user-o fa-lg" aria-hidden="true" style="color: #337AB7;"></i>
							<span class="caret"></span>
							<!-- thẻ user -->
						</a>
						<ul class="dropdown-menu THEUSER" style="border: none;">
							<li>
								<a href="dangnhap.php" style="color: #337AB7;">
									<span class="glyphicon glyphicon-log-in" style="color: #337AB7;"></span>
									&nbsp;
									Đăng nhập
								</a>
							</li>
							<!-- <li class="divider"></li> -->
							<li>
								<a href="dangky.php" style="color: #337AB7;">
									<span class="glyphicon glyphicon-pencil" style="color: #337AB7;"></span>
									&nbsp;
									Đăng ký
								</a>
							</li>
						</ul>
					</li>
					<?php
						endif;
						if($_SESSION["dang_nhap_chua"]== 1):
					?>
					<!-- `````````````````````````````USER KHI ĐÃ ĐĂNG NHẬP ``````````````````````````` -->
					<li class="dropdown USER">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<!-- <span class="glyphicon glyphicon-user" style="color: #1D9F75;"></span> -->
							<i class="fa fa-user-circle-o fa-lg" aria-hidden="true" style="color: #337AB7;"></i>
							<b style="color: #337AB7;">
								<?= $_SESSION["ten_taikhoan"]->TenKH ?>
							</b>
							<span class="caret" style="color: #337AB7;"></span>
						</a>
						<ul class="dropdown-menu THEUSER">
							<!-- ```````````````````````Quyền của ADMIN ```````````````````````````-->
							<?php
								if($_SESSION["ten_taikhoan"]->DacQuyen == 1):
							?>
							<li>
								<a href="themsanpham.php?" style="color: #338ECF;">Thêm sản phẩm</a>
							</li>
							<li>
								<a href="quanlydonhang.php?" style="color: #338ECF;">Quản lý đơn hàng</a>
							</li>
							<li class="divider"></li>
							<?php
								endif;
							?>
							<!-- ```````````````````````````````````````````````````````````` -->
							<li>
								<a href="thongtincanhan.php?" style="color: #338ECF;">Thông tin cá nhân</a>
							</li>
							<li>
								<a href="doimatkhau.php?" style="color: #338ECF;">Đổi mật khẩu</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="dangxuat.php" style="color: #338ECF;">
									<i class="fa fa-sign-out" aria-hidden="true" style="color: #338ECF;""></i>
									Đăng xuất
								</a>
							</li>
						</ul>
					</li>
					<?php
						endif;
					?>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
	<br>
	<br>
	<br>
	<!-- ````````````````````````````````PHẦN THỂ HIỆN SẢN PHẨM or THÊM SẢN PHẨM`````````````````````````` -->
	<div class="container-fluid">
		<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title" style="font-weight: bold;"><?= $page_title ?></h3>
		</div>
		<div class="panel-body">
			<?php include_once $page_body_file; ?>
		</div>
	</div>
	</div>
	
	<script src="assets/jquery-3.1.1.min.js"></script>
	<script src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="assets/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
	<script src="assets/tinymce/tinymce.min.js" ></script>

	<!-- `````````````````````````XỬ LÝ SỰ KIỆN ````````````````````````` -->
	<script type="text/javascript">
		// ``````````````````TRANG CHI TIẾT SẢN PHẨM``````````````````
		// Hover menu sản phẩm
		$("#sp").hover(function(){
			$("#thesp").css("display","block");
		},function(){
			$("#thesp").css("display","none");
		});
		// hover thẻ thương hiệu
		$("#th").hover(function(){
			$("#theth").css("display","block");
		},function(){
			$("#theth").css("display","none");
		});
		// hover thẻ user
		$(".USER").hover(function(){
			$(".THEUSER").css("display","block");
		},function(){
			$(".THEUSER").css("display","none");
		});
		// hàm dùng cho textbox tăng giảm số lượng trong trang chi tiết sản phẩm
		$(function () {
			$('#txtsoluong').TouchSpin({	
				min: 1,
				max: 100
				// step: 1,
				// decimals: 0,
				// boostat: 5,
				// maxboostedstep: 10,
				// postfix: '%'
			});
		});
		// ``````````````````````TRANG GIỎ HÀNG```````````````````````
		// hàm dùng cho textbox tăng giảm số lượng trong trang xem giỏ hàng
		$(function () {
			$('.txtsoluong-sp').TouchSpin({	
				min: 1,
				max: 100
				// step: 1,
				// decimals: 0,
				// boostat: 5,
				// maxboostedstep: 10,
				// postfix: '%'
			});
		});

		//bắt sự kiện khi click vào thẻ có class tên btnxoa
		$('.btnxoa').on('click', function() {
			// gán biến masp = với cái data có thuộc tính id và lấy giá trị 
			var masp = $(this).data('id');

			//form có những id này sẽ nhận những giá trị tương ứng 
			$('#txtXoaSP').val(masp);
		    $('#txtCmd').val('Xoa');
		    $('#f-giohang').submit();
		});

		//bắt sự kiện khi nhấn vào nút cập nhật
		$('.btncapnhat').on('click', function() {

			var sl = $(this).closest('tr').find('.txtsoluong-sp').val();
			$('#txtCapnhatSL').val(sl);

			var masp = $(this).data('id');
			$('#txtXoaSP').val(masp);
		    $('#txtCmd').val('Capnhat');

		    $('#f-giohang').submit();
		});

		// bắt sự kiện khi nhấn nút thanh toán
		$('#btnthanhtoan').on('click', function() {
			// gán biến masp = với cái data có thuộc tính id và lấy giá trị 
			
		    $('#txtCmd1').val('Thanhtoan');
		    $('#f-thanhtoan').submit();
		});
		// `````````````````````````TRANG THÊM SẢN PHẨM`````````````````````
		// thanh toolbar trong input nhập chi tiết
		tinymce.init({
		    selector: '#txtchitiet',
		    menubar: false,
		    plugins: 'advlist autolink lists link image charmap print preview anchor textcolor',
		    toolbar1: 'insert | undo redo | styleselect | fontselect | bold italic underline forecolor | bullist numlist | removeformat |',
		    // toolbar2: "",
		    
		    //height: 300,
		    // encoding: "xml",
		});

		// hàm chỉ cho nhập số không cho nhập kí tự hay chữ (nguồn internet)
		function keypress(e){
			var keypressed = null;
			if (window.event){
		  		keypressed = window.event.keyCode;
			}
			else{
		  		keypressed = e.which;
			}

			if ((keypressed < 48 || keypressed > 57) && keypressed!=190){
				if (keypressed == 8 || keypressed == 127){
				   	return;
		  		}
		  		return false;
			}
		}
	</script>
</body>
</html>