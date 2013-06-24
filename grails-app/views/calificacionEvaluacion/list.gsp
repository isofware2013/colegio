
<%@ page import="cl.ucen.colegios.CalificacionEvaluacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-calificacionEvaluacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-calificacionEvaluacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="calificacionEvaluacion.evaluacion.label" default="Evaluacion" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'calificacionEvaluacion.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="nota" title="${message(code: 'calificacionEvaluacion.nota.label', default: 'Nota')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${calificacionEvaluacionInstanceList}" status="i" var="calificacionEvaluacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${calificacionEvaluacionInstance.id}">${fieldValue(bean: calificacionEvaluacionInstance, field: "evaluacion")}</g:link></td>
					
						<td><g:formatDate date="${calificacionEvaluacionInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: calificacionEvaluacionInstance, field: "nota")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${calificacionEvaluacionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
