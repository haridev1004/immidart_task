## ✨ Immidart Task

A robust Flutter application developed as a technical assignment, demonstrating **clean architecture**, **API integration**, and effective **caching strategies**.

-----

## 🚀 Overview

This project showcases seamless integration with a **Mock API** using the **Dio** package for efficient network requests and **Hive** for reliable offline **caching** and **data persistence**. The application structure, meticulously designed by **Hariharan Ravichandran**, adheres to modern Flutter best practices, ensuring **scalability**, **readability**, and **maintainability**.

-----

## 🧱 Key Features

  * 🔗 **Dio Integration:** Robust handling of **REST API calls**, complete with **error management** and **interceptors**.
  * 💾 **Hive Caching:** Provides **lightweight** and **highly efficient** local data storage for offline access.
  * ⚙️ **Clean Architecture:** Strict **separation of concerns** implemented through a **modular structure** (Data, Logic, UI).
  * 🧮 **Repository Pattern:** Centralized and streamlined **data handling**, mediating between the API and local cache.
  * 📱 **Responsive UI:** Adaptive and engaging layouts designed to function flawlessly across **multiple screen sizes**.
  * 🧑‍💻 **Mock API Support:** Capability to simulate **real-world data interactions** and various **error states** for comprehensive testing.

-----

## 📂 Project Structure

A clear and modular project layout facilitates easy navigation and maintenance:

```
lib/
│
├── data/
│ ├── models/       # Data models, business entities, and JSON serialization/parsing
│ ├── repository/   # Implementation of the Repository pattern, managing data flow (API/Cache)
│ └── services/     # Dio service setup, handling network communication and interceptors
│
├── logic/
│ └── cubit_or_bloc/ # Core business logic and state management using Cubit/BLoC
│
├── ui/
│ ├── screens/      # Primary UI screens and complex layouts
│ ├── widgets/      # Collection of reusable, custom UI components
│ └── themes/       # App styling, color schemes, and theme configurations
│
└── main.dart       # Application entry point and initial setup
```

-----

## 🛠️ Tech Stack

| Category | Technology | Purpose |
| :--- | :--- | :--- |
| **Framework** | **Flutter** | Cross-platform UI development. |
| **Language** | **Dart** | Core programming language. |
| **Networking** | **Dio** | Robust HTTP client for API communication. |
| **Local Storage** | **Hive** | Fast and lightweight NoSQL database for caching. |
| **Architecture** | **Clean Architecture / Repository Pattern** | Enforcing separation of concerns and maintainability. |
| **State Management** | **Cubit / BLoC** | Handling complex business logic and UI state changes. |

-----

## 🧑‍💻 Getting Started

Follow these simple steps to set up and run the project locally.

### 1\. Clone the Repository

```bash
git clone https://github.com/haridev1004/immidart_task.git
cd immidart_task
```

### 2\. Install Dependencies

Fetch all required packages listed in the `pubspec.yaml` file:

```bash
flutter pub get
```

### 3\. Run the Project

Execute the application on your connected device or emulator:

```bash
flutter run
```

-----

## 📸 Screenshots

*(Add screenshots or a demo GIF here if available)*

-----

## Developed By

**Hariharan Ravichandran**
Senior Flutter Developer