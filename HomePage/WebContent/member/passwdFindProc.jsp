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
	
%>


<!DOCTYPE html> 
<html> 
<head>
  <title>비밀번호찾기</title>
  <meta charset="utf-8">

</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br><br>

<div class="container">
  <h1 class="col-sm-offset-2 col-sm-10" >비밀번호찾기</h1>
	<div class="well weel-lg">
	  <%
		if(passwd!=null){
			out.print("귀하의 비밀번호는 "+passwd+"입니다");
		}else{
			out.print("이름 또는 아이디를 잘못 입력하셨거나 <br>");
			out.print("회원이 아닙니다. 회원가입하세요");
		}
	  %>	
	</div>

      <button class="btn-default btn" onclick="location.href='<%=root%>/menu/index.jsp'">홈</button>
      <button class="btn-default btn" onclick="history.back()">다시시도</button>
      <%if(passwd!=null) {%>      
      <button class="btn-default btn" onclick="location.href='<%=root%>/member/loginForm.jsp'">로그인</button>
      <%} %>


</div>
</body> 
</html> 

