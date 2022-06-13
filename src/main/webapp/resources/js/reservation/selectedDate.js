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

//인원 선택 메소드
const headcountBox = document.getElementById("headcountBox");

$('#adultCount').on("click", openHeadcounter);
$('#childCount').on("click", openHeadcounter);

function openHeadcounter(){
    headcountBox.classList.remove("removeResource");
}

//저장하기 버튼 동작
$('#countBtn').on("click", function(){

    $('#adultCount').val( $('#adultCount-span').text() );
    $('#childCount').val( $('#childCount-span').text() );

    headcountBox.classList.add("removeResource");
});


//플러스 마이너스 버튼 메서드
$('.plusBtn').on("click", function(){

    let count = $(this).prev().text();
    if(count < 6){   
        count++;
    }
    $(this).prev().text(count);
    
});

$('.minusBtn').on("click", function(){
    
    let count = $(this).next().text();
    if(count > 0){   
        count--;
    }
    $(this).next().text(count);

});
//-----------------------------------------------------------

//  ajax 호출에 필요한 값 변수로 세팅
const reserveDate = document.getElementById("reserve-datepicker");
const adultCount = document.getElementById("adultCount");
const childCount = document.getElementById("childCount");

const dateMessage = document.getElementById("dateMessage");


//객실 조회하기
//roomList 배열의 길이만큼 for 문을 돌려서 li태그 생성
const roomSearchBtn = document.getElementById("roomSearchBtn");

roomSearchBtn.addEventListener("click", function(){
    
    console.log(reserveDate.value);
    console.log(dateRange.value);
    console.log(adultCount.value);
    console.log(childCount.value);

    // 날짜 인원 선택 검사
    if(dateRange.value == 0){
        alert("날짜를 입력해주세요.");
        return;
    }

    if(adultCount.value == 0){
        alert("인원수를 입력해주세요.\n\n* 어린이는 성인 1인 이상 동반 필수");
        return;
    }

    let sum = parseInt(adultCount.value) + parseInt(childCount.value);

    if(sum > 6){
        alert("총 인원 수는 6명을 초과할 수 없습니다.\n\n* 총 인원 수 : 성인, 어린이 인원 수의 합");
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
        success: function(roomList){
    
            console.log(roomList);

            //화면에 출력되어 있는 객실 리스트 삭제
            const ul = document.getElementById("roomList");
            ul.innerHTML = "";

            //roomList에 저장된 요소를 하나씩 접근
            for(let room of roomList){

                //행
                const li = document.createElement("li");

                //내용 들어있는 div!!
                const roomBox = document.createElement("div");
                roomBox.classList.add("roomBox");

                // 마지막에 줄 긋는 div!!
                const dividingRow = document.createElement("div");
                dividingRow.classList.add("dividing-row");

                //roomBox 안에 들어갈 내용!!
                const div = document.createElement("div");

                //썸네일이미지!!
                const img = document.createElement("img");
                img.setAttribute("src", contextPath + room.roomThumbnail);

            }


    
        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    })

})


// 팝업창 열기(미완)
// const roomDetail = document.getElementsByClassName("room-detail");

// if(roomDetail.length != 0){
    
//     roomDetail[0].addEventListener("click", function(){
    
//         window.open('../../Semi_HTML/popUp/room-popUp.html','객실 상세보기','width=920px, height=600px, left=100px, top = 100px, scrollbars = yes, resizable=no');
//     });

// }

