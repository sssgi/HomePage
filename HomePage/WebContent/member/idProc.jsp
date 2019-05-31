<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");
	boolean flag = dao.duplicateId(id);
	%>

<!DOCTYPE html> 
<html> 
<head>
  <title>ID중복확인</title>
  <meta charset="urf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  
  	function use(){
  		opener.id.value='<%=id%>';
  		self.close();
  	}
  
  
  </script>
</head>
<body>

<div class="container">
  <div class="well weel-lg text-center">
  
    입력된 Id : <%=id %><br><br>
  <%if(flag){
  		out.print("중복되어 사용할 수 없습니다.<br><br>");
	}else{
		out.print("중복아님, 사용할 수 있습니다.<br><br>");
		out.print("<button class='btn-default btn' type='button' onclick='use();'>사용</button>");
	}	
  %>	
  </div>

    <div class="text-center">
      <button class="btn-default btn" type="button" onclick="location.href='idForm.jsp'">다시시도</button>
      <button class="btn-default btn" type="button" onclick="window.close()">닫기</button>
    </div>


</div>
</body> 
</html> 

