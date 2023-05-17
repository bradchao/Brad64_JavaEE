<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost/iii"
	user="root"
	password="root"
	/>
<sql:query var="rs">
	SELECT * FROM gift WHERE id = ?
	<sql:param>${param.id }</sql:param>
</sql:query>
{ "gift-name" : "${rs.rows[0].name }",
	"city" : "${rs.rows[0].city }",
	"town" : "${rs.rows[0].town }"
}
