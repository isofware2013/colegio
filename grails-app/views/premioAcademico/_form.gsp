<%@ page import="cl.ucen.colegios.PremioAcademico" %>



<div class="fieldcontain ${hasErrors(bean: premioAcademicoInstance, field: 'antecedenteAcademico', 'error')} required">
	<label for="antecedenteAcademico">
		<g:message code="premioAcademico.antecedenteAcademico.label" default="Antecedente Academico" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="antecedenteAcademico" name="antecedenteAcademico.id" from="${cl.ucen.colegios.AntecedenteAcademico.list()}" optionKey="id" required="" value="${premioAcademicoInstance?.antecedenteAcademico?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: premioAcademicoInstance, field: 'docente', 'error')} required">
	<label for="docente">
		<g:message code="premioAcademico.docente.label" default="Docente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="docente" name="docente.id" from="${cl.ucen.colegios.Docente.list()}" optionKey="id" required="" value="${premioAcademicoInstance?.docente?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: premioAcademicoInstance, field: 'premio', 'error')} ">
	<label for="premio">
		<g:message code="premioAcademico.premio.label" default="Premio" />
		
	</label>
	<g:textField name="premio" value="${premioAcademicoInstance?.premio}"/>
</div>

