# PRÁCTICA 4 - Open WebUI + MCP Toolbox for Databases + Groq
# Se usan 3 ventanas de PowerShell abiertas al mismo tiempo.

# VENTANA 1 - Open WebUI (Paso 1)
#   mkdir openwebui ; cd openwebui ; python -m venv venv ; .\venv\Scripts\Activate.ps1
#   pip install psycopg2-binary
#   pip install open-webui
#   open-webui serve        # http://localhost:8080

# Paso 3 (en Open WebUI): Admin Settings -> Connections -> conexión tipo OpenAI
#   URL base: https://api.groq.com/openai/v1
#   API Key : la tuya (ver .env.example, NO la subas a ningún lado)

# VENTANA 2 - MCP Toolbox (Paso 4 y 6)
#   Descargar toolbox.exe (windows/amd64) de github.com/googleapis/mcp-toolbox/releases
#   y guardarlo junto a tools.yaml, por ejemplo en C:\asistente-bd
cd C:\asistente-bd
toolbox.exe --config tools.yaml

# VENTANA 3 - mcpo, el puente (Paso 7)
#   pip install mcpo
mcpo --port 8000 --api-key "clave-secreta" `
  --server-type "streamable-http" -- http://127.0.0.1:5000/mcp

# Paso 8 (en Open WebUI): Admin Settings -> External Tools
#   URL: http://localhost:8000/openapi.json   |   API Key: clave-secreta
# Paso 9: en un chat nuevo activar la herramienta y preguntar:
#   "¿Cuántos clientes están registrados?"
