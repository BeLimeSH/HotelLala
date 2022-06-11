
const down1 = document.getElementsByClassName('down')[0];
const up1 = document.getElementsByClassName('up')[0];
const btn1 = document.getElementsByClassName('accordion-list')[0];
const inner1 = document.getElementsByClassName('content')[0];
btn1.addEventListener("click",function(){
  down1.classList.toggle("exit");
  up1.classList.toggle("active");
  // inner.style.display="block";
  inner1.classList.toggle("active");
});
const down2 = document.getElementsByClassName('down')[1];
const up2 = document.getElementsByClassName('up')[1];
const btn2 = document.getElementsByClassName('accordion-list1')[0];
const inner2 = document.getElementsByClassName('content')[1];
btn2.addEventListener("click",function(){
  down2.classList.toggle("exit");
  up2.classList.toggle("active");
  // inner.style.display="block";
  inner2.classList.toggle("active");
});
const down3 = document.getElementsByClassName('down')[2];
const up3 = document.getElementsByClassName('up')[2];
const btn3 = document.getElementsByClassName('accordion-list2')[0];
const inner3 = document.getElementsByClassName('content')[2];
btn3.addEventListener("click",function(){
  down3.classList.toggle("exit");
  up3.classList.toggle("active");
  // inner.style.display="block";
  inner3.classList.toggle("active");
});

const down4 = document.getElementsByClassName('down')[3];
const up4 = document.getElementsByClassName('up')[3];
const btn4 = document.getElementsByClassName('accordion-list3')[0];
const inner4 = document.getElementsByClassName('content')[3];
btn4.addEventListener("click",function(){
  down4.classList.toggle("exit");
  up4.classList.toggle("active");
  // inner.style.display="block";
  inner4.classList.toggle("active");
});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.57002, 126.97650), // 지도의 중심좌표
    level: 4, // 지도의 확대 레벨
    mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
}; 

// 지도를 생성한다 
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 지도에 마커를 생성하고 표시한다
var marker = new kakao.maps.Marker({
position: new kakao.maps.LatLng(37.56999, 126.97874), // 마커의 좌표
draggable : true, // 마커를 드래그 가능하도록 설정한다
map: map // 마커를 표시할 지도 객체
});

// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
kakao.maps.event.addListener(marker, 'click', function() {
alert('마커를 클릭했습니다!');
});

// 마커에 mouseover 이벤트를 등록한다
kakao.maps.event.addListener(marker, 'mouseover', function() {
console.log('마커에 mouseover 이벤트가 발생했습니다!');
});

// 마커에 mouseout 이벤트 등록
kakao.maps.event.addListener(marker, 'mouseout', function() {
console.log('마커에 mouseout 이벤트가 발생했습니다!');
});

// 마커에 dragstart 이벤트 등록
kakao.maps.event.addListener(marker, 'dragstart', function() {
console.log('마커에 dragstart 이벤트가 발생했습니다!');
});

// 마커에 dragend 이벤트 등록
kakao.maps.event.addListener(marker, 'dragend', function() {
console.log('마커에 dragend 이벤트가 발생했습니다!');
});