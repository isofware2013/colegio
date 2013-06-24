
<%@ page import="cl.ucen.colegios.Unidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidad.label', default: 'Unidad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-unidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-unidad" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="objetivo" title="${message(code: 'unidad.objetivo.label', default: 'Objetivo')}" />
					
						<g:sortableColumn property="objetivosEspecificos" title="${message(code: 'unidad.objetivosEspecificos.label', default: 'Objetivos Especificos')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'unidad.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="cantidadHorasTeoricas" title="${message(code: 'unidad.cantidadHorasTeoricas.label', default: 'Cantidad Horas Teoricas')}" />
					
						<g:sortableColumn property="cantidadHorasPracticas" title="${message(code: 'unidad.cantidadHorasPracticas.label', default: 'Cantidad Horas Practicas')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${unidadInstanceList}" status="i" var="unidadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${unidadInstance.id}">${fieldValue(bean: unidadInstance, field: "objetivo")}</g:link></td>
					
						<td>${fieldValue(bean: unidadInstance, field: "objetivosEspecificos")}</td>
					
						<td>${fieldValue(bean: unidadInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: unidadInstance, field: "cantidadHorasTeoricas")}</td>
					
						<td>${fieldValue(bean: unidadInstance, field: "cantidadHorasPracticas")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${unidadInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
