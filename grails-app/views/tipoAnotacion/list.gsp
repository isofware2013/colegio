
<%@ page import="cl.ucen.colegios.TipoAnotacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoAnotacion.label', default: 'TipoAnotacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipoAnotacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipoAnotacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'tipoAnotacion.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'tipoAnotacion.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="plantilla" title="${message(code: 'tipoAnotacion.plantilla.label', default: 'Plantilla')}" />
					
						<th><g:message code="tipoAnotacion.tipo.label" default="Tipo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoAnotacionInstanceList}" status="i" var="tipoAnotacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoAnotacionInstance.id}">${fieldValue(bean: tipoAnotacionInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: tipoAnotacionInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: tipoAnotacionInstance, field: "plantilla")}</td>
					
						<td>${fieldValue(bean: tipoAnotacionInstance, field: "tipo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoAnotacionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
