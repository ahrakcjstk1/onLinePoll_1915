package kr.tjoeun.onLinePoll;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class PollWrite {// 23. 텍스트 파일로 투표 결과를 출력할 메소드를 구현할 클래스(PollWrite)를 만든다.

	public static void pollWrite(String filepath, ArrayList<String> poll) {// 24. 텍스트 파일로 투표 결과를 출력하는 메소드를 만든다.
		
		PrintWriter printWriter = null;// 25. 텍스트 파일로 투표 결과를 출력할 객체를 선언한다.
		
		try {
			
			printWriter = new PrintWriter(filepath);
			
			for(String str : poll) {// 26. 텍스트 파일로 투표 내용의 끝까지 출력한다.
				printWriter.write(str + "\r\n");// 27. 텍스트 파일로 출력할 때 출력 내용이 줄이 바뀌면서 출력되게 한다.
			}
			
		} catch (FileNotFoundException e) {// 28. FileNotFoundException을 처리한다.
			
			System.out.println("디스크에 파일이 존재하지 않습니다.");
			
		} finally {
			
			if (printWriter != null) {
				printWriter.close(); //29. 출력 작업이 완료되면 출력 작업에 사용한 객체를 닫는다.
			}
			
		}
	}
}
