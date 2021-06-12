<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./inc/boardHead.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../common/jquery/jquery-3.6.0.js"></script>
<script>
	var check = 'left';
	var chk = 'left';
	var sel_files = [];
	
$(function(){
	
	$(".submit-button").click(function(){
		document.writeFrm.submit();
	});
	
	$("#input-imgs").on("change",handleImgFileSelect);
	
	$(".each-category-button").click(function(){
		
		$(".each-category-button").css({"backgroundColor":"white"});
		
		if($(this).val()=='fashion'){
			console.log("fashion");
			$("#hidden-category").val('fashion');
			$(this).css({"backgroundColor":"rgba(30, 29, 41, 0.32)"});
			$("#selected-category").text("패션")
		}
		else if($(this).val()=='sports'){
			console.log("sports");
			$("#hidden-category").val('sports');
			$(this).css({"backgroundColor":"rgba(30, 29, 41, 0.32)"});
			$("#selected-category").text("스포츠")
		}
		else if($(this).val()=='electronics'){
			console.log("electronics");
			$("#hidden-category").val('electronics');
			$(this).css({"backgroundColor":"rgba(30, 29, 41, 0.32)"});
			$("#selected-category").text("전자제품")
		}
		else if($(this).val()=='furniture'){
			console.log("furniture");
			$("#hidden-category").val('furniture');
			$(this).css({"backgroundColor":"rgba(30, 29, 41, 0.32)"});
			$("#selected-category").text("가구")
		}
	});
	$("input:radio").click(function(){
		console.log("먹나?")
		
		//::before은 가상생성자이기 때문에 jquery로 제어하기 위해서는 css속성은 먹지않고, css에서 선택자 클래스를 생성하여
		//toggleClass로 진행한다.
		if($(this).val()=='buyPos'){
			console.log("되냐");
			console.log($('#구매가능').prop('checked'));
			if($('#구매가능').prop('checked')==true && check=='right'){
				$("#buyAvail").toggleClass('uncheck');
				$('#buyUnavail').toggleClass('check');
				check = 'left';
			}
		}
		if($(this).val()=='buyImpos'){
			console.log("되냐");
			console.log($('.test').val());
			console.log(check);
			if($('#구매불가').prop('checked')==true && check=='left'){
				$("#buyAvail").toggleClass('uncheck');
				$('#buyUnavail').toggleClass('check');
				check = 'right';
			}
		}
		if($(this).val()=='pos'){
			if($('#교환가능').prop('checked')==true && chk=='right'){
				$("#bargainAvail").toggleClass('uncheck');
				$('#bargainUnavail').toggleClass('check');
				chk = 'left';
			}
		}
		if($(this).val()=='impos'){
			if($('#교환불가').prop('checked')==true && chk=='left'){
				$("#bargainAvail").toggleClass('uncheck');
				$('#bargainUnavail').toggleClass('check');
				chk = 'right';
			}
		}
	});
	
	
});


	function handleImgFileSelect(e){
		//input:file이 onchange되면 sel_files 배열을 초기화 한다.(이미지를 선택할 때마다 미리보기로 띄워져 있던 파일들을 초기화 시킨다.)
		sel_files = [];
		//미리보기 사진 공간에 띄워져있던 사진들을 초기화 시킨다.
		$("#append-space").empty();
		
		//change될때 받아온 데이터를 files로 저장한다.
		var files = e.target.files;
		//초기화한 files를 배열로 만든다.
		var filesArr = Array.prototype.slice.call(files);
		if(filesArr.length>5){
			alert("사진은 최대 5개까지 등록 가능합니다.");
			return;
		}
		var idx = 0;
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("image파일만 등록 가능합니다.")
				return;
			}
			//forEach로 받아온 각각의 파일을 sel_files 배열에 저장한다.
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				var html = "<li draggable='false' class='append-img'>"
					+" <div class='append-img-text'>대표이미지</div>"
					+" <img src="+e.target.result+" alt='상품이미지' id='img-'"+idx+">"
					+" <button type='button' id='append-delete-button-"+idx+"'></button>"
					+"</li>";
				var html2 = "<li draggable='false' class='append-img'>"
					+" <div class='append-img-text'>추가이미지</div>"
					+" <img src="+e.target.result+" alt='상품이미지' id='img-'"+idx+">"
					+" <button type='button' id='append-delete-button-"+idx+"'></button>"
					+"</li>"
				if(idx==0){
					$("#append-space").append(html);
				}
				else{
					$("#append-space").append(html2);
				}
				idx++;
				var howMany = "("+idx+"/5)";
				$("#howManyPicture").text(howMany);
			}
			reader.readAsDataURL(f);
			
		});
	}
	function formValidate(f) {
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if (f.category.value == "") {
			alert("카테고리를 선택하세요");
			return false;
		}
		if (f.price.value == "") {
			alert("가격을 입력하세요");
			f.rpice.focus();
			return false;
		}
	}
