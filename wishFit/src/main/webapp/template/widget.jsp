<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src = "http://code.jquery.com/jquery-3.6.0.js"></script>
    <title>달력 위젯</title>
    
    <style>
        table
        {
            border:1px solid #BDBDBD;
            text-align:center;
            width:10%;
            font-size:12px;
        }
        .nextyear, .beforeyear{
            font-size:1%;
            color:#B3B6B3;

        }
        .acc-color-sun{
            color : #FF9090;
        }
        .acc-color-sat{
            color : #7ED5E4;
        }
        .container-left{
            margin-top : 20px;
            margin-left : 20px;
            position : relative;
        }
    </style>
    
    <script>
        var today = new Date(); // 오늘 날짜
        var date = new Date();
    
        //이전 달 누르면 넘어가기
        $(function(){
            $("#before").click(function(){
                today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
                build(); //만들기
            });
        });
        //다음 달 누르면 넘어가기
        $(function(){
            $("#next").click(function(){
                today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
                build();
            });
        });
        function build()
        {
            var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
            var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
            var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
            var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
            yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
            
            if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
            {
                before.innerHTML=(today.getMonth())+"월";
                next.innerHTML="1월";
            }
            else if(today.getMonth()+1==1) //  1월 일 때
            {
            before.innerHTML="12월";
            next.innerHTML=(today.getMonth()+2)+"월";
            }
            else //   12월 일 때
            {
                before.innerHTML=(today.getMonth())+"월";
                next.innerHTML=(today.getMonth()+2)+"월";
            }
            
        
            // 남은 테이블 줄 삭제
            while (tbcal.rows.length > 2) 
            {
                tbcal.deleteRow(tbcal.rows.length - 1);
            }
            var row = null;
            row = tbcal.insertRow();
            var cnt = 0;
    
            // 1일 시작칸 찾기
            for (i = 0; i < nMonth.getDay(); i++) 
            {
                cell = row.insertCell();
                cnt = cnt + 1;
            }
    
            // 달력 출력
            for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
            { 
                cell = row.insertCell();
                cell.innerHTML = i;
                cnt = cnt + 1;
                if (cnt % 7 == 1) {//일요일 계산
                    cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
                }
                if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                    cell.innerHTML = "<font color=#7ED5E4>" + i//토요일에 색
                    row = calendar.insertRow();// 줄 추가
                }
                if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) 
                {
                    cell.bgColor = "#BCF1B1"; //오늘날짜배경색
                }
            
            }
    
        }
    </script>
</head>
<body onload="build();">
    <div class="container-300 container-left">
        <table id="calendar" >
            <tr>
                <td class="beforeyear"><label id="before"></label></td>
                <td colspan="5" id="yearmonth"></td>
                <td class="nextyear"><label id="next"></label></td>
            </tr>
            <tr class="line">
                <td class="acc-color-sun week-head">일</td>
                <td class="week-head">월</td>
                <td class="week-head">화</td>
                <td class="week-head">수</td>
                <td class="week-head">목</td>
                <td class="week-head">금</td>
                <td class="acc-color-sat week-head">토</td>
            </tr>
        </table>
    </div>
    
    
</body>
</html>