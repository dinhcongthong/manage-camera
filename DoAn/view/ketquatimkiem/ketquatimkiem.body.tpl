<?php
	if(isset($_REQUEST["btntimkiem"])){
		// Gán hàm addslashes để chống sql injection (khi nhập liệu bậy bạ thêm sau ở đường dẫn)
		$tukhoa = addslashes($_GET["timkiem"]);
	}

	// ````````````````````````````````````````````````````````
		$limit = 8;
		$current_page = 1;
		if (isset($_GET["page"])) {
			$current_page = $_GET["page"];
		}
		$next_page = $current_page + 1;
		$prev_page = $current_page - 1;
		$c_sql = "select count(*) as num_rows from sanpham where TenSP like '%$tukhoa%'"; //lấy tổng số sản phẩm có trong csdl
		$c_rs = load($c_sql); //load vào biến c_rs
		$c_row = $c_rs->fetch_assoc();
		$num_rows = $c_row["num_rows"];
		$num_pages = ceil($num_rows / $limit); //làm tròn lên
		if ($current_page < 1 || $current_page > $num_pages) {
			$current_page = 1;
		}
		$offset = ($current_page - 1) * $limit;
	// ````````````````````````````````````````````````````````

	if(empty($tukhoa)){
		echo "Xin hãy nhập từ khóa tìm kiếm !";
	}
	else{
		$sql = "select * from sanpham where TenSP like '%$tukhoa%' limit $offset, $limit";
		$rs = load($sql);
		if($rs->num_rows > 0):
			while($row = $rs->fetch_assoc()):
?>			
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail" style="height: 400px">
					<a href="chitietSP.php?masp=<?= $row["MaSP"]?>">
						<img src="imgs/SanPham/<?= $row["MaSP"] ?>/small.jpg" alt="...">
					</a>
					<div class="caption">
						<h5 style="font-weight: bold;"><?= $row["TenSP"] ?></h5>
						<h4 style="color: red;"><?= number_format($row["Gia"]) ?> VND</h4>
						<p style="height: 30px"><?= $row["DanhGia"] ?></p>
						<br>
						<div class="container-fluid">
							<div class="col-md-1">
								<a href="chitietSP.php?masp=<?= $row["MaSP"]?>" class="btn btn-primary" role="button">Chi tiết</a>
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
							</div>
						</div>
					</div>
				</div>
			</div>
<?php
			endwhile;
?>
<!-- `````````````````````````Phân trang nếu có kết quả tìm kiếm```````````````````` -->
	<tfood class="col-md-2 col-md-offset-5">
		<ul class="pager">
			<?php if ($prev_page > 0) : ?>
			<li>
				<a href="?timkiem=<?= $tukhoa ?>&btntimkiem=&page=<?= $prev_page ?>" role="button">
					<span class="glyphicon glyphicon-chevron-left"></span>
					Trước
				</a>
			</li>	
			<?php endif; ?>

			<?php if ($next_page <= $num_pages) : ?>
			<li>
				<a href="?timkiem=<?= $tukhoa ?>&btntimkiem=&page=<?= $next_page ?>" role="button">
					Tiếp
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</li>
			<?php endif; ?>
		</ul>
	</tfoot>
<!-- ``````````````````````````````````````````````````````````````````````````` -->
<?php			
		else:
			echo "Không tìm thấy kết quả tìm kiếm";
		endif;
	}
?>


