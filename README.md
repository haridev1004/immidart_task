# 🧩 Immidart Task

A Flutter application developed as part of a technical assignment, demonstrating clean architecture, API integration, and caching strategies.

---

## 🚀 Overview

This project showcases integration with a **Mock API** using **Dio** for network requests and **Hive** for offline caching and data persistence.  
The application structure is thoughtfully designed and implemented by **Hariharan Ravichandran**, following Flutter best practices for scalability, readability, and maintainability.

---

## 🧱 Key Features

- 🔗 **Dio Integration:** Handles REST API calls with error management and interceptors  
- 💾 **Hive Caching:** Provides lightweight and efficient local data storage  
- ⚙️ **Clean Architecture:** Separation of concerns using a modular structure  
- 🧮 **Repository Pattern:** Centralized data handling between API and local storage  
- 📱 **Responsive UI:** Adaptive layouts for multiple screen sizes  
- 🧑‍💻 **Mock API Support:** Simulates real-world data interaction and error states  

---

## 📂 Project Structure

lib/
│
├── data/
│ ├── models/ # Data models and JSON parsing
│ ├── repository/ # Repository handling data flow between API and cache
│ └── services/ # Dio service for API communication
│
├── logic/
│ └── cubit_or_bloc/ # Business logic and state management
│
├── ui/
│ ├── screens/ # UI screens and layouts
│ ├── widgets/ # Reusable custom widgets
│ └── themes/ # App styling and theme configuration
│
└── main.dart # Application entry point



---

## 🛠️ Tech Stack

- **Framework:** Flutter  
- **Language:** Dart  
- **Networking:** Dio  
- **Local Storage:** Hive  
- **Architecture:** MVVM / Repository Pattern  
- **State Management:** Cubit / BLoC  

---

## 🧑‍💻 Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/haridev1004/immidart_task.git


2. Install dependencies
flutter pub get

3. Run the project
flutter run

📸 Screenshots

(Add screenshots or a demo GIF here if available)

👨‍💻 Developed By

Hariharan Ravichandran
Flutter Developer | Mobile Application Engineer
📧 Email me

🌐 GitHub