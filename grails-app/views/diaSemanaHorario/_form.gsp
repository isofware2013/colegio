<%@ page import="cl.ucen.colegios.DiaSemanaHorario" %>



<div class="fieldcontain ${hasErrors(bean: diaSemanaHorarioInstance, field: 'diaSemana', 'error')} required">
	<label for="diaSemana">
		<g:message code="diaSemanaHorario.diaSemana.label" default="Dia Semana" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="diaSemana" from="${cl.ucen.colegios.DiaSemana?.values()}" keys="${cl.ucen.colegios.DiaSemana.values()*.name()}" required="" value="${diaSemanaHorarioInstance?.diaSemana?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: diaSemanaHorarioInstance, field: 'horario', 'error')} required">
	<label for="horario">
		<g:message code="diaSemanaHorario.horario.label" default="Horario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="horario" name="horario.id" from="${cl.ucen.colegios.Horario.list()}" optionKey="id" required="" value="${diaSemanaHorarioInstance?.horario?.id}" class="many-to-one"/>
</div>

