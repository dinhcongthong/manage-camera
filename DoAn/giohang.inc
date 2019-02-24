<!-- trang này chứa các hàm xử lý -->
<?php
// khởi tạo session
session_start();
// kiểm tra xem session giỏ hàng tồn tại chưa, nếu chưa ta tạo nó và gán cho nó 1 cái mảng 
if(!isset($_SESSION["giohang"]))
{
	$_SESSION["giohang"] = array();
}

function add_item($masp, $sl) {
	// kiểm tra xem trong session[giohang] đã có phần tử "masp"->key nào chưa
	//nếu trong session đã có p.từ masp này rồi thì khi thêm sp có masp này ta sẽ cộng dồn sl
	
	if (array_key_exists($masp, $_SESSION["giohang"])) {
		$_SESSION["giohang"][$masp] += $sl;
	} else {
		//ngược lại ta sẽ thêm masp->sl này vào session
		$_SESSION["giohang"][$masp] = $sl;
	}
}

function delete_item($masp) {
	unset($_SESSION["giohang"][$masp]);
}

function update_item($masp, $sl) {
	$_SESSION["giohang"][$masp] = $sl;
}

function get_total_items() {
	$tongSL = 0;
	foreach ($_SESSION["giohang"] as $masp => $sl) {
		$tongSL += $sl;
	}

	return $tongSL;
}