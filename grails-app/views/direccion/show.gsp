
<%@ page import="cl.ucen.colegios.Direccion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'direccion.label', default: 'Direccion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-direccion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-direccion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list direccion">
			
				<g:if test="${direccionInstance?.nombreCalle}">
				<li class="fieldcontain">
					<span id="nombreCalle-label" class="property-label"><g:message code="direccion.nombreCalle.label" default="Nombre Calle" /></span>
					
						<span class="property-value" aria-labelledby="nombreCalle-label"><g:fieldValue bean="${direccionInstance}" field="nombreCalle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${direccionInstance?.numeracion}">
				<li class="fieldcontain">
					<span id="numeracion-label" class="property-label"><g:message code="direccion.numeracion.label" default="Numeracion" /></span>
					
						<span class="property-value" aria-labelledby="numeracion-label"><g:fieldValue bean="${direccionInstance}" field="numeracion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${direccionInstance?.dependencia}">
				<li class="fieldcontain">
					<span id="dependencia-label" class="property-label"><g:message code="direccion.dependencia.label" default="Dependencia" /></span>
					
						<span class="property-value" aria-labelledby="dependencia-label"><g:fieldValue bean="${direccionInstance}" field="dependencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${direccionInstance?.comuna}">
				<li class="fieldcontain">
					<span id="comuna-label" class="property-label"><g:message code="direccion.comuna.label" default="Comuna" /></span>
					
						<span class="property-value" aria-labelledby="comuna-label"><g:link controller="comuna" action="show" id="${direccionInstance?.comuna?.id}">${direccionInstance?.comuna?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${direccionInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="direccion.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${direccionInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${direccionInstance?.persona}">
				<li class="fieldcontain">
					<span id="persona-label" class="property-label"><g:message code="direccion.persona.label" default="Persona" /></span>
					
						<span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="show" id="${direccionInstance?.persona?.id}">${direccionInstance?.persona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${direccionInstance?.id}" />
					<g:link class="edit" action="edit" id="${direccionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
