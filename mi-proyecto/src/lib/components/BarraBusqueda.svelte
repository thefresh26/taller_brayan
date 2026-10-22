<script>
	export let busqueda = '';
</script>

<div class="campo">
	<label for="busqueda">Buscar por nombre</label>
	<input id="busqueda" type="text" placeholder="Escribe un nombre..." bind:value={busqueda} />
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
