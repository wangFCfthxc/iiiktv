//jQuery UI calendar
$(function() {
		$.datepicker.setDefaults($.datepicker.regional["zh-TW"]);
		$("#calendar").datepicker({
			minDate : +1,
			maxDate : "+1M",
			showAnim : "slideDown",
			dateFormat : "yy-mm-dd",
			showButtonPanel : true
		});
	});

	$(function() {
		$("#timePer").selectmenu()
	});
//判斷表格中該填入何種資訊
	function checkBookIn() {
		if ($('#calendar').val() == '') {
			$('#meg01').html('<em>請選擇預約日期</em>');
		} else {
			$('#meg01').html('');
		}
		if ($('#time').val() == null) {
			$('#meg02').html('<em>請選擇預約時間</em>');
		} else {
			$('#meg02').html('');
		}
		if ($('#num').val() == '') {
			$('#meg03').html('<em>請填選人數</em>');
		} else {
			$('#meg03').html('');
		}
		if ($('#ckbox').prop("checked") == false) {
			$('#meg04').html('<em>未同意</em>');
		} else {
			$('#meg04').html('');
		}
		if ($('#roombox').val() == null){
			$('#meg05').html('<em>請填選包廂</em>');
		} else {
			$('#meg05').html('');
		}
		if ($('#calendar').val() != '' && $('#time').val() != null && $('#roombox').val() != null && $('#num').val() != '' && $('#ckbox').prop("checked") == true)
			return true;
		return false;
	}
	$(document).ready(function() {
		$('#myModal3').modal();
		$('[data-toggle="tooltip"]').tooltip();
		$("#demo").on("hide.bs.collapse",function() {
			$("#csCheck").html('<span class="glyphicon glyphicon-collapse-down"></span> 訂位須知');
		});
		$("#demo").on("show.bs.collapse",function() {
			$("#csCheck").html('<span class="glyphicon glyphicon-collapse-up"></span> 訂位須知');
		});
		$("#csCheck").click(function() {
			$("#ckbox").prop("checked", true);
		});
		$("#bookbtn").click(function() {
			$("#ckbox").prop("checked", false);
		});
		$("#calendar").change(function() {
			if ($("#calendar").val() != '') {
				$("#roombox").removeAttr('disabled');
			}
		});
		$("#roombox").change(function() {
			$("#time option").remove();
			if ($("#roombox").val() != '') {
				$("#time").removeAttr('disabled');
			}
			
			if($("#roombox").prop('selectedIndex') == 1){
				$("#time").append(
						"<option disabled selected>--請選擇時--</option>",
						"<option value='50'>00:00</option>",
						"<option value='51'>03:00</option>",
						"<option value='52'>06:00</option>",
						"<option value='53'>09:00</option>",
						"<option value='54'>12:00</option>",
						"<option value='55'>15:00</option>",
						"<option value='56'>18:00</option>",
						"<option value='57'>21:00</option>"
						);
			}
			if($("#roombox").prop('selectedIndex') == 2){
				$("#time").append(
						"<option disabled selected>--請選擇時--</option>",
						"<option value='60'>00:00</option>",
						"<option value='61'>03:00</option>",
						"<option value='62'>06:00</option>",
						"<option value='63'>09:00</option>",
						"<option value='64'>12:00</option>",
						"<option value='65'>15:00</option>",
						"<option value='66'>18:00</option>",
						"<option value='67'>21:00</option>"
						);
			}
			if($("#roombox").prop('selectedIndex') == 3){
				$("#time").append(
						"<option disabled selected>--請選擇時--</option>",
						"<option value='70'>00:00</option>",
						"<option value='71'>03:00</option>",
						"<option value='72'>06:00</option>",
						"<option value='73'>09:00</option>",
						"<option value='74'>12:00</option>",
						"<option value='75'>15:00</option>",
						"<option value='76'>18:00</option>",
						"<option value='77'>21:00</option>"
						);
			}
		});

	});
//	判斷包廂剩幾個位置
	window.onload = function() {
		$('#calendar').change(function() {
			var a = $('#calendar').val();
			$('#roombox').prop('selectedIndex', 0);
			$('#time').prop('selectedIndex', 0);
			$('#roombox').change(function() {
				var b = $('#roombox').val();
				$('#time').prop('selectedIndex', 0);
				$('#time').change(function() {
					var c = $('#time').val();
					var response = {
							calendar : a,
							roombox : b,
							time : c
					};
					
					$.ajax({
						type : 'post',
						url : 'bookInAjax.jsp',
						data : response,
						datatype : 'json',
						success : function(response) {
							$('#sp').html(response);
						}
					});
				});
			});
		});
	}