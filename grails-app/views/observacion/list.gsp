
<%@ page import="cl.ucen.colegios.Observacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'observacion.label', default: 'Observacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-observacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-observacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tipo" title="${message(code: 'observacion.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="fechaIngreso" title="${message(code: 'observacion.fechaIngreso.label', default: 'Fecha Ingreso')}" />
					
						<th><g:message code="observacion.alumno.label" default="Alumno" /></th>
					
						<g:sortableColumn property="texto" title="${message(code: 'observacion.texto.label', default: 'Texto')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${observacionInstanceList}" status="i" var="observacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${observacionInstance.id}">${fieldValue(bean: observacionInstance, field: "tipo")}</g:link></td>
					
						<td><g:formatDate date="${observacionInstance.fechaIngreso}" /></td>
					
						<td>${fieldValue(bean: observacionInstance, field: "alumno")}</td>
					
						<td>${fieldValue(bean: observacionInstance, field: "texto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${observacionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
