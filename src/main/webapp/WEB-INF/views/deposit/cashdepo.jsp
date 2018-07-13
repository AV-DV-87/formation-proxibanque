<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../templates/header.jsp" />
</head>
<body>
	<h2>Effectuer un dépôt d'espèces :</h2>
	<div class="container">
		<c:if test="${ empty result or result.error }">
			<form method="post">
				<c:if test="${ not empty result}">
					<div class="alert alert-danger" role="alert">${result.content}</div>
				</c:if>
				<div class="form-group">
					<label for="credit">Compte à créditer</label>
					<select id="credit" name="creditId" class="custom-select">
						<jsp:include page="../templates/account-options.jsp" />
					</select>
				</div>
				<div class="form-group">
					<label for="amount">Montant (€)</label>
					<input id="amount" name="amount" type="number" min="0" step="0.05" required />
				</div>
				<button class="btn btn-primary btn-lg">Valider</button>
			</form>
		</c:if>
		<c:if test="${ not empty result and !result.error }">
			<div class="alert alert-success" role="alert">${result.content}</div>
		</c:if>
	</div>
</body>
</html>