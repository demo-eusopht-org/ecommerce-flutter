
# 🛍️ Shopping App

**Shopping App** is a Flutter-based mobile application that provides an intuitive online shopping experience. This app integrates **Firebase** to handle authentication, database management, and other backend functionalities..

---


## 🛠️ Tech Stack
- 🐦 **Flutter**: Version 3.24.3
- 🎯 **Dart**: Version 3.5.3


---

## 📁 Folder Structure

The project is organized into the following folder structure for better modularity and maintainability:



lib/
├── 📡 auth_pages/               #App Auth-Pages
│   ├── login_page.dart
│   └── signUp_page.dart
├── 🎛️ MainScreens/        # App Main-Screens
│   ├── add_cart.dart
│   ├── database.dart
│   ├── home_page.dart
│   ├── next_screen.dart
│   ├── shop_cart.dart
│   ├── splash.dart
├── 📦 models/             # Data models representing application objects
│   ├── cart_model.dart
│   ├── my_cart_model.dart
│   ├── product_model.dart

├── 📄 pubspec.yaml       # Dependency configurations
└── 🚀 main.dart          # Application entry point

--- 
## 🚀 Getting Started

Follow these instructions to set up and run the app locally.

### ✅ Prerequisites

Ensure the following tools are installed on your system: - **Flutter SDK**: Install the latest version from the [Flutter website](https://flutter.dev/docs/get-started/install). - **Git**: Install Git for version control. - **Code Editor**: Use an editor like **VS Code** or **Android Studio** for development.

### 🛠️ Installation Steps
1. **Clone the repository**: ```bash git clone https://github.com/your-username/shopping.git cd alpha-generation

2. **Install dependencies**
   Run the following command to fetch and install required packages:
```bash
flutter pub get
```
3. **Run the app**
``` bash
flutter run
```
