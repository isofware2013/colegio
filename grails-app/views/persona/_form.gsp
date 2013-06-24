<%@ page import="cl.ucen.colegios.Persona" %>



<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="persona.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${personaInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellidoPaterno', 'error')} ">
	<label for="apellidoPaterno">
		<g:message code="persona.apellidoPaterno.label" default="Apellido Paterno" />
		
	</label>
	<g:textField name="apellidoPaterno" value="${personaInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'digito', 'error')} ">
	<label for="digito">
		<g:message code="persona.digito.label" default="Digito" />
		
	</label>
	<g:textField name="digito" value="${personaInstance?.digito}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'direcciones', 'error')} ">
	<label for="direcciones">
		<g:message code="persona.direcciones.label" default="Direcciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personaInstance?.direcciones?}" var="d">
    <li><g:link controller="direccion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="direccion" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'direccion.label', default: 'Direccion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'emails', 'error')} ">
	<label for="emails">
		<g:message code="persona.emails.label" default="Emails" />
		
	</label>
	<g:textField name="emails" value="${personaInstance?.emails}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="persona.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${personaInstance?.fechaNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="persona.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${personaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'rut', 'error')} required">
	<label for="rut">
		<g:message code="persona.rut.label" default="Rut" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rut" type="number" value="${personaInstance.rut}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="persona.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${cl.ucen.colegios.Sexo?.values()}" keys="${cl.ucen.colegios.Sexo.values()*.name()}" required="" value="${personaInstance?.sexo?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="persona.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personaInstance?.telefonos?}" var="t">
    <li><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefono" action="create" params="['persona.id': personaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefono.label', default: 'Telefono')])}</g:link>
</li>
</ul>

</div>

