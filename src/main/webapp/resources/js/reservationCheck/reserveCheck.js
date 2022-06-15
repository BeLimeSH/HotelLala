/*// 예약 조회(ajax)
function reserveCheck(){
	
	$.ajax({
		url : contextPath + "/reservationCheck",
		data : {"reservationNo" : reservationNo},
		type : "GET",
		dataType : "JSON",
		success : function(rsvList){
			
			console.log(rsvList);
			
			for( let reserve of rsvList ){
				
				// 예약번호
                const reservationNo = document.createElement("td");
                reservationNo.innerText = reserve.reservationNo; 
				
				// 주문번호
				const requestNo = document.createElement("td");
                requestNo.innerText = reserve.requestNo; 
				
				// 예약상태
				const reservationFl = document.createElement("td");
                reservationFl.innerText = reserve.reservationFl; 
				
				// 결제번호
				const paymentNo = document.createElement("td");
                paymentNo.innerText = reserve.paymentNo; 
				
				// 객실호수
				const roomNo = document.createElement("td");
                roomNo.innerText = reserve.roomNo; 
								
				// 로그인한 회원번호와 예약 시 회원번호가 같을 시
				if( loginMemberNo ==  reserve.memberNo ){
					
					// 버튼 영역
	                const cancelBtnArea = document.createElement("div");
	                cancelBtnArea.classList.add("reply-btn-area");
					
					// 취소 버튼
					const cancelBtn = document.createElement("button");
	                cancelBtn.innerText = "취소";
	                
	                // 취소 버튼 onclick 이벤트 추가
	                cancelBtn.setAttribute("onclick", "cancelReserve("+reserve.reservationNo+")");
	
	                // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
	                replyBtnArea.append(cancelBtn);
	                
				}
				
			}
			
		},
		error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
            }
	});
	
}
*/


// 예약 취소
// (function(){
//     const cancelBtn = document.getElementById("cancelBtn");

//     if(cancelBtn != null){

//         cancelBtn.addEventListener("click", function(){

//             let url = "reservationCheck/cancel"; // 상대경로

//             if( confirm("예약을 취소 하시겠습니까?") ){
//                 location.href = url; // get방식으로 url에 요청
//             }

//         });

//     }

// })();