// const frm = document.querySelector(".frm");
const check = document.querySelector(".fa-check");
const chkstyle = document.querySelector(".chkstyle");
chkstyle.addEventListener("click",function(){
    // check.style.color="white";
    // chkstyle.style.backgroundColor="black"
    check.classList.toggle('active');
    chkstyle.classList.toggle('backchk');
    // chkstyle.classList.toggle('exit');
});
