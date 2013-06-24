
<%@ page import="cl.ucen.colegios.Alumno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-alumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-alumno" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list alumno">
			
				<g:if test="${alumnoInstance?.rut}">
				<li class="fieldcontain">
					<span id="rut-label" class="property-label"><g:message code="alumno.rut.label" default="Rut" /></span>
					
						<span class="property-value" aria-labelledby="rut-label"><g:fieldValue bean="${alumnoInstance}" field="rut"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.digito}">
				<li class="fieldcontain">
					<span id="digito-label" class="property-label"><g:message code="alumno.digito.label" default="Digito" /></span>
					
						<span class="property-value" aria-labelledby="digito-label"><g:fieldValue bean="${alumnoInstance}" field="digito"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="alumno.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${alumnoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.apellidoPaterno}">
				<li class="fieldcontain">
					<span id="apellidoPaterno-label" class="property-label"><g:message code="alumno.apellidoPaterno.label" default="Apellido Paterno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue bean="${alumnoInstance}" field="apellidoPaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.apellidoMaterno}">
				<li class="fieldcontain">
					<span id="apellidoMaterno-label" class="property-label"><g:message code="alumno.apellidoMaterno.label" default="Apellido Materno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue bean="${alumnoInstance}" field="apellidoMaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="alumno.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${alumnoInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.fechaNacimiento}">
				<li class="fieldcontain">
					<span id="fechaNacimiento-label" class="property-label"><g:message code="alumno.fechaNacimiento.label" default="Fecha Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaNacimiento-label"><g:formatDate date="${alumnoInstance?.fechaNacimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.emails}">
				<li class="fieldcontain">
					<span id="emails-label" class="property-label"><g:message code="alumno.emails.label" default="Emails" /></span>
					
						<span class="property-value" aria-labelledby="emails-label"><g:fieldValue bean="${alumnoInstance}" field="emails"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.direcciones}">
				<li class="fieldcontain">
					<span id="direcciones-label" class="property-label"><g:message code="alumno.direcciones.label" default="Direcciones" /></span>
					
						<g:each in="${alumnoInstance.direcciones}" var="d">
						<span class="property-value" aria-labelledby="direcciones-label"><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="alumno.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${alumnoInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.procedencia}">
				<li class="fieldcontain">
					<span id="procedencia-label" class="property-label"><g:message code="alumno.procedencia.label" default="Procedencia" /></span>
					
						<span class="property-value" aria-labelledby="procedencia-label"><g:fieldValue bean="${alumnoInstance}" field="procedencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="alumno.observaciones.label" default="Observaciones" /></span>
					
						<g:each in="${alumnoInstance.observaciones}" var="o">
						<span class="property-value" aria-labelledby="observaciones-label"><g:link controller="observacion" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.relativos}">
				<li class="fieldcontain">
					<span id="relativos-label" class="property-label"><g:message code="alumno.relativos.label" default="Relativos" /></span>
					
						<g:each in="${alumnoInstance.relativos}" var="r">
						<span class="property-value" aria-labelledby="relativos-label"><g:link controller="relativoAlumno" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${alumnoInstance?.id}" />
					<g:link class="edit" action="edit" id="${alumnoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
