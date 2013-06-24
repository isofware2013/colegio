<%@ page import="cl.ucen.colegios.TipoAnotacion" %>



<div class="fieldcontain ${hasErrors(bean: tipoAnotacionInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoAnotacion.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${tipoAnotacionInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoAnotacionInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="tipoAnotacion.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${tipoAnotacionInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoAnotacionInstance, field: 'plantilla', 'error')} ">
	<label for="plantilla">
		<g:message code="tipoAnotacion.plantilla.label" default="Plantilla" />
		
	</label>
	<g:textField name="plantilla" value="${tipoAnotacionInstance?.plantilla}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoAnotacionInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="tipoAnotacion.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${cl.ucen.colegios.Anotacion.list()}" optionKey="id" required="" value="${tipoAnotacionInstance?.tipo?.id}" class="many-to-one"/>
</div>

