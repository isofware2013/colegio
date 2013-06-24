<%@ page import="cl.ucen.colegios.Alumno" %>



<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'rut', 'error')} required">
	<label for="rut">
		<g:message code="alumno.rut.label" default="Rut" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rut" type="number" min="1000" max="49999999" value="${alumnoInstance.rut}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'digito', 'error')} ">
	<label for="digito">
		<g:message code="alumno.digito.label" default="Digito" />
		
	</label>
	<g:textField name="digito" maxlength="1" pattern="${alumnoInstance.constraints.digito.matches}" value="${alumnoInstance?.digito}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="alumno.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${alumnoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'apellidoPaterno', 'error')} ">
	<label for="apellidoPaterno">
		<g:message code="alumno.apellidoPaterno.label" default="Apellido Paterno" />
		
	</label>
	<g:textField name="apellidoPaterno" value="${alumnoInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="alumno.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${alumnoInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="alumno.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${cl.ucen.colegios.Sexo?.values()}" keys="${cl.ucen.colegios.Sexo.values()*.name()}" required="" value="${alumnoInstance?.sexo?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="alumno.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${alumnoInstance?.fechaNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'emails', 'error')} ">
	<label for="emails">
		<g:message code="alumno.emails.label" default="Emails" />
		
	</label>
	<g:textField name="emails" value="${alumnoInstance?.emails}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'direcciones', 'error')} ">
	<label for="direcciones">
		<g:message code="alumno.direcciones.label" default="Direcciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${alumnoInstance?.direcciones?}" var="d">
    <li><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="direccion" action="create" params="['alumno.id': alumnoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'direccion.label', default: 'Direccion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="alumno.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${alumnoInstance?.telefonos?}" var="t">
    <li><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefono" action="create" params="['alumno.id': alumnoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefono.label', default: 'Telefono')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'procedencia', 'error')} ">
	<label for="procedencia">
		<g:message code="alumno.procedencia.label" default="Procedencia" />
		
	</label>
	<g:textField name="procedencia" value="${alumnoInstance?.procedencia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="alumno.observaciones.label" default="Observaciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${alumnoInstance?.observaciones?}" var="o">
    <li><g:link controller="observacion" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="observacion" action="create" params="['alumno.id': alumnoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'observacion.label', default: 'Observacion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'relativos', 'error')} ">
	<label for="relativos">
		<g:message code="alumno.relativos.label" default="Relativos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${alumnoInstance?.relativos?}" var="r">
    <li><g:link controller="relativoAlumno" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="relativoAlumno" action="create" params="['alumno.id': alumnoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'relativoAlumno.label', default: 'RelativoAlumno')])}</g:link>
</li>
</ul>

</div>

