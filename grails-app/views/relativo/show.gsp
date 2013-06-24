
<%@ page import="cl.ucen.colegios.Relativo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relativo.label', default: 'Relativo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-relativo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-relativo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list relativo">
			
				<g:if test="${relativoInstance?.rut}">
				<li class="fieldcontain">
					<span id="rut-label" class="property-label"><g:message code="relativo.rut.label" default="Rut" /></span>
					
						<span class="property-value" aria-labelledby="rut-label"><g:fieldValue bean="${relativoInstance}" field="rut"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.digito}">
				<li class="fieldcontain">
					<span id="digito-label" class="property-label"><g:message code="relativo.digito.label" default="Digito" /></span>
					
						<span class="property-value" aria-labelledby="digito-label"><g:fieldValue bean="${relativoInstance}" field="digito"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="relativo.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${relativoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.apellidoPaterno}">
				<li class="fieldcontain">
					<span id="apellidoPaterno-label" class="property-label"><g:message code="relativo.apellidoPaterno.label" default="Apellido Paterno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue bean="${relativoInstance}" field="apellidoPaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.apellidoMaterno}">
				<li class="fieldcontain">
					<span id="apellidoMaterno-label" class="property-label"><g:message code="relativo.apellidoMaterno.label" default="Apellido Materno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue bean="${relativoInstance}" field="apellidoMaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="relativo.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${relativoInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.fechaNacimiento}">
				<li class="fieldcontain">
					<span id="fechaNacimiento-label" class="property-label"><g:message code="relativo.fechaNacimiento.label" default="Fecha Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaNacimiento-label"><g:formatDate date="${relativoInstance?.fechaNacimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.nivelEstudio}">
				<li class="fieldcontain">
					<span id="nivelEstudio-label" class="property-label"><g:message code="relativo.nivelEstudio.label" default="Nivel Estudio" /></span>
					
						<span class="property-value" aria-labelledby="nivelEstudio-label"><g:fieldValue bean="${relativoInstance}" field="nivelEstudio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.profesion}">
				<li class="fieldcontain">
					<span id="profesion-label" class="property-label"><g:message code="relativo.profesion.label" default="Profesion" /></span>
					
						<span class="property-value" aria-labelledby="profesion-label"><g:fieldValue bean="${relativoInstance}" field="profesion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.alumnos}">
				<li class="fieldcontain">
					<span id="alumnos-label" class="property-label"><g:message code="relativo.alumnos.label" default="Alumnos" /></span>
					
						<g:each in="${relativoInstance.alumnos}" var="a">
						<span class="property-value" aria-labelledby="alumnos-label"><g:link controller="relativoAlumno" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.emails}">
				<li class="fieldcontain">
					<span id="emails-label" class="property-label"><g:message code="relativo.emails.label" default="Emails" /></span>
					
						<span class="property-value" aria-labelledby="emails-label"><g:fieldValue bean="${relativoInstance}" field="emails"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.direcciones}">
				<li class="fieldcontain">
					<span id="direcciones-label" class="property-label"><g:message code="relativo.direcciones.label" default="Direcciones" /></span>
					
						<g:each in="${relativoInstance.direcciones}" var="d">
						<span class="property-value" aria-labelledby="direcciones-label"><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${relativoInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="relativo.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${relativoInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${relativoInstance?.id}" />
					<g:link class="edit" action="edit" id="${relativoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
