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

// 아이디 저장 체크박스가 체크되었을때 이벤트
document.getElementById("idSaveCheck").addEventListener("change",function(){

    // this == 체크박스
    if(this.checked){
        const str = "개인 정보 보호를 위해 개인 PC에서의 사용을 권장합니다. 개인 PC가 아닌 경우 취소를 눌러주세요.";
    
        if(!confirm(str)){ //취소를 눌렀을때
            this.checked=false; // 체크해제
        }
    }

  
});