# ⚡ Quotex OTC 24/7 REST API System

> **Enterprise-grade, 24/7 self-healing REST API & WebSocket wrapper for Quotex (Real & OTC asset pairs).**  
> Designed to stream real-time price feeds, record 8-day M1 candle histories, and power automated binary options trading bots and signal generators.

![Telegram](https://img.shields.io/badge/Contact_Developer-Telegram-blue?style=for-the-badge&logo=telegram)  
![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)  
![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)  
![License](https://img.shields.io/badge/License-Commercial_Source_Code-emerald?style=for-the-badge)

---

## 🛒 Commercial License & Purchase Source Code

Looking for the full, production-ready source code with complete rights and 1-on-1 developer support?

### What’s Included in the Full Package:

- 📦 **100% Full Unlocked Source Code** (`app.py`, `worker.py`, `database.py`, `pyquotex/` engine).
- 🚀 **1-Click Automated Windows Launcher** (`start_api.bat`).
- ⚡ **Unlimited Personal & Commercial License** (Deploy on unlimited VPS/servers).
- 🛠️ **24/7 Developer Support & Setup Assistance**.
- 🔄 **Lifetime Code Updates & Bug Fixes**.

📩 **Contact on Telegram to Buy**: [@usmanch069](https://t.me/usmanch069)  
💳 **Accepted Payment Methods**: USDT (TRC20), Binance Pay, Crypto.

---

## 🚀 Key System Features

- 📈 **8-Day M1 Candle History**: Automatically maintains a rolling 8-day historical database of closed M1 candles for all active Real & OTC asset pairs.
- 🚫 **Anti-Repaint Guarantee**: Only finalized, closed candles are saved to the database. Running candles are ignored to eliminate signal repainting.
- 💰 **Historical Payout Rate Tracking**: Every M1 candle entry stores the exact real-time payout percentage recorded at that specific minute.
- 🕒 **Fully Configurable Timezone Support**: All API JSON outputs format timestamps as `YYYY-MM-DD HH:MM:SS` with fully customizable timezone offsets (e.g. UTC, UTC+6, EST, IST, GMT, etc.).
- 🔄 **Dynamic 24/7 Asset Discovery**: Automatically detects active markets (switching seamlessly between weekday forex and weekend OTC pairs) without requiring server restarts.
- 🛡️ **Bulletproof Self-Healing Architecture**:
  - Automatically reconnects during network drops or socket disconnections.
  - Automatically clears corrupted cookies and re-authenticates fresh.
  - Automatically detects offline downtime gaps and backfills missing candles in the background.
- 📊 **Real-Time ASCII Terminal UI**: Beautiful live console dashboard featuring colored status indicators, asset sync counters, and visual progress bars.
- 🌐 **Interactive Glassmorphic Web Portal**: Includes a modern dark-mode web portal at `http://127.0.0.1:8000/` for visual testing and API querying.

---

## 🏗️ Architecture & Project Structure

```
api/
├── pyquotex/          # High-performance Quotex WebSocket Protocol Engine
├── app.py             # FastAPI REST Server & Endpoint Routers
├── worker.py          # Background Stream Manager & Downtime Gap-Filler
├── database.py        # SQLite Persistence Controller & 8-Day Retention Daemon
├── start_api.bat      # 1-Click Windows Production Launcher
├── requirements.txt   # Python Dependencies
├── .env.example       # Environment Configuration Template
└── README.md          # System Documentation
```

---

## ⚙️ Quick Start Guide

### 1. Prerequisites

- **Python 3.10+** (Ensure `Add Python to PATH` is enabled).
- **Google Chrome Browser** installed on your system.

### 2. Configuration

Copy `.env.example` to `.env` and configure your Quotex login details:

```ini
email=your_quotex_email@gmail.com
password=your_quotex_password
```

### 3. Launching the API

Double-click `**start_api.bat**` (or run `python -m uvicorn app:app --port 8000`).

---

## 🌐 API Endpoint Documentation & Examples

### 1. Web Portal Dashboard

- **Full Request URL**: `http://127.0.0.1:8000/`
- **Description**: Open in any web browser for interactive API querying and database candle statistics.

---

### 2. Get Live Payouts & Market Status

Returns all open/closed OTC and Real assets along with live payout rates.

- **Endpoint**: `/api/v1/markets`
- **Full Example Request**: `GET http://127.0.0.1:8000/api/v1/markets`
- **Response Format**:

```json
{
  "timezone": "UTC+6",
  "total_assets": 2,
  "data": [
    {
      "symbol": "EURUSD_otc",
      "display_name": "EUR/USD",
      "payout_percent": 92,
      "is_active": true
    },
    {
      "symbol": "GBPUSD_otc",
      "display_name": "GBP/USD",
      "payout_percent": 90,
      "is_active": true
    }
  ]
}
```

---

### 3. Get M1 Candles History

Retrieves historical M1 candle records for a symbol in chronological order (oldest first).

- **Endpoint**: `/api/v1/candles`
- **Full Example Request**: `GET http://127.0.0.1:8000/api/v1/candles?symbol=EURUSD_otc&limit=1000`
- **Query Parameters**:
  - `symbol` (string, required): Asset pair name (e.g. `EURUSD_otc`, `BTCUSD_otc`).
  - `limit` (integer, optional): Maximum candles to retrieve (default: `1000`, max: `11520`).
- **Response Format**:

```json
{
  "symbol": "EURUSD_otc",
  "timeframe": "1m",
  "timezone": "UTC+6",
  "candle_count": 2,
  "candles": [
    {
      "time": "2026-07-26 19:40:20",
      "open": 1.09245,
      "high": 1.0926,
      "low": 1.0924,
      "close": 1.09255,
      "volume": 42,
      "payout": 92
    },
    {
      "time": "2026-07-26 19:41:20",
      "open": 1.09255,
      "high": 1.0928,
      "low": 1.0925,
      "close": 1.09275,
      "volume": 58,
      "payout": 92
    }
  ]
}
```

---

## 🛠️ Maintenance & Database Purging Tool

Includes an interactive CLI tool (`delete_asset.py`) allowing you to selectively delete candle history for specific asset pairs or clear the entire database.

```bash
python delete_asset.py
```

### Interactive Console Features:
- Lists all asset pairs currently stored in `qxbroker.db` with exact candle counts.
- Enter a pair number (e.g. `1`, `2`) or symbol name (`EURUSD_otc`) to purge candles for a single asset.
- Type `ALL` to purge the complete database.
- Confirms before executing deletions to prevent accidental data loss.

---

## 🔍 GitHub SEO & Search Keywords

`quotex api` · `quotex otc api` · `quotex python wrapper` · `quotex websocket bot` · `binary options api` · `quotex signal bot` · `fastapi quotex` · `quotex payouts api` · `quotex history candles` · `quotex auto trading`

---

## 📬 Contact & Support

For sales inquiries, custom feature additions, or integration help, message directly on Telegram:  
👉 **[@usmanch069](https://t.me/usmanch069)**

---

## ⚠️ Disclaimer

This software is provided for educational and personal use only. Trading financial instruments carries significant risk of loss. The authors are not responsible for any financial losses incurred through the use of this software. Always test on a demo account before using with live funds.
