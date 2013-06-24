<%@ page import="cl.ucen.colegios.DiaCursoAsignatura" %>



<div class="fieldcontain ${hasErrors(bean: diaCursoAsignaturaInstance, field: 'anotaciones', 'error')} ">
	<label for="anotaciones">
		<g:message code="diaCursoAsignatura.anotaciones.label" default="Anotaciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${diaCursoAsignaturaInstance?.anotaciones?}" var="a">
    <li><g:link controller="anotacion" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="anotacion" action="create" params="['diaCursoAsignatura.id': diaCursoAsignaturaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'anotacion.label', default: 'Anotacion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: diaCursoAsignaturaInstance, field: 'asistentes', 'error')} required">
	<label for="asistentes">
		<g:message code="diaCursoAsignatura.asistentes.label" default="Asistentes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="asistentes" type="number" value="${diaCursoAsignaturaInstance.asistentes}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: diaCursoAsignaturaInstance, field: 'cursoAsignaturaPeriodo', 'error')} required">
	<label for="cursoAsignaturaPeriodo">
		<g:message code="diaCursoAsignatura.cursoAsignaturaPeriodo.label" default="Curso Asignatura Periodo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cursoAsignaturaPeriodo" name="cursoAsignaturaPeriodo.id" from="${cl.ucen.colegios.CursoAsignaturaPeriodo.list()}" optionKey="id" required="" value="${diaCursoAsignaturaInstance?.cursoAsignaturaPeriodo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: diaCursoAsignaturaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="diaCursoAsignatura.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${diaCursoAsignaturaInstance?.fecha}"  />
</div>

