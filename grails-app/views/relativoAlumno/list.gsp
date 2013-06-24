
<%@ page import="cl.ucen.colegios.RelativoAlumno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relativoAlumno.label', default: 'RelativoAlumno')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-relativoAlumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-relativoAlumno" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="relativoAlumno.alumno.label" default="Alumno" /></th>
					
						<th><g:message code="relativoAlumno.relativo.label" default="Relativo" /></th>
					
						<g:sortableColumn property="tipo" title="${message(code: 'relativoAlumno.tipo.label', default: 'Tipo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${relativoAlumnoInstanceList}" status="i" var="relativoAlumnoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${relativoAlumnoInstance.id}">${fieldValue(bean: relativoAlumnoInstance, field: "alumno")}</g:link></td>
					
						<td>${fieldValue(bean: relativoAlumnoInstance, field: "relativo")}</td>
					
						<td>${fieldValue(bean: relativoAlumnoInstance, field: "tipo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${relativoAlumnoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
