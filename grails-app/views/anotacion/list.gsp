
<%@ page import="cl.ucen.colegios.Anotacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'anotacion.label', default: 'Anotacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-anotacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-anotacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="alumnoCurso" title="${message(code: 'anotacion.alumnoCurso.label', default: 'Alumno Curso')}" />
					
						<th><g:message code="anotacion.diaCursoAsignatura.label" default="Dia Curso Asignatura" /></th>
					
						<g:sortableColumn property="texto" title="${message(code: 'anotacion.texto.label', default: 'Texto')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${anotacionInstanceList}" status="i" var="anotacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${anotacionInstance.id}">${fieldValue(bean: anotacionInstance, field: "alumnoCurso")}</g:link></td>
					
						<td>${fieldValue(bean: anotacionInstance, field: "diaCursoAsignatura")}</td>
					
						<td>${fieldValue(bean: anotacionInstance, field: "texto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${anotacionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
