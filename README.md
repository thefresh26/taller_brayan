# actividad_brayan

Estructura de la actividad, siguiendo las guías del profesor:

```
actividad_brayan/
├── api2026/                          API FastAPI + PostgreSQL (Neon), arquitectura modular (Práctica 3 de la API)
│   ├── main.py
│   ├── .env.example                  copiar a .env con las credenciales de Neon (el .env no se sube)
│   └── app/  api/ core/ models/ repositories/   (cada carpeta con __init__.py)
├── mi-proyecto/                      CRUD SvelteKit, creado con `npx sv@0.9.0 create`
│   ├── src/lib/components/           Navbar, Footer, Header, Card
│   ├── src/lib/services/             api_estudiante.js, api_libro.js, api_prestamo.js
│   ├── src/routes/                   +layout, +page (importa inicio/), inicio/, estudiantes/, libros/, prestamos/, ejemplos/
│   └── vite.config.js                proxy /api -> http://localhost:8000 (reescribe /api porque la API publica /estudiantes/)
├── practica_1_docker/                Open WebUI con Docker
├── practica_3_openwebui_postgres/    Herramienta Text-to-SQL + prompt + comandos
└── practica_4_groq_mcp_toolbox/      tools.yaml + comandos (Toolbox, mcpo) + .env.example
```

## API (api2026)
```
python -m venv myvenv
myvenv\Scripts\activate
pip install fastapi uvicorn pydantic psycopg2-binary python-dotenv
uvicorn main:app --reload        # http://127.0.0.1:8000/docs
```

## Frontend (mi-proyecto)
```
npm install
npm run dev        # http://localhost:5173/estudiantes
```
Con la API corriendo en el puerto 8000. Reiniciar `npm run dev` si se cambia vite.config.js.
Los ejemplos de clase (SVELT JS 3) están en /ejemplos/formulario, /ejemplos/suma y /ejemplos/tareas.

Nota: el campo `grado` es numérico porque así lo define la API (`grado: int`).
Los campos del módulo de libros (`titulo`, `autor`, `anio`) son un supuesto: la API entregada no tiene endpoint de libros.