</script>
</head>
<style>
	html {
	    line-height: 1.15;
	    text-size-adjust: 100%;
	}
	body {
	    background-color: rgb(249, 249, 249);
	}
	body, input, textarea, select, button {
	    -webkit-font-smoothing: antialiased;
	    direction: ltr;
	    text-align: left;
	    color: rgb(33, 33, 33);
	    letter-spacing: -0.5px;
	    outline: 0px;
	    border: 0px;
	}
	html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, main, menu, nav, output, ruby, section, summary, time, mark, audio, video {
	    margin: 0px;
	    padding: 0px;
	    border: 0px;
	    font: inherit;
	    vertical-align: baseline;
	}
	input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 2px;
    border-width: 2px;
    border-style: inset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
	}
	input[type="file"] {
    appearance: none;
    background-color: initial;
    cursor: default;
    align-items: baseline;
    color: inherit;
    text-overflow: ellipsis;
    white-space: pre;
    text-align: start !important;
    padding: initial;
    border: initial;
    overflow: hidden !important;
	}
	h1, h2, h3, h4, h5, h6 {
	    font-size: 14px;
	    font-weight: 400;
	    margin: 0px;
	}
	div {
    	display: block;
	}
	ol,ul{
		list-style: none;
	}
	small{
		font-size : 80%;
	}
	button, [type="button"], [type="reset"], [type="submit"] {
    	appearance: button;
	}
	button {
	    background-color: transparent;
	    cursor: pointer;
	    outline: none;
	}
	[type="checkbox"], [type="radio"] {
	    box-sizing: border-box;
	    padding: 0px;
	}
	.main-box{
		height : 100%;
	    background: rgb(255, 255, 255);
	    font-size: 16px;
	    position: relative;
	}
	.inner-main{
	    display: block;
	    width: 1024px;
	    margin: auto;
	}
	.main-session{
		display: block;
		margin-bottom: 3rem;
	}
	.main-session h2{
	    height: 100px;
	    font-size: 26px;
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    border-bottom: 2px solid rgb(30, 29, 41);
	}
	.main-session h2>span{
		color: rgb(255, 80, 88);
	    font-size: 1rem;
	    margin-left: 2rem;
	}
	.column-box{
		padding-top: 0.5rem;
	}
	.image-column{
	    width: 100%;
	    display: flex;
	    padding: 2rem 0px;
	    border-bottom: 1px solid rgb(220, 219, 228);
	}
	.img-column-title{
	    width: 10.5rem;
    	font-size: 18px;
	}
	.img-column-title>span{
		color: rgb(255, 80, 88);
	}
	.img-column-title>small{
		color: rgb(155, 153, 169);
    	margin-left: 0.25rem;	
	}
	.img-column-content{
	    flex: 1 1 0%;
	}
	.img-content-box{
	    display: flex;
	    width: 856px;
	    flex-wrap: wrap;
	    overflow-x: hidden;
	}
	.image-upload-box{
		width: 202px;
	    height: 202px;
	    position: relative;
	    border: 1px solid rgb(230, 229, 239);
	    background: rgb(250, 250, 253);
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: center;
	    justify-content: center;
	    flex-direction: column;
	    color: rgb(155, 153, 169);
	    font-size: 1rem;
	    margin-right: 1rem;
	    margin-bottom: 0px;
	}
	.image-upload-box::before{
	    content: "";
	    background-position: center center;
	    background-repeat: no-repeat;
	    background-size: cover;
	    width: 2rem;
	    height: 2rem;
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgdmlld0JveD0iMCAwIDMyIDMyIj4KICAgIDxwYXRoIGZpbGw9IiNEQ0RCRTQiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTI4LjQ3MSAzMkgzLjUzYy0uOTcxIDAtMS44OTQtLjQyMi0yLjUyOS0xLjE1N2wtLjAyNi0uMDNBNCA0IDAgMCAxIDAgMjguMTk4VjguNjA3QTQgNCAwIDAgMSAuOTc0IDUuOTlMMSA1Ljk2YTMuMzQzIDMuMzQzIDAgMCAxIDIuNTI5LTEuMTU2aDIuNTM0YTIgMiAwIDAgMCAxLjUzNy0uNzJMMTAuNC43MkEyIDIgMCAwIDEgMTEuOTM3IDBoOC4xMjZBMiAyIDAgMCAxIDIxLjYuNzJsMi44IDMuMzYzYTIgMiAwIDAgMCAxLjUzNy43MmgyLjUzNGMuOTcxIDAgMS44OTQuNDIzIDIuNTI5IDEuMTU3bC4wMjYuMDNBNCA0IDAgMCAxIDMyIDguNjA2djE5LjU5MWE0IDQgMCAwIDEtLjk3NCAyLjYxN2wtLjAyNi4wM0EzLjM0MyAzLjM0MyAwIDAgMSAyOC40NzEgMzJ6TTE2IDkuNmE4IDggMCAxIDEgMCAxNiA4IDggMCAwIDEgMC0xNnptMCAxMi44YzIuNjQ3IDAgNC44LTIuMTUzIDQuOC00LjhzLTIuMTUzLTQuOC00LjgtNC44YTQuODA1IDQuODA1IDAgMCAwLTQuOCA0LjhjMCAyLjY0NyAyLjE1MyA0LjggNC44IDQuOHoiLz4KPC9zdmc+Cg==);
	    margin-bottom: 1rem;
	}
	.image-upload-box input{
	    border: 1px solid rgb(195, 194, 204);
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    top: 0px;
	    left: 0px;
	    opacity: 0;
	    cursor: pointer;
	    font-size: 0px;
	}
	.img-required{
	    margin-top: 1.5rem;
	    color: orange;
	    line-height: 1.5;
	    font-size: 14px;
	}
	.view-upload-img-box{
		width: 100%;
	    height: 100%;
	    position: fixed;
	    top: 0px;
	    left: 0px;
	    background: rgba(0, 0, 0, 0.9);
	    z-index: 1000;
	    display: none;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: center;
	    justify-content: center;
	}
	.inner-view-upload-img-box{
		width: 100%;
	    height: 100%;
	    position: relative;
	    display: flex;
	    flex-direction: column;
	    -webkit-box-pack: center;
	    justify-content: center;
	}
	.close-button{
		position: absolute;
	    top: 50px;
	    right: 50px;
	}
	.title-column-content{
	    width: 100%;
	    display: flex;
	    padding: 2rem 0px;
	    border-bottom: 1px solid rgb(220, 219, 228);
	}
	.title-content-box{
	    width: 10.5rem;
	    font-size: 18px;
	    padding-top: 14px;
	}
	.title-content-box>span{
	    color: rgb(255, 80, 88);
	}
	.input-title-box{
	    flex: 1 1 0%;
	    width : 100%;
	}
	.inner-input-title-box{
		display: flex;
	    width: 100%;
	    -webkit-box-align: center;
	    align-items: center;
	}
	.input-title{
	    height: 3rem;
   		padding: 0px 1rem;
	    width: 80%;
        border: 1px solid rgb(195, 194, 204);
	}
	.outer-title{
	    position: relative;
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
		    width : 100%
	}
	.category-column-box{
		width: 100%;
	    display: flex;
	    padding: 2rem 0px;
	    border-bottom: 1px solid rgb(220, 219, 228);
	}
	.category-column-name{
	    width: 10.5rem;
	    font-size: 18px;
	    padding-top: 8px;
	}
	.category-column-name>span{
		color: rgb(255, 80, 88);
	}
	.category-select-box{
		flex: 1 1 0%;
	}
	.category-select-inner-box{
		display: flex;
	    width: 284px;
	    height: 19rem;
	    overflow: hidden;
	    border: 1px solid rgb(220, 219, 228);
	}
	.category-select{
	    width: 284px;
	    height: 100%;
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: center;
	    justify-content: center;
	    overflow-y: auto;
	    color: rgb(195, 194, 204);
	}
	.category-select-menu{
	    width: 100%;
	    height: 100%;
	    padding: 0.5rem 0px;
	}
	.each-category{
		display: flex;
	    width: 100%;
	    height: 40px;
	    -webkit-box-align: center;
	    align-items: center;
	}
	.each-category-button{
	    width: 100%;
	    height: 100%;
	    padding: 0px 1.5rem;
	}
	.show-select-category{
	    margin-top: 1.5rem;
	    font-size: 16px;
	    color: rgb(255, 80, 88);
	}
	.availablity-column-box{
	    width: 100%;
	    display: flex;
	    padding: 2rem 0px;
	    border-bottom: 1px solid rgb(220, 219, 228);
	}
	.availablity-column-title{
		width: 10.5rem;
	    font-size: 18px;
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	}
	.availablity-column-title>span{
		color: rgb(255, 80, 88);
	}
	.availablity-content-box{
		flex: 1 1 0%;
	}
	.availablity-content-inner-box{
	    display: flex;
	}
	.availablity-uncheck{
	    display: flex;
	    font-size: 1rem;
	    -webkit-box-align: center;
	    align-items: center;
	    position: relative;
	    margin-right: 2rem;
	}
	.availablity-check{
	    display: flex;
	    font-size: 1rem;
	    -webkit-box-align: center;
	    align-items: center;
	    position: relative;
	    margin-right: 2rem;
	}
	.availablity-uncheck::before{
		content: "";
	    background-position: center center;
	    background-repeat: no-repeat;
	    background-size: 20px 20px;
	    width: 2rem;
	    height: 2rem;
	    padding: 0.5rem;
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiNDM0MyQ0MiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEwIDIwYzUuNTE0IDAgMTAtNC40ODYgMTAtMTBTMTUuNTE0IDAgMTAgMCAwIDQuNDg2IDAgMTBzNC40ODYgMTAgMTAgMTB6bTAtMThjNC40MTEgMCA4IDMuNTg5IDggOHMtMy41ODkgOC04IDgtOC0zLjU4OS04LTggMy41ODktOCA4LTh6Ii8+Cjwvc3ZnPgo=);
	    border-radius: 50%;
	}
	.availablity-check::before{
		content: "";
	    background-position: center center;
	    background-repeat: no-repeat;
	    background-size: 20px 20px;
	    width: 2rem;
	    height: 2rem;
	    padding: 0.5rem;
	    background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiNGRjUwNTgiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEwIDIwYzUuNTE0IDAgMTAtNC40ODYgMTAtMTBTMTUuNTE0IDAgMTAgMCAwIDQuNDg2IDAgMTBzNC40ODYgMTAgMTAgMTB6bTAtMThjNC40MTEgMCA4IDMuNTg5IDggOHMtMy41ODkgOC04IDgtOC0zLjU4OS04LTggMy41ODktOCA4LTh6bTAgMTNhNSA1IDAgMSAwIDAtMTAgNSA1IDAgMCAwIDAgMTB6Ii8+Cjwvc3ZnPgo=');
	    border-radius: 50%;
	}
	#buyAvail.uncheck::before{
		background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiNDM0MyQ0MiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEwIDIwYzUuNTE0IDAgMTAtNC40ODYgMTAtMTBTMTUuNTE0IDAgMTAgMCAwIDQuNDg2IDAgMTBzNC40ODYgMTAgMTAgMTB6bTAtMThjNC40MTEgMCA4IDMuNTg5IDggOHMtMy41ODkgOC04IDgtOC0zLjU4OS04LTggMy41ODktOCA4LTh6Ii8+Cjwvc3ZnPgo=);
		
	}
	#buyUnavail.check::before{
		background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiNGRjUwNTgiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEwIDIwYzUuNTE0IDAgMTAtNC40ODYgMTAtMTBTMTUuNTE0IDAgMTAgMCAwIDQuNDg2IDAgMTBzNC40ODYgMTAgMTAgMTB6bTAtMThjNC40MTEgMCA4IDMuNTg5IDggOHMtMy41ODkgOC04IDgtOC0zLjU4OS04LTggMy41ODktOCA4LTh6bTAgMTNhNSA1IDAgMSAwIDAtMTAgNSA1IDAgMCAwIDAgMTB6Ii8+Cjwvc3ZnPgo=');
		
	}
	#bargainAvail.uncheck::before{
		background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiNDM0MyQ0MiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEwIDIwYzUuNTE0IDAgMTAtNC40ODYgMTAtMTBTMTUuNTE0IDAgMTAgMCAwIDQuNDg2IDAgMTBzNC40ODYgMTAgMTAgMTB6bTAtMThjNC40MTEgMCA4IDMuNTg5IDggOHMtMy41ODkgOC04IDgtOC0zLjU4OS04LTggMy41ODktOCA4LTh6Ii8+Cjwvc3ZnPgo=);
		
	}
	#bargainUnavail.check::before{
		background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiNGRjUwNTgiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEwIDIwYzUuNTE0IDAgMTAtNC40ODYgMTAtMTBTMTUuNTE0IDAgMTAgMCAwIDQuNDg2IDAgMTBzNC40ODYgMTAgMTAgMTB6bTAtMThjNC40MTEgMCA4IDMuNTg5IDggOHMtMy41ODkgOC04IDgtOC0zLjU4OS04LTggMy41ODktOCA4LTh6bTAgMTNhNSA1IDAgMSAwIDAtMTAgNSA1IDAgMCAwIDAgMTB6Ii8+Cjwvc3ZnPgo=');
		
	}
	.availablity-check input[type="radio"]{ 
		 display: none;
		border: 1px solid rgb(195, 194, 204);
	}
	.availablity-uncheck input[type="radio"]{
		 display: none;
		border: 1px solid rgb(195, 194, 204);
	}
	.price-box{
	    flex: 1 1 0%;
	}
	.price-inner-box input{
		height: 3rem;
    	padding: 0px 1rem;
    	border: 1px solid rgb(195, 194, 204);
	}
	.price-inner-box span{
		margin-left : 5px;
		color : rgb(195, 194, 204);
	}
	.freeshipping-box{
		display: flex;
    	margin-top: 1rem;
	}
	.freeship-label{
		display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    cursor: pointer;
	}
	.freeship-label::before{
		content: "";
	    background-position: center center;
	    background-repeat: no-repeat;
	    background-size: 20px 20px;
	    width: 2rem;
	    height: 2rem;
	    padding: 0.5rem;
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiNDM0MyQ0MiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEwIDBDNC40ODYgMCAwIDQuNDg2IDAgMTBzNC40ODYgMTAgMTAgMTAgMTAtNC40ODYgMTAtMTBTMTUuNTE0IDAgMTAgMG0wIDE4Yy00LjQxMSAwLTgtMy41ODktOC04czMuNTg5LTggOC04IDggMy41ODkgOCA4LTMuNTg5IDgtOCA4bTIuMjkzLTEwLjcwN0w5IDEwLjU4NiA3LjcwNyA5LjI5M2ExIDEgMCAxIDAtMS40MTQgMS40MTRsMiAyYS45OTcuOTk3IDAgMCAwIDEuNDE0IDBsNC00YTEgMSAwIDEgMC0xLjQxNC0xLjQxNCIvPgo8L3N2Zz4K);
	    border-radius: 50%;
	}
	.freeship-label input{
		height: 3rem;
    	padding: 0px 1rem;
   	    display: none;
   	    border: 1px solid rgb(195, 194, 204);
	}
	.content-inner{
	    flex: 1 1 0%;
	}
	.content-inner textarea{
		padding: 1rem;
	    resize: none;
	    line-height: 1.35;
        border: 1px solid rgb(195, 194, 204);
        width: 100%;
	}
	.per-day{
		color: orange;
		font-size: 16px;
	}
	.button-box{
		margin-top : 50px;  
	    width: 100%;
	    height: 5.5rem;
	    background: rgb(250, 250, 253);
	    box-shadow: rgb(234 233 241) 0px -1px 0px 0px;
	/*     position: fixed; */
	    left: 0px;
	    bottom: 0px;
	    display : flex;
	}
	.include-button{
	    display: flex;
	    height: 100%;
	    -webkit-box-pack: end;
	    justify-content: flex-end;
	    -webkit-box-align: center;
	    align-items: center;
	    width: 1024px;
	    margin: auto;
	}
	.submit-button{
		height: 3.5rem;
	    width: 10rem;
	    color: rgb(255, 255, 255);
	    font-size: 20px;
	    font-weight: 700;
	    border-radius: 2px;
	    background: rgb(255, 80, 88);
	    position: relative;
	}
	.submit-button::before{
	    content: "등록하기";
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    top: 0px;
	    left: 0px;
	    border-radius: 2px;
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: center;
	    justify-content: center;
	}
	.append-img{
	    width: 202px;
	    height: 202px;
	    border: 1px solid rgb(230, 229, 239);
	    margin-right: 1rem;
	    margin-bottom: 0px;
	    list-style-type: none;
	    position: relative;
	    display: inline-block;
	    cursor: pointer;
	}
	.append-img-text{
	    position: absolute;
	    height: 1.5rem;
	    padding: 0px 0.5rem;
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    top: 0.5rem;
	    left: 0.5rem;
	    background-color: rgba(30, 29, 41, 0.32);
	    color: rgb(255, 255, 255);
	    border-radius: 12px;
	    font-size: 12px;
	}
	.append-img img{
		width: 100%;
		height: 100%;
	}
	.append-delete-button{
		width: 1.5rem;
	    height: 1.5rem;
	    background-position: center center;
	    background-repeat: no-repeat;
	    background-size: 12px 12px;
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTYuODQ4IDZsMy43NzYtMy43NzZhLjYuNiAwIDEgMC0uODQ4LS44NDhMNiA1LjE1IDIuMjI0IDEuMzc2YS42LjYgMCAwIDAtLjg0OC44NDhMNS4xNTIgNiAxLjM3NiA5Ljc3NWEuNi42IDAgMSAwIC44NDguODQ5TDYgNi44NDhsMy43NzYgMy43NzZhLjU5OC41OTggMCAwIDAgMS4wMjQtLjQyNS42LjYgMCAwIDAtLjE3Ni0uNDI0TDYuODQ4IDZ6IiBvcGFjaXR5PSIuNjQiLz4KPC9zdmc+Cg==);
	    background-color: rgba(30, 29, 41, 0.32);
	    border-radius: 50%;
	    position: absolute;
	    top: 0.5rem;
	    right: 0.5rem;
	}
	.append-space{
		display: flex;
		
	}
	#selected-category{
		color : orange;
		font-weight: bold;
		font-size: 18px;
	}
