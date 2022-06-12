// 비밀번호 변경 제출 유효성 검사
function changePwValidate(){

    //input 요소
    const currentPw =document.getElementsByName("currentPw")[0];
    const newPw =document.getElementsByName("newPw")[0];
    const newPwConfirm =document.getElementsByName("newPwConfirm")[0];
    


    // 비밀번호 정규 표현식 
    const regEx= /^[\w!]{8}$/;



    //현재 비밀번호 미작성
    if(currentPw.vlaue.trim().length==0){
        alert("현재 비밀번호를 입력해주세요");
        currentPw.fucus();
        currentPw.value="";
        return false;
    }
    
    
    
    // 새비밀번호 미작성
    if(newPw.value.trim().lengtg==0){
        alert("새 비밀번호를 입력해주세요");
        newPw.fucus();
        newPw.value="";
        return false;
    }
    

    if(!regEx.test(newPw.value)){ //유효하지 않은 경우
        alert("영어,숫자 8글자로 작성해주세요");
        newPw.focus();
        newPw.value="";
        return false;
    }
    


    // 새비밀번호 확인 미작성시 
    if(newPwConfirm.vlaue.trim().length==0){
        alert("새비밀번호 확인을 입력해주세요");
   
        newPwConfirm.fucus();
        newPwConfirm.value="";
        return false;
    }
    

    // 새비밀번호 != 새비밀번호확인 
    if(newPw.value != newPwConfirm.value){
        alert("새비밀번호가 일치하지 않습니다.");
        newPw.focus();
        newPw="";
        return false;

    }

    return true; // 위조건 모두 수행하지 않았을떄 true
}