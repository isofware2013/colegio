<%@ page import="cl.ucen.colegios.Relativo" %>



<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'rut', 'error')} required">
	<label for="rut">
		<g:message code="relativo.rut.label" default="Rut" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rut" type="number" min="1000" max="49999999" value="${relativoInstance.rut}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'digito', 'error')} ">
	<label for="digito">
		<g:message code="relativo.digito.label" default="Digito" />
		
	</label>
	<g:textField name="digito" maxlength="1" pattern="${relativoInstance.constraints.digito.matches}" value="${relativoInstance?.digito}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="relativo.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${relativoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'apellidoPaterno', 'error')} ">
	<label for="apellidoPaterno">
		<g:message code="relativo.apellidoPaterno.label" default="Apellido Paterno" />
		
	</label>
	<g:textField name="apellidoPaterno" value="${relativoInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="relativo.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${relativoInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="relativo.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${cl.ucen.colegios.Sexo?.values()}" keys="${cl.ucen.colegios.Sexo.values()*.name()}" required="" value="${relativoInstance?.sexo?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="relativo.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${relativoInstance?.fechaNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'nivelEstudio', 'error')} ">
	<label for="nivelEstudio">
		<g:message code="relativo.nivelEstudio.label" default="Nivel Estudio" />
		
	</label>
	<g:textField name="nivelEstudio" value="${relativoInstance?.nivelEstudio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'profesion', 'error')} ">
	<label for="profesion">
		<g:message code="relativo.profesion.label" default="Profesion" />
		
	</label>
	<g:textField name="profesion" value="${relativoInstance?.profesion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'alumnos', 'error')} ">
	<label for="alumnos">
		<g:message code="relativo.alumnos.label" default="Alumnos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${relativoInstance?.alumnos?}" var="a">
    <li><g:link controller="relativoAlumno" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="relativoAlumno" action="create" params="['relativo.id': relativoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'relativoAlumno.label', default: 'RelativoAlumno')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'emails', 'error')} ">
	<label for="emails">
		<g:message code="relativo.emails.label" default="Emails" />
		
	</label>
	<g:textField name="emails" value="${relativoInstance?.emails}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'direcciones', 'error')} ">
	<label for="direcciones">
		<g:message code="relativo.direcciones.label" default="Direcciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${relativoInstance?.direcciones?}" var="d">
    <li><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="direccion" action="create" params="['relativo.id': relativoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'direccion.label', default: 'Direccion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: relativoInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="relativo.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${relativoInstance?.telefonos?}" var="t">
    <li><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefono" action="create" params="['relativo.id': relativoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefono.label', default: 'Telefono')])}</g:link>
</li>
</ul>

</div>

