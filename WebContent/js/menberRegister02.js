/*適用於會員登入/註冊、電話號碼修改、個人歌單 等頁面*/

//input輸入,文字效果
$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});

//個人歌單 - 排列順序挪移
$(document).ready(function(){
    $('.up, .down').click(function(e){
        e.preventDefault();
        
        var row = $(this).parents("tr:first"); 
     
        if ($(this).is(".up")) {
            row.insertBefore(row.prev());
        } 
        else {
            row.insertAfter(row.next());
        }
    });
});

//取消訂位
$('.btn.btn-danger.cancel').on('click', function () {
	var id = $(this).closest('tr').data('id');
    $('#modal-warning').data('id', id).modal('show');
    $('#beCanceled').click(function () {
	$('[data-id=' + id + ']').remove();
    $('#modal-warning').modal('hide');
    $.ajax({
		type : 'post',
		url : '../ClientBookingServlet.controller',
		data : {pkId:id},
		datatype : 'json'
	}); 
    
    return false;
});
});
//歌單 - 移除
$('.btn.btn-danger.delete').on('click', function () {
	var id = $(this).closest('tr').data('id');
    $('#modal-warning').data('id', id).modal('show');
    $('#beCanceled').click(function () {
	$('[data-id=' + id + ']').remove();
    $('#modal-warning').modal('hide');
    return false;
});
});


//input內容清除
function clearAll(){
	$(':input').val('');
}



