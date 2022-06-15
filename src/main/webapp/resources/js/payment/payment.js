(function(){
    // console.log(roomRates);
    // console.log(adultBreakfast);
    // console.log(childBreakfast);
    // console.log(extraBed);
    // console.log(dateRange);

    $('#r-price').text( priceToString( roomRates*dateRange ) );
    $('#ab-price').text( priceToString( adultBreakfast*30000 ) + "원" );
    $('#cb-price').text( priceToString( childBreakfast*25000 ) + "원" );
    $('#e-price').text( priceToString( extraBed*65000 )+ "원" );
    $('#sum-price').text( priceToString( roomRates*dateRange + adultBreakfast*30000 + childBreakfast*25000 + extraBed*65000) + " 원" );
})();



const iamportPayment = document.getElementById("iamportPayment");
iamportPayment.addEventListener("click", function(){
    
    var IMP = window.IMP;
    IMP.init("imp33404182");
    
    //IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ //param
        pg: "html5_inicis", //pg사명 or pg사명.CID
        pay_method: "card",
        merchant_uid: "merchant_" + new Date().getTime(), //주문 번호(중복X 문자열)
        name: "Standard", //상품명
        amount: 100, //금액
        buyer_email: "",
        buyer_name: "김승희"
    }, function(rsp){
        if(rsp.success){
            alert("결제 성공 -> imp_uid : " + rsp.imp_uid + " / merchant_uid : " + rsp.merchant_uid);
        } else {
            alert("결제 실패 : 코드(" + rsp.error_code +") / 메세지(" + rsp.error_msg + ")");
        }
    });
})

// 결제 방법
const payOptionBox = document.getElementById("pay-option-box");
const payOption = document.getElementsByName("pay-option");

payOptionBox.addEventListener("click", function(){

    for(let i=0; i<4; i++) {

        if(payOption[i].checked){
            payOption[i].previousElementSibling.style.backgroundColor = "white";
            payOption[i].previousElementSibling.style.color = "#ff7E5F";
        } else {
            payOption[i].previousElementSibling.style.backgroundColor = "#ff7E5F";
            payOption[i].previousElementSibling.style.color = "white";
        }
    }
});

//가격 포맷 바꾸기
function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}