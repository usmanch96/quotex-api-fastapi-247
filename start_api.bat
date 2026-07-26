@echo off
title Quotex OTC 24/7 API Server
echo [*] Starting FastAPI API server...
python -m uvicorn app:app --host 127.0.0.1 --port 8000 --log-level warning
pause