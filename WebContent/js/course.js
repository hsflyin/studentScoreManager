
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
	var cname = $("#cnameid").val(); 
	var credit = $("#creditid").val(); 
	var preiodstart = $("#preiodid").val(); 
	var preiodend = $("#preiodendid").val(); 
	if((cname!="")&&(credit!="")&&(preiodstart!="")&&(preiodend!="")){
	
			
					$("#form1").submit();
		
	}else{
		alert("请输入完整信息");
	}
	
});

/* 取消 */
$("#cancel2").click(function(){
	
$("#tip2").fadeOut(100);
});


function updateCourse(cno){
	$("#tip3").fadeIn(200);
	$.post("selCourseByCno",{"cno":cno},function(result){
		//alert(result);
		var data = JSON.parse(result);
		$("#cnoid1").val(data.cno);
		$("#creditid1").val(data.credit);
		$("#cnameid1").val(data.cname);
		$("#preiodstartid1").val(data.preiodstart);
		$("#preiodendid1").val(data.preiodend);
	});
	
	
	
}

/* 确定 */
$("#sure3").click(function(){
	var credit = $("#creditid1").val();
	var cname = $("#cnameid1").val();
	var preiodstart = $("#preiodstartid1").val();
	var preiodend = $("#preiodendid1").val();
	
	if((credit!="")&&(cname!="")&&(preiodstart!="")&&(preiodend!="")){	
			
				$("#form2").submit();
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


