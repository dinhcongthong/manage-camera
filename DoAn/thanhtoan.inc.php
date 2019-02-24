<?php
	require_once "./lib/db.php";

	session_start();
	// nếu form thanh toán được submit thì txtCmd1 sẽ tồn tại nên ta kiểm tra nó để pik form submit chưa
	if(isset($_POST["txtCmd1"])){
		$tongtien = $_POST["txtTongtien"];
		$ngaylap = date("Y-m-d H:i:s",strtotime("+6 hours"));
		$makh = $_SESSION["ten_taikhoan"]->MaKH;
		// cho mặc định trạng thái khi thanh toán là chưa giao
		$trangthai = "chưa giao";

		$sql = "insert into donhang(NgayLap,MaKH,TongTien,TrangThai) values('$ngaylap','$makh',$tongtien,'$trangthai')";
		//insert vào database và lấy ra stt của đơn hàng
		$madh = write($sql);

		foreach ($_SESSION["giohang"] as $masp => $sl)
		{
			$sql = "select * from SanPham where MaSP = $masp";
			$rs = load($sql);
			$row = $rs->fetch_assoc();
			$giasp = $row["Gia"];
			// nếu số lượng hàng trong giỏ hơn số lượng hàng trong ko thì lấy max ở kho
			if($sl > $row["SoLuong"])
			{
				$sl = $row["SoLuong"];
			}
			$Tongtien_1_sp = $sl * $giasp;

			// cập nhật lại hàng trong ko
			$capnhatSL = $row["SoLuong"] - $sl;
			$sql_U = "update sanpham set SoLuong = '$capnhatSL' where MaSP = '$masp'";
			write($sql_U);

			//update số lượng bán vào bản sản phẩm
			//1.lấy ra số lượng đã bán đc trước đó
			$slDabanCu = $row["SoLuongDaBan"];
			//2.cộng với số lượng trong giỏ
			$slDabanMoi = $slDabanCu + $sl; 
			$sql_slban = "update sanpham set SoLuongDaBan = '$slDabanMoi' where MaSP = '$masp'";
			write($sql_slban);

			// lập chi tiết đơn hàng từ madh ở trên và thông tin đơn hàng trong session[giohang]
			$sql_1 = "insert into ct_donhang(MaSP,MaDH,Soluong,GiaSP,ThanhTien) values('$masp','$madh','$sl','$giasp','$Tongtien_1_sp')";
			write($sql_1);	

		}
		//cho giỏ hàng rỗng như ban đầu
		$_SESSION["giohang"] = array();

		// trả về trang vừa rời đi
		if (isset($_SERVER['HTTP_REFERER'])) {
		    $url = $_SERVER['HTTP_REFERER'];
		    header("location: $url");
		}
	}