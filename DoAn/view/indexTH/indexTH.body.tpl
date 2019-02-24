<div class="row">
	<?php

		$idth = $_GET["idth"];

		$limit = 7;
		$current_page = 1;

		if (isset($_GET["page"])) {
			$current_page = $_GET["page"];
		}

		$Tien = $current_page + 1;
		$Lui = $current_page - 1;

		$c_sql = "select count(*) as num_rows from sanpham where MaNSX = $idth";
		$c_rs = load($c_sql);
		$c_row = $c_rs->fetch_assoc();
		$num_rows = $c_row["num_rows"];
		$num_pages = ceil($num_rows / $limit);
		

		if ($current_page < 1 || $current_page > $num_pages) {
			$current_page = 1;
		}

		$offset = ($current_page - 1) * $limit;
		$sql = "select * from sanpham where MaNSX = $idth limit $offset, $limit";
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
				<h5 style="font-weight: bold;"><?= $row["TenSP"] ?></h5>
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
							<!-- một text box để nhận số lượng của sản phẩm (cho mặc định bằng 1 luôn)-->
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
		Không có sản phẩm này
	<?php
		endif;
	?>
</div>

<tfood class="col-md-2 col-md-offset-5">
	<ul class="pager">	
		<?php if ($Lui > 0) : ?>
		<li>
			<a href="?idth=<?= $idth ?>&page=<?= $Lui ?>" role="button">
				<span class="glyphicon glyphicon-chevron-left"></span>
				Trước
			</a>
		</li>
		<?php endif; ?>
		<?php if ($Tien <= $num_pages) : ?>
		<li>
			<a href="?idth=<?= $idth ?>&page=<?= $Tien ?>" role="button">
				Tiếp
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</li>
		<?php endif; ?>
	</ul>
</tfood>