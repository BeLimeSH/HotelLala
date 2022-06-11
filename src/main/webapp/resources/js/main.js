//nav 이벤트

const toggleBtn = document.querySelector('.seconds_bar');
const toggleBtn2 = document.querySelector('.first_bar');
const seconds = document.querySelector('.seconds');
const third = document.querySelector('.third');

toggleBtn.addEventListener('click',()=>{
    seconds.classList.toggle('active');
    third.classList.toggle('exit');    
});

toggleBtn2.addEventListener('click',()=>{
    seconds.classList.toggle('active');
    third.classList.toggle('exit');
});

//메인 사진 슬라이드 쇼
if( $('.mainPhoto') != '' ) {
  
  console.log("야호");
  
  const colorChange1 = document.getElementsByClassName("fa-bars")[0];
  const colorChange2 = document.getElementsByClassName("seconds_bar")[0];
  colorChange1.style.color = "white";
  colorChange2.style.color = "white";
  
  $(function(){
      
      var mainPhoto = $('.mainPhoto');
      // firstSlide = mainPhoto.find('.slide').first() // 첫번째 슬라이드
      // .stop(true).animate({'opacity':1},200); // 첫번째 슬라이드만 보이게 하기
        
      function NextSlide(){ // 다음 버튼 함수
  
          stopSlide();startSlide(); //타이머 초기화
        
          firstSlide = mainPhoto.find('.slide').first().appendTo(mainPhoto); //첫 번째 슬라이드 맨 마지막으로 보내기
    
          var lastSlide = mainPhoto.find('.slide').last().stop(true).animate({'opacity':0},400); //맨 마지막으로 보낸 슬라이드 fadeOut시키기
          
          firstSlide = mainPhoto.find('.slide').first().stop(true).animate({'opacity':1},400);//맨 처음 슬라이드 fadeIn 시키기
      }
      
      startSlide(); // 자동 슬라이드 시작
        
      var theInterval;
      
      function startSlide() {
          theInterval = setInterval(NextSlide, 6000); //자동 슬라이드 설정
      }
    
      function stopSlide() { //자동 멈추기
          clearInterval(theInterval);
      }
  });
  
  //nav 스크롤 이벤트 설정
  window.addEventListener("scroll", function(){
  
    if(window.pageYOffset > 790){
      colorChange1.style.color = "black";
      colorChange2.style.color = "black";
    }
    
    if(window.pageYOffset <= 790){
      colorChange1.style.color = "white";
      colorChange2.style.color = "white";
    }
  
  });

}