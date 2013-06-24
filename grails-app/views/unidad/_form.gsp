<%@ page import="cl.ucen.colegios.Unidad" %>



<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'objetivo', 'error')} ">
	<label for="objetivo">
		<g:message code="unidad.objetivo.label" default="Objetivo" />
		
	</label>
	<g:textField name="objetivo" value="${unidadInstance?.objetivo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'objetivosEspecificos', 'error')} ">
	<label for="objetivosEspecificos">
		<g:message code="unidad.objetivosEspecificos.label" default="Objetivos Especificos" />
		
	</label>
	<g:textField name="objetivosEspecificos" value="${unidadInstance?.objetivosEspecificos}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="unidad.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${unidadInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'cantidadHorasTeoricas', 'error')} required">
	<label for="cantidadHorasTeoricas">
		<g:message code="unidad.cantidadHorasTeoricas.label" default="Cantidad Horas Teoricas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadHorasTeoricas" type="number" value="${unidadInstance.cantidadHorasTeoricas}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'cantidadHorasPracticas', 'error')} required">
	<label for="cantidadHorasPracticas">
		<g:message code="unidad.cantidadHorasPracticas.label" default="Cantidad Horas Practicas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadHorasPracticas" type="number" value="${unidadInstance.cantidadHorasPracticas}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: unidadInstance, field: 'evaluacionesDefinidas', 'error')} ">
	<label for="evaluacionesDefinidas">
		<g:message code="unidad.evaluacionesDefinidas.label" default="Evaluaciones Definidas" />
		
	</label>
	<g:select name="evaluacionesDefinidas" from="${cl.ucen.colegios.EvaluacionDefinida.list()}" multiple="multiple" optionKey="id" size="5" value="${unidadInstance?.evaluacionesDefinidas*.id}" class="many-to-many"/>
</div>

