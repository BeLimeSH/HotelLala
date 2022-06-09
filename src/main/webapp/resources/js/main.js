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

var slideIndex = 0;

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");

    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }

    slideIndex++;

    if (slideIndex > slides.length) {slideIndex = 1}

    slides[slideIndex-1].style.display = "block";  
    setTimeout(showSlides, 7000); // Change image every 7 seconds
}

$(document).ready(function(){
    showSlides();
});