<%@page import="db.dao.PersonInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = request.getParameter("id");
		System.out.println("deletePerson_proc 파라미터 : " + id);
		int intId = Integer.parseInt(id);
		
		PersonInfoDAO personInfoDAO = new PersonInfoDAO();
		int result = personInfoDAO.removePersonInfoById(intId);
		
		if(result > 0){
			%>
				<script>
					alert('삭제 성공');
					location.href = 'index.jsp';
				</script>
			<%		
				} else {
			%>
				<script>
					alert('삭제 실패');
					//location.href = 'addPerson.jsp';
					history.back();
				</script>
			<%
				}
			

			%>
	%>

</body>
</html>