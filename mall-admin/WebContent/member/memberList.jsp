<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="dao.*" import="vo.*"%>
<%
	if(session.getAttribute("loginAdminId")== null) { // admin아이디가 로그인이 되어있지 않다면
		response.sendRedirect(request.getContextPath()+"/login.jsp"); // login페이지로 돌아가시오
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<h1>회원 목록</h1>
	<%
		MemberDao memberDao = new MemberDao();
		ArrayList<Member> list = memberDao.selectMemberList();
	%>
	<table class="table table-striped table-hover table-dark">
		<thead>
			<tr>
				<th>memberEmail</th>
				<th>memberName</th>
				<th>memberDate</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Member m : list) {
		%>
			<tr>
				<td><%=m.getMemberEmail() %></td>
				<td><%=m.getMemberName() %></td>
				<td><%=m.getMemberDate() %></td>
				<th><a href="<%=request.getContextPath() %>/member/deleteMemberAction.jsp?memberEmail=<%=m.getMemberEmail() %>">삭제</a></th>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</div>	
</body>
</html>