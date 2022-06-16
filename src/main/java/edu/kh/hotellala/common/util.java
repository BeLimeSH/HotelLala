package edu.kh.hotellala.common;

public class util {
	// 개행 문자-><br> 변경 메서드 
	public static String newLineHandling(String content) {
		return content.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");

		//textarea 의 엔터 : \r\n
		//\r : 캐리지 리턴( 첫 번째로 돌아가기) -> 현재는 개행문자로 인식
		//\n : new line(다음 줄로 이동)
	}
	
	//XSS : 관리자가 아닌 이용자가 악성 스크립트를 삽입해서 공격하는 
	//Cross Site Scripting(XSS) 공격 방지 처리 메서드
	
	public static String XSSHandling(String content) {
		
		if(content != null) {			
			// < , >, &, " 문자를 HTML 코드가 아닌 문자 그대로 보이도록 변경
			content = content.replaceAll("&", "&amp;"); //&amp;lt;h1&gt;
			content = content.replaceAll("<", "&lt;"); // &lt;h1>
			content = content.replaceAll(">", "&gt;"); // &lt;h1&gt;
			content = content.replaceAll("\"", "&quot;"); // &lt;h1&gt;
		}
		return content;
	}
}
