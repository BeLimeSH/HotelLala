const roomRatesSpan = document.getElementById('room-rates');

(function(){
    roomRatesSpan.innerText = priceToString(roomRates);
})();

//가격 포맷 바꾸기
function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

//옵션 사항 ul 태그 클릭될 때 이벤트 추가
const optionCon = document.getElementsByClassName('option-con')[0];

optionCon.addEventListener("click", function(){

    console.log( $('#a-breakfast').val()*15000 +  $('#c-breakfast').val()*10000 + $('#extra-bed').val()*65000 );
    roomRatesSpan.innerText = priceToString( parseInt( roomRates ) + $('#a-breakfast').val()*15000
                                            + $('#c-breakfast').val()*10000 + $('#extra-bed').val()*65000 );

});

// 추가 요청사항
$('#req-input').on("change", function(){

    let er = $(this).val().replace(/\n/g, "<br>");
    $('#extra-request').val( er.trim() );
    
});

$('#req-reset-btn').on("click", function(){
    $('#req-input').val('');
    $('#extra-request').val('');
});

//정규표현식 검사
function reqValidate(){
    
    const regExp = /^[가-힣\w.,!? ]*$/;

    let er = $('#extra-request').val().replace(/<br>/g, "");

    if( !regExp.test( er ) ){
    
        alert("추가 요청사항은 특수문자, 이모티콘 없이 입력해주세요(.,!? 제외)");
        $('#req-input').focus();

        return false;
    }

    return true;
}

//플러스 마이너스 버튼 메서드
const plusBtn = document.getElementsByClassName("plusBtn")
const minusBtn = document.getElementsByClassName("minusBtn")

for(let i=0; i<plusBtn.length; i++){

    plusBtn[i].addEventListener("click", function(){

        let count = plusBtn[i].previousElementSibling.value;

        if(i!=2){
            if(count < 100){   
                count++;
            }
        } else {
            if(count < 2){   
                count++;
            }
        }

        plusBtn[i].previousElementSibling.value = count;
    });

    minusBtn[i].addEventListener("click", function(){

        let count = minusBtn[i].nextElementSibling.value;
        if(count > 0){   
            count--;
        }
        minusBtn[i].nextElementSibling.value = count;
    });
};