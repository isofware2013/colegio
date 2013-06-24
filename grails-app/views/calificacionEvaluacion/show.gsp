
<%@ page import="cl.ucen.colegios.CalificacionEvaluacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-calificacionEvaluacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-calificacionEvaluacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list calificacionEvaluacion">
			
				<g:if test="${calificacionEvaluacionInstance?.evaluacion}">
				<li class="fieldcontain">
					<span id="evaluacion-label" class="property-label"><g:message code="calificacionEvaluacion.evaluacion.label" default="Evaluacion" /></span>
					
						<span class="property-value" aria-labelledby="evaluacion-label"><g:link controller="evaluacion" action="show" id="${calificacionEvaluacionInstance?.evaluacion?.id}">${calificacionEvaluacionInstance?.evaluacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificacionEvaluacionInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="calificacionEvaluacion.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${calificacionEvaluacionInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificacionEvaluacionInstance?.nota}">
				<li class="fieldcontain">
					<span id="nota-label" class="property-label"><g:message code="calificacionEvaluacion.nota.label" default="Nota" /></span>
					
						<span class="property-value" aria-labelledby="nota-label"><g:fieldValue bean="${calificacionEvaluacionInstance}" field="nota"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${calificacionEvaluacionInstance?.id}" />
					<g:link class="edit" action="edit" id="${calificacionEvaluacionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
