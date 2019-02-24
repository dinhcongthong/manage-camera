<?php
// kt đk nếu trên link có masp thì lấy masp và update lượt LuotXem 
	if(isset($_GET["masp"]))
	{
		$masp =  $_GET["masp"];
		$luotxem_sql = "update sanpham set LuotXem = LuotXem + 1 where MaSP = $masp";
		write($luotxem_sql);
		// $luotxem_row = $luotxem_rs->fetch_assoc();
	}
?>
<div class="container-fluid">
	<div class="col-md-6" style="text-align: center;">
		<img src="imgs/SanPham/<?= $masp ?>/big.jpg" alt="...">
	</div>

	<div class="col-md-6">
		<?php
			$sql = "select * from sanpham where MaSP = $masp";
			$rs = load($sql);
			while($row = $rs->fetch_assoc()):
		?>
			<div class="tensp" style="text-align: center;">
				<h3 style="font-weight: bold;"> <?= $row["TenSP"]?> </h3>
			</div>
			<h4 style="padding-left: 20px;">Tính năng nổi bật</h4>
			<div style="padding-left: 20px;">
				<p>
					<?= $row["ChiTiet"] ?>
				</p>
			</div>
			<div style="padding-left: 20px;">
				<div class="luotxem" style="color: #0032B9;">
					<b style="font-size: 13pt">Lượt xem : <?= $row["LuotXem"]?> </b>
					&nbsp;
					<!-- Hiển thị lượt xem -->
					<span class="glyphicon glyphicon-eye-open"></span>
				</div>
				<div class="soluong" style="color: #1BA261;">
					<b style="font-size: 13pt">Hàng còn: <?= $row["SoLuong"]?> chiếc</b>
					&nbsp;
					<!-- Hiển thị lượt xem -->
					<!-- <span class="glyphicon glyphicon-eye-open"></span> -->
				</div>
				<p>
					<b style="font-size: 13pt;"> Giá bán: </b>
					<b style="color: red; font-size: 17pt; margin-left: 10px;"><?= number_format($row["Gia"]) ?> đ</b>
				</p>
			</div>
		<?php
			endwhile;
		?>
		<!-- Hành động bấm nút thêm vào giỏ hàng sẽ gửi qua trang  "themhangvaogio.inc.php"-->
		<form method="post" action="themhangvaogio.inc.php"> 
			<div class="row">
				<div class="col-md-3" style="text-align: left; line-height: 20px; padding-left:35px">
					<h4>Số lượng: </h4> 
				</div>
				<div class="col-md-3">
					<div class="input-group">
						<!-- một text box để nhận số lượng của sản phẩm, được post đi khi nhấn submid-->
						<input type="text" class="form-control" name="txtsoluong" id="txtsoluong" value="1">
					</div><!-- /input-group-->
				</div>
			</div><!-- /.row -->
				<div class="col-md-5 col-md-offset-2" style="margin-top: 20px;">
					<!-- một text box nhận mã sp được post đi khi nhấn submid -->
					<input type="hidden" name="txtmasp" value="<?= $_GET["masp"] ?>">
					<button type="submit" name="btnthemvaogio" class="btn" style="width: 400px; background-color: #5CB85C; color: #FFF;">
						<span class="glyphicon glyphicon-shopping-cart" style="font-size: 16pt;"></span>
						&nbsp;
						<b style="font-size: 16pt;" >Thêm vào giỏ</b>
					</button>
				</div>
		</form>
	</div>
</div>
<hr>
<!-- hiển thị sản phầm cùng loại -->
<h5 style="color: red;">Sản phẩm cùng loại</h5>
<hr>
<div class="container-fluid">
	<?php
		// lấy mã loại
		$ml_sql = "select * from sanpham where MaSP = $masp";
		$ml_rs = load($ml_sql);
		$ml_row = $ml_rs->fetch_assoc();
		
		$maloai = $ml_row["MaLoai"];
		// lấy ra sl sản phẩm của loại đang xem
		$sql_dem = "select count(*) as dem from sanpham where MaLoai = $maloai";
		$rs_dem = load($sql_dem);
		$row_dem = $rs_dem->fetch_assoc();
		$sl = $row_dem["dem"];

		$min = 0;
		// kiểm tra đk vì nếu ta thêm 1sp của 1 loại mới thì sp của loại đó lúc này chỉ có 1, lúc này cho max bằng 1 đồng nghĩa auto vị trí bắt đầu là 1
		if($sl < 5)
		{
			$vtri = 0;
		}
		else
		{
			// sl-5 vì nếu lấy 5 sp mà ta chọn 5 sp cuối sẽ ko thể hiện ra 5 sp tiếp
			$max = $sl-5;
			// ta random vitri bắt đầu lấy nếu ko mõi lần bấm vào sp cùng loại thì chỉ lẩn quẩn 5 sp đầu tiên
			$vtri = rand($min, $max);
		}
		
		$sp_sql = "select * from sanpham where MaLoai = $maloai limit $vtri,5";
		$sp_rs = load($sp_sql);
		
		while($sp_row = $sp_rs->fetch_assoc()):
	?>
		<div class="col-md-2" style="text-align: center; margin-left: 30px;">
			<a href="chitietSP.php?masp=<?= $sp_row["MaSP"]?>&">
				<img src="imgs/SanPham/<?= $sp_row["MaSP"]?>/small.jpg" alt="..." width="170">
			</a>
			<br>
			<b><?= $sp_row["TenSP"] ?></b>
		</div>
	<?php
		endwhile;
	?>
</div>
<hr>
<!-- hiển thị sản có cùng thương hiệu -->
<h5 style="color: red;">Sản phẩm cùng thương hiệu</h5>
<hr>
<div class="container-fluid">
	<?php
		$mansx = $ml_row["MaNSX"];

		// lấy ra sl sản phẩm của nhà sản xuất đang xem
		$sql_dem1 = "select count(*) as dem from sanpham where MaNSX = $mansx";
		$rs_dem1 = load($sql_dem1);
		$row_dem1 = $rs_dem1->fetch_assoc();
		$sl1 = $row_dem1["dem"];

		$min1 = 0;
		if($sl1 < 5)
		{
			$vtri1 = 0;
		}
		else
		{
			// sl-5 vì nếu lấy 5 sp mà ta chọn 5 sp cuối sẽ ko thể hiện ra 5 sp tiếp
			$max1 = $sl1 - 5;
			// ta random vitri bắt đầu lấy nếu ko mõi lần bấm vào sp cùng loại thì chỉ lẩn quẩn 5 sp đầu tiên
			$vtri1 = rand($min1, $max1);
		}


		$sp1_sql = "select * from sanpham where MaNSX = $mansx limit $vtri1,5";
		$sp1_rs = load($sp1_sql);
		while($sp1_row = $sp1_rs->fetch_assoc()):
	?>
		<!-- khi nhấn vào những sản phẩm sẽ được dẫn đến trang chi tiết cungd với mã của sp -->
		<div class="col-md-2" style="text-align: center; margin-left: 30px;">
			<a href="chitietSP.php?masp=<?= $sp1_row["MaSP"]?>&">
				<img src="imgs/SanPham/<?= $sp1_row["MaSP"]?>/small.jpg" alt="..." width="170">
			</a>
			<br>
			<b><?= $sp1_row["TenSP"] ?></b>
		</div>
	<?php
		endwhile;
	?>
</div>

<!-- Xử lý nút tăng giảm số lượng bên cuối trang layout -->
