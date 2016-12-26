$(".employee-modify").click(function(){
	$("#employee-form").show();
	var eID = $(this).parents("tr").find(".eID").text();
	var eName = $(this).parents("tr").find(".eName").text();
	var phoneNum = $(this).parents("tr").find(".phoneNum").text();
	var email = $(this).parents("tr").find(".email").text();
	var permission = $(this).parents("tr").find(".permission").text();

	$("#employee-form .form-eID").val(eID);
	$("#employee-form .form-eName").val(eName);
	$("#employee-form .form-phoneNum").val(phoneNum);
	$("#employee-form .form-email").val(email);
	$("#employee-form .form-permission").val(permission);
	
	return false;
});

$("#create-employee").click(function(){
	$("#employee-form").show();

	$("#employee-form .form-eID").val("");
	$("#employee-form .form-eName").val("");
	$("#employee-form .form-phoneNum").val("");
	$("#employee-form .form-email").val("");
	$("#employee-form .form-permission").val("");

	return false;
});

$(".goods-modify").click(function(){
	$("#goods-form").show();
	var gName = $(this).parents("tr").find(".gName").text();
	var price = $(this).parents("tr").find(".price").text();
	var type = $(this).parents("tr").find(".type").text();
	var discount = $(this).parents("tr").find(".discount").text();
	var date = $(this).parents("tr").find(".date").text();
	var expiredDate = $(this).parents("tr").find(".expired-date").text();
	var offerBy = $(this).parents("tr").find(".offerBy").text();
	var size = $(this).parents("tr").find(".size").text();

	$("#goods-form .form-gName").val(gName);
	$("#goods-form .form-price").val(price);
	$("#goods-form .form-type").val(type);
	$("#goods-form .form-discount").val(discount);
	$("#goods-form .form-date").val(date);
	$("#goods-form .form-expired-date").val(expiredDate);
	$("#goods-form .form-offerBy").val(offerBy);
	$("#goods-form .form-size").val(size);
	return false;
});

$("#create-goods").click(function(){
	$("#goods-form").show();

	$("#goods-form .form-gName").val("");
	$("#goods-form .form-price").val("");
	$("#goods-form .form-type").val("");
	$("#goods-form .form-discount").val("");
	$("#goods-form .form-date").val("");
	$("#goods-form .form-expired-date").val("");
	$("#goods-form .form-offerBy").val("");
	$("#goods-form .form-size").val("");

	return false;
});
