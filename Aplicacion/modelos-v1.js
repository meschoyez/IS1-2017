/*modelo de libro*/
Libro = Backbone.Model.extend({
	defaults: {
		id :'',
		titulo: '',
		isbn: ''
	}
});
/*fin modelo de libro*/
/*modelo de persona*/
Persona = Backbone.Model.extend({
	defaults: {
		id :'',
		nombre: '',
		legajo: '',
		email: '',
		domicilio: '',
		telefono: '',
		fecha_alta: '',
		fecha_baja: ''
	}
});
/*fin modelo de persona*/
/*modelo de autor*/
Autor = Backbone.Model.extend({
	defaults: {
		id :'',
		nombre: ''
	}
});
/*fin modelo de autor*/
/* modelo de bibliotecario*/
Bibliotecario = Backbone.Model.extend({
	defaults: {
		id :'',
		horario_entrada: '',
		horario_salida: '',
	}
});
/*fin modelo de bibliotecario*/
/* modelo de ejemplar*/
Ejemplar = Backbone.Model.extend({
	defaults: {
		id :'',
		id_libro: '',
		fecha_baja: '',
		fecha_alta: '',
		id_estado:''
	}
});
/*fin  modelo de ejemplar*/
/* modelo de estado*/
Estado = Backbone.Model.extend({
	defaults: {
		id :'',
		descripcion: ''
	}
});
/*fin  modelo de estado*/
/*modelo de libro_autor*/
Libro_autor = Backbone.Model.extend({
	defaults: {
		id :'',
		idLibro:'',
		idAutor:''
	}
});
/*modelo de libro_autor*/
/*modelo de prestamo*/
Prestamo = Backbone.Model.extend({
	defaults: {
		id :'',
		id_ejemplar:'',
		id_bibliotecario:'',
	    id_socio:'',
        fecha_prestamo:'',		
		fecha_devolucion:''
	}
});
/*fin modelo de prestamo*/

Socios = Backbone.Model.extend({
	defaults: {
		id :'',
		fecha_suscripcion:''
	}
});