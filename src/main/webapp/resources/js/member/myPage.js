

//유효성 검사 여부를 기록할 객체 생성
const checkObj={ 
    "memberName":false,
    "memberTel":false,
    "currentPw":false,
    "memberAddress":false,
    "newPw":false,
    "newPwConfirm":false,
 
    
};


// 내정보 수정 

function infoValidate(){

    const memberName = document.getElementById("memberName");
    const memberTel = document.getElementById("memberTel");
    const memberAddress = document.getElementsByName("memberAddress");

    const regExp1 = /^[a-zA-Z가-힣]{2,10}$/;
    // const regExp2 = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/; 
   
 
    //이름 유효성 검사 
    if(memberName.value.length == 0){ // 미작성 시 
        alert("이름을 입력해주세요.");
        memberName.focus();
        memberName.value="";
        return false;
    }

    if(!regExp1.test(memberName.value)){ // 유효하지 않은 경우
        alert("이름은 영문/한글 2~10 글자 사이로 작성해주세요.");
        memberName.focus();
        return false;
    }
 

    // 전화번호 유효성 검사
    if(memberTel.value.length == 0){ // 미작성 시
        alert("전화번호를 입력해주세요.(- 제외)");
        memberTel.focus();
        return false;
    }

    // if(!regExp2.test(memberTel.value)){ // 유효하지 않은 경우
    //     alert(" 전화번호 형식이 올바르지 않습니다.");
    //     memberTel.focus();
    //     return false;
    // }
    
    //주소 유효성검사
    if(memberAddress[0].value.trim().length==0){ // 유효하지 않은 경우
        alert(" 우편번호를 입력해주세요");
        memberAddress[0].focus();
        memberAddress[0].value="";
        return false;
    }
    
    if(memberAddress[1].value.trim().length==0){ // 유효하지 않은 경우
        alert(" 도로명 주소를 입력해주세요");
        memberAddress[1].focus();
        memberAddress[1].value="";
        return false;
    }
    if(memberAddress[2].value.trim().length==0){ // 유효하지 않은 경우
        alert(" 상세주소를 입력해주세요.");
        memberAddress[2].focus();
        memberAddress[2].value="";
        return false;
    }



    return true; // true를 반환해서 form 제출 수행
}







