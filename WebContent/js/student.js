
$(".add").click(function(){
	$("#tip2").fadeIn(200);
	$.post("selClazzs","",function(result){
		if(result.length > 0){
			var json = JSON.parse(result);
			$("#clazzno1").html("");
			for (var i = 0; i < json.length; i++) {
				
				$("#clazzno1").append("<option value="+json[i].clazzno+">"+json[i].cname+"</option>");
			}
			return;
		}else{
			alert("获取不到班级信息");
			return;
		}
	})
	
});

/* 关闭 */
$("#tiptop2 a").click(function(){
$("#tip2").fadeOut(200);
});

/* 确定 */
$("#sure2").click(function(){
	//var 
	var student = $("#studentid1").val(); 
	var birthtime = $("#birthtimeid1").val(); 
	var sname = $("#snameid1").val(); 
	var intime = $("#intimeid1").val(); 
	var birthplace = $("#birthplaceid1").val(); 
	var gender = $("#genderid1").val();
	var clazzno = $("#clazzno1").val();
	var varreg = /^\d{8}$/;
	if((student!="")&&(birthtime!="")&&(sname!="")&&(intime!="")&&(birthplace!="")&&(gender!="")&&(clazzno!="")){
		if(!varreg.test(student)){
			alert("请输入八位数字学号!");
		}else{
			$.post("selSid",{"sid":student},function(result){
				if(result=='null'){
					$("#form1").submit();
				}else{
					alert("学号已存在，请重新输入！");
				}
			})
		}
	}else{
		alert("请输入完整信息");
	}
	
});

/* 取消 */
$("#cancel2").click(function(){
	
$("#tip2").fadeOut(100);
});


function updateStudent(sno){
	$("#tip3").fadeIn(200);
	$.post("selClazzs","",function(result){
		//alert(result);
		if(result.length > 0){
			var json = JSON.parse(result);
			$("#clazzno2").html("");
			for (var i = 0; i < json.length; i++) {
				$("#clazzno2").append("<option value="+json[i].clazzno+">"+json[i].cname+"</option>");
			}
		}else{
			alert("获取不到班级信息");
		}
	})
	
	$.post("selSno",{"sno":sno},function(result){
		//alert(result);
		var data = JSON.parse(result);
		//alert(data.clazzno);
		$("#studentid").val(data.sid);
		$("#hiddenno").val(data.sid);
		$("#hiddenid").val(sno);
		$("#snameid").val(data.sname);
		$("#birthtimeid").val(data.birthtime);
		$("#intimeid").val(data.intime);
		$("#birthplaceid").val(data.birthplace); 
		$("#genderid").val(data.gender);
		$("#clazzno2").val(data.clazzno);
	});
	
	
	
}

/* 确定 */
$("#sure3").click(function(){
	var student = $("#studentid").val(); 
	var birthtime = $("#birthtimeid").val(); 
	var sname = $("#snameid").val(); 
	var intime = $("#intimeid").val(); 
	var birthplace = $("#birthplaceid").val(); 
	var gender = $("#genderid").val(); 
	var clazzno = $("#clazzno2").val(); 
	var varreg = /^\d{8}$/;
	
	if((student!="")&&(birthtime!="")&&(sname!="")&&(intime!="")&&(birthplace!="")&&(gender!="")&&(clazzno!="")){
		if(!varreg.test(student)){
			alert("请输入八位数字学号!");
		}else{
			
			if(student == $("#hiddenno").val()){
				$("#form2").submit();
			}else{
				$.post("selSid",{"sid":student},function(result){
					if(result!="null"){
						alert("学号已存在，请重新输入！");
					}else{
						$("#form2").submit();
					}
				})
			}
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


