<%@ page import="cl.ucen.colegios.PeriodoEscolar" %>



<div class="fieldcontain ${hasErrors(bean: periodoEscolarInstance, field: 'anio', 'error')} required">
	<label for="anio">
		<g:message code="periodoEscolar.anio.label" default="Anio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="anio" type="number" value="${periodoEscolarInstance.anio}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: periodoEscolarInstance, field: 'periodo', 'error')} required">
	<label for="periodo">
		<g:message code="periodoEscolar.periodo.label" default="Periodo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="periodo" name="periodo.id" from="${cl.ucen.colegios.Periodo.list()}" optionKey="id" required="" value="${periodoEscolarInstance?.periodo?.id}" class="many-to-one"/>
</div>

