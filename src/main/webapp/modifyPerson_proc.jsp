<%@page import="db.dto.PersonInfoDTO"%>
<%@ page import="db.dao.PersonInfoDAO"%>
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
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		System.out.println("modifyPerson_proc 파라미터 : " + id + " " + name);
		int intId = Integer.parseInt(id);
		
		PersonInfoDAO personInfoDAO = new PersonInfoDAO();
		PersonInfoDTO personInfo = new PersonInfoDTO(intId, name);
		
		int result = personInfoDAO.modifyPersonInfo(personInfo);
		
		if(result > 0){
			%>
				<script>
					alert('수정 성공');
					location.href = 'personInfo.jsp?id=<%=id%>';
				</script>
			<%		
				} else {
			%>
				<script>
					alert('수정 실패');
					//location.href = 'addPerson.jsp';
					history.back();
				</script>
			<%
				}

			%>
	%>
</body>
</html>