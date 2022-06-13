// 예약 조회(ajax)
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
				
			}
			
		},
		error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
            }
	});
	
}


// 예약 취소
function cancelReserve(reservationNo){
	
	if( confirm("정말로 취소 하시겠습니까?") ){
		
		$.ajax({
			url : contextPath + "/reservationCheck/cancel",
			data : {"reservationNo" : reservationNo},
			type : "GET",
			success : function(result){
				if(result > 0){
					alert("예약이 취소되었습니다.");
				}else{
					alert("예약 취소 요청이 거부되었습니다.");
				}
			},
			error : function(req, status, error){
				console.log("예약 취소 실패");
                console.log(req.responseText);
			}
		});
		
	}
	
}