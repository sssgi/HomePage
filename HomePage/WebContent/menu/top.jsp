<%@ page contentType="text/html; charset=UTF-8" %> 
<% String root = request.getContextPath(); %> 
<% 
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	String str ="기본페이지입니다.";
	if(id!=null && !grade.equals("A")){
		str = "안녕하세요" + id + "님!";
	} else if(id!=null && grade.equals("A")){
		str = "관리자 페이지입니다.";
	}
	
%> 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
    .navbar-fixed-top{border-width:0 0 0px}
    .dropdown-menu{ min-width: 40px;}
    .container-fluid{padding-right:10px; padding-left:10px;}
  	.navbar-default{background-color:rgba(255,255,255,0);}
  	.navbar-default .navbar-nav>li>a {color:#f9f9f9;}
    .navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:focus, .navbar-default .navbar-nav>.open>a:hover{
	background-color:inherit;
	color:#000000;
    }
	.navbar-nav .open .dropdown-menu{
	background-color: rgba( 255, 255, 255, 0.5 );
    }
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow: hidden;
    transition: 0.5s;
    padding-top: 60px;
}
.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 20px;
    color: #818181;
    display: block;
    transition: 0.3s;
    font-weight:bold;
}

.sidenav a:hover {
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

#tabLogo{
	position:absolute;
	top:0;
	left:0;
	color:red;
	height:auto;
	vertical-align: middle;
	padding:15px 10px;
	align:center;
	transition:all 0.5s;
	z-index:9999;
	cursor:pointer;
}
#tabLogo a{
	font-size:20px;
	color:#fff;
}
#tabLogo a:hover, #tabLogo a:visited, #tabLogo a:active, #tabLogo a:link{
	text-decoration: none;
}
  </style>
  <script>
  
  	function test(){
  		var obj = document.getElementById("mySidenav");
  		if(obj.style.width == "0px" || obj.style.width == ""){
  			openNav(); 
  		}else{
  			closeNav();
  		}
  		
  	}
	function openNav() {
    	document.getElementById("mySidenav").style.width = "250px";
    	document.getElementById("tabLogo").style.left = "250px";
	}

	function closeNav() {
    	document.getElementById("mySidenav").style.width = "0";
    	document.getElementById("tabLogo").style.left = "0";
	}
  </script>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
	<ul class="nav navbar-nav navbar-right">
	  <%if(id==null){ %>
	  <li><a href="<%=root%>/member/agreement.jsp"><span class="glyphicon glyphicon-user"></span>Signup</a></li>
	  <li><a href="<%=root%>/member/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
	  <%}else{ %>
	  <li><a href="<%=root%>/member/read.jsp"><span class="glyphicon glyphicon-info-sign"></span>나의정보</a></li>
	  <li><a href="<%=root%>/member/logOut.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
	  <%} %>
	   <%if(id!=null && grade.equals("A")) {%>
	  <li><A href="<%=root%>/admin/list.jsp"><span class="glyphicon glyphicon-th-list"></span>회원목록</A></li>
	  <%} %>
	  <%if(id!=null){ %>
	  <li><a href="#"><span class="glyphicon glyphicon-user"></span>안녕하세요. <%=id %>님!</a></li>
	  <%} %> 
	</ul>  
  </div>
</nav>

<div id="leftNav" style="position:relative;">
<div id="mySidenav" class="sidenav">
<div style="min-width:250px;">
  <a href="<%=root%>/menu/index.jsp">Home</a>
  <a href="<%=root %>/bbs/list.jsp">Board</a>
  <a href="<%=root%>/imgup/list.jsp">Photo</a>
  <a href="<%=root%>/guestbook/list.jsp">GuestBook</a>
  
</div>
</div>
<div id="tabLogo">
	  <a href="#" onclick="test()" ><strong>VIXX</strong></a>
</div>
</div>
</body>
</html>



 


