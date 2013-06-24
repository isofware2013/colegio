<%@ page import="cl.ucen.colegios.Asignatura" %>



<div class="fieldcontain ${hasErrors(bean: asignaturaInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="asignatura.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="codigo" type="number" value="${asignaturaInstance.codigo}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: asignaturaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="asignatura.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${asignaturaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: asignaturaInstance, field: 'nivel', 'error')} required">
	<label for="nivel">
		<g:message code="asignatura.nivel.label" default="Nivel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nivel" from="${cl.ucen.colegios.Nivel?.values()}" keys="${cl.ucen.colegios.Nivel.values()*.name()}" required="" value="${asignaturaInstance?.nivel?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: asignaturaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="asignatura.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${asignaturaInstance?.nombre}"/>
</div>

