<script>
	// variante: primario | gris | editar | borrar
	export let variante = 'primario';
	export let tipo = 'button';
</script>

<button type={tipo} class="btn btn-{variante}" on:click>
	<slot />
</button>

<style>
	.btn {
		padding: 10px 16px;
		border: none;
		border-radius: 6px;
		color: white;
		font-size: 0.95rem;
		cursor: pointer;
	}
	.btn-primario {
		background-color: #1e3a8a;
	}
	.btn-primario:hover {
		background-color: #1d4ed8;
	}
	.btn-gris {
		background-color: #6b7280;
	}
	.btn-gris:hover {
		background-color: #4b5563;
	}
	.btn-editar {
		background-color: #f59e0b;
	}
	.btn-editar:hover {
		background-color: #d97706;
	}
	.btn-borrar {
		background-color: #dc2626;
	}
	.btn-borrar:hover {
		background-color: #b91c1c;
	}
</style>
