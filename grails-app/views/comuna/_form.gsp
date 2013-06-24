<%@ page import="cl.ucen.colegios.Comuna" %>



<div class="fieldcontain ${hasErrors(bean: comunaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="comuna.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${comunaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: comunaInstance, field: 'region', 'error')} required">
	<label for="region">
		<g:message code="comuna.region.label" default="Region" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="region" name="region.id" from="${cl.ucen.colegios.Region.list()}" optionKey="id" required="" value="${comunaInstance?.region?.id}" class="many-to-one"/>
</div>

