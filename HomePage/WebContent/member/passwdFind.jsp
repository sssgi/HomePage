<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean> 
<%
	String mname = request.getParameter("mname");
	String id = request.getParameter("id");
	
	Map map = new HashMap();
	map.put("mname",mname);
	map.put("id",id);
	
	String passwd = dao.passwdFind(map);


	if(passwd!=null){
		
		out.print("귀하의 비밀번호는 "+passwd+"입니다");
		
	}else{
		
			out.print("이름 또는 아이디를 잘못 입력하셨거나 ");
			out.print("회원이 아닙니다. 회원가입하세요");
	}
%>	


