<%@ page import="cl.ucen.colegios.Evaluacion" %>



<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'evaluacionDefinida', 'error')} required">
	<label for="evaluacionDefinida">
		<g:message code="evaluacion.evaluacionDefinida.label" default="Evaluacion Definida" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="evaluacionDefinida" name="evaluacionDefinida.id" from="${cl.ucen.colegios.EvaluacionDefinida.list()}" optionKey="id" required="" value="${evaluacionInstance?.evaluacionDefinida?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'cursoAsignaturaPeriodo', 'error')} required">
	<label for="cursoAsignaturaPeriodo">
		<g:message code="evaluacion.cursoAsignaturaPeriodo.label" default="Curso Asignatura Periodo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cursoAsignaturaPeriodo" name="cursoAsignaturaPeriodo.id" from="${cl.ucen.colegios.CursoAsignaturaPeriodo.list()}" optionKey="id" required="" value="${evaluacionInstance?.cursoAsignaturaPeriodo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'fechaPlanificada', 'error')} required">
	<label for="fechaPlanificada">
		<g:message code="evaluacion.fechaPlanificada.label" default="Fecha Planificada" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaPlanificada" precision="day"  value="${evaluacionInstance?.fechaPlanificada}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'fechaReal', 'error')} required">
	<label for="fechaReal">
		<g:message code="evaluacion.fechaReal.label" default="Fecha Real" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaReal" precision="day"  value="${evaluacionInstance?.fechaReal}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'ponderacion', 'error')} required">
	<label for="ponderacion">
		<g:message code="evaluacion.ponderacion.label" default="Ponderacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ponderacion" value="${fieldValue(bean: evaluacionInstance, field: 'ponderacion')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="evaluacion.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipo" from="${cl.ucen.colegios.TipoEvaluacion?.values()}" keys="${cl.ucen.colegios.TipoEvaluacion.values()*.name()}" required="" value="${evaluacionInstance?.tipo?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="evaluacion.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${evaluacionInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'calificacionEvaluacion', 'error')} required">
	<label for="calificacionEvaluacion">
		<g:message code="evaluacion.calificacionEvaluacion.label" default="Calificacion Evaluacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="calificacionEvaluacion" name="calificacionEvaluacion.id" from="${cl.ucen.colegios.CalificacionEvaluacion.list()}" optionKey="id" required="" value="${evaluacionInstance?.calificacionEvaluacion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'calificaciones', 'error')} ">
	<label for="calificaciones">
		<g:message code="evaluacion.calificaciones.label" default="Calificaciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${evaluacionInstance?.calificaciones?}" var="c">
    <li><g:link controller="calificacionEvaluacion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="calificacionEvaluacion" action="create" params="['evaluacion.id': evaluacionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion')])}</g:link>
</li>
</ul>

</div>

