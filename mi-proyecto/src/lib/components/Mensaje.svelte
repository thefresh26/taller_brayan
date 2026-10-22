<script>
	export let texto = '';
</script>

{#if texto}
	<p class="mensaje">{texto}</p>
{/if}

<style>
	.mensaje {
		margin-top: 14px;
		padding: 10px;
		background-color: #dbeafe;
		border-radius: 6px;
		color: #1e3a8a;
	}
</style>
