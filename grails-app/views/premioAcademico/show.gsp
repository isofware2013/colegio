
<%@ page import="cl.ucen.colegios.PremioAcademico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'premioAcademico.label', default: 'PremioAcademico')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-premioAcademico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-premioAcademico" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list premioAcademico">
			
				<g:if test="${premioAcademicoInstance?.antecedenteAcademico}">
				<li class="fieldcontain">
					<span id="antecedenteAcademico-label" class="property-label"><g:message code="premioAcademico.antecedenteAcademico.label" default="Antecedente Academico" /></span>
					
						<span class="property-value" aria-labelledby="antecedenteAcademico-label"><g:link controller="antecedenteAcademico" action="show" id="${premioAcademicoInstance?.antecedenteAcademico?.id}">${premioAcademicoInstance?.antecedenteAcademico?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${premioAcademicoInstance?.docente}">
				<li class="fieldcontain">
					<span id="docente-label" class="property-label"><g:message code="premioAcademico.docente.label" default="Docente" /></span>
					
						<span class="property-value" aria-labelledby="docente-label"><g:link controller="docente" action="show" id="${premioAcademicoInstance?.docente?.id}">${premioAcademicoInstance?.docente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${premioAcademicoInstance?.premio}">
				<li class="fieldcontain">
					<span id="premio-label" class="property-label"><g:message code="premioAcademico.premio.label" default="Premio" /></span>
					
						<span class="property-value" aria-labelledby="premio-label"><g:fieldValue bean="${premioAcademicoInstance}" field="premio"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${premioAcademicoInstance?.id}" />
					<g:link class="edit" action="edit" id="${premioAcademicoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
