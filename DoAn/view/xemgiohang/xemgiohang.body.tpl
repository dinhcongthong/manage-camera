<?php
	if(isset($_SESSION["ten_taikhoan"]->MaKH)){
		$makh = $_SESSION["ten_taikhoan"]->MaKH;
	}
?>
<!-- form sẽ lấy dữ liệu khi script bên layout thực thi các hàm và dữ liệu từ form được gửi qua trang capnhatgiohang.inc.php -->
<form id="f-giohang" method="post" action="capnhatgiohang.inc.php">
	<input type="hidden" id="txtCmd" name="txtCmd">
	<input type="hidden" id="txtXoaSP" name="txtXoaSP">
	<input type="hidden" id="txtCapnhatSL" name="txtCapnhatSL">
</form>
<table class="table">
	<thead>
		<tr>
			<th class="col-md-4">Sản phẩm</th>
			<th class="col-md-2">Giá</th>
			<th class="col-md-3" style="padding-left: 30px">Số lượng</th>
			<th>Thành tiền</th>
			<th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		<?php
			$TongTien = 0;
			foreach ($_SESSION["giohang"] as $masp => $sl) :
				$sql = "select * from SanPham where MaSP = $masp";
				$rs = load($sql);
				$row = $rs->fetch_assoc();
				$Tongtien_1_sp = $sl * $row["Gia"];
				$TongTien += $Tongtien_1_sp;
		?>
		<tr>
			<td><?= $row["TenSP"] ?></td>
			<td><?= number_format($row["Gia"]) ?></td>
			<td>
				<div class="col-md-6">
					<!-- hàm touchpin của input tăng số lượng sp này được để bên layout -->
					<b>
						<!-- số lượng được xử lý bằng script bên layout -->
						<input type="text" class="txtsoluong-sp" name="" id="" value="<?= $sl ?>">
					</b>
				</div>
				<!-- nút cập nhật -->
				<!-- được xử lý sự kiện bằng script bên layout -->
				<a class="btn btn-xs btn-success btncapnhat" data-id="<?= $masp ?>" href="javascript:;" role="button">
					<span class="glyphicon glyphicon-ok"></span>
				</a>
			</td>
			<td><?= number_format($Tongtien_1_sp) ?></td>
			<td>&nbsp;</td>
			<td class="text-right">
				<!-- nút xóa -->
				<!-- được xử lý sự kiện bằng script bên layout -->
				<a class="btn btn-xs btn-danger btnxoa" data-id="<?= $masp ?>" href="javascript:;" role="button">
					<span class="glyphicon glyphicon-remove"></span>
				</a>
			</td>
		</tr>
		<?php
			endforeach;
		?>
	</tbody>
	<tbody>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>
				<h4 style="color: red;" name="tongtien"><?= number_format($TongTien) ?></h4>
			</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<?php
				if($_SESSION["dang_nhap_chua"]==0):
			?>
			<td>&nbsp;</td>
			<?php
				else:
			?>
			<td>
				<a class="btn btn-default" role="button" href="lichsumuahang.php?" name="btnlichsu">
					<span class="glyphicon glyphicon-dashboard"></span>
					Lịch sử mua hàng
				</a>
			</td>
			<?php
				endif;
			?>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<!-- ```````````````CHƯA ĐĂNG NHẬP SẺ CHUYỂN TỚI TRANG ĐĂNG NHẬP KHI NHẤN THANH TOÁN`````````````-->
			<!-- && nếu giỏ hàng rỗng sẽ ko hiện thanh toán -->
			<?php
				if($_SESSION["dang_nhap_chua"]==0 && !empty($_SESSION["giohang"])):
			?>
			<td>
				<a class="btn btn-primary" role="button" href="dangnhap.php" name="btnthanhtoan">
					<span class="glyphicon glyphicon-list-alt"></span>
					Thanh toán
				</a>
			</td>
			<!-- `````````````````ĐÃ ĐĂNG NHẬP THÌ CHO PHÉP THANH TOÁN NẾU GIỎ HÀNG KHÔNG RỖNG`````````` -->
			<?php
				// nếu giỏ hàng rỗng thì ko hiển thị nút thanh toán
				elseif(!empty($_SESSION["giohang"])):
			?>
			<form id="f-thanhtoan" name="f-thanhtoan" method="post" action="thanhtoan.inc.php">
				<input type="hidden" id="txtTongtien" name="txtTongtien" value="<?= $TongTien ?>">
				<input type="hidden" id="txtCmd1" name="txtCmd1">
			</form>
			<td>
				<a class="btn btn-primary btnthanhtoan" id="btnthanhtoan" role="button" name="btnthanhtoan">
					<span class="glyphicon glyphicon-list-alt"></span>
					Thanh toán
				</a>
			</td>
			<?php
				endif;
			?>

			<td>
				<a class="btn btn-success" href="index.php" role="button">
					<span class="glyphicon glyphicon-thumbs-up"></span>
					Mua tiếp
				</a>
			</td>
		</tr>
	</tfoot>
</table>
