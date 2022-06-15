let amount = roomRates*dateRange + adultBreakfast*30000 + childBreakfast*25000 + extraBed*65000;
let payMethod = "";

//예약 정보 출력
(function(){
    $('#r-price').text( priceToString( roomRates*dateRange ) );
    $('#ab-price').text( priceToString( adultBreakfast*30000 ) + "원" );
    $('#cb-price').text( priceToString( childBreakfast*25000 ) + "원" );
    $('#e-price').text( priceToString( extraBed*65000 )+ "원" );
    $('#sum-price').text( priceToString( amount + " 원" ));
})();


//결제 방법 선택
const payOptionBox = document.getElementById("pay-option-box");
const payOption = document.getElementsByName("pay-option");

for(let i=0; i<4; i++) {

    payOption[i].addEventListener("click", function(){

        if(payOption[i].checked){
            payOption[i].previousElementSibling.style.backgroundColor = "white";
            payOption[i].previousElementSibling.style.color = "#ff7E5F";
            
            payMethod = payOption[i].value;
            console.log(payMethod);
        } 
    });
    
    payOptionBox.addEventListener("click", function(){
        if(!payOption[i].checked) {
            payOption[i].previousElementSibling.style.backgroundColor = "#ff7E5F";
            payOption[i].previousElementSibling.style.color = "white";
        }
    });
}

const iamportPayment = document.getElementById("iamportPayment");
iamportPayment.addEventListener("click", function(){

    console.log(payMethod);

    if(payMethod == ""){
        alert("결제 방법을 선택해주세요.");
        return;
    }
    
    var IMP = window.IMP;
    IMP.init("imp33404182");
    
    //IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ //param
        pg: "html5_inicis", //pg사명 or pg사명.CID
        pay_method: payMethod,
        merchant_uid: requestNo, //주문 번호(중복X 문자열)
        name: roomType, //상품명
        amount: amount, //금액
        buyer_name: memberName
    }, function(rsp){
        if(rsp.success){
            // jQuery로 HTTP 요청
            jQuery.ajax({
                url: contextPath + "/reservation/impay", //import 서블릿 /reservation/impay
                method: "POST",
                headers: { "Content-Type": "application/json" },
                data: {
                    "requestNo": rsp.merchant_uid,
                    "amount" : rsp.amount,
                    "memberNo" : memberNo,
                    "payType" : rsp.pay_method
                    //은행 코드 -> (무통장)
                    //계좌번호 -> (무통장)
                }
            }).done(function (data) {
                // 가맹점 서버 결제 API 성공시 로직
                // success 서블릿 주소 요청
                // /reservation/complete
                
                // location.href
            })
            // alert("결제 성공 -> imp_uid : " + rsp.imp_uid + " / merchant_uid : " + rsp.merchant_uid);
        } else {
            alert("결제 실패 : 코드(" + rsp.error_code +") / 메세지(" + rsp.error_msg + ")");
        }
    });
})

//가격 포맷 바꾸기
function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}