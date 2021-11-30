
	function searchRecord(year, month){
		var form = document.querySelector(".record-form");
		form.querySelector("input[name=year]").value = year;
		form.querySelector("input[name=month]").value = month;
		form.submit();
	}
	function searchRecordMid(year, month,category){
		var form = document.querySelector(".record-form");
		form.querySelector("input[name=year]").value = year;
		form.querySelector("input[name=month]").value = month;
		var tag = document.createElement("input");
		tag.type="hidden";
		tag.name="boardMiddleName";
		tag.value=category;
		form.appendChild(tag);
		form.submit();
	}
	
	
	function prevMonth(){
		var year = currentYear;
		var month = currentMonth - 1;
//		var category=nowCategory;
		if(month < 1){
			month = 12;
			year--;
		}
		
		searchRecord(year, month);
	}
	function nextMonth(){
		var year = currentYear;
		var month = currentMonth +1;
//		var category = nowCategory;
		if(month >12){
			month=1;
			year++;
		}
		searchRecord(year, month)
	}
	function middleDaily(){
		var year=currentYear;
		var month = currentMonth;
		var category="일자별";
		
		searchRecordMid(year,month,category);
		
	};
	function middleFitgroup(){
		var year=currentYear;
		var month = currentMonth;
		var category="소모임";
		
		searchRecordMid(year,month,category);
		
	};
	function middleDiet(){
		var year=currentYear;
		var month = currentMonth;
		var category="식단";
		
		searchRecordMid(year,month,category);
		
	};
	function middleReset(){
		var year = currentYear;
		var month = currentMonth;
		
		searchRecord(year,month);
	};
	//버튼 누르면 preMonth()/nextMonth()함수 실행
	$(function(){
		$(".before-month").click(function(){
			prevMonth();
		});
		$(".next-month").click(function(){
			nextMonth();
		});
	});
	$(function(){
		$(".daily-record").click(function(){
			middleDaily();
			
		});
		$(".fitgroup-record").click(function(){
			middleFitgroup();
		});
		$(".diet-record").click(function(){
			middleDiet();
		});
		$(".reset-record").click(function(){
			middleReset();
		});
	});