<%@ page import="cl.ucen.colegios.GradoAcademico" %>



<div class="fieldcontain ${hasErrors(bean: gradoAcademicoInstance, field: 'antecedenteAcademico', 'error')} required">
	<label for="antecedenteAcademico">
		<g:message code="gradoAcademico.antecedenteAcademico.label" default="Antecedente Academico" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="antecedenteAcademico" name="antecedenteAcademico.id" from="${cl.ucen.colegios.AntecedenteAcademico.list()}" optionKey="id" required="" value="${gradoAcademicoInstance?.antecedenteAcademico?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gradoAcademicoInstance, field: 'docente', 'error')} required">
	<label for="docente">
		<g:message code="gradoAcademico.docente.label" default="Docente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="docente" name="docente.id" from="${cl.ucen.colegios.Docente.list()}" optionKey="id" required="" value="${gradoAcademicoInstance?.docente?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gradoAcademicoInstance, field: 'grado', 'error')} ">
	<label for="grado">
		<g:message code="gradoAcademico.grado.label" default="Grado" />
		
	</label>
	<g:textField name="grado" value="${gradoAcademicoInstance?.grado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gradoAcademicoInstance, field: 'tipoGrado', 'error')} required">
	<label for="tipoGrado">
		<g:message code="gradoAcademico.tipoGrado.label" default="Tipo Grado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipoGrado" from="${cl.ucen.colegios.TipoGrado?.values()}" keys="${cl.ucen.colegios.TipoGrado.values()*.name()}" required="" value="${gradoAcademicoInstance?.tipoGrado?.name()}"/>
</div>

