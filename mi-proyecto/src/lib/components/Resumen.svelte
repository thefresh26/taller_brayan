<script>
	export let estudiantes = [];

	$: total = estudiantes.length;
	$: promedioGeneral =
		total === 0 ? 0 : estudiantes.reduce((suma, e) => suma + Number(e.promedio), 0) / total;
</script>

<p class="resumen">
	Total de estudiantes: <strong>{total}</strong> | Promedio general:
	<strong>{promedioGeneral.toFixed(2)}</strong>
</p>

<style>
	.resumen {
		color: #1e3a8a;
	}
</style>