// 비밀번호 변경 제출 유효성 검사 
function changePwValidate(){

    //input 요소
    const currentPw =document.getElementById("currentPw");
    const newPw =document.getElementById("newPw");
    const newPwConfirm =document.getElementById("newPwConfirm");
    


    // 비밀번호 정규 표현식 
    const regExp = /^[\w!@#_-]{6,30}$/;
    
    



    //현재 비밀번호 미작성
    if(currentPw.value.trim().length==0){
        alert("현재 비밀번호를 입력해주세요");
        currentPw.focus();
        currentPw.value="";
        return false;// form태그가 제출되지 않게 한다.
    }
    
    
    
    // 새비밀번호 미작성
    if(newPw.value.trim().length == 0){
        alert("새 비밀번호를 입력해주세요");
        newPw.focus();
        newPw.value="";
        return false;
    }
    

    if(!regExp.test(newPw.value)){ //유효하지 않은 경우
        alert("영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로 작성해주세요.");
        newPw.focus();
        newPw.value="";
        return false;
    }
    


    // 새비밀번호 확인 미작성시 
    if(newPwConfirm.value.trim().length==0){
        alert("새비밀번호 확인을 입력해주세요");
   
        newPwConfirm.focus();
        newPwConfirm.value="";
        return false;
    }
    

    // 새비밀번호 != 새비밀번호확인 
    if(newPw.value != newPwConfirm.value){
        alert("새비밀번호가 일치하지 않습니다.");
        newPw.focus();
        return false;

    }

    return true; // 위조건 모두 수행하지 않았을떄 true
}





// 회원탈퇴 유효성 검사
function secessionValidate(){
  
    const memberPw = document.getElementById("memberPw");
    const agree = document.getElementById("agree");

    

  
    // 비밀번호 미작성 
    if(memberPw.value.trim().length==0){
        alert(" 비밀번호를 입력해주세요.");
        memberPw.focus();
        return false;  
    }
    
    // 약관 동의 체크 여부
    // -체크박스요소.checked : 체크시 true  , 해제시 false 반환 
    

    if(!agree.checked){ // 체크를 안했을때 
        alert("유의사항 확인 후 탈퇴 신청 버튼을 눌러주세요.");
        agree.focus();
        return false
        
    }

    // 정말 탈퇴할지 확인 
    // - window.confirm("내용") : 대화 상자에 확인/취소 생성
    //          확인 클릭 시 true / 취소 클릭 시 false
    //          window는 생략 가능 

    if(!confirm("정말 탈퇴 신청을 하시겠습니까?")){ // 취소를 누른 경우
        return false;

    }

    return true;
}


//비밀번호 유효성 검사 
const currentPw = document.getElementById("currentPw");
const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");

const pwMessage1 = document.getElementById("pwMessage1");
const pwMessage2 = document.getElementById("pwMessage2");

if(newPw != null){

    newPw.addEventListener("input",function(){
        

     if(newPw.value.length==0){
        pwMessage1.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로 작성해주세요.";
        pwMessage1.classList.remove("confirm", "error");
        return;
    } 

    const regExp = /^[\w!@#_-]{6,30}$/;

    if(regExp.test(newPw.value)){ // 새 비번 유효할때

        checkObj.newPw=true;

        pwMessage1.innerText = "올바른 비밀번호 형식입니다.";
        pwMessage1.classList.add("confirm");
        pwMessage1.classList.remove("error");

        checkPw();


    }else{
        pwMessage1.innerText = "올바른 비밀번호 형식이 아닙니다.";
        pwMessage1.classList.add("error");
        pwMessage1.classList.remove("confirm");

        checkObj.newPw = false; // 유효하지 않은 상태임을 기록 

    }
    
    
    newPwConfirm.addEventListener("input",checkPw);
    
    
    function checkPw(){ // 새비밀번호와 새비밀번호 확인 일치 검사 
        
        if(newPw.value == newPwConfirm.value){
            pwMessage2.innerText = "비밀번호가 일치합니다.";
            pwMessage2.classList.add("confirm");
            pwMessage2.classList.remove("error");

            checkObj.memberPwConfirm = true; // 유효한 상태임을 기록 
            
            
        }else{
            
            pwMessage2.innerText = "비밀번호가 일치하지 않습니다.";
            pwMessage2.classList.add("error");
            pwMessage2.classList.remove("confirm");
            
            checkObj.memberPwConfirm = false; // 유효하지 않은 상태임을 기록 
        }
        
        
        
    }
    });

}

//내정보 수정 유효성 검사
 

// 전화번호 유효성 검사
const memberTel = document.getElementById("memberTel");
const telMessage = document.getElementById("telMessage");

if(memberTel!=null){


    memberTel.addEventListener("input", function(){

        // 입력이 되지 않은 경우
        if(memberTel.value.length == 0){
            telMessage.innerText = "변경할 휴대번호를 입력해주세요.(- 제외)";
            telMessage.classList.remove("confirm", "error");

            checkObj.memberTel = false; // 유효하지 않은 상태임을 기록 

            return;
        }

        // 전화번호 정규식
        const regExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

        if(regExp.test(memberTel.value)){ // 유효한 경우
            checkObj.memberTel = true; // 유효한 상태임을 기록 
        
            telMessage.innerText = "올바른 전화번호 형식입니다.";
            telMessage.classList.add("confirm");
            telMessage.classList.remove("error");

            
        } else{ // 유효하지 않은 경우
            checkObj.memberTel = false; // 유효하지 않은 상태임을 기록 
            telMessage.innerText = "올바르지 않은 전화번호 형식입니다. 다시 입력해주세요.";
            telMessage.classList.add("error");
            telMessage.classList.remove("confirm");
        }

    });

}

    
// 회원명 유효성 검사
const memberName = document.getElementById("memberName");
const nameMessage = document.getElementById("nameMessage");


if(memberName){

    memberName.addEventListener("input", function(){
        
        // 입력되지 않은 경우
    if(memberName.value.length == 0){
        nameMessage.innerText = "영어/한글 2~10글자 사이로 작성해주세요.";
        nameMessage.classList.remove("confirm", "error");

        checkObj.memberName = false; // 유효하지 않은 상태임을 기록 

        return;
    }

    const regExp = /^[a-zA-Z가-힣]{2,10}$/;

    if( regExp.test(memberName.value) ){ // 유효한 경우
        
        checkObj.memberName = true; // 유효한 상태임을 기록 
        
        nameMessage.innerText = "안녕하세욘.";
        nameMessage.classList.add("confirm");
        nameMessage.classList.remove("error");
        
        
        
        
        
    }else{
        nameMessage.innerText = "영어/숫자/한글 2~10글자 사이로 작성해주세요.";
        nameMessage.classList.add("error");
        nameMessage.classList.remove("confirm");
        
        checkObj.memberName = false; // 유효하지 않은 상태임을 기록 
    }
    
    });

}