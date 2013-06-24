<%@ page import="cl.ucen.colegios.AntecedenteAcademico" %>



<div class="fieldcontain ${hasErrors(bean: antecedenteAcademicoInstance, field: 'anio', 'error')} required">
	<label for="anio">
		<g:message code="antecedenteAcademico.anio.label" default="Anio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="anio" type="number" value="${antecedenteAcademicoInstance.anio}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: antecedenteAcademicoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="antecedenteAcademico.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${antecedenteAcademicoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: antecedenteAcademicoInstance, field: 'docente', 'error')} required">
	<label for="docente">
		<g:message code="antecedenteAcademico.docente.label" default="Docente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="docente" name="docente.id" from="${cl.ucen.colegios.Docente.list()}" optionKey="id" required="" value="${antecedenteAcademicoInstance?.docente?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: antecedenteAcademicoInstance, field: 'institucion', 'error')} ">
	<label for="institucion">
		<g:message code="antecedenteAcademico.institucion.label" default="Institucion" />
		
	</label>
	<g:textField name="institucion" value="${antecedenteAcademicoInstance?.institucion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: antecedenteAcademicoInstance, field: 'pais', 'error')} ">
	<label for="pais">
		<g:message code="antecedenteAcademico.pais.label" default="Pais" />
		
	</label>
	<g:textField name="pais" value="${antecedenteAcademicoInstance?.pais}"/>
</div>

