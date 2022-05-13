<!-- 10. 입력 화면을 설계해 구현할 pollRead.jsp를 만든다. 첫줄체 연필표시 눌러서!,,브랜치를 마스터로 하면 최종 권한자여서 바로 바뀜. 팀원들은 자기가 브랜치 만들서서 수정하면됨 -->
<%@page import="kr.tjoeun.onLinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인투표 페이지</title>
<!-- 11. 사이트를 대표하는 아이콘인 파비콘을 설정한다. -->
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
	//	12. 이클립스가 구현하는 웹서버의 실제 경로에 저장된 파일의 경로와 이름을 연결한다.
	String filepath = application.getRealPath("/") + "poll.txt";

	//	13. 투표 정보가 저장된 메소드를 실행해 텍스트 파일을 읽어들인다.
	ArrayList<String> poll = PollRead.pollRead(filepath); //(직접 작성하면 빨간줄, 컨슾해서 임폴트 시키면 사라짐) //이 파일패스가 PollRead.java메소드의 인수로 넘어감, 그러고 리턴받은 poll을 어레이리스트에 저장.
	
	//	14. 읽어들인 투표 정보에서 투표 항목의 개수를 계산한다.
	int itemCount = (poll.size() - 1) / 2; 
%>

	<!-- 15. 투표 항목 중 하나를 선택하고 투표하기 버튼이 클릭되면 투표 결과를 넘겨줄 페이지를  pollWrite.jsp로 지정한다. -->
	<form action="pollWrite.jsp" method="post">
		<table width="500" border="1" align="center" cellpadding="5" cellspacing="0">
			<tr>
				<th>
					<%= poll.get(0)%><!-- 16. 테이블에 투표 제목을 표시한다. -->
				</th>
			</tr>
<% 
			for (int i=1; i<=itemCount; i++){
%>	
			<tr>
				<td>
					<!-- 17. 테이블에 투표 항목을 선택할 수 있도록 radio 버튼을 표시한다. -->
					<!-- 18. radio 버튼은 동시에 2개 이상 선택되지 않도록 한다. -->
					<input type="radio" name="poll" value="<%=i%>"><%= poll.get(i) %><!-- 19. 텍스트 파일에서 읽어들인 투표 항목을 화면에 표시한다. -->
				
				</td>
			</tr>
<% 
	}
%>		
			<tr>
				<td align="center">
					<input type="submit" value="투표하기"/><!-- 20. 투표하기 버튼을 화면에 표시한다. -->
				
					<input type="button" value="결과보기" onclick="location.href = 'pollResult.jsp'"/>
					<!-- 21. 결과보기 버튼을 화면에 표시한다.  -->
					<!-- 22. 결과보기 버튼이 클릭되면 결과보기 페이지 pollResult.jsp가 나타나도록 구현한다. -->
				</td>
			</tr>
	
	
		
		
		</table>




	</form>
</body>
</html>
