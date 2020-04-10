
$(".add").click(function(){
	$("#tip2").fadeIn(200);
});

/* 关闭 */
$("#tiptop2 a").click(function(){
$("#tip2").fadeOut(200);
});

/* 确定 */
$("#sure2").click(function(){
	//var 
	var tname = $("#tnameid").val(); 
	var dept = $("#deptid").val(); 
	var birthplace = $("#birthplaceid").val(); 
	var phone = $("#phoneid").val(); 
	var birthdate = $("#birthdateid").val(); 
	var enterdate = $("#enterdateid").val();
	var varreg = /^\d{11}$/;
	if((tname!="")&&(dept!="")&&(birthplace!="")&&(phone!="")&&(birthdate!="")&&(enterdate!="")){
		if(!varreg.test(phone)){
			alert("请输入适合的电话号码!");
		}else{
			
					$("#form1").submit();
		
		}
	}else{
		alert("请输入完整信息");
	}
	
});

/* 取消 */
$("#cancel2").click(function(){
	
$("#tip2").fadeOut(100);
});


function updateTeacher(tno){
	$("#tip3").fadeIn(200);
	$.post("selTeacherByTno",{"tno":tno},function(result){
		//alert(result);
		var data = JSON.parse(result);
		//alert(data.clazzno);
		$("#tnoid1").val(data.tno);
		$("#tnameid1").val(data.tname);
		$("#birthdateid1").val(data.birthdate);
		$("#deptid1").val(data.dept);
		$("#enterdateid1").val(data.enterdate);
		$("#birthplaceid1").val(data.birthplace); 
		$("#phoneid1").val(data.phone);
	});
	
	
	
}

/* 确定 */
$("#sure3").click(function(){
	var tname = $("#tnameid1").val();
	var birthdate = $("#birthdateid1").val();
	var dept = $("#deptid1").val();
	var enterdate = $("#enterdateid1").val();
	var birthplace = $("#birthplaceid1").val(); 
	var phone = $("#phoneid1").val();
	var varreg = /^\d{11}$/;
	
	if((tname!="")&&(dept!="")&&(birthplace!="")&&(phone!="")&&(birthdate!="")&&(enterdate!="")){	
		if(!varreg.test(phone)){
			alert("请输入合适的手机号!");
		}else{
			
				$("#form2").submit();
		}
	}else{
		alert("请输入完整信息");
	}
});
/* 关闭 */
$("#tiptop3 a").click(function(){
$("#tip3").fadeOut(200);
});
/* 取消 */
$("#cancel3").click(function(){
	
$("#tip3").fadeOut(100);
});


