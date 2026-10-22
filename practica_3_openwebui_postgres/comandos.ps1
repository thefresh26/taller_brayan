# PRÁCTICA 3 - Open WebUI con Ollama y PostgreSQL (Python 3.11 o 3.12)
# 1) Ollama (https://ollama.com/) ya instalado
ollama --version
ollama pull qwen3:1.7b
ollama pull qwen2.5:1.5b-instruct
ollama list

# 2) Carpeta y entorno virtual
mkdir openwebui
cd openwebui
python -m venv venv
.\venv\Scripts\Activate.ps1

# 3) Instalar
pip install psycopg2-binary
pip install open-webui      # puede demorar

# 4) Correr el servidor (http://localhost:8080)
open-webui serve
