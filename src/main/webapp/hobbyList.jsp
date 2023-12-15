<%@ page import="db.dao.HobbyListDAO"%>
<%@ page import="db.dto.HobbyListDTO"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="navigation.jsp" %>
	<%
		HobbyListDAO hobbyInfoDAO = new HobbyListDAO();
	
		List<HobbyListDTO> personList = hobbyInfoDAO.findHobbyInfoList();
		
		
	%>
	
	<h1>취미목록</h1>
	<a href="./index.jsp">메인 페이지로</a>
	<p></p>
	<table border="1">
	  <tr>
	  	<th>아이디</th>
	  	<th>순번</th>
	  	<th>취미</th>
	  	<th>선호도</th>
	  </tr>
		
		
	  <%
	  	for(HobbyListDTO hobbyInfo : personList) {
	  %>
	  
	  	<tr>
		<td>
	  	<%=hobbyInfo.getId()%>
	  	</td> 
	  	<td>
	  	 <%=hobbyInfo.getNo()%> 
	  	 </td>
	  	 <td>
	  	 <%=hobbyInfo.getHobby()%> 
	  	 </td>
	  	 <td>
	  	 <%=hobbyInfo.getPrefer()%>
	  	</td>
	  </tr>
	  
	  <% 
	  	}
	  %>
	  
	 </table>

</body>
</html>