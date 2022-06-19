(function(){
    const reserveSearchBtn = document.getElementById("reserve-datepicker");
    reserveSearchBtn.addEventListener("click", function(){

		let today = new Date();
		let tomorrow = new Date(today);
		let nextYear = new Date(today);
		
		tomorrow.setDate(today.getDate() + 1);
		nextYear.setDate(today.getDate() + 365);
		
		const dateRange = document.getElementById("dateRange");
		
		//datepicker
		//날짜 선택 페이지, 객실 선택 페이지에서의 동작이 다름 -> if문으로 처리
		
		$(function() {
		    $('#reserve-datepicker').daterangepicker({
		        "autoApply": true,
		        "locale": {
		            "format": "YYYY-MM-DD",
		            "separator": " ~ ",
		            "applyLabel": "Apply",
		            "cancelLabel": "Cancel",
		            "fromLabel": "From",
		            "toLabel": "To",
		            "customRangeLabel": "Custom",
		            "weekLabel": "W",
		            "daysOfWeek": [
		                "일",
		                "월",
		                "화",
		                "수",
		                "목",
		                "금",
		                "토"
		            ],
		            "monthNames": [
		                "January",
		                "February",
		                "March",
		                "April",
		                "May",
		                "June",
		                "July",
		                "August",
		                "September",
		                "October",
		                "November",
		                "December"
		            ],
		            "firstDay": 1
		        },
		        "startDate": today,
		        "endDate": tomorrow,
		        "minDate": today,
		        "maxDate": nextYear,
		        "opens": "right"
		    }, function(start, end, label) {
		        console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
		        
		        let startDate = new Date(start.format('YYYY-MM-DD'));
		        let endDate = new Date(end.format('YYYY-MM-DD'));
		
		        let dateRangeValue = (endDate - startDate)/24/60/60/1000;
		
		        // 몇박???
		        dateRange.value = dateRangeValue;
		    });
		});
	 });		
		
	//  ajax 호출에 필요한 값 변수로 세팅
	
    
})();

// 날짜 조회 검색 
function reserveSearchValidate() {
	/*const reserveDate = document.getElementById("reserve-datepicker");
	const dateMessage = document.getElementById("dateMessage");
	const searchBtn = document.getElementById("searchBtn");*/

	if(loginMemberNo == ""){
		alert("로그인 후 이용해주세요..");
        return false;
	}

	// 날짜 검사
	if(dateRange.value.length == 0){
        alert("조회를 희망하는 날짜를 입력해주세요.");
        return false;
    }
    
   // dateMessage.classList.add("removeResource");

   /* $.ajax({
        url : contextPath + "/reservation/check",
        data: {
            "reserveDate"   : reserveDate.value,
            "dateRange"     : dateRange.value
        },
        type: "POST",
        dataType: "JSON",
        success: function(checkList){
			
			console.log(checkList);
			
			// 조회 목록 삭제
			const cList = document.getElementById("check-list"); // ul태그
			cList.innerHTML = "";
			
			// 리스트에 저장된 요소 하나씩 접근
			for(let reservation of checkList){
				
				const reserveCheckContent = document.createElement("td");
				reserveCheckContent.classList.add("reserve-check-content");
				
				reserveCheckContent.append();
				
				// 로그인한 회원번호와 예약 테이블의 회원번호가 같을 때만 예약 취소 가능
                if( loginMemberNo == reservation.memberNo ){
	
                    // 버튼 영역
                    const cancelBtnArea = document.createElement("div");
                    cancelBtnArea.classList.add("cancel-btn-area");

                    // 예약 취소 버튼
                    const cancelBtn = document.createElement("button");
                    cancelBtn.innerText = "예약 취소";

                    // 취소 버튼에 onclick 이벤트 속성 추가
                    cancelBtn.setAttribute("onclick", "cancelReserve("+reservation.memberNo+")");

 					// 버튼 영역 마지막 자식으로 취소 버튼 추가
                    cancelBtnArea.append(cancelBtn);

                }
				
			}
			
			
		},
		error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    });*/

}


// ------------------------------------------------------------------------
// 총 예약 갯수 출력


// ------------------------------------------------------------------------

// 예약 취소 클릭 시 이벤트 수행(관리자 전달, 여기서 취소 업데이트 X)
function cancelReserve(memberNo){
    
    if( confirm("예약을 취소 하시겠습니까?") ){

        $.ajax({
            url : contextPath + "/reservation/cancel",
            data : {"memberNo" : memberNo},
            type : "GET",
            success : function(result){
                if(result > 0){ // 취소 성공 시
                    alert("예약 취소 요청이 성공적으로 처리되었습니다.");
                    checkList();
                }else{ // 실패
                    alert("예약 취소 요청 처리 실패");
                }
            },

            error : function(req, status, error){
                console.log("댓글 삭제 실패");
                console.log(req.responseText);
            }
        });

    }

}
