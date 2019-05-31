<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	
	Map map = new HashMap();
	map.put("id",id);
	map.put("pw",pw);
	
	boolean flag = dao.updatePw(map);
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>비밀번호 변경확인</title>
  <meta charset="utf-8">

</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10" >비밀번호 변경확인</h1>
  <div class="well weel-lg">
  <%
  		if(flag){
  			out.print("비밀번호를 변경했습니다.<br>");
  			out.print("로그인을 해보세요");
  		}else{
  			out.print("비밀번호 변경을 실패했습니다.");
  		}
  
  
  %>
  
  </div>
    <button class="btn-default btn" onclick="location.href='loginForm.jsp'">로그인</button>
    <button class="btn-default btn" onclick="history.back()">다시시도</button>




</div>
</body> 
</html> 

