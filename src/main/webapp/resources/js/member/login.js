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

    const frm_userId = document.getElementById("frm_userId");
    const frm_userpw = document.getElementById("frm_userpw");
   

    //아이디 입력되지 않았을때
    if(frm_userId.value.trim().length ==0 ){
        alert("아이디를 입력해주세요.");

        frm_userId.value="";// 내용 모두 지우기
        frm_userId.focus(); // input 아이디에 집중
        return false; // 이벤트 제거 false 반환

    }

    //비밀번호 입력되지 않았을때
    if(frm_userpw.value.trim().length ==0){
        
        alert("비밀번호를 입력해주세요");
        frm_userpw.value="";
        frm_userpw.focus();
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