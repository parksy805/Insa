/*********************************************************
 * DESC : 직원 정보 등록 js
 * AUTH : 박소영 (개발팀)
 * HIST : 20220220
*********************************************************/
 
/********************************************************
profileImg 업로드 시, scr 변경
*********************************************************/
function setProfileImg(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.getElementById("profile_thumbnail");
		img.setAttribute("src", event.target.result);
		document.querySelector("#profile_thumbnail").appendChild(img);
	};
	
	reader.readAsDataURL(event.target.files[0]);
}


/********************************************************
이름에 한글만 입력하는 함수 --IE호환성 
*********************************************************/
function hangul(){ 
	if((event.keyCode < 12592) || (event.keyCode > 12687)){
		alert("한글만 입력 가능합니다.");
		event.returnValue = false ;
	}
}

$(document).ready(function() {
	//alert("1");
	
	/********************************************************
	사번 = 입사년월 + 부서코드 + ***
	*********************************************************/
	$("#joinDate, #dept").change(function(){
		//alert("test");//ok
		var year = $("#joinDate").val().substr(2, 2);
		var month =$("#joinDate").val().substr(5, 2);
		var dept = $("#dept option:selected").attr('value2').substr(1,2);//option:selected중요ㅠㅠ
		//alert(dept);
		
		if(document.getElementById("joinDate").value != null ||
				document.getElementById("dept").value != null	){
			$("#agentNo").attr('placeholder',year+month+dept+'***');
		} else {
			$("#agentNo").attr('placeholder',"");
		}
		
	})
	
	
	/********************************************************
	id 중복체크
	*********************************************************/
	//#id keyup하면 한글자 입력할때마다 중복 뜨니까 change로
	$("#id").on("change", function(event) { 
		//alert("test"); //change할때 연결되는지 확인
		if (event.keyCode === 13) {
	    	event.preventDefault();
	  	}
		$.ajax({
			url : "/idCheck.do",
			type : "post",
			dataType : "JSON",
			data : {
				id : $("#id").val()
			},
			success : function(result) { //@ResponseBody return값. DB에 중복 id 2개 이상이면 안먹힘
				if (result == 1) {
					alert("중복된 아이디입니다.");
					$("#id").val("");
					$("#id").focus();
					event.preventDefault(); 
				} else if (result == 0) {
					alert("사용가능한 아이디입니다.");
				}
			}
		});//end ajax
	});//end on
	
	/********************************************************
	pwd,pwd2 비번 일치 확인
	*********************************************************/
	$("#pwd").on("keyup", function() {
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		var mesg  = "비밀번호 불일치";
		if ( pwd == pwd2) {
			mesg = "비밀번호 일치";
		}
		$("#pwd_result").text(mesg);
	});
	$("#pwd2").on("keyup", function() {
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		var mesg  = "비밀번호 불일치";
		if ( pwd == pwd2) {
			mesg = "비밀번호 일치";
		}
		$("#pwd_result").text(mesg);
	});
	
	/********************************************************
	주민번호 입력 시 하이픈,마스킹 추가
	*********************************************************/	
	$("#regNoMasking").on("keyup", function(e) {
		if( $(this).val().length < 14 ) {
		//alert($(this).val().length);
		
		$("#regNo").val(  $(this).val().substr(0,6) +"-"+$(this).val().substr(6,7)  );
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(\d{6})(\d{7})/, "$1-*******") );
		}
	});
	/********************************************************
	주민번호 입력 시 나이랑 성별 자동계산
	*********************************************************/	
	$("#regNoMasking").on("keydown", function() {
		var cur_year = new Date().getFullYear();
		var cur_month = new Date().getMonth();
		var cur_date = new Date().getDate();
		var reg_year = $("#regNoMasking").val().substr(0, 2);
		
		if (reg_year != "" && reg_year < 20) { //20년생 이전이면
			reg_year = cur_year - (20 + reg_year) + 1;
			$("#age").val(reg_year);
		} else if (reg_year != "" && reg_year >= 20) { //20년생 이후면
			reg_year = cur_year - (19 + reg_year) + 1;
			$("#age").val(reg_year);
		}
	
		var reg_month = $("#regNoMasking").val().substr(2, 2);
		var reg_date = $("#regNoMasking").val().substr(4, 2);
		var reg_sex = $("#regNoMasking").val().substr(6, 1);
	
		if (reg_year != "" && reg_sex == 1 || reg_sex == 3 || reg_sex == 5) {
			$("#sex").val("남자").prop("selected", true);
		} else if (reg_year != "" && reg_sex == 2 || reg_sex == 4 || reg_sex == 6) {
			$("#sex").val("여자").prop("selected", true);
		}
	
	});
	
	
	/********************************************************
	전화번호,폰번호 입력 시 하이픈 추가
	*********************************************************/	
	$("#call, #phone").keyup( function(e) {
		//숫자 이외 제한
		if (e.keyCode == 8 || e.keyCode == 39 || e.keyCode == 37) {
			return false;
		}
		$(this).val($(this).val().replace(/[^0-9]/g, "")
			.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3")
			.replace("--", "-"));
	});
	
	/********************************************************
	연봉 3자리 단위마다 콤마
	*********************************************************/	
	$("#salary_comma").keyup( function(e) {
		//숫자 이외 제한
		if (e.keyCode == 8 || e.keyCode == 39 || e.keyCode == 37) {
			return false;
		}
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#salary").val( Number(     $(this).val().replace(/[^\d]+/g, "") ) );//일단 ,로 보여주고나서 다시 ,제외한걸 DB에 저장
		
	});

	/********************************************************
	군필여부 Y였다가-> N면 disalbled->다시 Y,""하면 reset
	KOSA여부 Y였다가-> N면 disalbled->다시 Y하면 reset
	*********************************************************/	
	$("#milYn").change(function(){
		if( $(this).val() ==  'N' || $(this).val() =="" ){ //군필N면
			$("#milType").attr("disabled","disabled"); //"disabled"는 아예 사용하지 않는거라 name속성이 막힘
			$("#milLevel").attr("disabled","disabled");
			$("#milStartDate").attr("disabled","disabled");
			$("#milEndDate").attr("disabled","disabled"); //4가지 요소 속성의 readonly="readonly"로
			
			$("#milType option:eq(0)").prop("selected", true); //option:eq(0) =option index 0번째에 접근
			$("#milLevel option:eq(0)").prop("selected", true); //prop: 위에 접근된 index로 "selected"설정하기
			$("#milStartDate").val(""); //date는 그냥 공백처리
			$("#milEndDate").val(""); 
		}
		if( $(this).val() ==  'Y'  ){ //군필Y면
			$("#milType").removeAttr("disabled");
			$("#milLevel").removeAttr("disabled");
			$("#milStartDate").removeAttr("disabled");
			$("#milEndDate").removeAttr("disabled"); //4가지 요소 속성의 disabled="disabled" 삭제
		}
	});
	$("#kosaYn").change(function(){
		if( $(this).val() == "N" || $(this).val() =="" ){
			$("#kosaLevel").attr("disabled","disabled");
			
			$("#kosaLevel option:eq(0)").prop("selected", true);
		}
		if( $(this).val() == "Y"   ){
			$("#kosaLevel").removeAttr("disabled");//요소 속성의 disabled="disabled"였던 상태 삭제
		}
	});
	
	
	/********************************************************
	입사일 더 빠르게
	퇴사일 더 늦게 + 퇴사일 먼저 입력 방지
	입영일 더 빠르게
	전역일 더 늦게 + 전역일 먼저 입력 방지
	*********************************************************/	
	$("#joinDate").change(function() {
		var joinDate = new Date($('#joinDate').val());
		var retireDate = new Date($('#retireDate').val());
		if (joinDate.getTime() > retireDate.getTime()) {
			alert("입사일, 퇴사일을 다시 확인해주세요.");
			$("#joinDate").val("");
			$("#retireDate").val("");
		}
	});
	$("#retireDate").change(function() {
		var joinDate = new Date($('#joinDate').val());
		var retireDate = new Date($('#retireDate').val());
	
		if( $('#joinDate').val() == "" && $('#retireDate').val() != "" ){
			alert("입사일을 먼저 선택해주세요.");
			$("#retireDate").val("");
		}
		
		if (joinDate.getTime() > retireDate.getTime()) {
			alert("입사일, 퇴사일을 다시 확인해주세요.");
			$("#joinDate").val("");
			$("#retireDate").val("");
		}
	});
	$("#milStartDate").change(function() {
		var milStartDate = new Date($('#milStartDate').val());
		var milEndDate = new Date($('#milEndDate').val());
		if (milStartDate.getTime() > milEndDate.getTime()) {
			alert("입영일, 전역일을 다시 확인해주세요.");
			$("#milStartDate").val("");
			$("#milEndDate").val("");
		}
	});
	$("#milEndDate").change(function() {
		var milStartDate = new Date($('#milStartDate').val());
		var milEndDate = new Date($('#milEndDate').val());
		if( $('#milStartDate').val() == "" && $('#milEndDate').val() != "" ){
			alert("입영일을 먼저 선택해주세요.");
			$("#milEndDate").val("");
		}
		if (milStartDate.getTime() > milEndDate.getTime()) {
			alert("입영일, 전역일을 다시 확인해주세요.");
			$("#milStartDate").val("");
			$("#milEndDate").val("");
		}
	});
	
	
	
	/********************************************************
	사업자번호 입력 시 하이픈 추가
	*********************************************************/	
	$("#cmpRegNo").keyup( function(e) {
		//숫자 이외 제한
		if (e.keyCode == 8 || e.keyCode == 39 || e.keyCode == 37) {
			return false;
		}
		$(this).val($(this).val().replace(/[^0-9]/g, "")
			.replace(/(\d{3})(\d{2})(\d{5})/, "$1-$2-$3"));
	});
	
	
	
	
	
}) //end (document).ready


