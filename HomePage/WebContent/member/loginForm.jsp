<%@ page contentType="text/html; charset=UTF-8" %> 
<%	
	request.setCharacterEncoding("utf-8");
    
	// --------------------쿠키 설정 내용시작-------------------
	String c_id=""; //id 저장 여부를 저장하는 변수, Y
	String c_id_val=""; //id 값
	
	Cookie[] cookies = request.getCookies();
	Cookie cookie = null;
	
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){
			cookie = cookies[i];
			if(cookie.getName().equals("c_id")){
				c_id = cookie.getValue();
			}else if(cookie.getName().equals("c_id_val")){
				c_id_val = cookie.getValue();
			}
		}
	}
	//----------------------쿠키 설정 내용 끝--------------------	



%>


<!DOCTYPE html> 
<html> 
<head>
  <title>로그인 처리</title>
  <meta charset="utf-8">
  <style type="text/css">
	body{
  		background-color: #79a6d2 !important;
  	}

  	h1,label {
  		color: #ffffff !important;
  	}
  	
  </style>  
</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br><br>

<div class="container">
<h1 class="text-center">로그인</h1>
 <form class="form-horizontal" action="<%=request.getContextPath() %>/member/loginProc.jsp" method="post">
  
  <div class="form-group">
   <label class="control-label col-sm-4" for="id">아이디</label>
    <div class="col-sm-4">
      <input type="text" name="id" id="id" class="form-control" required="required" value="<%=c_id_val %>">
		<% if(c_id.equals("Y")){ %>    
      	 <input type='checkbox' name='c_id' value='Y' checked='checked'>ID저장
		<%}else{ %>
		 <input type='checkbox' name='c_id'  value='Y'>ID저장 
		<%} %>  
    </div>
  </div>
  
  <div class="form-group">
   <label class="control-label col-sm-4" for="passwd">비밀번호</label>
    <div class="col-sm-4">
      <input type="password" name="passwd" id="passwd" class="form-control" required="required">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-7" >
      <button class="btn-default btn">로그인</button>
      <button class="btn-default btn" type="button" onclick="location.href='agreement.jsp'">회원가입</button>
      <button class="btn-default btn" type="button" onclick="location.href='idFindForm.jsp'">아이디찾기</button>
      <button class="btn-default btn" type="button" onclick="location.href='passwdFindForm.jsp'">비밀번호찾기</button>

    </div>
  </div>

</form>

</div>
</body> 
</html> 

