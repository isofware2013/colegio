
<%@ page import="cl.ucen.colegios.Docente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'docente.label', default: 'Docente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-docente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-docente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="rut" title="${message(code: 'docente.rut.label', default: 'Rut')}" />
					
						<g:sortableColumn property="digito" title="${message(code: 'docente.digito.label', default: 'Digito')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'docente.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellidoPaterno" title="${message(code: 'docente.apellidoPaterno.label', default: 'Apellido Paterno')}" />
					
						<g:sortableColumn property="apellidoMaterno" title="${message(code: 'docente.apellidoMaterno.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="sexo" title="${message(code: 'docente.sexo.label', default: 'Sexo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${docenteInstanceList}" status="i" var="docenteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${docenteInstance.id}">${fieldValue(bean: docenteInstance, field: "rut")}</g:link></td>
					
						<td>${fieldValue(bean: docenteInstance, field: "digito")}</td>
					
						<td>${fieldValue(bean: docenteInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: docenteInstance, field: "apellidoPaterno")}</td>
					
						<td>${fieldValue(bean: docenteInstance, field: "apellidoMaterno")}</td>
					
						<td>${fieldValue(bean: docenteInstance, field: "sexo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${docenteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
