<%@ page import="cl.ucen.colegios.Rol" %>



<div class="fieldcontain ${hasErrors(bean: rolInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="rol.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${rolInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: rolInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="rol.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${rolInstance?.nombre}"/>
</div>

