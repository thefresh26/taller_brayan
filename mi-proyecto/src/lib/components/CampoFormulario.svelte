<script>
	export let id;
	export let etiqueta = '';
	export let tipo = 'text';
	export let placeholder = '';
	export let value = '';
	export let min = undefined;
	export let max = undefined;
	export let step = undefined;
</script>

<div class="campo">
	<label for={id}>{etiqueta}</label>
	{#if tipo === 'number'}
		<input {id} type="number" {min} {max} {step} {placeholder} bind:value required />
	{:else}
		<input {id} type="text" {placeholder} bind:value required />
	{/if}
</div>

<style>
	.campo {
		display: flex;
		flex-direction: column;
		margin-bottom: 14px;
	}
	label {
		font-weight: bold;
		margin-bottom: 6px;
	}
	input {
		padding: 10px;
		border: 1px solid #cbd5e1;
		border-radius: 6px;
		font-size: 1rem;
	}
	input:focus {
		outline: none;
		border-color: #1e3a8a;
	}
</style>
