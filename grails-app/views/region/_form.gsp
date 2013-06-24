<%@ page import="cl.ucen.colegios.Region" %>



<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="region.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${regionInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'comunas', 'error')} ">
	<label for="comunas">
		<g:message code="region.comunas.label" default="Comunas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${regionInstance?.comunas?}" var="c">
    <li><g:link controller="comuna" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comuna" action="create" params="['region.id': regionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comuna.label', default: 'Comuna')])}</g:link>
</li>
</ul>

</div>

