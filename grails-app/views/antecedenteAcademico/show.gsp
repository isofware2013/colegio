
<%@ page import="cl.ucen.colegios.AntecedenteAcademico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'antecedenteAcademico.label', default: 'AntecedenteAcademico')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-antecedenteAcademico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-antecedenteAcademico" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list antecedenteAcademico">
			
				<g:if test="${antecedenteAcademicoInstance?.anio}">
				<li class="fieldcontain">
					<span id="anio-label" class="property-label"><g:message code="antecedenteAcademico.anio.label" default="Anio" /></span>
					
						<span class="property-value" aria-labelledby="anio-label"><g:fieldValue bean="${antecedenteAcademicoInstance}" field="anio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${antecedenteAcademicoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="antecedenteAcademico.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${antecedenteAcademicoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${antecedenteAcademicoInstance?.docente}">
				<li class="fieldcontain">
					<span id="docente-label" class="property-label"><g:message code="antecedenteAcademico.docente.label" default="Docente" /></span>
					
						<span class="property-value" aria-labelledby="docente-label"><g:link controller="docente" action="show" id="${antecedenteAcademicoInstance?.docente?.id}">${antecedenteAcademicoInstance?.docente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${antecedenteAcademicoInstance?.institucion}">
				<li class="fieldcontain">
					<span id="institucion-label" class="property-label"><g:message code="antecedenteAcademico.institucion.label" default="Institucion" /></span>
					
						<span class="property-value" aria-labelledby="institucion-label"><g:fieldValue bean="${antecedenteAcademicoInstance}" field="institucion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${antecedenteAcademicoInstance?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="antecedenteAcademico.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:fieldValue bean="${antecedenteAcademicoInstance}" field="pais"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${antecedenteAcademicoInstance?.id}" />
					<g:link class="edit" action="edit" id="${antecedenteAcademicoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
