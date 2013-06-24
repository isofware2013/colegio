
<%@ page import="cl.ucen.colegios.Telefono" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefono.label', default: 'Telefono')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-telefono" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-telefono" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="area" title="${message(code: 'telefono.area.label', default: 'Area')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'telefono.numero.label', default: 'Numero')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'telefono.tipo.label', default: 'Tipo')}" />
					
						<th><g:message code="telefono.persona.label" default="Persona" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${telefonoInstanceList}" status="i" var="telefonoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${telefonoInstance.id}">${fieldValue(bean: telefonoInstance, field: "area")}</g:link></td>
					
						<td>${fieldValue(bean: telefonoInstance, field: "numero")}</td>
					
						<td>${fieldValue(bean: telefonoInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: telefonoInstance, field: "persona")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${telefonoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
