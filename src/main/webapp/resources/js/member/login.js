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


// 로그인 유효성 검사 
function loginValidate(){

    const inputId = document.getElementsByName("inputId");
    const inputPw = document.getElementsByName("inputPw");

    //아이디 입력되지 않았을때
    if(inputId.value.trim().length ==0 ){
        alert("아이디를 입력해주세요.");

        inputId.value="";// 내용 모두 지우기
        inputId.focus(); // input 아이디에 집중
        return false; // 이벤트 제거 false 반환

    }
    //비밀번호 입력되지 않았을때
    if(inputPw.value.trim().length ==0){
        
        alert("비밀번호를 입력해주세요");
        inputPw.value="";
        inputPw.focus();
        return false;

    }
    return true;
}

document.getElementById("idSaveCheck")