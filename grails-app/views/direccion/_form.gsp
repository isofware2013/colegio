<%@ page import="cl.ucen.colegios.Direccion" %>



<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'nombreCalle', 'error')} ">
	<label for="nombreCalle">
		<g:message code="direccion.nombreCalle.label" default="Nombre Calle" />
		
	</label>
	<g:textField name="nombreCalle" value="${direccionInstance?.nombreCalle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'numeracion', 'error')} ">
	<label for="numeracion">
		<g:message code="direccion.numeracion.label" default="Numeracion" />
		
	</label>
	<g:textField name="numeracion" value="${direccionInstance?.numeracion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'dependencia', 'error')} ">
	<label for="dependencia">
		<g:message code="direccion.dependencia.label" default="Dependencia" />
		
	</label>
	<g:textField name="dependencia" value="${direccionInstance?.dependencia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'comuna', 'error')} required">
	<label for="comuna">
		<g:message code="direccion.comuna.label" default="Comuna" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="comuna" name="comuna.id" from="${cl.ucen.colegios.Comuna.list()}" optionKey="id" required="" value="${direccionInstance?.comuna?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="direccion.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipo" from="${cl.ucen.colegios.TipoDireccion?.values()}" keys="${cl.ucen.colegios.TipoDireccion.values()*.name()}" required="" value="${direccionInstance?.tipo?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="direccion.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${cl.ucen.colegios.Persona.list()}" optionKey="id" required="" value="${direccionInstance?.persona?.id}" class="many-to-one"/>
</div>

