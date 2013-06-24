<%@ page import="cl.ucen.colegios.CalificacionEvaluacion" %>



<div class="fieldcontain ${hasErrors(bean: calificacionEvaluacionInstance, field: 'evaluacion', 'error')} required">
	<label for="evaluacion">
		<g:message code="calificacionEvaluacion.evaluacion.label" default="Evaluacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="evaluacion" name="evaluacion.id" from="${cl.ucen.colegios.Evaluacion.list()}" optionKey="id" required="" value="${calificacionEvaluacionInstance?.evaluacion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionEvaluacionInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="calificacionEvaluacion.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${calificacionEvaluacionInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionEvaluacionInstance, field: 'nota', 'error')} required">
	<label for="nota">
		<g:message code="calificacionEvaluacion.nota.label" default="Nota" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nota" value="${fieldValue(bean: calificacionEvaluacionInstance, field: 'nota')}" required=""/>
</div>

