<div class="row">
	<center><h4 style="color: #00BB27;" >
		<span class="glyphicon glyphicon-star-empty"></span>
		&nbsp;
		<b> Sản phẩm được xem nhiều nhất </b>
		&nbsp;
		<span class="glyphicon glyphicon-star-empty"></span>
	</h4></center>
	<hr>
	<?php
		$limit = 10;
		
		// sắp xếp số lượt xem giảm dần từ trên xuống và xuất ra với giới hạn
		$sql = "select * from sanpham order by LuotXem DESC limit $limit";
		$rs = load($sql);
		if ($rs->num_rows > 0) :
			while ($row = $rs->fetch_assoc()) :
	?>
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail" style="height: 400px">
				<a href="chitietSP.php?masp=<?= $row["MaSP"]?>&">
					<img src="imgs/SanPham/<?= $row["MaSP"] ?>/small.jpg" alt="...">
				</a>
				<div class="caption">
					<h5><?= $row["TenSP"] ?></h5>
					<h4 style="color: red;"><?= number_format($row["Gia"]) ?> VND</h4>
					<p style="height: 30px"><?= $row["DanhGia"] ?></p>
					<br>
					<div class="container-fluid">
					<div class="col-md-1">
						<a href="chitietSP.php?masp=<?= $row["MaSP"]?>&" class="btn btn-primary" role="button">Chi tiết</a>
						<!-- nếu đăng nhập sẽ hiện nút đặt mua -->
						<!-- <?php
							// if($_SESSION["dang_nhap_chua"]==1):
						?> -->
					</div>
					<div class="col-md-1 col-md-offset-3">
						<!-- Hành động bấm nút thêm vào giỏ hàng sẽ gửi qua trang  "themhangvaogio.inc.php"-->
						<form method="post" action="themhangvaogio.inc.php">
							<input type="hidden" name="txtmasp" value="<?= $row["MaSP"] ?>">
							<!-- một text box để nhận số lượng của sản phẩm (cho mặc đinh bằng 1)-->
							<input type="hidden" name="txtsoluong" value="1">
							<button class="btn btn-success" role="button" type="submit" name="btnthemvaogio">
								<span class="glyphicon glyphicon-shopping-cart"></span>
								Đặt mua
							</button>
						</form>
						<!-- <?php
							// endif;
						?> -->
					</div>
				</div>
				</div>
			</div>
		</div>
	<?php
			endwhile;
		else :
	?>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			Không có sản phẩm.
		</div>
	<?php
		endif;
	?>
</div>
<hr>
<center>
	<h4 style="color: #00BB27;" >
		<span class="glyphicon glyphicon-star-empty"></span>
		&nbsp;
		<b>Sản phẩm mới nhất</b>
		&nbsp;
		<span class="glyphicon glyphicon-star-empty"></span>
	</h4>
</center>
<hr>
<div class="row">
	<?php
		$limit = 10;
		
		// sắp xếp số lượt xem giảm dần từ trên xuống và xuất ra với giới hạn
		$sql1 = "select * from sanpham order by NgayNhap DESC limit $limit";
		$rs1 = load($sql1);
		if ($rs1->num_rows > 0) :
			while ($row1 = $rs1->fetch_assoc()) :
	?>
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail" style="height: 400px">
				<a href="chitietSP.php?masp=<?= $row1["MaSP"]?>&">
					<img src="imgs/SanPham/<?= $row1["MaSP"] ?>/small.jpg" alt="...">
				</a>
				<div class="caption">
					<h5><?= $row1["TenSP"] ?></h5>
					<h4 style="color: red;"><?= number_format($row1["Gia"]) ?> VND</h4>
					<p style="height: 30px"><?= $row1["DanhGia"] ?></p>
					<br>
					<div class="container-fluid">
					<div class="col-md-1">
						<a href="chitietSP.php?masp=<?= $row1["MaSP"]?>&" class="btn btn-primary" role="button">Chi tiết</a>
						<!-- nếu đăng nhập sẽ hiện nút đặt mua -->
						<!-- <?php
							// if($_SESSION["dang_nhap_chua"]==1):
						?> -->
					</div>
					<div class="col-md-1 col-md-offset-3">
						<!-- Hành động bấm nút thêm vào giỏ hàng sẽ gửi qua trang  "themhangvaogio.inc.php"-->
						<form method="post" action="themhangvaogio.inc.php">
							<input type="hidden" name="txtmasp" value="<?= $row1["MaSP"] ?>">
							<!-- một text box để nhận số lượng của sản phẩm (cho mặc đinh bằng 1)-->
							<input type="hidden" name="txtsoluong" value="1">
							<button class="btn btn-success" role="button" type="submit" name="btnthemvaogio">
								<span class="glyphicon glyphicon-shopping-cart"></span>
								Đặt mua
							</button>
						</form>
						<!-- <?php
							// endif;
						?> -->
					</div>
				</div>
				</div>
			</div>
		</div>
	<?php
			endwhile;
		else :
	?>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			Không có sản phẩm.
		</div>
	<?php
		endif;
	?>
	<!-- `````````````````````````````````````````````` -->
</div>
<hr>
<center>
	<h4 style="color: #00BB27;" >
		<span class="glyphicon glyphicon-star-empty"></span>
		&nbsp;
		<b>Sản phẩm bán chạy nhất</b>
		&nbsp;
		<span class="glyphicon glyphicon-star-empty"></span>
	</h4>
</center>
<hr>
<div class="row">
	<?php
		$limit = 10;
		
		// sắp xếp số lượt xem giảm dần từ trên xuống và xuất ra với giới hạn
		$sql2 = "select * from sanpham order by SoLuongDaBan DESC limit $limit";
		$rs2 = load($sql2);
		if ($rs2->num_rows > 0) :
			while ($row2 = $rs2->fetch_assoc()) :
	?>
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail" style="height: 400px">
				<a href="chitietSP.php?masp=<?= $row2["MaSP"]?>&">
					<img src="imgs/SanPham/<?= $row2["MaSP"] ?>/small.jpg" alt="...">
				</a>
				<div class="caption">
					<h5><?= $row2["TenSP"] ?></h5>
					<h4 style="color: red;"><?= number_format($row2["Gia"]) ?> VND</h4>
					<p style="height: 30px"><?= $row2["DanhGia"] ?></p>
					<br>
					<div class="container-fluid">
					<div class="col-md-1">
						<a href="chitietSP.php?masp=<?= $row2["MaSP"]?>&" class="btn btn-primary" role="button">Chi tiết</a>
						<!-- nếu đăng nhập sẽ hiện nút đặt mua -->
						<!-- <?php
							// if($_SESSION["dang_nhap_chua"]==1):
						?> -->
					</div>
					<div class="col-md-1 col-md-offset-3">
						<!-- Hành động bấm nút thêm vào giỏ hàng sẽ gửi qua trang  "themhangvaogio.inc.php"-->
						<form method="post" action="themhangvaogio.inc.php">
							<input type="hidden" name="txtmasp" value="<?= $row2["MaSP"] ?>">
							<!-- một text box để nhận số lượng của sản phẩm (cho mặc đinh bằng 1)-->
							<input type="hidden" name="txtsoluong" value="1">
							<button class="btn btn-success" role="button" type="submit" name="btnthemvaogio">
								<span class="glyphicon glyphicon-shopping-cart"></span>
								Đặt mua
							</button>
						</form>
						<!-- <?php
							// endif;
						?> -->
					</div>
				</div>
				</div>
			</div>
		</div>
	<?php
			endwhile;
		else :
	?>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			Không có sản phẩm.
		</div>
	<?php
		endif;
	?>
</div>