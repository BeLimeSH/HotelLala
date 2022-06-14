// 내정보 수정 

// 내 정보 수정 유효성 검사
function infoValidate(){

    const memberName = document.getElementById("memberName");
    const memberTel = document.getElementById("memberTel");

    const regExp1 = /^[a-zA-Z0-9가-힣]{2,10}$/;        // 닉네임 정규식
    const regExp2 = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/; // 전화번호 정규식

    // 닉네임 유효성 검사
    if(memberName.value.length == 0){ // 미작성 시 : 닉네임을 입력해주세요.
        alert("닉네임을 입력해주세요.");


        memberName.focus();
        return false;
    }

    if(!regExp1.test(memberName.value)){ // 유효하지 않은 경우
        alert("닉네임은 영어/숫자/한글 2~10 글자 사이로 작성해주세요.");
        memberName.focus();
        return false;
    }
 

    // 전화번호 유효성 검사
    if(memberTel.value.length == 0){ // 미작성 시
        alert("전화번호를 입력해주세요.(- 제외)");
        memberTel.focus();
        return false;
    }

    if(!regExp2.test(memberTel.value)){ // 유효하지 않은 경우
        alert(" 전화번호 형식이 올바르지 않습니다.");
        memberTel.focus();
        return false;
    }



    return true; // true를 반환해서 form 제출 수행
}





// 비밀번호 변경 제출 유효성 검사 
function changePwValidate(){

    //input 요소
    const currentPw =document.getElementsByName("currentPw")[0];
    const newPw =document.getElementsByName("newPw")[0];
    const newPwConfirm =document.getElementsByName("newPwConfirm")[0];
    


    // 비밀번호 정규 표현식 
    const regExp = /^[\w!@#_-]{6,30}$/;
    
    



    //현재 비밀번호 미작성
    if(currentPw.vlaue.trim().length==0){
        alert("현재 비밀번호를 입력해주세요");
        currentPw.fucus();
        currentPw.value="";
        return false;// form태그가 제출되지 않게 한다.
    }
    
    
    
    // 새비밀번호 미작성
    if(newPw.value.trim().length == 0){
        alert("새 비밀번호를 입력해주세요");
        newPw.fucus();
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
        alert("약관 동의 후 탈퇴 버튼을 클릭해주세요.");
        agree.focus();
        return false;
        
    }

    // 정말 탈퇴할지 확인 
    // - window.confirm("내용") : 대화 상자에 확인/취소 생성
    //          확인 클릭 시 true / 취소 클릭 시 false
    //          window는 생략 가능 

    if(!confirm("정말 탈퇴하시겠습니까?")){ // 취소를 누른 경우
        return false;

    }

    return true;
}
