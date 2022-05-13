package kr.tjoeun.onLinePoll;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class PollRead {//2.텍스트 파일을 읽어들일 메소드를 구현할 클래스(PollRead)를 만든다.

	public static ArrayList<String> pollRead(String filepath) {// 3. 텍스트 파일의 내용을 읽어들일 메소드를 만든다.

		
		ArrayList<String> poll = null;// 4. 텍스트 파일의 내용을 저장할 객체를 선언한다.
		Scanner scanner = null;// 5. 텍스트 파일의 내용을 읽어들일 객체를 선언한다.
		
		try {
			scanner = new Scanner(new File(filepath));//(트라이캐치) //pollRead.jsp에서 얻어온 파일의 객체를 만들고 읽음(익명 객체로)
			poll = new ArrayList<String>();
			
			while (scanner.hasNextLine()) {// 6. 텍스트 파일의 내용을 파일의 끝까지 반복하며 읽어들인다.
				String str = scanner.nextLine().trim(); // 7. 텍스트 파일의 불필요한 공백을 제거한다.
				if(str.length() > 0) {// 8. 텍스트 파일의 빈 줄은 읽어들이지 않는다.
					poll.add(str);
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println("디스크에 파일이 존재하지 않습니다.");
		}
		
		return poll;// 9. 읽어들인 텍스트 파일의 내용을 리턴시킨다.
		
	}

}
