<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
	<head>
		<link href="compsoc.css" rel="stylesheet" type="text/css" />
		<title>UWCS Music Server</title>
	</head>
	<body>
		Hello,World!<br />
		<c:if test="${not empty username}">
			<font color="blue"><br />Currently logged in s <c:out value="${username}"/>
			</font>
		</c:if>	
		<br />
		<c:forEach items="${queue}" var="qi">
			${qi.toString()} <br />
		</c:forEach>
		<sec:authorize access="isAuthenticated()">
		<h1>Please upload a file</h1>
        <form method="post" commandName="FORM" action="/upload/" enctype="multipart/form-data">
            <input type="file" name="file"/>
            <input type="submit"/>
        </form>
		</sec:authorize>
	</body>
</html>