
<%@ page import="cl.ucen.colegios.EvaluacionDefinida" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evaluacionDefinida.label', default: 'EvaluacionDefinida')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-evaluacionDefinida" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-evaluacionDefinida" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list evaluacionDefinida">
			
				<g:if test="${evaluacionDefinidaInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="evaluacionDefinida.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${evaluacionDefinidaInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionDefinidaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="evaluacionDefinida.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${evaluacionDefinidaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionDefinidaInstance?.ponderacion}">
				<li class="fieldcontain">
					<span id="ponderacion-label" class="property-label"><g:message code="evaluacionDefinida.ponderacion.label" default="Ponderacion" /></span>
					
						<span class="property-value" aria-labelledby="ponderacion-label"><g:fieldValue bean="${evaluacionDefinidaInstance}" field="ponderacion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${evaluacionDefinidaInstance?.id}" />
					<g:link class="edit" action="edit" id="${evaluacionDefinidaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
