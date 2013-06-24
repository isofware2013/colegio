<%@ page import="cl.ucen.colegios.Periodo" %>



<div class="fieldcontain ${hasErrors(bean: periodoInstance, field: 'fechaInicio', 'error')} required">
	<label for="fechaInicio">
		<g:message code="periodo.fechaInicio.label" default="Fecha Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicio" precision="day"  value="${periodoInstance?.fechaInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: periodoInstance, field: 'fechaTermino', 'error')} required">
	<label for="fechaTermino">
		<g:message code="periodo.fechaTermino.label" default="Fecha Termino" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaTermino" precision="day"  value="${periodoInstance?.fechaTermino}"  />
</div>

