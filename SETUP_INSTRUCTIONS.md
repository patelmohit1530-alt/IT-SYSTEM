# 🏥 Stavya Spine Hospital — IT Department Management System
## Local Offline Deployment & System Transfer Guide

This document contains complete, step-by-step instructions to transfer, set up, and run the **Stavya Spine Hospital IT Department System** on any local Windows, Mac, or Linux computer (100% offline private execution).

---

## 📋 Prerequisites

Before setting up on a new computer:
1. Download & Install **Node.js (LTS version)**:
   - Official Download: [https://nodejs.org/](https://nodejs.org/)
   - Verify installation in terminal / command prompt:
     ```cmd
     node -v
     npm -v
     ```

---

## 🚀 How to Transfer & Run on Another Computer

### Step 1: Copy Project Folder
1. Copy the entire `stavya-it-system` folder onto a USB drive or local network drive.
2. Paste the folder onto the target server or computer (e.g. `C:\Stavya_IT_System`).

### Step 2: Open Command Prompt / Terminal
1. Open Command Prompt (`cmd`) or PowerShell on the target system.
2. Navigate to the project folder:
   ```cmd
   cd C:\Stavya_IT_System
   ```

### Step 3: Start Local Server (Automated 1-Click Launchers)

You can launch the system using any of the following 1-click scripts:

- **Windows Users**: Simply double-click **`run.bat`** (or **`start.cmd`**).
  - Automatically checks Node.js
  - Automatically installs dependencies if missing (`npm install`)
  - Automatically opens the web browser to `http://localhost:4000/`
  - Starts the local server with LAN network sharing

- **Linux / Mac Users**: Run **`./run.sh`** in terminal.

#### Manual Command Line Alternative:
```cmd
npm install
npm run dev -- --host
```

---

## 🌐 Accessing the Application

### On the Local Host Computer:
Open any web browser (Chrome / Edge / Firefox / Safari) and go to:
- **`http://localhost:4000/`**

### Accessing from Other PCs on Hospital Local Network (LAN):
1. Find the Server IP address by running `ipconfig` in Command Prompt on the main PC (e.g. `192.168.1.100`).
2. On any other hospital computer connected to the same Wi-Fi / LAN ethernet network, open browser and navigate to:
   - **`http://192.168.1.100:4000/`**

---

## 🔑 Default Login Credentials

| Role | Username | Password | Access Rights |
| :--- | :--- | :--- | :--- |
| **Superadmin (Director)** | `STA-DR-15` | `123456` | Full Control, User Creation, Department CRUD, Data Reset, AI Reports |
| **Superadmin (IT Admin)** | `admin` | `Admin@123` | Full System Management & Settings |
| **IT Executive** | `executive` | `Exec@123` | Assigned Complaints, Inventory, Item Movements |
| **Department User** | `reception` | `Recep@123` | Raise Ticket, View Assigned Assets |

---

## 💾 Offline Backup & Server Migration Features

### 1. Auto-Backup Engine
- Background auto-backup runs automatically.
- Accessible via the **Offline Auto-Backup** button in the header.
- Custom manual backup directory path (e.g. `D:\Stavya_IT_Backups`).

### 2. Clearing Test Data for Production Use
- Go to **Superadmin Control Center** (`/users`).
- Click the **`⚠️ System Migration & Clear Data`** tab.
- Click **Clear All System Data**, type `STAVYA-RESET` in the confirmation modal, and click **Wipe Data**.
- An automatic JSON backup file will be generated before clearing test records.

---

## 📦 Production Build (Optional)

If you wish to serve the optimized production static build:
```cmd
npm run build
npm run preview -- --host
```
Static files will be compiled into the `dist/` directory.

---

## 🖥️ Running as a Local Desktop Application

The system is packaged as an offline, single-machine or multi-device local Windows application:

1. **Desktop Shortcut**:
   - Run `Create_Desktop_Shortcut.bat` once.
   - It places a **Stavya IT System** icon on your Windows Desktop.
   - Double-clicking opens the local system immediately at `http://localhost:4000/`.
2. **Background Tray App (`Stavya_IT_System.exe`)**:
   - Double-click `Stavya_IT_System.exe` or `Start_Stavya_App.bat`.
   - Starts the Express API backend on port `3001` and the web server on port `4000`.
   - Adds a system tray icon in the Windows taskbar with quick options to:
     - Open the local PC application.
     - View or copy the mobile/LAN URL for tablets and phones on hospital Wi-Fi.
     - Restart servers or exit cleanly.

---

## 🎫 Task & Ticket Generation Wizard (2-Step Problem Type Selection)

When creating a new task or incident ticket in **Task Management** (`/tasks`):
1. **Step 1: Problem Type Selection**:
   - First, the user selects the type of problem:
     1. **PRINTER** 🖨️ (Generates ticket with prefix `PRN`, e.g., `PRN-2026-001`)
     2. **SOFTWARE** 💻 (Generates ticket with prefix `SFT`, e.g., `SFT-2026-001`)
     3. **HARDWARE** 🖥️ (Generates ticket with prefix `HDW`, e.g., `HDW-2026-001`)
     4. **NETWORK** 🌐 (Generates ticket with prefix `NET`, e.g., `NET-2026-001`)
     5. **SERVER** 🗄️ (Generates ticket with prefix `SRV`, e.g., `SRV-2026-001`)
2. **Category Customization (+ Add / Delete)**:
   - Click **`⚙️ Manage Categories (+ Add / Delete)`** in Step 1.
   - **Add Custom Category**: Enter Category Name, Prefix (e.g., `BIO` for Biomedical), Emoji, Color, and Associated System.
   - **Delete Category**: Click the trash icon to remove any category.
   - **Reset Defaults**: Restores the 5 core categories at any time.
   - Saved automatically in your browser's persistent storage.
3. **Step 2: Task Details & RCA Investigation**:
   - Equipment options are automatically filtered to the selected category.
   - You can click **`[↩️ Change Problem Type]`** or **`[← Back to Problem Types]`** at any time to switch categories.
   - Assign owners, set priority, log downtime, complete 5-Whys, and assign CAPA action items.

---

## 💾 Local Data Backup & Storage

1. **Single Source of Truth (`server/db.json`)**:
   - All assets, printers, tickets, tasks, users, and audit logs are stored in `server/db.json`.
   - The file is completely outside the UI source code (`src/` and `dist/`), meaning code changes never erase your data.
2. **Instant Manual Backup (`Backup_Local_Data.bat`)**:
   - Double-click **`Backup_Local_Data.bat`** at any time.
   - Automatically saves a timestamped JSON file in `backup data/` and copies it to `D:\software backup\` (if drive D exists).
   - Displays live record counts for equipment, tasks, tickets, and users.
3. **Automated Background Backup**:
   - The backend automatically takes a full snapshot every 15 minutes into `backup data/`.

---

## 🔄 Making Changes & Updates Through Antigravity (100% Safe)

**YES! You can freely update and modify the software through Antigravity at any time without losing your data.**

### How It Works:
1. **Database Isolation**:
   - Antigravity edits files in `src/` (React components, styles, pages).
   - Your real database (`server/db.json`) is stored separately in the backend.
2. **Applying Updates**:
   - Whenever Antigravity completes code changes, Antigravity runs:
     ```cmd
     npm run build
     ```
   - This creates an updated bundle in `dist/`.
   - The running backend server on port `4000` immediately serves the new changes.
   - You can also double-click **`Update_App_With_Antigravity.bat`** anytime to recompile the frontend in 1 click.
3. **Viewing Updates**:
   - Simply press **F5** or **Ctrl + F5** in your browser at `http://localhost:4000/`.
   - All your existing tasks, inventory, printers, and settings remain completely intact!

