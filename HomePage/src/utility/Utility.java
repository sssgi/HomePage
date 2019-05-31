package utility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

public class Utility {
	
	
	public static String getCodeValue(String code){
		String value = null;
		Hashtable codes = new Hashtable();
		codes.put("A01", "회사원");
		codes.put("A02", "전산관련직");
		codes.put("A03", "연구전문직");
		codes.put("A04", "각종학교학생");
		codes.put("A05", "일반자영업");
		codes.put("A06", "공무원");
		codes.put("A07", "의료인");
		codes.put("A08", "법조인");
		codes.put("A09", "종교/언론/예술인");
		codes.put("A10", "기타");
		 
		value = (String)codes.get(code);
		 
		return value;
		
	}
	
	
	public static String checkNull(String str) {//null값으로 인한 에러를 방지하기 위한 메소드
		if(str==null)
			str = "";
		
		return str;
		
	}
	
	
		/** 
		  *  
		  * @param totalRecord 전체 레코드수 
		  * @param nowPage     현재 페이지 
		  * @param recordPerPage 페이지당 레코드 수  
		  * @param col 검색 컬럼  
		  * @param word 검색어
		  * @return 페이징 생성 문자열
		  */ 
	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word){ 
	   
		int pagePerBlock = 5; // 블럭당 페이지 수 (한 그룹당 페이지 수)
		int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 페이지  
		int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 -> 1~5페이지= 1그룹, 6~10페이지= 2그룹 -->전체 그룹 2
	    int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 그룹 -> 현재 13페이지를 보고있는데 13페이지는 5개씩 그룹으로 봣을때 3그룹에 속함
	    int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
	    int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
		    
	    StringBuffer str = new StringBuffer(); 
	    str.append("<div style='text-align:center'>"); 
	    str.append("<ul class='pagination'> ");
	    int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
	
	    if (nowGrp >= 2){
		    str.append("<li><a href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>이전</A></li>"); 
	    } 
		 
	    for(int i=startPage; i<=endPage; i++){ 
		    if (i > totalPage){ 
		 	    break; 
		    } 
		 
		    if (nowPage == i){ 
		        str.append("<li class='active'><a href=#>"+i+"</a></li>"); 
		    }else{ 
		        str.append("<li><a href='./list.jsp?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A></li>");   
		    } 
	    } 
		       
	    _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
		    if (nowGrp < totalGrp){ 
			    str.append("<li><A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>다음</A></li>"); 
		    }
		   
		    str.append("</ul>"); 
		    str.append("</div>"); 
		    
		    return str.toString(); 
	} 


	public static boolean compareDay(String wdate) {
		boolean flag = false;
		List<String> list = getDay();
		
		if(wdate.equals(list.get(0)) 
		   || wdate.equals(list.get(1)) 
		   || wdate.equals(list.get(2))) { //'||' = or표시
			
			flag = true;
		}
		
		return flag;		
	}


	private static List<String> getDay() {
		List<String> list = new ArrayList<String>();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		for(int j=0; j<3; j++) {
			list.add(sd.format(cal.getTime()));
			cal.add(Calendar.DATE,0);
			
		}

		return list;
	}
	
}
