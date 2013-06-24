<%@ page import="cl.ucen.colegios.Observacion" %>



<div class="fieldcontain ${hasErrors(bean: observacionInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="observacion.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipo" from="${cl.ucen.colegios.TipoObservacion?.values()}" keys="${cl.ucen.colegios.TipoObservacion.values()*.name()}" required="" value="${observacionInstance?.tipo?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: observacionInstance, field: 'fechaIngreso', 'error')} required">
	<label for="fechaIngreso">
		<g:message code="observacion.fechaIngreso.label" default="Fecha Ingreso" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaIngreso" precision="day"  value="${observacionInstance?.fechaIngreso}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: observacionInstance, field: 'alumno', 'error')} required">
	<label for="alumno">
		<g:message code="observacion.alumno.label" default="Alumno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="alumno" name="alumno.id" from="${cl.ucen.colegios.Alumno.list()}" optionKey="id" required="" value="${observacionInstance?.alumno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: observacionInstance, field: 'texto', 'error')} ">
	<label for="texto">
		<g:message code="observacion.texto.label" default="Texto" />
		
	</label>
	<g:textField name="texto" value="${observacionInstance?.texto}"/>
</div>

