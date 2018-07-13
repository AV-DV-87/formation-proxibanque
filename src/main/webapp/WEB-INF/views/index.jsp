<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="templates/header.jsp" />
</head>
<body>
	<div class="container">
		<div class="stepwizard col-md-offset-3">
			<div class="stepwizard-row setup-panel">
				<div class="stepwizard-step">
					<a href="" type="button" 
						class="btn btn-circle${empty searchId and empty clientId ? ' btn-primary' : ' btn-default'}">1</a>
					<p>Identification</p>
				</div>
				<div class="stepwizard-step">
					<a href="" type="button"
						class="btn btn-circle${!empty searchId and empty clientId ? ' btn-primary' : ' btn-default'}">2</a>
					<p>Validation</p>
				</div>
				<div class="stepwizard-step">
					<a href="" type="button"
						class="btn btn-circle${!empty clientId ? ' btn-primary' : ' btn-default'}">3</a>
					<p>Opération</p>
				</div>
			</div>
		</div>

		<c:choose>
			<c:when test="${empty searchId and empty clientId}">
				<div class="row setup-content" id="step-1">
					<form method="post">
						<div class="form-group">
							<label for="keywords">Nom et/ou prénom</label> <input
								id="keywords" name="keywords" class="form-control" required />
						</div>
						<button class="btn btn-primary nextBtn btn-lg">Rechercher</button>
					</form>
				</div>
			</c:when>
			<c:when test="${not empty searchId and empty clientId}">
				<div class="row setup-content" id="step-2">
					<form action="<c:url value="/${searchId}/validate.html" />"
						method="post">
						<div class="form-group">
							<label for="birthdate">Entrez votre date de naissance</label> <input
								type="date" id="birthdate" name="birthdate" required />
						</div>
						<button class="btn btn-success">Valider</button>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<c:url value="/${clientId}" var="rootUrl" />
				<div class="row setup-content" id="step-3">
					<div class="operations">
						<h3>Choisir une opération</h3>
					</div>
					<ul>
						<li><a href="${rootUrl}/retrait/espece.html">Retrait en espèce</a></li>
						<li><a href="${rootUrl}/retrait/cartebleue.html">Retrait d'une CB</a></li>
						<li><a href="${rootUrl}/retrait/chequier.html">Demande de chéquier</a></li>
						<li><a href="${rootUrl}/depot/especes.html">Dépôt de liquide</a></li>						
						<li><a href="${rootUrl}/virement/interne.html">Effectuer un virement</a></li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>