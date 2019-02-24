<!-- trang này dùng để xử lý vỏ hàng. lấy thông tin từ trang ctsp xử lý và quây lại trang ctsp  -->
<?php

require_once 'giohang.inc';

	//kiểm tra nút "btnthemvaogio" đã được bấm chưa, nếu rồi sẽ lấy thông tin từ form ở trang ctsp
if (isset($_POST["btnthemvaogio"])) {
	$masp = $_POST["txtmasp"];
	$sl	 = $_POST["txtsoluong"];
	
	// gọi hàm thêm sản phẩm truyền vào tham số được lấy từ form
	add_item($masp, $sl);

	//trở về trang vừa rời đi (ở đây là trang chi tiết sp)
	if (isset($_SERVER['HTTP_REFERER'])) {
	    $url = $_SERVER['HTTP_REFERER'];
	    header("location: $url");
	}
}