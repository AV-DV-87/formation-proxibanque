<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${accounts}" var="account">
	<option value="${account.id}">${account.label} ${account.balance}</option>
</c:forEach>