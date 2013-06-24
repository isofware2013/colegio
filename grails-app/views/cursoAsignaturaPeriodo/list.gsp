
<%@ page import="cl.ucen.colegios.CursoAsignaturaPeriodo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cursoAsignaturaPeriodo.label', default: 'CursoAsignaturaPeriodo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cursoAsignaturaPeriodo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cursoAsignaturaPeriodo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="cursoAsignaturaPeriodo.curso.label" default="Curso" /></th>
					
						<th><g:message code="cursoAsignaturaPeriodo.docente.label" default="Docente" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cursoAsignaturaPeriodoInstanceList}" status="i" var="cursoAsignaturaPeriodoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cursoAsignaturaPeriodoInstance.id}">${fieldValue(bean: cursoAsignaturaPeriodoInstance, field: "curso")}</g:link></td>
					
						<td>${fieldValue(bean: cursoAsignaturaPeriodoInstance, field: "docente")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cursoAsignaturaPeriodoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
