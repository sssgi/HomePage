<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
	session.invalidate();//모든 세션변수 제거
	response.sendRedirect(request.getContextPath()+"/menu/index.jsp");
 %> 