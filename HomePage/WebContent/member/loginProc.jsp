<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	Map map = new HashMap();
	map.put("id",id);
	map.put("pw",passwd);
	
	boolean flag = dao.loginCheck(map);
	
	//로그인이 성공적으로 이루어지면 세션하고 계속 연결해줘야 하므로  grade가져와야함.
	String grade = null; //회원등급
	if(flag){
		
		grade = dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		
		//cookie저장, Checkbox는 선택하지 않으면 null
		Cookie cookie = null;
		String c_id = request.getParameter("c_id"); //Y,아이디 저장여부
		
		if(c_id != null){ //처음에는 값이 없으므로 null체크로 처리
			cookie = new Cookie("c_id","Y");//아이디 저장여부 쿠키
			cookie.setMaxAge(120);//2분유지
			response.addCookie(cookie);//쿠키기록
			
			cookie = new Cookie("c_id_val",id);//id값 저장 쿠키
			cookie.setMaxAge(120);
			response.addCookie(cookie);			
		}else{
			cookie = new Cookie("c_id","");//쿠키삭제
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			
			cookie = new Cookie("c_id_val","");//쿠키삭제
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
				
	}	
	
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>로그인처리</title>
  <meta charset="utf-8">

</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

<div class="container">
  <h1 class="col-sm-offset-2 col-sm-10" >로그인처리</h1>
	<div class="well weel-lg">
	  <%
		if(flag){
			out.print("로그인이 되었습니다.");
		}else{
			out.print("아이디 또는 비밀번호를 잘못 입력하셨거나 <br>");
			out.print("회원이 아닙니다. 회원가입하세요");
		}
	  %>	
	</div>

      <button class="btn-default btn" onclick="location.href='<%=root%>/menu/index.jsp'">홈</button>
      <button class="btn-default btn" onclick="history.back()">이전</button>
      <%if(flag==false){ %>
      <button class="btn-default btn" type="button" onclick="location.href='idFindForm.jsp'">아이디찾기</button>
      <button class="btn-default btn" type="button" onclick="location.href='passwdFindForm.jsp'">비밀번호찾기</button>
	  <%} %>	









 

</div>
</body> 
</html> 

