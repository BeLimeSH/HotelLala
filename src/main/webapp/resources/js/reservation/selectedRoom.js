// 팝업창 열기(미완)
const roomDetail = document.getElementsByClassName("room-detail");

if(roomDetail.length != 0){
    
    roomDetail[0].addEventListener("click", function(){
    
        window.open('../../Semi_HTML/popUp/room-popUp.html','객실 상세보기','width=920px, height=600px, left=100px, top = 100px, scrollbars = yes, resizable=no');
    });

}