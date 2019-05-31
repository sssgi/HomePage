<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %> 
<%
	String id = Utility.checkNull(request.getParameter("id"));
	
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>비밀번호 찾기</title>
  <meta charset="utf-8">
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.js"></script>
  <script src="<%=request.getContextPath() %>/js/ajaxsetup.js"></script> 	
  <script type="text/javascript">
  	function passwdFind(){
  		if($("#mname").val()==""){
  			alert('이름을 입력해주세요');
  			document.frm.mname.focus();  			
  		}else if($("#id").val()==""){
  			alert('ID를 입력해주세요');
  			document.frm.id.focus(); 
  		}else{
  			var url="passwdFind.jsp";
  			var param = $("#frm").serialize();
  			$.get(
  				url,
  				param,
  				function(data,textStatus){
  					data = data.trim();
  					
  					$("#passwdFind").text(data);
  					
  				}
  			
  			);
  			  			
  		}
  		
  	}
  
  
  </script>
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
<h1 class="col-sm-offset-2 col-sm-10" >비밀번호찾기</h1>
  <form class="form-horizontal" id="frm" name="frm" action="passwdFindProc.jsp" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">ID</label>
        <div class="col-sm-6">
          <input type="text" name="id" id="id" class="form-control" value="<%=id%>" placeholder="user1">
        </div>
    </div>
  
  <div class="form-group">
   <label class="control-label col-sm-2" for="mname">이름</label>
    <div class="col-sm-6">
      <input type="text" id="mname" name="mname" class="form-control"  placeholder="홍길동"> 
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button class="btn-default btn" type="button" onclick="passwdFind()">찾기</button>
      <button class="btn-default btn" type="reset">취소</button>
      <br><br>
      <div id="passwdFind"></div>	
    </div>
  </div>
	
</form>

</div>
</body> 
</html> 

