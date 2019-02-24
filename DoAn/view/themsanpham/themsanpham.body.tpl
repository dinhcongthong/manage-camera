<?php
	if(isset($_POST["btnThemsanpham"]))
	{
		$maloai = $_POST["selmaloai"];
		$mansx = $_POST["selmansx"];
		$tensp = $_POST["txttensp"];
		$danhgia = $_POST["txtmota"];
		$chitiet = $_POST["txtchitiet"];
		$soluong = $_POST["txtsoluong"];
		$gia = $_POST["txtgia"];
		$luotxem = 0;
		$ngaynhap = date("Y-m-d H:i:s",strtotime("+6 hours"));
		$soluongdaban = 0;

		$sql = "insert into sanpham(MaLoai,MaNSX,TenSP,DanhGia,ChiTiet,Gia,SoLuong,LuotXem,NgayNhap,SoLuongDaBan) values('$maloai','$mansx','$tensp','$danhgia','$chitiet','$gia','$soluong','$luotxem','$ngaynhap','$soluongdaban')";
		$id = write($sql);

		//tạo thư mục với stt của sp mới thêm
		mkdir("imgs/SanPham/$id");

		//xử lý thêm file
		$f = $_FILES["anhlon"];
		if ($f["error"] > 0) {

		} else {
			// lấy đường dẫn mặc định
			$tmp_name = $f["tmp_name"]; 
			// lấy tên của ảnh được chọn (chưa bik lấy để làm gì @@)
			$name = $f["name"];
			// tạo một đường mình muốn thêm ảnh
			$destination = "imgs/SanPham/$id/big.jpg";
			// đổi đường dẫn mặc định bằng đường dẫn mình mới tạo
			move_uploaded_file($tmp_name, $destination);
		}

		$f1 = $_FILES["anhnho"];
		if ($f1["error"] > 0) {

		} else {
			$tmp_name = $f1["tmp_name"];
			$name = $f1["name"];
			$destination = "imgs/SanPham/$id/small.jpg";

			move_uploaded_file($tmp_name, $destination);
		}
	}

?>
<div class="panel-body">
	<!-- ```````````````````FORM`````````````````````````` -->
	<form class="form-horizontal" method="POST" action="" enctype="multipart/form-data">
		<div class="form-group">
			<label for="txtProName" class="col-md-2 control-label">Tên sản phẩm</label>
			<div class="col-md-5">
				<input type="text" class="form-control" id="txttensp" name="txttensp" placeholder="Tên sản phẩm">
			</div>
		</div>
		<div class="form-group">
			<label for="txtTinyDes" class="col-md-2 control-label">Mô tả</label>
			<div class="col-md-6">
				<input type="text" class="form-control" id="txtmota" name="txtmota" placeholder="2 - 3 đặc tính nỗi bật">
			</div>
		</div>
		<div class="form-group">
			<label for="txtPrice" class="col-md-2 control-label">Giá</label>
			<div class="col-md-4">
				<input type="text" class="form-control" id="txtgia" name="txtgia" placeholder="Giá sản phẩm" onkeypress="return keypress(event)">
			</div>
		</div>
		<div class="form-group">
			<label for="selmaloai" class="col-md-2 control-label">Loại</label>
			<div class="col-md-4">
				<select id="selmaloai" name="selmaloai" class="form-control">
					<?php
						$sql = "select * from danhmuc";
						$rs = load($sql);
						while ($row = $rs->fetch_assoc()) :
					?>
					<option value="<?= $row["MaLoai"] ?>"><?= $row["TenLoai"] ?></option>
					<?php endwhile; ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="selmansx" class="col-md-2 control-label">Thương hiệu</label>
			<div class="col-md-4">
				<select id="selmansx" name="selmansx" class="form-control">
					<?php
						$sql = "select * from nsx";
						$rs = load($sql);
						while ($row = $rs->fetch_assoc()) :
					?>
					<option value="<?= $row["MaNSX"] ?>"><?= $row["TenNSX"] ?></option>
					<?php endwhile; ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="txtPrice" class="col-md-2 control-label">Số lượng</label>
			<div class="col-md-4">
				<input type="text" class="form-control" id="txtsoluong" name="txtsoluong" placeholder="số lượng sản phẩm" onkeypress="return keypress(event)">
			</div>
		</div>
		<div class="form-group">
			<label for="txtFullDes" class="col-md-2 control-label">Chi tiết</label>
			<div class="col-md-10">
				<textarea rows="6" id="txtchitiet" name="txtchitiet" class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="anhnho" class="col-md-2 control-label">Ảnh nhỏ</label>
			<div class="col-md-5">
				<input type="file" class="form-control" id="anhnho" name="anhnho">
			</div>
		</div>
		<div class="form-group">
			<label for="anhlon" class="col-md-2 control-label">Ảnh lớn</label>
			<div class="col-md-5">
				<input type="file" class="form-control" id="anhlon" name="anhlon">
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-offset-3 col-md-6" style="text-align: center">
				<button name="btnThemsanpham" type="submit" class="btn btn-success">
				<span class="glyphicon glyphicon-plus"></span>
				Thêm sản phẩm
			</div>
		</div>
	</form>
	<!-- `````````````````````````````````````````````````````````````````````` -->
</div>


