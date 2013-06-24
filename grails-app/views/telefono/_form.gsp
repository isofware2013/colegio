<%@ page import="cl.ucen.colegios.Telefono" %>



<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'area', 'error')} required">
	<label for="area">
		<g:message code="telefono.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="area" type="number" min="1" max="999" value="${telefonoInstance.area}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="telefono.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" min="111111" max="99999999" value="${telefonoInstance.numero}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="telefono.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipo" from="${cl.ucen.colegios.TipoTelefono?.values()}" keys="${cl.ucen.colegios.TipoTelefono.values()*.name()}" required="" value="${telefonoInstance?.tipo?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="telefono.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${cl.ucen.colegios.Persona.list()}" optionKey="id" required="" value="${telefonoInstance?.persona?.id}" class="many-to-one"/>
</div>

