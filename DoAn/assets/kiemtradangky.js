function Kiemtra1()
{
	if(f_dk.taikhoan.value.length === 0 || f_dk.taikhoan.value.length > 100)
	{
		document.getElementById('stk').innerHTML = "Error"; stk.style.color = "red";
	}
	else
	{
		document.getElementById('stk').innerHTML = "Ok"; stk.style.color = "green";
	}

	if(f_dk.matkhau.value.length === 0 || f_dk.matkhau.value.length > 20)
	{
		document.getElementById('smk').innerHTML = "Error"; smk.style.color = "red";
	}
	else
	{
		document.getElementById('smk').innerHTML = "Ok"; smk.style.color = "green";
	}

	if(f_dk.tenkh.value.length === 0 || f_dk.tenkh.value.length > 100 || !isNaN(f_dk.tenkh.value))
	{
		document.getElementById('stkh').innerHTML = "Error"; stkh.style.color = "red";
	}
	else
	{
		document.getElementById('stkh').innerHTML = "Ok"; stkh.style.color = "green";
	}

	if(f_dk.nam.value.length === 0 || isNaN(f_dk.nam.value) || f_dk.nam.value < 1900)
	{
		document.getElementById('sns').innerHTML = "Error"; sns.style.color = "red";
	}
	else
	{
		document.getElementById('sns').innerHTML = "Ok"; sns.style.color = "green";
	}
	if(f_dk.sdt.value.length === 0 || f_dk.sdt.value.length > 11 || f_dk.sdt.value.length < 10 || isNaN(f_dk.sdt.value))
	{
		document.getElementById('ssdt').innerHTML = "Error"; ssdt.style.color = "red";
	}
	else
	{
		document.getElementById('ssdt').innerHTML = "Ok"; ssdt.style.color = "green";
	}
	if(f_dk.diachi.value.length === 0 )
	{
		document.getElementById('sdc').innerHTML = "Error"; sdc.style.color = "red";
	}
	else
	{
		document.getElementById('sdc').innerHTML = "Ok"; sdc.style.color = "green";
	}
	if(f_dk.email.value.indexOf('@gmail.com') === -1 && f_dk.email.value.indexOf('@yahoo.com') === -1)
	{
		document.getElementById('semail').innerHTML = "Error"; semail.style.color = "red";
	}
	else
	{
		document.getElementById('semail').innerHTML = "Ok"; semail.style.color = "green";
	}
}


function Kiemtra2()
{
	if(f_dk.taikhoan.value.length === 0 || f_dk.taikhoan.value.length > 100)
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}

	if(f_dk.matkhau.value.length === 0 || f_dk.matkhau.value.length > 20)
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}

	if(f_dk.tenkh.value.length === 0 || f_dk.tenkh.value.length > 100 || !isNaN(f_dk.tenkh.value))
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}

	if(f_dk.nam.value.length === 0 || isNaN(f_dk.nam.value) || f_dk.nam.value < 1900)
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}
	if(f_dk.sdt.value.length === 0 || f_dk.sdt.value.length > 11 || f_dk.sdt.value.length < 10 || isNaN(f_dk.sdt.value))
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}
	if(f_dk.diachi.value.length === 0 )
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}
	if(f_dk.email.value.indexOf('@gmail.com') === -1 && f_dk.email.value.indexOf('@yahoo.com') === -1)
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}
	return true;
}

function Kiemtra3()
{
	if(f_dk.tenkh.value.length === 0 || f_dk.tenkh.value.length > 100 || !isNaN(f_dk.tenkh.value))
	{
		document.getElementById('stkh').innerHTML = "Error"; stkh.style.color = "red";
	}
	else
	{
		document.getElementById('stkh').innerHTML = "Ok"; stkh.style.color = "green";
	}

	if(f_dk.email.value.indexOf('@gmail.com') === -1 && f_dk.email.value.indexOf('@yahoo.com') === -1)
	{
		document.getElementById('semail').innerHTML = "Error"; semail.style.color = "red";
	}
	else
	{
		document.getElementById('semail').innerHTML = "Ok"; semail.style.color = "green";
	}

	if(f_dk.sdt.value.length === 0 || f_dk.sdt.value.length > 11 || f_dk.sdt.value.length < 10 || isNaN(f_dk.sdt.value))
	{
		document.getElementById('ssdt').innerHTML = "Error"; ssdt.style.color = "red";
	}
	else
	{
		document.getElementById('ssdt').innerHTML = "Ok"; ssdt.style.color = "green";
	}

	if(f_dk.nam.value.length === 0 || isNaN(f_dk.nam.value) || f_dk.nam.value < 1900)
	{
		document.getElementById('sns').innerHTML = "Error"; sns.style.color = "red";
	}
	else
	{
		document.getElementById('sns').innerHTML = "Ok"; sns.style.color = "green";
	}
	
	if(f_dk.diachi.value.length === 0 )
	{
		document.getElementById('sdc').innerHTML = "Error"; sdc.style.color = "red";
	}
	else
	{
		document.getElementById('sdc').innerHTML = "Ok"; sdc.style.color = "green";
	}
	
}

function Kiemtra4()
{
	if(f_dk.tenkh.value.length === 0 || f_dk.tenkh.value.length > 100 || !isNaN(f_dk.tenkh.value))
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}
	
	if(f_dk.email.value.indexOf('@gmail.com') === -1 && f_dk.email.value.indexOf('@yahoo.com') === -1)
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}

	if(f_dk.sdt.value.length === 0 || f_dk.sdt.value.length > 11 || f_dk.sdt.value.length < 10 || isNaN(f_dk.sdt.value))
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}

	if(f_dk.nam.value.length === 0 || isNaN(f_dk.nam.value) || f_dk.nam.value < 1900)
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}
	
	if(f_dk.diachi.value.length === 0 )
	{
		alert('Vui lòng kiểm tra lại thông tin đã nhập!');
		return false;
	}
	return true;
}