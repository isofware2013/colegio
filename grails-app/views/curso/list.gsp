
<%@ page import="cl.ucen.colegios.Curso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-curso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-curso" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="curso.periodoEscolar.label" default="Periodo Escolar" /></th>
					
						<th><g:message code="curso.profesorJefe.label" default="Profesor Jefe" /></th>
					
						<th><g:message code="curso.asignaturas.label" default="Asignaturas" /></th>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'curso.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="jornada" title="${message(code: 'curso.jornada.label', default: 'Jornada')}" />
					
						<g:sortableColumn property="nivel" title="${message(code: 'curso.nivel.label', default: 'Nivel')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cursoInstanceList}" status="i" var="cursoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cursoInstance.id}">${fieldValue(bean: cursoInstance, field: "periodoEscolar")}</g:link></td>
					
						<td>${fieldValue(bean: cursoInstance, field: "profesorJefe")}</td>
					
						<td>${fieldValue(bean: cursoInstance, field: "asignaturas")}</td>
					
						<td>${fieldValue(bean: cursoInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: cursoInstance, field: "jornada")}</td>
					
						<td>${fieldValue(bean: cursoInstance, field: "nivel")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cursoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
