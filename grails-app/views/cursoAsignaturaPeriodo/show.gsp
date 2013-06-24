
<%@ page import="cl.ucen.colegios.CursoAsignaturaPeriodo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cursoAsignaturaPeriodo.label', default: 'CursoAsignaturaPeriodo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cursoAsignaturaPeriodo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cursoAsignaturaPeriodo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cursoAsignaturaPeriodo">
			
				<g:if test="${cursoAsignaturaPeriodoInstance?.curso}">
				<li class="fieldcontain">
					<span id="curso-label" class="property-label"><g:message code="cursoAsignaturaPeriodo.curso.label" default="Curso" /></span>
					
						<span class="property-value" aria-labelledby="curso-label"><g:link controller="curso" action="show" id="${cursoAsignaturaPeriodoInstance?.curso?.id}">${cursoAsignaturaPeriodoInstance?.curso?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoAsignaturaPeriodoInstance?.diasHorarios}">
				<li class="fieldcontain">
					<span id="diasHorarios-label" class="property-label"><g:message code="cursoAsignaturaPeriodo.diasHorarios.label" default="Dias Horarios" /></span>
					
						<g:each in="${cursoAsignaturaPeriodoInstance.diasHorarios}" var="d">
						<span class="property-value" aria-labelledby="diasHorarios-label"><g:link controller="diaSemanaHorario" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cursoAsignaturaPeriodoInstance?.docente}">
				<li class="fieldcontain">
					<span id="docente-label" class="property-label"><g:message code="cursoAsignaturaPeriodo.docente.label" default="Docente" /></span>
					
						<span class="property-value" aria-labelledby="docente-label"><g:link controller="docente" action="show" id="${cursoAsignaturaPeriodoInstance?.docente?.id}">${cursoAsignaturaPeriodoInstance?.docente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cursoAsignaturaPeriodoInstance?.id}" />
					<g:link class="edit" action="edit" id="${cursoAsignaturaPeriodoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
