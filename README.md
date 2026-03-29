# ☕ Aura Brew: The Ultimate Coffee Experience

> "Freshly Brewed Elegance in every cup."

Aura Brew is a premium, full-stack coffee shop application designed with a focus on high-end aesthetics and seamless functionality. This project bridges a stunning **Flutter** mobile frontend with a robust **Django REST API** backend.

---

## 🌟 Key Features

### 💻 Mobile Client (Flutter)
- **🎨 Premium UI/UX:** A modern, minimalist aesthetic with smooth transitions.
- **🛠️ Custom Brewing:** Customize your drinks with specific milk options, toppings, and sizes.
- **🛒 Smart Cart:** Effortlessly manage your selection and proceed to checkout.
- **📜 Order History:** Access detailed logs of your past orders.
- **👤 Profile Management:** Personalized user profiles and secure authentication.

### ⚙️ Backend Engine (Django)
- **⚡ High Performance:** RESTful API designed for speed and reliability.
- **🛡️ Secure Auth:** Token-based authentication for mobile security.
- **📊 Admin Control:** A sophisticated dashboard powered by `django-jazzmin`.
- **☁️ Cloud Ready:** Optimized for deployment on Render and Neon.tech (PostgreSQL).
- **📦 Static Hosting:** Integrated WhiteNoise for zero-cost static file serving.

---

## 📂 Project Structure

```bash
.
├── api_server/       # Django REST API backend
├── mobile_app/       # Flutter mobile application
└── README.md         # Project overview and guide
```

---

## 🛠️ Technology Stack

| Layer | Technology |
| :--- | :--- |
| **Frontend** | Flutter, Google Fonts, Provider, HTTP |
| **Backend** | Python 3.x, Django REST Framework |
| **Database** | PostgreSQL (Neon.tech), SQLite (Development) |
| **Infrastructure** | Render, WhiteNoise, Gunicorn |

---

## 🚀 Quick Setup Guide

### 1️⃣ API Server Setup
```bash
# Navigate to backend
cd api_server

# Setup environment
python -m venv venv
.\venv\Scripts\activate

# Install & Run
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

### 2️⃣ Mobile App Setup
```bash
# Navigate to app
cd mobile_app

# Install & Run
flutter pub get
flutter run
```

---

## 🌎 Live Deployment Summary

### 🔌 API Hosting (Render)
- **URL:** Managed via Render web services.
- **Database:** Serverless PostgreSQL via Neon.tech.

### 📱 Distribution
- **Build APK:** `flutter build apk --release`

---

> [!TIP]
> Check out the `mobile_app/assets/images/app_icon.png` for the premium branding we've implemented!

---
*Developed with Passion for Coffee and Code*
