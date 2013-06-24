
<%@ page import="cl.ucen.colegios.DiaCursoAsignatura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diaCursoAsignatura.label', default: 'DiaCursoAsignatura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-diaCursoAsignatura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-diaCursoAsignatura" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="asistentes" title="${message(code: 'diaCursoAsignatura.asistentes.label', default: 'Asistentes')}" />
					
						<th><g:message code="diaCursoAsignatura.cursoAsignaturaPeriodo.label" default="Curso Asignatura Periodo" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'diaCursoAsignatura.fecha.label', default: 'Fecha')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${diaCursoAsignaturaInstanceList}" status="i" var="diaCursoAsignaturaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${diaCursoAsignaturaInstance.id}">${fieldValue(bean: diaCursoAsignaturaInstance, field: "asistentes")}</g:link></td>
					
						<td>${fieldValue(bean: diaCursoAsignaturaInstance, field: "cursoAsignaturaPeriodo")}</td>
					
						<td><g:formatDate date="${diaCursoAsignaturaInstance.fecha}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${diaCursoAsignaturaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
