
<%@ page import="cl.ucen.colegios.Anotacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'anotacion.label', default: 'Anotacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-anotacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-anotacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list anotacion">
			
				<g:if test="${anotacionInstance?.alumnoCurso}">
				<li class="fieldcontain">
					<span id="alumnoCurso-label" class="property-label"><g:message code="anotacion.alumnoCurso.label" default="Alumno Curso" /></span>
					
						<span class="property-value" aria-labelledby="alumnoCurso-label"><g:fieldValue bean="${anotacionInstance}" field="alumnoCurso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${anotacionInstance?.diaCursoAsignatura}">
				<li class="fieldcontain">
					<span id="diaCursoAsignatura-label" class="property-label"><g:message code="anotacion.diaCursoAsignatura.label" default="Dia Curso Asignatura" /></span>
					
						<span class="property-value" aria-labelledby="diaCursoAsignatura-label"><g:link controller="diaCursoAsignatura" action="show" id="${anotacionInstance?.diaCursoAsignatura?.id}">${anotacionInstance?.diaCursoAsignatura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${anotacionInstance?.texto}">
				<li class="fieldcontain">
					<span id="texto-label" class="property-label"><g:message code="anotacion.texto.label" default="Texto" /></span>
					
						<span class="property-value" aria-labelledby="texto-label"><g:fieldValue bean="${anotacionInstance}" field="texto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${anotacionInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="anotacion.tipo.label" default="Tipo" /></span>
					
						<g:each in="${anotacionInstance.tipo}" var="t">
						<span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipoAnotacion" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${anotacionInstance?.id}" />
					<g:link class="edit" action="edit" id="${anotacionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
