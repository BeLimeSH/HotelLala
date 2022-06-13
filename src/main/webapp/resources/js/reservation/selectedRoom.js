//  ajax 호출에 필요한 값 변수로 세팅
var reserveDate = document.getElementById("date-span").innerText;
var dateRange = document.getElementById("dateRange-span").innerText;
var adultCount = document.getElementById("adult").innerText;
var childCount = document.getElementById("child").innerText;

console.log(reserveDate);
console.log(dateRange);
console.log(adultCount);
console.log(childCount);
//객실 조회하기
//roomList 배열의 길이만큼 for 문을 돌려서 li태그 생성
(function(){

    $.ajax({
        url : contextPath + "/reservation/room",
        data: {
            "reserveDate"   : reserveDate,
            "dateRange"     : dateRange,
            "adultCount"    : adultCount,
            "childCount"    : childCount
        },
        type: "POST",
        dataType: "JSON",
        success: function(roomList){

            console.log(roomList);

        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    })

})();





// 팝업창 열기(미완)
const roomDetail = document.getElementsByClassName("room-detail");

if(roomDetail.length != 0){
    
    roomDetail[0].addEventListener("click", function(){
    
        window.open('../../Semi_HTML/popUp/room-popUp.html','객실 상세보기','width=920px, height=600px, left=100px, top = 100px, scrollbars = yes, resizable=no');
    });

}

