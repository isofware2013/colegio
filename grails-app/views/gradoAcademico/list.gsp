
<%@ page import="cl.ucen.colegios.GradoAcademico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gradoAcademico.label', default: 'GradoAcademico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-gradoAcademico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-gradoAcademico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="gradoAcademico.antecedenteAcademico.label" default="Antecedente Academico" /></th>
					
						<th><g:message code="gradoAcademico.docente.label" default="Docente" /></th>
					
						<g:sortableColumn property="grado" title="${message(code: 'gradoAcademico.grado.label', default: 'Grado')}" />
					
						<g:sortableColumn property="tipoGrado" title="${message(code: 'gradoAcademico.tipoGrado.label', default: 'Tipo Grado')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gradoAcademicoInstanceList}" status="i" var="gradoAcademicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gradoAcademicoInstance.id}">${fieldValue(bean: gradoAcademicoInstance, field: "antecedenteAcademico")}</g:link></td>
					
						<td>${fieldValue(bean: gradoAcademicoInstance, field: "docente")}</td>
					
						<td>${fieldValue(bean: gradoAcademicoInstance, field: "grado")}</td>
					
						<td>${fieldValue(bean: gradoAcademicoInstance, field: "tipoGrado")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gradoAcademicoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
