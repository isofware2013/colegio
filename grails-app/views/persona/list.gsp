
<%@ page import="cl.ucen.colegios.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-persona" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="apellidoMaterno" title="${message(code: 'persona.apellidoMaterno.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="apellidoPaterno" title="${message(code: 'persona.apellidoPaterno.label', default: 'Apellido Paterno')}" />
					
						<g:sortableColumn property="digito" title="${message(code: 'persona.digito.label', default: 'Digito')}" />
					
						<g:sortableColumn property="emails" title="${message(code: 'persona.emails.label', default: 'Emails')}" />
					
						<g:sortableColumn property="fechaNacimiento" title="${message(code: 'persona.fechaNacimiento.label', default: 'Fecha Nacimiento')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'persona.nombre.label', default: 'Nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personaInstanceList}" status="i" var="personaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personaInstance.id}">${fieldValue(bean: personaInstance, field: "apellidoMaterno")}</g:link></td>
					
						<td>${fieldValue(bean: personaInstance, field: "apellidoPaterno")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "digito")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "emails")}</td>
					
						<td><g:formatDate date="${personaInstance.fechaNacimiento}" /></td>
					
						<td>${fieldValue(bean: personaInstance, field: "nombre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