</style>
<body>

<div class="container">
	<jsp:include page="./inc/boardTop.jsp" />
	<div class="main-box"> 
		<main class="inner-main">
			<section class="main-session">
				<h2>상품등록하기<span>*필수항목</span></h2>
				<form id="form" name="writeFrm" method="post" enctype="multipart/form-data"
    				action="../lendmark/write.do" onsubmit="return formValidate(this);">
				<ul class="column-box">
					<li class="image-column">
						<div class="img-column-title">
							상품이미지<span>*</span><small id="howManyPicture">(0/5)</small>
						</div>
						<div class="img-column-content">
							<ul class="img-content-box">
								<li class="image-upload-box">이미지 등록<input type="file" id="input-imgs" name="images[]"
									accept="image/*" multiple required>
								</li>
								<div id = "append-space"></div>
							</ul>
							<div class="img-required">
								<b>※큰 이미지일 경우 이미지가 깨질 수 있습니다.</b>
							</div>
							<div class="view-upload-img-box">
								<div class="inner-view-upload-img-box">
									<button type="button" class="close-button">
										<img
											src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAABACAYAAACjgtGkAAAAAXNSR0IArs4c6QAAAolJREFUeAHl20tSxCAQANCJW12ql3DtKTxE9GQ6h/AU7j2EutT12J1qUowhCZ/+AFLFgIEU9pvApjPDAcrpdLqH5gHqJ9TjMAzf0HZfIO4rCHKEegP1FeJ+u6Co36H9oIGRJtJQn80fDIwdDQ6DCxcmXEIftW6hdv2kBDBwV/ygxQyCf/wHlC2MBUjvKHsYQZBeUWIwVkF6Q4nF2ATpBSUFYxekdZRUjCiQVlFyMKJBWkPJxUgCaQWlBCMZpHaUUowskFpRODCyQWpD4cIoAqkFhROjGMQahRuDBcQKRQKDDUQbRQqDFUQLRRKDHUQaRRpDBEQKRQNDDIQbRQtDFIQLRRNDHKQURRtDBSQXxQJDDSQVxQpDFSQWxRJDHWQPxRrDBGQNBa9DcYlnzLXO6cVpROnjLJWptOa0DDwNfi75i9a+htYMA/8HMxBcnFCeoIsQWBDm2SWepyvKH+51COVl5+VCX0jo2nyDdMcMxDtA8enAJwMr9kcag65+Mfk2PAx8c2c6Myh08/dT1EFCGO7MgDH/oDV5aUcVZAvDbQ5rFDWQGIwaUFRAUjCsUcRBcjAsUURBSjCsUMRAODAsUERAODG0UdhBJDA0UVhBJDG0UNhANDA0UFhANDGkUYpBLDAkUYpALDGkULJBasCQQMkCqQmDGyUZpEYMTpQkkJoxuFCiQVrA4ECJAmkJoxRlF6RFjBKUTZCWMXJRVkF6wMhBCSaqesJAFEpzHKGLOSDMBY0QI6Y8FmUBQhNdFt7lRqYf+S7ubuiCh4IxIcpjCOVsy9CER7oBb3xxSSTod1H2YpxB9iZ2oUFBbMU6gWxN6AnCj2UtZneG3MFk3FddbhMfwvUDZwoaHH4B+xHVOFecBB4AAAAASUVORK5CYII="
											width="34" height="32" alt="닫기 버튼 아이콘">
									</button>
								</div>
							</div>
						</div>
					</li>
					<li class="title-column-content">
						<div class="title-content-box">
							제목<span>*</span>
						</div>
						<div class="input-title-box">
							<div class="inner-input-title-box">
								<div class="outer-title">
									<input type="text" name="title" placeholder="상품 제목을 입력해주세요."
										class="input-title" value="">
									<input type="hidden" id="title-required" />
								</div>
								
							</div>
						</div>
					</li>
					<li class="category-column-box">
						<div class="category-column-name">
							카테고리<span>*</span>
						</div>
						<div class="category-select-box">
							<div class="category-select-inner-box">
								<div class="category-select">
									<input type="hidden" id="hidden-category" name="category" value=""/>
									<ul class="category-select-menu">
										<li class="each-category">
											<button type="button" class="each-category-button"  value="fashion">패션</button>
										</li>
										<li class="each-category">
											<button type="button" class="each-category-button" value="sports">스포츠</button>
										</li>
										<li class="each-category">
											<button type="button" class="each-category-button" value="electronics">전자제품</button>
										</li>
										<li class="each-category">
											<button type="button" class="each-category-button" value="furniture">가구</button>
										</li>
									</ul>
								</div>
							</div>
							<h3 class="show-select-category">선택한 카테고리 : <b id="selected-category"></b>
							</h3>
						</div>
					</li>
					<li class="availablity-column-box">
						<div class="availablity-column-title">
							상품판매여부<span>*</span>
						</div>
						<div class="availablity-content-box">
							<div class="availablity-content-inner-box">
								<label for="구매가능" id="buyAvail" class="availablity-check">
									<input id="구매가능"  type="radio" value="buyPos" name="buy-radio" checked>판매가능
								</label>
								<label for="구매불가" id="buyUnavail" class="availablity-uncheck">
									<input id="구매불가"  type="radio" name="buy-radio" value="buyImpos" >판매불가
								</label>
							</div>
						</div>
					</li>
					<li class="availablity-column-box">
						<div class="availablity-column-title">
							가격제안여부<span>*</span>
						</div>
						<div class="availablity-content-box">
							<div class="availablity-content-inner-box">
								<label for="교환가능" id="bargainAvail" class="availablity-check">
									<input id="교환가능"  type="radio" value="pos" name="bargain-avail" checked>제안가능
								</label>
								<label for="교환불가" id="bargainUnavail" class="availablity-uncheck">
									<input id="교환불가"  type="radio" value="impos" name="bargain-avail" >제안불가
								</label>
							</div>
						</div>
					</li>
					<li class="availablity-column-box">
						<div class="availablity-column-title">
							가격<span class="per-day">/일</span><span>*</span>
						</div>
						<div class="price-box">
							<div class="price-inner-box">
								<input type="text" placeholder="숫자만 입력해주세요." name="price"
									class="sc-dmejso ilTAHn" value=""><span>원</span>
							</div>
						</div>
					</li>
					<li class="availablity-column-box">
						<div class="availablity-column-title">
							최소대여기간<span>*</span>
						</div>
						<div class="price-box">
							<div class="price-inner-box">
								<input type="text" placeholder="숫자만 입력해주세요." name="minimumPeriod"
									class="minimum-period" value=""><span>일</span>
							</div>
						</div>
					</li>
					<li class="availablity-column-box">
						<div class="availablity-column-title">
							최대대여기간
						</div>
						<div class="price-box">
							<div class="price-inner-box">
								<input type="text" placeholder="숫자만 입력해주세요." name = "maximumPeriod"
									class="maximum-period" value=""><span>일</span>
							</div>
						</div>
					</li>
					<li class="availablity-column-box">
						<div class="availablity-column-title">설명</div>
						<div class="content-inner">
							<textarea placeholder="상품 설명을 입력해주세요." rows="6" class="sc-ibxvc efdJUr" name="content"></textarea>
						</div>
					</li>
				</ul>
				</form>
			</section>
		</main>
		<footer class="button-box">
		<div class="include-button">
			<button class="submit-button"></button>
		</div>
		
		</footer>
	</div>
</div>
</body>
</html>