$(function() {

    $(".dateclick").dateclick();    // DateClick
    $(".searchDate").schDate();
});

// Search Date
jQuery.fn.schDate = function(){
    var $obj = $(this);
    var $chk = $obj.find("input[type=button]");
    $chk.click(function(){
        $('input:not(:checked)').parent(".chkbox2").removeClass("on");
        $('input:checked').parent(".chkbox2").addClass("on");
    });
};

// DateClick
jQuery.fn.dateclick = function(){
    var $obj = $(this);
    $obj.click(function(){
        $(this).parent().find("input").focus();
    });
}  

// 기간 검색 버튼
function setSearchDate(start){
    
    var d = new Date();
    const c = new Date(new Date(new Date().toLocaleDateString()).getTime()+24*60*60*1000-1);
    
    var startDate = $.datepicker.formatDate('yy-mm-dd', d);
    $('#date2').val(startDate);
    
    if(start == '3m') {
        var m = d.getMonth();
        d.setMonth(m - 3)
    } else if(start == '6m') {
        var m = d.getMonth();
        d.setMonth(m - 6)
    } else {
        var y = d.getFullYear();
        d.setFullYear(y - 1)
    }
    
    var endDate = $.datepicker.formatDate('yy-mm-dd', d);
    $('#date1').val(endDate);
    
    $('#date1').datepicker();
    $('#date1').datepicker("option", "maxDate", $ ("#date2").val());
    $('#date1').datepicker("option", "onClose", function ( selectedDate ) {
        $("#date2").datepicker( "option", "minDate", selectedDate );
    });
    
    $('#date2').datepicker();
    $('#date2').datepicker("option", "minDate", $ ("#date1").val());
    $('#date2').datepicker("option", "onClose", function ( selectedDate ) {
        $("#date1").datepicker( "option", "maxDate", selectedDate );
    });
}
