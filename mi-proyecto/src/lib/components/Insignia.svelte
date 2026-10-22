<script>
	// Muestra «Aprobado» si el promedio es mayor o igual a 3, y «Reprobado» si no
	export let promedio = 0;
</script>

<span class="insignia" class:aprobado={promedio >= 3} class:reprobado={promedio < 3}>
	{promedio >= 3 ? 'Aprobado' : 'Reprobado'}
</span>

<style>
	.insignia {
		padding: 3px 8px;
		border-radius: 10px;
		font-size: 0.85rem;
		color: white;
	}
	.aprobado {
		background-color: #16a34a;
	}
	.reprobado {
		background-color: #dc2626;
	}
</style>
