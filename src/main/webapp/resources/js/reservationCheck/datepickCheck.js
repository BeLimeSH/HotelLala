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


//  ajax 호출에 필요한 값 변수로 세팅
const reserveDate = document.getElementById("reserve-datepicker");
const dateMessage = document.getElementById("dateMessage");

const searchBtn = document.getElementById("searchBtn");

// 날짜 조회 검색 
searchBtn.addEventListener("click", function(){
	
	// 날짜 검사
	if(dateRange.value == 0){
        alert("조회를 희망하는 날짜를 입력해주세요.");
        return;
    }
    
    dateMessage.classList.add("removeResource");

    $.ajax({
        url : contextPath + "/reservation/date",
        data: {
            "reserveDate"   : reserveDate.value,
            "dateRange"     : dateRange.value,
            "adultCount"    : adultCount.value,
            "childCount"    : childCount.value
        },
        type: "POST",
        dataType: "JSON",
        success: function(checkList){
	
			
	
		},
		error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    })

})
