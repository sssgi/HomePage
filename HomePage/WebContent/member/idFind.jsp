<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	String mname = request.getParameter("mname");
	String email = request.getParameter("email");
	
	Map map = new HashMap();
	map.put("mname",mname);
	map.put("email",email);
	String id = dao.idFind(map);

	if(id!=null){
		
		out.print("귀하의 id는 "+id+"입니다");
		
	}else{
		
		out.print("이름 또는 이메일을 잘못 입력하셨거나");
		out.print("회원이 아닙니다. 회원가입하세요");
		
	}
 %>	
