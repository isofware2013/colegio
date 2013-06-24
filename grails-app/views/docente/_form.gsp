<%@ page import="cl.ucen.colegios.Docente" %>



<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'rut', 'error')} required">
	<label for="rut">
		<g:message code="docente.rut.label" default="Rut" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rut" type="number" min="1000" max="49999999" value="${docenteInstance.rut}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'digito', 'error')} ">
	<label for="digito">
		<g:message code="docente.digito.label" default="Digito" />
		
	</label>
	<g:textField name="digito" maxlength="1" pattern="${docenteInstance.constraints.digito.matches}" value="${docenteInstance?.digito}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="docente.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${docenteInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'apellidoPaterno', 'error')} ">
	<label for="apellidoPaterno">
		<g:message code="docente.apellidoPaterno.label" default="Apellido Paterno" />
		
	</label>
	<g:textField name="apellidoPaterno" value="${docenteInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="docente.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${docenteInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="docente.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${cl.ucen.colegios.Sexo?.values()}" keys="${cl.ucen.colegios.Sexo.values()*.name()}" required="" value="${docenteInstance?.sexo?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="docente.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${docenteInstance?.fechaNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'emails', 'error')} ">
	<label for="emails">
		<g:message code="docente.emails.label" default="Emails" />
		
	</label>
	<g:textField name="emails" value="${docenteInstance?.emails}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'direcciones', 'error')} ">
	<label for="direcciones">
		<g:message code="docente.direcciones.label" default="Direcciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${docenteInstance?.direcciones?}" var="d">
    <li><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="direccion" action="create" params="['docente.id': docenteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'direccion.label', default: 'Direccion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="docente.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${docenteInstance?.telefonos?}" var="t">
    <li><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefono" action="create" params="['docente.id': docenteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefono.label', default: 'Telefono')])}</g:link>
</li>
</ul>

</div>

