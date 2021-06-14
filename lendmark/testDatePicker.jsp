<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
	
	$(function() {
		$("#start").click(function(){
			console.log("이게안되나?");
			$("#testStart").datepicker("show");
		});
		$("#end").click(function(){
			$("#testEnd").datepicker("show");
		});
		var startMinDate = new Date();
		var endMinDate;
		console.log(endMinDate);
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$( "#testStart" ).datepicker({
			changeMonth: true,
			changeYear: true,
			nextText: '다음 달',
			prevText: '이전 달',
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dateFormat: "yymmdd", 
			minDate : 0,
			// 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
			onSelect: function(selectedDate) {
				// 종료일(endDate) datepicker가 닫힐때 
				// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정 
				$("#testEnd").datepicker( "option", "minDate", selectedDate );
				$("#testEnd").datepicker( "option", "maxDate", 30 );
				$("#startDate").text(selectedDate);
				} 
		}); 
		$( "#testEnd" ).datepicker({
			changeMonth: true,
			changeYear: true,
			nextText: '다음 달',
			prevText: '이전 달',
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dateFormat: "yymmdd", 
			minDate : $("#testStart").val(),
			maxDate: $("#testStart").val()+30,
			// 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
			onSelect: function(selectedDate) {
				// 종료일(endDate) datepicker가 닫힐때 
				// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정 
				$("#testDatepicker").datepicker( "option", "maxDate", selectedDate );
				$("#endDate").text(selectedDate);
				$("#rentalPrice").text((parseInt(selectedDate)-parseInt($("#testStart").val()))*3000+"원");
				} 
		}); 
		
			
	});
</script>
<style>
	#startDateBlock{
		height: 45px;
    	padding: 0 5px;
   	    display: table-cell;
	    width: 100%;
	    padding: 5px;
	    height: 55px;
	    color: #343434;
	    vertical-align: top;
	    font-size: 16px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div>
		<div id ="startDateBlock">
			 <p style="">대여시작일</p>
			<span id="startDate"></span>
			<input type="text" id="testStart" style="display:none" /><button id="start" style="background-color: black; border: 0 ;cursor: pointer;"><i class="fa fa-calendar" style="color:white;"></i></button>
		</div>
		<div>
			 <p>반납일</p>
			<span id="endDate"></span>
			<input type="text" id="testEnd" style="display:none" /><button id="end" style="background-color: black; border: 0;cursor: pointer;"><i class="fa fa-calendar" style="color:white;"></i></button>
		</div>
		
	</div>
	<div>
		<h2>대여금액</h2>
		<span id="rentalPrice"></span>
	</div>
</body>
</html>