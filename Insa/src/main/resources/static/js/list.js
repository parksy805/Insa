//한글만 함수 --IE호환성 
function hangul(){ 
	if((event.keyCode < 12592) || (event.keyCode > 12687)){
		alert("한글만 입력 가능합니다.");
		event.returnValue = false ;
	}
}



$(document).ready( function(){
	
	
	//삭제버튼 Ajax 이벤트처리
	$("#deleteBtn_list").on("click", function() {
		//alert( 'insaList.do?searchAgentNo='+ $("#searchAgentNo").val() );
		//alert(  $(".checkedAgentNo:checked").length  );
		var checkedAgentNo = [];
		
		if ( $(".checkedAgentNo:checked").length == 0 ) {
			alert("삭제할 항목을 선택해주세요");
			
		} else { //checked있을 경우
			
			if (confirm("정말 삭제하시겠습니까?")) {
				$(".checkedAgentNo:checked").each( function(){
					checkedAgentNo.push( $(this).val() );
				})
				$.ajax({
	                url         :   "/checkedDelete.do",
	                dataType    :   "JSON",
	                type        :   "GET",
	                data        :   { 
	                	checkedAgentNo : checkedAgentNo
	                	},
	                success     :   function(cnt){
	                	if (cnt >= 1) {
	    					alert("총 " + $(".checkedAgentNo:checked").length+ "개 삭제했습니다.");
	    					location.href='insaList.do?searchAgentNo='+$("#searchAgentNo").val()
	    								+'&searchName='+$("#searchName").val()
	    								+'&searchStatus='+$("#searchStatus").val()
	    								+'&searchPutYn='+$("#searchPutYn").val()
	    								+'&searchPosition='+$("#searchPosition").val()
	    								+'&searchJoinDate='+$("#searchJoinDate").val()
	    								+'&searchRetireDate='+$("#searchRetireDate").val()
	    								+'&searchJobType='+$("#searchJobType").val();
	    				} 
	                }
	            }); //end ajax 
	            
	            
			} else {
				event.preventDefault();
				return;
			} 	
		}//end else checked 
	})//end deleteBtn
	
	
	


}); // end document readyun


