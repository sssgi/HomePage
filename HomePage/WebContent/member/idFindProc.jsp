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
	
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>ID찾기</title>
  <meta charset="utf-8">

</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br><br>

<div class="container">
  <h1 class="col-sm-offset-2 col-sm-10" >Id찾기</h1>
	<div class="well weel-lg">
	  <%
		if(id!=null){
			out.print("귀하의 id는 "+id+"입니다");
		}else{
			out.print("이름 또는 이메일을 잘못 입력하셨거나 <br>");
			out.print("회원이 아닙니다. 회원가입하세요");
		}
	  %>	
	</div>

      <button class="btn-default btn" onclick="location.href='<%=root%>/menu/index.jsp'">홈</button>
      <button class="btn-default btn" onclick="history.back()">다시시도</button>
      <%if(id!=null) {%>      
      <button class="btn-default btn" onclick="location.href='<%=root%>/member/passwdFindForm.jsp?id=<%=id%>'">비밀번호찾기</button>
      <%} %>


</div>
</body> 
</html> 

