<%@ page import="cl.ucen.colegios.Horario" %>



<div class="fieldcontain ${hasErrors(bean: horarioInstance, field: 'horaInicio', 'error')} required">
	<label for="horaInicio">
		<g:message code="horario.horaInicio.label" default="Hora Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="horaInicio" type="number" value="${horarioInstance.horaInicio}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: horarioInstance, field: 'horaTermino', 'error')} required">
	<label for="horaTermino">
		<g:message code="horario.horaTermino.label" default="Hora Termino" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="horaTermino" type="number" value="${horarioInstance.horaTermino}" required=""/>
</div>

