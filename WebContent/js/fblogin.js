
function statusChangeCallback(response) {
  if (response.status === 'connected') {
    testAPI();
  } else if (response.status === 'not_authorized') {
	  $('#status').html('請登入此應用程式，方能註冊');
  } else {
	  $('#status').html('請登入您的Facebook的帳號');
  }
}

function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}

window.fbAsyncInit = function() {
FB.init({
  appId      : '1396251953742222',
  status	 : true,
  xfbml      : true,  
  version    : 'v2.8' 
});

FB.getLoginStatus(function(response) {
  statusChangeCallback(response);
});

};
//以下此段是獲取fb的 apk
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/zh_TW/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


function testAPI() {
  FB.api('/me','get',{fields:'id,name,email'}, function(response) {
    $.ajax({
    	type:'post',
    	url:'../ClientRegisterServlet.controller',
    	data:response,
    	datatype:'jsonp',
    	success:function(response){
    		$('#sp').html(response);
    	}
    })
    });
}