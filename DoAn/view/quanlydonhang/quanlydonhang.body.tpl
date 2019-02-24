<?php
	// //session_start();
	// if(!isset($_SESSION["dang_nhap_chua"]))
	// {
	// 	$_SESSION["dang_nhap_chua"]==0;
	// }
	// if($_SESSION["dang_nhap_chua"]==0)
	// {
	// 	header("Location: index.php");
	// }

	// xử lý
	if(isset($_POST["btnCapnhat"])){
		$madonhang = $_POST["selmadonhang"];
		$trangthai = $_POST["seltrangthai"];
		$sql_U = "update donhang set TrangThai = '$trangthai' where MaDH = $madonhang";
		write($sql_U);
	}

?>
<div class="panel panel-default">
  	<div class="panel-body">
	    <form method="post" action="">
			<div class="col-md-2">
				<select id="selmadonhang" name="selmadonhang" class="form-control">
					<?php 
						$sql = "select * from donhang";
						$rs = load($sql);
						while ($row = $rs->fetch_assoc()) :
					?>
						<option value="<?= $row["MaDH"] ?>">Đơn hàng <?= $row["MaDH"] ?></option>
					<?php endwhile; ?>
				</select>
		  	</div>
		  	<div class="col-md-2">
				<select id="seltrangthai" name="seltrangthai" class="form-control">
						<option value="chưa giao">Chưa giao</option>
						<option value="đang giao">Đang giao</option>
						<option value="đã giao">Đã giao</option>
				</select>
		  	</div>
		  	<div class="col-md-2" style="text-align: center">
				<button name="btnCapnhat" type="submit" class="btn btn-success">
					<span class="glyphicon glyphicon-refresh"></span>
					Cập nhật trạng thái
				</button>
			</div>
	  	</form>
	</div>
</div>
<div class="panel panel-default">
  	<div class="panel-body">
  		<table class="table">
  			<thead>
  				<tr>
  					<th>Mã đơn hàng</th>
  					<th>Ngày lập</th>
  					<th>Mã khách hàng</th>
  					<th>Tổng tiền</th>
  					<th>Trạng thái</th>
  				</tr>
  			</thead>
  			<tbody>
  				<?php 
					$sql1 = "select * from donhang";
					$rs1 = load($sql1);
					while($row1 = $rs1->fetch_assoc()):
				?>
  				<tr>
  					<td><?= $row1["MaDH"] ?></td>
  					<td><?= $row1["NgayLap"] ?></td>
  					<td><?= $row1["MaKH"] ?></td>
  					<td><?= number_format($row1["TongTien"]) ?></td>
  					<!-- chưa giao -->
  					<?php
  						if($row1["TrangThai"] === "chưa giao"):
  					?>
  					<td style="color: red;"><?= $row1["TrangThai"] ?></td>
  					<!-- đã giao -->
  					<?php
  						elseif($row1["TrangThai"] === "đã giao"):
  					?>
  					<td style="color: green;"><?= $row1["TrangThai"] ?></td>
  					<!--đang giao -->
  					<?php
  						else:
  					?>
  					<td style="color: blue;"><?= $row1["TrangThai"] ?></td>
  					<?php
  						endif;
  					?>
  				</tr>
  				<?php
  					endwhile;
  				?>
  			</tbody>
  		</table>
 	</div>
 </div>
