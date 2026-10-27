# 🎓 EduFlex - Modern Student Management System

A complete, production-ready, full-stack **Student Management System** developed as a **FLEXI Web Development Project**. 

Built with **React.js** on the frontend, **Node.js with Express.js** on the backend, and **MongoDB** as the dedicated database accessed and inspected via **MongoDB Compass**.

---

## 🌟 Key Features

- **📊 Comprehensive Academic Dashboard:** Real-time analytics, total enrollments, active students, graduated alumni count, average GPA, course distribution progress bars, and recent registrations.
- **⚡ Full CRUD Operations:** Add new students, view rich student profiles, edit details, and safely delete records with confirmation safeguards.
- **🔍 Instant Search & Multi-Criteria Filtering:** Live search by Student Name, Roll Number, or Email, plus filters by Course, Status (Active, Inactive, Graduated, Suspended), and Semester (1–8).
- **🎓 Student Self-Service Portal:** Direct lookup by Roll Number (e.g., `CS2026-001`, `AI2026-015`) to inspect digital ID verification, GPA, semester status, and enrolled courses.
- **🔐 Authentication & Role Management:** Secure JWT-based authentication for Administrators and Students with bcrypt password hashing and 1-click Demo credentials fillers.
- **📁 CSV Data Export:** One-click download of student records in CSV format.
- **🧭 In-App MongoDB Compass Guide:** Dedicated view with live connection strings, instructions, and sample Mongoose/Compass filter queries.

---

## 🛠️ Technology Stack

| Layer | Technologies Used |
| :--- | :--- |
| **Frontend** | React 18, Vite, Lucide Icons, Plus Jakarta Sans, Responsive Modern CSS |
| **Backend** | Node.js, Express.js, Mongoose ODM, JWT (jsonwebtoken), bcryptjs, Morgan, CORS |
| **Database** | **MongoDB** (accessed and managed **ONLY** through MongoDB Compass) |
| **Tooling** | REST APIs, Embedded standalone MongoDB fallback engine on port 27017 |

---

## 📂 Project Architecture

```
FLEXI/
├── client/                        # React.js Frontend (Vite)
│   ├── src/
│   │   ├── api/studentApi.js      # REST API client
│   │   ├── context/AuthContext.jsx # Auth state & user session
│   │   ├── components/            # Modals, Navbar, Sidebar, StatsCards, Toasts
│   │   ├── pages/                 # Dashboard, Directory, Portal, Compass Guide, Login, Register
│   │   ├── App.jsx                # Root React component & view router
│   │   ├── index.css              # Modern responsive styling
│   │   └── main.jsx               # React DOM bootstrap
│   ├── vite.config.js             # Vite configuration with /api proxy
│   ├── package.json
│   └── index.html
├── server/                        # Node.js + Express Backend REST API
│   ├── config/db.js               # MongoDB connection (Compass & Atlas support)
│   ├── controllers/               # Auth & Student business logic
│   ├── middleware/                # JWT auth & error middleware
│   ├── models/
│   │   ├── Student.js             # MongoDB Student schema
│   │   └── User.js                # MongoDB User schema
│   ├── routes/                    # API routes (/api/students, /api/auth)
│   ├── seed/seedData.js           # Sample records seeder
│   ├── .env                       # MongoDB connection string & configs
│   ├── package.json
│   └── server.js                  # Express entry point
├── start-all.bat                  # Single-click launcher for Windows
├── start-server.bat               # Direct server starter
├── start-client.bat               # Direct client starter
├── seed-database.bat              # Database seeder
└── README.md
```

---

## 🚀 How to Run the Application

### Option 1: One-Click Launcher (Windows)
Double-click **`start-all.bat`** in the project folder. It will launch both the Node.js backend on `http://localhost:5000` and the React frontend on `http://localhost:5173`.

---

### Option 2: Terminal Commands

Before starting the backend, copy `.env.example` to `.env` in the project root (or `server/.env.example` to `server/.env` when launching from the `server` directory), then set `JWT_SECRET` to a unique, long random value. The backend will not start with the example placeholder.

#### 1. Start the Backend Server
Open a terminal in the `FLEXI` directory:
```powershell
copy .env.example .env
npm run server
```
*The backend connects to MongoDB, auto-seeds default demo data if empty, and listens on `http://localhost:5000`.*

#### 2. Start the React Frontend
Open a second terminal in the `FLEXI` directory:
```powershell
cd frontend
npm run dev
```
*Open your browser and navigate to **`http://localhost:5173`**.*

---

## 🍃 Connecting & Verifying in MongoDB Compass

### Step 1: Open MongoDB Compass
Launch **MongoDB Compass** on your computer.

### Step 2: Paste Connection String
In the **New Connection** field, paste:
```
mongodb://127.0.0.1:27017/student_management_db
```
Click the green **Connect** button.

### Step 3: View Database & Collections
In the left sidebar of MongoDB Compass, you will see:
- **`student_management_db`**
  - **`students`**: Contains all enrolled student documents (Name, Roll Number, Course, Email, Phone, GPA, Semester, Status, etc.).
  - **`users`**: Contains authenticated user accounts with bcrypt-hashed passwords.

### Step 4: Verify Live Operations
1. Open the **`students`** collection in Compass.
2. In the React web app at `http://localhost:5173`, click **"Add New Student"** and submit a new student record.
3. Click the **Refresh (⟳)** button in MongoDB Compass.
4. The newly created document appears immediately with its generated `_id`, timestamps, and indexed fields!
5. Try editing or deleting a student in the web app — refresh Compass to verify that the database document updates or is removed in real time.

### Sample Compass Queries:
You can test queries directly in the Compass Filter bar:
```json
{ "status": "Active" }
{ "course": "Computer Science & Engineering" }
{ "gpa": { "$gte": 8.5 } }
```

---

## 🔑 Demo Login Credentials

The system comes pre-seeded with sample user accounts for quick testing:

| Role | Email | Password |
| :--- | :--- | :--- |
| **Administrator** | `admin@flexi.edu` | `password123` |
| **Student** | `student@flexi.edu` | `password123` |

*(You can also click the quick **"Admin Demo"** or **"Student Demo"** autofill buttons on the login page!)*

---

## 📡 REST API Reference

All requests and responses use JSON. The base URL is `http://localhost:5000/api`.

### Student Endpoints:
- `GET /api/students` — Retrieve students (supports `?search=`, `?course=`, `?status=`, `?semester=`, `?page=`, `?limit=`, `?sortBy=`, `?order=`)
- `GET /api/students/:id` — Retrieve a single student by MongoDB ID
- `GET /api/students/roll/:rollNumber` — Retrieve a single student by Roll Number
- `POST /api/students` — Create a new student record
- `PUT /api/students/:id` — Update an existing student record
- `DELETE /api/students/:id` — Delete a student record
- `GET /api/students/stats/overview` — Retrieve analytics and metrics for the dashboard

### Auth Endpoints:
- `POST /api/auth/register` — Register a new user account
- `POST /api/auth/login` — Sign in and receive JWT token
- `GET /api/auth/me` — Retrieve current authenticated user profile
