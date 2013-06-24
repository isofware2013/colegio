
<%@ page import="cl.ucen.colegios.DiaCursoAsignatura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diaCursoAsignatura.label', default: 'DiaCursoAsignatura')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-diaCursoAsignatura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-diaCursoAsignatura" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list diaCursoAsignatura">
			
				<g:if test="${diaCursoAsignaturaInstance?.anotaciones}">
				<li class="fieldcontain">
					<span id="anotaciones-label" class="property-label"><g:message code="diaCursoAsignatura.anotaciones.label" default="Anotaciones" /></span>
					
						<g:each in="${diaCursoAsignaturaInstance.anotaciones}" var="a">
						<span class="property-value" aria-labelledby="anotaciones-label"><g:link controller="anotacion" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${diaCursoAsignaturaInstance?.asistentes}">
				<li class="fieldcontain">
					<span id="asistentes-label" class="property-label"><g:message code="diaCursoAsignatura.asistentes.label" default="Asistentes" /></span>
					
						<span class="property-value" aria-labelledby="asistentes-label"><g:fieldValue bean="${diaCursoAsignaturaInstance}" field="asistentes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diaCursoAsignaturaInstance?.cursoAsignaturaPeriodo}">
				<li class="fieldcontain">
					<span id="cursoAsignaturaPeriodo-label" class="property-label"><g:message code="diaCursoAsignatura.cursoAsignaturaPeriodo.label" default="Curso Asignatura Periodo" /></span>
					
						<span class="property-value" aria-labelledby="cursoAsignaturaPeriodo-label"><g:link controller="cursoAsignaturaPeriodo" action="show" id="${diaCursoAsignaturaInstance?.cursoAsignaturaPeriodo?.id}">${diaCursoAsignaturaInstance?.cursoAsignaturaPeriodo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${diaCursoAsignaturaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="diaCursoAsignatura.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${diaCursoAsignaturaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${diaCursoAsignaturaInstance?.id}" />
					<g:link class="edit" action="edit" id="${diaCursoAsignaturaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
