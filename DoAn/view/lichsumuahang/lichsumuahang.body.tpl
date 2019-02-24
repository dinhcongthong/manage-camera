<?php
	if(isset($_SESSION["ten_taikhoan"]->MaKH)){
		$ma_kh = $_SESSION["ten_taikhoan"]->MaKH;
		$sql = "select * from donhang where MaKH = $ma_kh order by NgayLap DESC";
		$rs = load($sql);
	}
?>

<table class="table">
	<?php
		while ($row = $rs->fetch_assoc()):
			if($row["TrangThai"] === "chưa giao"){
				$trangthai = "chưa nhận";
			}elseif ($row["TrangThai"] === "đã giao") {
				$trangthai = "đã nhận";
			}else{
				$trangthai = "đang giao";
			}
	?>
	<thead>
		<tr style="color: red;">
			<th>Mã đơn hàng: <?= $row["MaDH"] ?> </th>
			<th>Ngày/giờ lập: <?= $row["NgayLap"] ?></th>
			<th>Tổng tiền: <?= number_format($row["TongTien"]) ?></th>
			<th>(<?= $trangthai ?>)</th>
		</tr>
	</thead>
	<tbody>
		<?php
			$ma_hd = $row["MaDH"];

			$sql1 = "select * from ct_donhang where MaDH = $ma_hd";
			$rs1 = load($sql1);

			while($row1 = $rs1->fetch_assoc()):
				$ma_sp = $row1["MaSP"];

				$sql_tensp = "select * from sanpham where MaSP = $ma_sp";
				$rs_tensp = load($sql_tensp);
				$row_tensp = $rs_tensp->fetch_assoc();
		?>
		<tr>
			<td>&nbsp;</td>
			<td><?= $row_tensp["TenSP"] ?></td>
			<td>Mã SP: <?= $row1["MaSP"] ?></td>
			<td>Số lượng: <?= $row1["Soluong"] ?></td>
			<td>Giá: <?= number_format($row1["GiaSP"]) ?></td>
			<td>Thành tiền: <?= number_format($row1["ThanhTien"]) ?></td>
		</tr>
		<?php
			endwhile;
		?>
	</tbody>
	<?php
		endwhile;
	?>
</table>
	

