// Dirección base de la API de estudiantes
const URL_BASE = '/api/estudiantes/';
// Función auxiliar: revisa la respuesta y la convierte a objeto JavaScript
async function procesarRespuesta(respuesta) {
	if (!respuesta.ok) {
		throw new Error('Error ' + respuesta.status + ': ' + respuesta.statusText);
	}
	return await respuesta.json();
}
// GET /api/estudiantes/ -> lista de todos los estudiantes
export async function obtenerEstudiantes() {
	const respuesta = await fetch(URL_BASE);
	return await procesarRespuesta(respuesta);
}
// GET /api/estudiantes/{id} -> un estudiante
export async function obtenerEstudiantePorId(id) {
	const respuesta = await fetch(URL_BASE + id);
	return await procesarRespuesta(respuesta);
}
// POST /api/estudiantes/ -> crea un estudiante
export async function crearEstudiante(estudiante) {
	const respuesta = await fetch(URL_BASE, {
		method: 'POST',
		headers: { 'Content-Type': 'application/json' },
		body: JSON.stringify(estudiante)
	});
	return await procesarRespuesta(respuesta);
}
// PUT /api/estudiantes/{id} -> actualiza un estudiante
export async function actualizarEstudiante(id, estudiante) {
	const respuesta = await fetch(URL_BASE + id, {
		method: 'PUT',
		headers: { 'Content-Type': 'application/json' },
		body: JSON.stringify(estudiante)
	});
	return await procesarRespuesta(respuesta);
}
// DELETE /api/estudiantes/{id} -> elimina un estudiante
export async function eliminarEstudiante(id) {
	const respuesta = await fetch(URL_BASE + id, {
		method: 'DELETE'
	});
	return await procesarRespuesta(respuesta);
}
