# actividad_brayan

Estructura de la actividad, siguiendo las guías del profesor:

```
actividad_brayan/
├── mi-proyecto/                      CRUD SvelteKit (guía "Módulo CRUD de Estudiantes con SvelteKit y FastAPI")
│   ├── src/lib/components/           Navbar, Header, Card, Footer
│   ├── src/lib/services/             api_estudiante.js, api_libro.js, api_prestamo.js
│   ├── src/routes/                   +layout, inicio, estudiantes/, libros/, prestamos/
│   └── vite.config.js                proxy /api -> http://localhost:8000
├── practica_1_docker/                Open WebUI con Docker (comando del profesor + compose equivalente)
├── practica_3_openwebui_postgres/    Herramienta Python Text-to-SQL + prompt del sistema + comandos
└── practica_4_groq_mcp_toolbox/      tools.yaml + comandos (Toolbox, mcpo) + .env.example
```

## Frontend (mi-proyecto)
```
cd mi-proyecto
npm install
npm run dev        # http://localhost:5173/estudiantes
```
Requiere la API FastAPI en http://localhost:8000 (reiniciar `npm run dev` si se cambia vite.config.js).

Incluye el "Reto final" de la guía: búsqueda por nombre, contador y promedio general
(estudiantes) y el módulo de libros (api_libro.js + routes/libros). Prestamos queda como
marcador "en construcción", igual que en la guía.

Pendiente de confirmar: la guía no define los campos de la API de libros; se asumieron
`titulo`, `autor` y `anio`. Ajustar en libros/+page.svelte según /docs de FastAPI.
