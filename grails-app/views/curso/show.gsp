
<%@ page import="cl.ucen.colegios.Curso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-curso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-curso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list curso">
			
				<g:if test="${cursoInstance?.periodoEscolar}">
				<li class="fieldcontain">
					<span id="periodoEscolar-label" class="property-label"><g:message code="curso.periodoEscolar.label" default="Periodo Escolar" /></span>
					
						<span class="property-value" aria-labelledby="periodoEscolar-label"><g:link controller="periodoEscolar" action="show" id="${cursoInstance?.periodoEscolar?.id}">${cursoInstance?.periodoEscolar?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.profesorJefe}">
				<li class="fieldcontain">
					<span id="profesorJefe-label" class="property-label"><g:message code="curso.profesorJefe.label" default="Profesor Jefe" /></span>
					
						<span class="property-value" aria-labelledby="profesorJefe-label"><g:link controller="docente" action="show" id="${cursoInstance?.profesorJefe?.id}">${cursoInstance?.profesorJefe?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.asignaturas}">
				<li class="fieldcontain">
					<span id="asignaturas-label" class="property-label"><g:message code="curso.asignaturas.label" default="Asignaturas" /></span>
					
						<span class="property-value" aria-labelledby="asignaturas-label"><g:link controller="cursoAsignaturaPeriodo" action="show" id="${cursoInstance?.asignaturas?.id}">${cursoInstance?.asignaturas?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="curso.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${cursoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.jornada}">
				<li class="fieldcontain">
					<span id="jornada-label" class="property-label"><g:message code="curso.jornada.label" default="Jornada" /></span>
					
						<span class="property-value" aria-labelledby="jornada-label"><g:fieldValue bean="${cursoInstance}" field="jornada"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.nivel}">
				<li class="fieldcontain">
					<span id="nivel-label" class="property-label"><g:message code="curso.nivel.label" default="Nivel" /></span>
					
						<span class="property-value" aria-labelledby="nivel-label"><g:fieldValue bean="${cursoInstance}" field="nivel"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cursoInstance?.id}" />
					<g:link class="edit" action="edit" id="${cursoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
