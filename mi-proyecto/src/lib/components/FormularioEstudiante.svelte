<script>
	import { createEventDispatcher } from 'svelte';
	import CampoFormulario from '$lib/components/CampoFormulario.svelte';
	import Boton from '$lib/components/Boton.svelte';

	export let nombre = '';
	export let grado = '';
	export let promedio = '';
	export let editando = false;

	const dispatch = createEventDispatcher();

	function enviar(evento) {
		evento.preventDefault();
		dispatch('guardar');
	}
</script>

<form on:submit={enviar}>
	<CampoFormulario id="nombre" etiqueta="Nombre" placeholder="Juan Pérez" bind:value={nombre} />
	<CampoFormulario id="grado" etiqueta="Grado" placeholder="10A" bind:value={grado} />
	<CampoFormulario
		id="promedio"
		etiqueta="Promedio"
		tipo="number"
		step="0.1"
		min="0"
		max="5"
		placeholder="4.5"
		bind:value={promedio}
	/>
	<div class="botones">
		<Boton tipo="submit" variante="primario">
			{editando ? 'Guardar cambios' : 'Registrar'}
		</Boton>
		{#if editando}
			<Boton variante="gris" on:click={() => dispatch('cancelar')}>Cancelar</Boton>
		{/if}
	</div>
</form>

<style>
	.botones {
		display: flex;
		gap: 10px;
	}
</style>