/********************************************************
이메일 직접입력, option 선택시에 readonly
*********************************************************/	
 function selectEmail(ele){ 
	 var $ele = $(ele); 
	 var $email2 = $('input[name=email2]'); 
	 
	 if($ele.val() == "1"){ // value='1' 직접입력 이라면 
		 $email2.attr('readonly', false);  //email2는 readonly로 바꾸고
		 $email2.val(''); 
	 } else { 
		 $email2.attr('readonly', true); 
		 $email2.val($ele.val()); 
	 }
 }
 
 
 /************************************************************************************/	
 
 //cmp preview 변경
function setCmpPreview(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.getElementById("cmp_img_preview");
		//var src = img.getAttribute("src");
		//alert(src); //디폴트 파일명
	
		img.setAttribute("src", event.target.result);
		document.querySelector("#cmp_img_preview").appendChild(img);
		
	};
	reader.readAsDataURL(event.target.files[0]);
}

//carrier preview 변경
function setCarrierPreview(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.getElementById("carrier_preview");
		img.setAttribute("src", event.target.result);
		document.querySelector("#carrier_preview").appendChild(img);
	};
	
	reader.readAsDataURL(event.target.files[0]);
}




// 사업자등록증,이력서 파일 업로 시 파일명 출력 + 이미지파일 제외 업로드 제한
$(function() {
	$("#cmpFile").change(function(e){
		var fileName= $("#cmpFile")[0].files[0].name;
		var fileSize= $("#cmpFile")[0].files[0].size;
		var src = $('#cmp_img_preview').attr("src");

		
		var regex = new RegExp("(.*?)\.(xlsx|pdf|exe|sh|zip|alz)$");

		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			event.preventDefault(); 
			//$('#cmp_img_preview').attr("src","/images/default_cmp.jpg");
			return;
		}
		if(fileSize >= 5242880 ){
			alert("파일 사이즈 초과");
			event.preventDefault(); 
			src="/images/default_cmp.jpg"
			return;
		}
		
		$("#cmp_reg_img_text").val( fileName ); 
	});
	
	$("#carrierFile").change(function(e){
		var fileName= $("#carrierFile")[0].files[0].name;
		var fileSize= $("#carrierFile")[0].files[0].size;
		
		var regex = new RegExp("(.*?)\.(xlsx|pdf|exe|sh|zip|alz)$");

		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			event.preventDefault(); 
			return;
		}
		if(fileSize >= 5242880 ){
			alert("파일 사이즈 초과");
			event.preventDefault(); 
			return;
		}
		
		$("#carrier_text").val( fileName ); 
		
	});
});
 
 
 