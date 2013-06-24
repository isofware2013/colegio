
<%@ page import="cl.ucen.colegios.Evaluacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evaluacion.label', default: 'Evaluacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-evaluacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-evaluacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list evaluacion">
			
				<g:if test="${evaluacionInstance?.evaluacionDefinida}">
				<li class="fieldcontain">
					<span id="evaluacionDefinida-label" class="property-label"><g:message code="evaluacion.evaluacionDefinida.label" default="Evaluacion Definida" /></span>
					
						<span class="property-value" aria-labelledby="evaluacionDefinida-label"><g:link controller="evaluacionDefinida" action="show" id="${evaluacionInstance?.evaluacionDefinida?.id}">${evaluacionInstance?.evaluacionDefinida?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.cursoAsignaturaPeriodo}">
				<li class="fieldcontain">
					<span id="cursoAsignaturaPeriodo-label" class="property-label"><g:message code="evaluacion.cursoAsignaturaPeriodo.label" default="Curso Asignatura Periodo" /></span>
					
						<span class="property-value" aria-labelledby="cursoAsignaturaPeriodo-label"><g:link controller="cursoAsignaturaPeriodo" action="show" id="${evaluacionInstance?.cursoAsignaturaPeriodo?.id}">${evaluacionInstance?.cursoAsignaturaPeriodo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.fechaPlanificada}">
				<li class="fieldcontain">
					<span id="fechaPlanificada-label" class="property-label"><g:message code="evaluacion.fechaPlanificada.label" default="Fecha Planificada" /></span>
					
						<span class="property-value" aria-labelledby="fechaPlanificada-label"><g:formatDate date="${evaluacionInstance?.fechaPlanificada}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.fechaReal}">
				<li class="fieldcontain">
					<span id="fechaReal-label" class="property-label"><g:message code="evaluacion.fechaReal.label" default="Fecha Real" /></span>
					
						<span class="property-value" aria-labelledby="fechaReal-label"><g:formatDate date="${evaluacionInstance?.fechaReal}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.ponderacion}">
				<li class="fieldcontain">
					<span id="ponderacion-label" class="property-label"><g:message code="evaluacion.ponderacion.label" default="Ponderacion" /></span>
					
						<span class="property-value" aria-labelledby="ponderacion-label"><g:fieldValue bean="${evaluacionInstance}" field="ponderacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="evaluacion.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${evaluacionInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="evaluacion.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${evaluacionInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.calificacionEvaluacion}">
				<li class="fieldcontain">
					<span id="calificacionEvaluacion-label" class="property-label"><g:message code="evaluacion.calificacionEvaluacion.label" default="Calificacion Evaluacion" /></span>
					
						<span class="property-value" aria-labelledby="calificacionEvaluacion-label"><g:link controller="calificacionEvaluacion" action="show" id="${evaluacionInstance?.calificacionEvaluacion?.id}">${evaluacionInstance?.calificacionEvaluacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.calificaciones}">
				<li class="fieldcontain">
					<span id="calificaciones-label" class="property-label"><g:message code="evaluacion.calificaciones.label" default="Calificaciones" /></span>
					
						<g:each in="${evaluacionInstance.calificaciones}" var="c">
						<span class="property-value" aria-labelledby="calificaciones-label"><g:link controller="calificacionEvaluacion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${evaluacionInstance?.id}" />
					<g:link class="edit" action="edit" id="${evaluacionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
