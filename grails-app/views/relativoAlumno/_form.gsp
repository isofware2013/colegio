<%@ page import="cl.ucen.colegios.RelativoAlumno" %>



<div class="fieldcontain ${hasErrors(bean: relativoAlumnoInstance, field: 'alumno', 'error')} required">
	<label for="alumno">
		<g:message code="relativoAlumno.alumno.label" default="Alumno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="alumno" name="alumno.id" from="${cl.ucen.colegios.Alumno.list()}" optionKey="id" required="" value="${relativoAlumnoInstance?.alumno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativoAlumnoInstance, field: 'relativo', 'error')} required">
	<label for="relativo">
		<g:message code="relativoAlumno.relativo.label" default="Relativo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="relativo" name="relativo.id" from="${cl.ucen.colegios.Relativo.list()}" optionKey="id" required="" value="${relativoAlumnoInstance?.relativo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativoAlumnoInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="relativoAlumno.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipo" from="${cl.ucen.colegios.TipoRelativo?.values()}" keys="${cl.ucen.colegios.TipoRelativo.values()*.name()}" required="" value="${relativoAlumnoInstance?.tipo?.name()}"/>
</div>

