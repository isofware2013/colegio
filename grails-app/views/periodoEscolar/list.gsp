
<%@ page import="cl.ucen.colegios.PeriodoEscolar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'periodoEscolar.label', default: 'PeriodoEscolar')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-periodoEscolar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-periodoEscolar" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="anio" title="${message(code: 'periodoEscolar.anio.label', default: 'Anio')}" />
					
						<th><g:message code="periodoEscolar.periodo.label" default="Periodo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${periodoEscolarInstanceList}" status="i" var="periodoEscolarInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${periodoEscolarInstance.id}">${fieldValue(bean: periodoEscolarInstance, field: "anio")}</g:link></td>
					
						<td>${fieldValue(bean: periodoEscolarInstance, field: "periodo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${periodoEscolarInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
