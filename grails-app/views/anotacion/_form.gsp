<%@ page import="cl.ucen.colegios.Anotacion" %>



<div class="fieldcontain ${hasErrors(bean: anotacionInstance, field: 'alumnoCurso', 'error')} ">
	<label for="alumnoCurso">
		<g:message code="anotacion.alumnoCurso.label" default="Alumno Curso" />
		
	</label>
	<g:textField name="alumnoCurso" value="${anotacionInstance?.alumnoCurso}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: anotacionInstance, field: 'diaCursoAsignatura', 'error')} required">
	<label for="diaCursoAsignatura">
		<g:message code="anotacion.diaCursoAsignatura.label" default="Dia Curso Asignatura" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="diaCursoAsignatura" name="diaCursoAsignatura.id" from="${cl.ucen.colegios.DiaCursoAsignatura.list()}" optionKey="id" required="" value="${anotacionInstance?.diaCursoAsignatura?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: anotacionInstance, field: 'texto', 'error')} ">
	<label for="texto">
		<g:message code="anotacion.texto.label" default="Texto" />
		
	</label>
	<g:textField name="texto" value="${anotacionInstance?.texto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: anotacionInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="anotacion.tipo.label" default="Tipo" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${anotacionInstance?.tipo?}" var="t">
    <li><g:link controller="tipoAnotacion" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tipoAnotacion" action="create" params="['anotacion.id': anotacionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tipoAnotacion.label', default: 'TipoAnotacion')])}</g:link>
</li>
</ul>

</div>

