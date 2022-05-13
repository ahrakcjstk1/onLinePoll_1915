<%@page import="kr.tjoeun.onLinePoll.PollWrite"%>
<%@page import="kr.tjoeun.onLinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String temp = request.getParameter("poll");// 30. pollRead.jsp에서 넘어오는 투표 내용을 받는다.
	
	if (temp != null && temp.trim().length() != 0) { // 31. 투표 데이터가 넘어왔나 검사한다.
		
		try{ // 32. 넘어온 투표 데이터가 숫자인가 검사한다. 
			int result = Integer.parseInt(temp); 
			
			String filepath = application.getRealPath("/") + "poll.txt";
			ArrayList<String> poll = PollRead.pollRead(filepath);
			
			int itemCount = (poll.size() - 1) / 2;// 33. 투표 내용이 저장된 텍스트 파일을 읽어 투표 항목의 개수를 계산한다.
			
			if(result >= 1 && result <= itemCount){ // 34. 넘어온 투표 데이터가 정상적인 투표 범위인가 계산한다.
				
				int index = result + itemCount; // 35. 득표수를 증가시킬 위치를 계산한다.
				
				result = Integer.parseInt(poll.get(index)) + 1;// 36. 득표수를 증가시킨다.
				
				poll.set(index, result + ""); 
				
				PollWrite.pollWrite(filepath, poll);// 37. 득표수를 증가시킨 결과를 저장한다.
				
				response.sendRedirect("pollResult.jsp");// 38. 투표 결과보기 페이지(pollResult.jsp)로 넘겨준다.
				
			} else {
				out.println("<script>");
				out.println("alert('투표 데이터가 정상 투표 범위가 아닙니다.')"); 
				out.println("location.href='pollRead.jsp'"); 
				out.println("</script>");
			}
			
		} catch (NumberFormatException e){
			out.println("<script>");
			out.println("alert('투표 데이터가 숫자가 아닙니다.')"); 
			out.println("location.href='pollRead.jsp'"); 
			out.println("</script>");				
		}
	
	} else {
		out.println("<script>");
		out.println("alert('투표할 데이터를 선택하세요.')"); 
		out.println("location.href='pollRead.jsp'"); 
		out.println("</script>");				
		
	}
	
%>
	
	
	

</body>
</html>