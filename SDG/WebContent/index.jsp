<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<form action="<%=request.getContextPath() %>/space/spaceTypeReg" method="GET">
			<button id="spaceReg">공간 등록</button>
		</form>
	</nav>
</body>
</html>