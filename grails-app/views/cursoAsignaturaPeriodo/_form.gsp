<%@ page import="cl.ucen.colegios.CursoAsignaturaPeriodo" %>



<div class="fieldcontain ${hasErrors(bean: cursoAsignaturaPeriodoInstance, field: 'curso', 'error')} required">
	<label for="curso">
		<g:message code="cursoAsignaturaPeriodo.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="curso" name="curso.id" from="${cl.ucen.colegios.Curso.list()}" optionKey="id" required="" value="${cursoAsignaturaPeriodoInstance?.curso?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoAsignaturaPeriodoInstance, field: 'diasHorarios', 'error')} ">
	<label for="diasHorarios">
		<g:message code="cursoAsignaturaPeriodo.diasHorarios.label" default="Dias Horarios" />
		
	</label>
	<g:select name="diasHorarios" from="${cl.ucen.colegios.DiaSemanaHorario.list()}" multiple="multiple" optionKey="id" size="5" value="${cursoAsignaturaPeriodoInstance?.diasHorarios*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoAsignaturaPeriodoInstance, field: 'docente', 'error')} required">
	<label for="docente">
		<g:message code="cursoAsignaturaPeriodo.docente.label" default="Docente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="docente" name="docente.id" from="${cl.ucen.colegios.Docente.list()}" optionKey="id" required="" value="${cursoAsignaturaPeriodoInstance?.docente?.id}" class="many-to-one"/>
</div>

