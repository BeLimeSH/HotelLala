// 취소 요청
const refundReason = document.getElementsByClassName("refundReason"); // 환불 요청 사유 작성 textarea
const cancelReqeust = document.getElementsByClassName("cancelReqeust"); // 취소 요청 버튼

for(let i=0; i<cancelReqeust.length ; i++){
	
	cancelReqeust[i].addEventListener("click", function(){
		
		if(loginMemberNo == ""){
			alert("로그인 후 이용해주세요..");
	        return false;
		}
		
		// refundReason Default Value = null 
		/*if(refundReason.value.trim().length == 0){
	        alert("댓글을 작성한 후 버튼을 클릭해주세요.");
	        refundReason.value = ""; // 띄어쓰기, 개행문자 제거
	        refundReason.focus();
	        return; 
	    }*/
		
		$.ajax({
	            url : "cancelRequest",
	            data : {"refundReason" : refundReason[i].value,
	            		   "memberNo" : loginMemberNo,
	            		   "requestNo": cancelReqeust[i].getAttribute("id") },
	            type : "post",
	            success : function(result){
		
	                if(result > 0){ // 성공
	                    alert("예약 취소 요청이 성공적으로 전달되었습니다.");
	                    refundReason.value = ""; // 사유 작성 내용 삭제
	                }else{ // 실패
	                    alert("예약 취소 요청 전달에 실패하였습니다.");
	                }
	            },
	
	            error : function(req, status, error){
	                console.log("취소 요청 실패");
	                console.log(req.responseText);
	            }
	        });
		
	});

}