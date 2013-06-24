
<%@ page import="cl.ucen.colegios.PremioAcademico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'premioAcademico.label', default: 'PremioAcademico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-premioAcademico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-premioAcademico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="premioAcademico.antecedenteAcademico.label" default="Antecedente Academico" /></th>
					
						<th><g:message code="premioAcademico.docente.label" default="Docente" /></th>
					
						<g:sortableColumn property="premio" title="${message(code: 'premioAcademico.premio.label', default: 'Premio')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${premioAcademicoInstanceList}" status="i" var="premioAcademicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${premioAcademicoInstance.id}">${fieldValue(bean: premioAcademicoInstance, field: "antecedenteAcademico")}</g:link></td>
					
						<td>${fieldValue(bean: premioAcademicoInstance, field: "docente")}</td>
					
						<td>${fieldValue(bean: premioAcademicoInstance, field: "premio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${premioAcademicoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
