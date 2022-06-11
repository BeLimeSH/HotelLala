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


document.querySelector(".cursor").addEventListener("click",function(){
    alert("test")
})