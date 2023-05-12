<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
		Account: ${param.account }<hr />
		1: ${paramValues.hobby[0] }<br />
		2: ${paramValues.hobby[1] }<br />
		3: ${paramValues.hobby[2] }<br />
		4: ${paramValues.hobby[3] }<br />
		5: ${paramValues.hobby[4] }<br />
		6: ${paramValues.hobby[5] }<br />
		<hr />
		Method: <%= request.getMethod() %><br />
		Method: ${pageContext.request.method }<br />
		IP: <%= request.getRemoteAddr() %><br />
		IP: ${pageContext.request.remoteAddr }<br />
		Locale: <%= request.getLocale() %><br />
		Locale: ${pageContext.request.locale }<br />
		Language: <%= request.getLocale().getDisplayLanguage() %>
		Language: ${pageContext.request.locale.displayLanguage }
		
		
		
	</body>
</html>