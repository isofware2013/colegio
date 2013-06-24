
<%@ page import="cl.ucen.colegios.GradoAcademico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gradoAcademico.label', default: 'GradoAcademico')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gradoAcademico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gradoAcademico" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gradoAcademico">
			
				<g:if test="${gradoAcademicoInstance?.antecedenteAcademico}">
				<li class="fieldcontain">
					<span id="antecedenteAcademico-label" class="property-label"><g:message code="gradoAcademico.antecedenteAcademico.label" default="Antecedente Academico" /></span>
					
						<span class="property-value" aria-labelledby="antecedenteAcademico-label"><g:link controller="antecedenteAcademico" action="show" id="${gradoAcademicoInstance?.antecedenteAcademico?.id}">${gradoAcademicoInstance?.antecedenteAcademico?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradoAcademicoInstance?.docente}">
				<li class="fieldcontain">
					<span id="docente-label" class="property-label"><g:message code="gradoAcademico.docente.label" default="Docente" /></span>
					
						<span class="property-value" aria-labelledby="docente-label"><g:link controller="docente" action="show" id="${gradoAcademicoInstance?.docente?.id}">${gradoAcademicoInstance?.docente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradoAcademicoInstance?.grado}">
				<li class="fieldcontain">
					<span id="grado-label" class="property-label"><g:message code="gradoAcademico.grado.label" default="Grado" /></span>
					
						<span class="property-value" aria-labelledby="grado-label"><g:fieldValue bean="${gradoAcademicoInstance}" field="grado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradoAcademicoInstance?.tipoGrado}">
				<li class="fieldcontain">
					<span id="tipoGrado-label" class="property-label"><g:message code="gradoAcademico.tipoGrado.label" default="Tipo Grado" /></span>
					
						<span class="property-value" aria-labelledby="tipoGrado-label"><g:fieldValue bean="${gradoAcademicoInstance}" field="tipoGrado"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gradoAcademicoInstance?.id}" />
					<g:link class="edit" action="edit" id="${gradoAcademicoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
