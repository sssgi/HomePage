<%@ page contentType="text/html; charset=UTF-8" %> 
<% String root = request.getContextPath(); %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="<%=root %>/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="<%=root %>/css/backgroundTransition.css" />
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="<%=root %>/css/backgroundTransition.js"></script>
	<script type="text/javascript">
  	$(document).ready(function(){
		  $('.backgroundTransition').backgroundTransition({
			  backgrounds:[
				{ src: '<%=root%>/images/bg1.jpg' },
			  	{ src: '<%=root%>/images/bg7.jpg' },
			  	{ src: '<%=root%>/images/bg3.jpg' },
			  	{ src: '<%=root%>/images/bg4.jpg' },
			  	{ src: '<%=root%>/images/bg5.jpg' },
			  	{ src: '<%=root%>/images/bg6.jpg' },
			
		  	],
		  	transitionDelay: 3,
		  	animationSpeed: 800
	  	});
  	});
	</script>
	<style>
		
		iframe {
			position : fixed;
			bottom : 2%; 
			right : 2%;
			min-width : 100 %;
			min-height : 100 %;
			width : 400px;
			height : 300px;
			z-index : 9;
		}
	</style>
  </head>
  <body>
  
  
  <jsp:include page="./top.jsp"></jsp:include>  
  <div class="backgroundTransition"></div>

	<iframe width="560" height="315" src="https://www.youtube.com/embed/0eSGW6xaWF4" frameborder="0"
	 allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


</body>
</html>