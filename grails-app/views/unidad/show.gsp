
<%@ page import="cl.ucen.colegios.Unidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidad.label', default: 'Unidad')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-unidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-unidad" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list unidad">
			
				<g:if test="${unidadInstance?.objetivo}">
				<li class="fieldcontain">
					<span id="objetivo-label" class="property-label"><g:message code="unidad.objetivo.label" default="Objetivo" /></span>
					
						<span class="property-value" aria-labelledby="objetivo-label"><g:fieldValue bean="${unidadInstance}" field="objetivo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadInstance?.objetivosEspecificos}">
				<li class="fieldcontain">
					<span id="objetivosEspecificos-label" class="property-label"><g:message code="unidad.objetivosEspecificos.label" default="Objetivos Especificos" /></span>
					
						<span class="property-value" aria-labelledby="objetivosEspecificos-label"><g:fieldValue bean="${unidadInstance}" field="objetivosEspecificos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="unidad.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${unidadInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadInstance?.cantidadHorasTeoricas}">
				<li class="fieldcontain">
					<span id="cantidadHorasTeoricas-label" class="property-label"><g:message code="unidad.cantidadHorasTeoricas.label" default="Cantidad Horas Teoricas" /></span>
					
						<span class="property-value" aria-labelledby="cantidadHorasTeoricas-label"><g:fieldValue bean="${unidadInstance}" field="cantidadHorasTeoricas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadInstance?.cantidadHorasPracticas}">
				<li class="fieldcontain">
					<span id="cantidadHorasPracticas-label" class="property-label"><g:message code="unidad.cantidadHorasPracticas.label" default="Cantidad Horas Practicas" /></span>
					
						<span class="property-value" aria-labelledby="cantidadHorasPracticas-label"><g:fieldValue bean="${unidadInstance}" field="cantidadHorasPracticas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadInstance?.evaluacionesDefinidas}">
				<li class="fieldcontain">
					<span id="evaluacionesDefinidas-label" class="property-label"><g:message code="unidad.evaluacionesDefinidas.label" default="Evaluaciones Definidas" /></span>
					
						<g:each in="${unidadInstance.evaluacionesDefinidas}" var="e">
						<span class="property-value" aria-labelledby="evaluacionesDefinidas-label"><g:link controller="evaluacionDefinida" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${unidadInstance?.id}" />
					<g:link class="edit" action="edit" id="${unidadInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
