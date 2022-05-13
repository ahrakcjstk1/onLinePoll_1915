<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.tjoeun.onLinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="refresh" content="1; url='?'" > <!-- 39. 일정 시간이 경과될 때 마다 결과 보기 화면을 자동으로 갱신시킨다. -->

<title>실시간 온라인투표 개표현황</title>
<link rel="icon" href="./favicon-16x16.png">

<style type="text/css">
 tr {
	color: #FFFFFF; 
 }
 table {
 	border: 1px solid #FFFFFF;
 }
</style>


</head>
<body background="./bg.jpg">

<%
	String filepath = application.getRealPath("/") + "poll.txt";
	ArrayList<String> poll = PollRead.pollRead(filepath); 
	int itemCount = (poll.size() - 1) / 2; //40. 투표 결과를 표시하기 위해 텍스트 파일을 읽어 투표 항목의 개수를 계산한다.
	
	int sum = 0;
	for(int i=itemCount + 1; i<poll.size(); i++) {
		sum += Integer.parseInt(poll.get(i)); // 41. 전체 투표수를 계산한다. //i(11~20)번째 어레이리스트 꺼내온 후 정수로 넣어준다
	}
	
	DecimalFormat df1 = new DecimalFormat("#,##0표"); // 42. 득표수에 적용할 숫자 서식을 만든다.
	DecimalFormat df2 = new DecimalFormat("0.00%"); // 43. 득표율에 적용할 숫자 서식을 만든다.
%>
	
	<table width="500" border="1" align="center" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="2">
				<%= poll.get(0) %><!-- 44. 투표 제목을 화면에 표시한다. -->
			</th>
		</tr>
		
		<tr>
			<td align="right" colspan="2">
				<%= df1.format(sum) %> <!-- 45. 전체 투표수에 숫자 서식을 적용해 화면에 표시한다. (에러 안사라지면 이클립스 재실행) -->
			</td>
		</tr>
<%
		for(int i=1; i<=itemCount; i++) {
			int pyo = Integer.parseInt(poll.get(i + itemCount)); // 46. 개별 항목에 대한 득표수를 얻어온다.
			double per = (sum == 0 ? 0 : (double) pyo / sum); // 47. 개별 항목에 대한 득표율을 계산한다.
%>		
		<tr>
			<td width="170">
				<%= poll.get(i) %>&nbsp;(<%=df1.format(pyo)%>) <!-- 48. 개별 득표수에 숫자 서식을 적용해 화면에 표시한다. -->
			</td>
			<td width="330">
				<hr color=#999999 size="12" width="<%= 330 * per %>" align="left"/> <!-- 49. 개별 득표율에 따른 막대 그래프를 표시한다. -->
			</td>
		</tr>
<%
		}
%>		
		<tr>
			<td colspan="2" align="center">
				<!-- 50. 투표하기로 가기 버튼이 클릭되면 투표하기 페이지 pollRead.jsp가 나타나도록 구현한다. -->
				<input type="button" value="투표 페이지로 돌아가기" onclick="location.href = 'pollRead.jsp'">
			</td>
		</tr>

	</table>
	

</body>
</html>