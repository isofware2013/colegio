
<%@ page import="cl.ucen.colegios.Evaluacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evaluacion.label', default: 'Evaluacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-evaluacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-evaluacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="evaluacion.evaluacionDefinida.label" default="Evaluacion Definida" /></th>
					
						<th><g:message code="evaluacion.cursoAsignaturaPeriodo.label" default="Curso Asignatura Periodo" /></th>
					
						<g:sortableColumn property="fechaPlanificada" title="${message(code: 'evaluacion.fechaPlanificada.label', default: 'Fecha Planificada')}" />
					
						<g:sortableColumn property="fechaReal" title="${message(code: 'evaluacion.fechaReal.label', default: 'Fecha Real')}" />
					
						<g:sortableColumn property="ponderacion" title="${message(code: 'evaluacion.ponderacion.label', default: 'Ponderacion')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'evaluacion.tipo.label', default: 'Tipo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${evaluacionInstanceList}" status="i" var="evaluacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${evaluacionInstance.id}">${fieldValue(bean: evaluacionInstance, field: "evaluacionDefinida")}</g:link></td>
					
						<td>${fieldValue(bean: evaluacionInstance, field: "cursoAsignaturaPeriodo")}</td>
					
						<td><g:formatDate date="${evaluacionInstance.fechaPlanificada}" /></td>
					
						<td><g:formatDate date="${evaluacionInstance.fechaReal}" /></td>
					
						<td>${fieldValue(bean: evaluacionInstance, field: "ponderacion")}</td>
					
						<td>${fieldValue(bean: evaluacionInstance, field: "tipo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${evaluacionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
