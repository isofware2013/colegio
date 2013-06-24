
<%@ page import="cl.ucen.colegios.Relativo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relativo.label', default: 'Relativo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-relativo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-relativo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="rut" title="${message(code: 'relativo.rut.label', default: 'Rut')}" />
					
						<g:sortableColumn property="digito" title="${message(code: 'relativo.digito.label', default: 'Digito')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'relativo.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellidoPaterno" title="${message(code: 'relativo.apellidoPaterno.label', default: 'Apellido Paterno')}" />
					
						<g:sortableColumn property="apellidoMaterno" title="${message(code: 'relativo.apellidoMaterno.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="sexo" title="${message(code: 'relativo.sexo.label', default: 'Sexo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${relativoInstanceList}" status="i" var="relativoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${relativoInstance.id}">${fieldValue(bean: relativoInstance, field: "rut")}</g:link></td>
					
						<td>${fieldValue(bean: relativoInstance, field: "digito")}</td>
					
						<td>${fieldValue(bean: relativoInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: relativoInstance, field: "apellidoPaterno")}</td>
					
						<td>${fieldValue(bean: relativoInstance, field: "apellidoMaterno")}</td>
					
						<td>${fieldValue(bean: relativoInstance, field: "sexo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${relativoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
