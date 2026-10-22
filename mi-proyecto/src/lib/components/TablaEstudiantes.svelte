<script>
	import { createEventDispatcher } from 'svelte';
	import Boton from '$lib/components/Boton.svelte';
	import Insignia from '$lib/components/Insignia.svelte';

	export let estudiantes = [];

	const dispatch = createEventDispatcher();
</script>

<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>Nombre</th>
			<th>Grado</th>
			<th>Promedio</th>
			<th>Estado</th>
			<th>Acciones</th>
		</tr>
	</thead>
	<tbody>
		{#each estudiantes as estudiante (estudiante.id)}
			<tr>
				<td>{estudiante.id}</td>
				<td>{estudiante.nombre}</td>
				<td>{estudiante.grado}</td>
				<td>{estudiante.promedio}</td>
				<td><Insignia promedio={Number(estudiante.promedio)} /></td>
				<td>
					<div class="acciones">
						<Boton variante="editar" on:click={() => dispatch('editar', estudiante.id)}>Editar</Boton>
						<Boton variante="borrar" on:click={() => dispatch('eliminar', estudiante)}>Eliminar</Boton>
					</div>
				</td>
			</tr>
		{/each}
	</tbody>
</table>

<style>
	table {
		width: 100%;
		border-collapse: collapse;
	}
	th,
	td {
		padding: 10px;
		text-align: left;
		border-bottom: 1px solid #e5e7eb;
	}
	th {
		background-color: #f3f4f6;
	}
	tr:hover td {
		background-color: #f9fafb;
	}
	.acciones {
		display: flex;
		gap: 8px;
	}
</style>
