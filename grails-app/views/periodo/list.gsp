
<%@ page import="cl.ucen.colegios.Periodo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'periodo.label', default: 'Periodo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-periodo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-periodo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'periodo.fechaInicio.label', default: 'Fecha Inicio')}" />
					
						<g:sortableColumn property="fechaTermino" title="${message(code: 'periodo.fechaTermino.label', default: 'Fecha Termino')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${periodoInstanceList}" status="i" var="periodoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${periodoInstance.id}">${fieldValue(bean: periodoInstance, field: "fechaInicio")}</g:link></td>
					
						<td><g:formatDate date="${periodoInstance.fechaTermino}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${periodoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
