<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="imgup.ImgUpDTO"%>
<%@ page import="imgup.ImgUpDAO"%>
<%@ page import="utility.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
			
	String upDir = "/imgup/storage";
	String tempDir = "/imgup/temp";

	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);
%>



