<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../js/jquery-3.1.1.js"></script>
<script src="../js/month.js"></script>
<script src="../js/menberRegister02.js"></script>

	<h1>免&nbsp;費&nbsp;註&nbsp;冊</h1>
	<h3>歡迎&nbsp;${name }&nbsp;請填寫以下資訊後送出</h3> 
 	<form action="../ClientRegisterServlet.controller" method="post">

          <div class="field-wrap">
            <label>
              手機號碼<span class="req">*</span>
            </label>
            <input type="tel" pattern="^09[0-9]{8}$" title="必須為09開頭、共10數字組成" 
		        type="tel" id="input_size"  name="tel" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
		        required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            
            <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-birthday-cake fa-2x" aria-hidden="true"></i></span>
            
            <div class="birthday">
            <div class="years">
            <select id="years" name="years"></select><a>年</a>
            &nbsp;&nbsp;</div>
            <div class="months">
            <select id="months" name="months"></select><a>月</a>
            &nbsp;&nbsp;</div>
            <div class="days"> 
            <select id="days" name="days"></select><a>日</a>
            &nbsp;&nbsp;</div>
            </div>
            
            </div>
            
          </div>
          <button type="button" class="button button-block" align="center" onclick="javascript:location.href='../index.html'">回首頁</button>
          <button type="button" class="button button-block" align="center" onclick="clearAll()">清 除</button>
          <button type="submit" class="button button-block" >送 出</button>
          
     </form>

