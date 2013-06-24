<%@ page import="cl.ucen.colegios.Curso" %>



<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'periodoEscolar', 'error')} required">
	<label for="periodoEscolar">
		<g:message code="curso.periodoEscolar.label" default="Periodo Escolar" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="periodoEscolar" name="periodoEscolar.id" from="${cl.ucen.colegios.PeriodoEscolar.list()}" optionKey="id" required="" value="${cursoInstance?.periodoEscolar?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'profesorJefe', 'error')} required">
	<label for="profesorJefe">
		<g:message code="curso.profesorJefe.label" default="Profesor Jefe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profesorJefe" name="profesorJefe.id" from="${cl.ucen.colegios.Docente.list()}" optionKey="id" required="" value="${cursoInstance?.profesorJefe?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'asignaturas', 'error')} required">
	<label for="asignaturas">
		<g:message code="curso.asignaturas.label" default="Asignaturas" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="asignaturas" name="asignaturas.id" from="${cl.ucen.colegios.CursoAsignaturaPeriodo.list()}" optionKey="id" required="" value="${cursoInstance?.asignaturas?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="curso.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${cursoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'jornada', 'error')} required">
	<label for="jornada">
		<g:message code="curso.jornada.label" default="Jornada" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="jornada" from="${cl.ucen.colegios.Jornada?.values()}" keys="${cl.ucen.colegios.Jornada.values()*.name()}" required="" value="${cursoInstance?.jornada?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'nivel', 'error')} required">
	<label for="nivel">
		<g:message code="curso.nivel.label" default="Nivel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nivel" from="${cl.ucen.colegios.Nivel?.values()}" keys="${cl.ucen.colegios.Nivel.values()*.name()}" required="" value="${cursoInstance?.nivel?.name()}"/>
</div>

