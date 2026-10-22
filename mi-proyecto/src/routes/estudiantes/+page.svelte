<script>
	import { onMount } from 'svelte';
	import Header from '$lib/components/Header.svelte';
	import Card from '$lib/components/Card.svelte';
	import FormularioEstudiante from '$lib/components/FormularioEstudiante.svelte';
	import Mensaje from '$lib/components/Mensaje.svelte';
	import Resumen from '$lib/components/Resumen.svelte';
	import BarraBusqueda from '$lib/components/BarraBusqueda.svelte';
	import Cargando from '$lib/components/Cargando.svelte';
	import SinDatos from '$lib/components/SinDatos.svelte';
	import TablaEstudiantes from '$lib/components/TablaEstudiantes.svelte';
	import {
		obtenerEstudiantes,
		obtenerEstudiantePorId,
		crearEstudiante,
		actualizarEstudiante,
		eliminarEstudiante
	} from '$lib/services/api_estudiante.js';

	let estudiantes = [];
	let nombre = '';
	let grado = '';
	let promedio = '';
	let mensaje = '';
	let cargando = false;
	let idEditando = null;
	let busqueda = '';

	$: estudiantesFiltrados = estudiantes.filter((e) =>
		e.nombre.toLowerCase().includes(busqueda.toLowerCase())
	);

	async function cargarEstudiantes() {
		cargando = true;
		try {
			estudiantes = await obtenerEstudiantes();
		} catch (error) {
			mensaje = 'No se pudo cargar la lista: ' + error.message;
		}
		cargando = false;
	}

	onMount(cargarEstudiantes);

	function limpiarFormulario() {
		nombre = '';
		grado = '';
		promedio = '';
		idEditando = null;
	}

	async function guardarEstudiante() {
		const datos = {
			nombre: nombre,
			grado: grado,
			promedio: Number(promedio)
		};

		try {
			if (idEditando === null) {
				await crearEstudiante(datos);
				mensaje = 'Estudiante registrado correctamente';
			} else {
				await actualizarEstudiante(idEditando, datos);
				mensaje = 'Estudiante actualizado correctamente';
			}
			limpiarFormulario();
			await cargarEstudiantes();
		} catch (error) {
			mensaje = 'No se pudo guardar: ' + error.message;
		}
	}

	async function prepararEdicion(id) {
		try {
			const estudiante = await obtenerEstudiantePorId(id);
			idEditando = estudiante.id;
			nombre = estudiante.nombre;
			grado = estudiante.grado;
			promedio = estudiante.promedio;
			mensaje = '';
		} catch (error) {
			mensaje = 'No se pudo cargar el estudiante: ' + error.message;
		}
	}

	async function borrarEstudiante(estudiante) {
		const seguro = confirm('¿Eliminar a ' + estudiante.nombre + '?');
		if (!seguro) {
			return;
		}
		try {
			const respuesta = await eliminarEstudiante(estudiante.id);
			mensaje = respuesta.mensaje;
			if (idEditando === estudiante.id) {
				limpiarFormulario();
			}
			await cargarEstudiantes();
		} catch (error) {
			mensaje = 'No se pudo eliminar: ' + error.message;
		}
	}
</script>

<Header titulo="Módulo de Estudiantes" subtitulo="Registrar, consultar, editar y eliminar" />

<Card>
	<h2>{idEditando === null ? 'Registrar estudiante' : 'Editar estudiante'}</h2>
	<FormularioEstudiante
		bind:nombre
		bind:grado
		bind:promedio
		editando={idEditando !== null}
		on:guardar={guardarEstudiante}
		on:cancelar={limpiarFormulario}
	/>
	<Mensaje texto={mensaje} />
</Card>

<Card>
	<h2>Lista de estudiantes</h2>
	<Resumen {estudiantes} />
	<BarraBusqueda bind:busqueda />
	{#if cargando}
		<Cargando />
	{:else if estudiantes.length === 0}
		<SinDatos texto="No hay estudiantes registrados." />
	{:else if estudiantesFiltrados.length === 0}
		<SinDatos texto="No hay estudiantes que coincidan con la búsqueda." />
	{:else}
		<TablaEstudiantes
			estudiantes={estudiantesFiltrados}
			on:editar={(e) => prepararEdicion(e.detail)}
			on:eliminar={(e) => borrarEstudiante(e.detail)}
		/>
	{/if}
</Card>

<style>
	h2 {
		margin-top: 0;
		color: #1e3a8a;
	}
</style>
