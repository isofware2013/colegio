<%@ page import="cl.ucen.colegios.EvaluacionDefinida" %>



<div class="fieldcontain ${hasErrors(bean: evaluacionDefinidaInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="evaluacionDefinida.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="codigo" type="number" value="${evaluacionDefinidaInstance.codigo}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionDefinidaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="evaluacionDefinida.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${evaluacionDefinidaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionDefinidaInstance, field: 'ponderacion', 'error')} required">
	<label for="ponderacion">
		<g:message code="evaluacionDefinida.ponderacion.label" default="Ponderacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ponderacion" value="${fieldValue(bean: evaluacionDefinidaInstance, field: 'ponderacion')}" required=""/>
</div>

