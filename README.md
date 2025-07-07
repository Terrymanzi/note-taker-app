# 📝 NotesApp

A minimal, cross-platform note-taking app built using **Flutter** and **Firebase**. It supports secure user authentication and real-time note management (create, read, update, delete) using Firestore.

## 🚀 Features

- 🔐 User Authentication (Firebase Auth)
- 🗃️ Real-time note syncing with Firestore
- ✏️ Create, Read, Update, Delete (CRUD) notes
- 📱 Responsive UI for mobile and tablet
- ☁️ Cloud-backed data persistence

## 🛠️ Tech Stack Used

- **Flutter** - Frontend UI framework
- **Firebase Auth** - Authentication
- **Cloud Firestore** - Real-time NoSQL database
- **Bloc** - State management

## 📸 App Screenshots

**login screen / sign up**
description
**notes_list**
description
**notes editor**
description

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        Notes App                         │
├─────────────────────────────────────────────────────────────┤
│  UI Layer (Screens & Widgets)                              │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────────────┐   │
│  │ Auth Screen │ │ Notes List  │ │   Note Editor       │   │
│  └─────────────┘ └─────────────┘ └─────────────────────┘   │
├─────────────────────────────────────────────────────────────┤
│  State Management (Bloc)                                   │
│  ┌─────────────┐ ┌─────────────┐                          │
│  │  Auth Bloc  │ │ Notes Bloc  │                          │
│  └─────────────┘ └─────────────┘                          │
├─────────────────────────────────────────────────────────────┤
│  Services Layer                                            │
│  ┌─────────────┐ ┌─────────────┐                          │
│  │ Auth Service│ │Notes Service│                          │
│  └─────────────┘ └─────────────┘                          │
├─────────────────────────────────────────────────────────────┤
│  Models                                                    │
│  ┌─────────────┐ ┌─────────────┐                          │
│  │ User Model  │ │ Note Model  │                          │
│  └─────────────┘ └─────────────┘                          │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    Firebase Backend                        │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐    ┌─────────────────────────────────┐ │
│  │ Firebase Auth   │    │      Cloud Firestore           │ │
│  │                 │    │                                 │ │
│  │ • User Login    │    │ • Real-time sync               │ │
│  │ • Registration  │    │ • CRUD operations              │ │
│  │ • Session Mgmt  │    │ • User-specific data           │ │
│  └─────────────────┘    └─────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

## 🧪 Build Steps

### Prerequisites:

- **Flutter SDK** (3.0+): [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Android Studio** or **VS Code** with Flutter extensions
- **Firebase CLI**: `npm install -g firebase-tools`
- **Git**: [Install Git](https://git-scm.com/downloads)

### Complete Build Process:

#### 1. **Environment Setup**

```bash
# Verify Flutter installation
flutter doctor

# Clone the repository
git clone https://github.com/terrymanzi/NoteTakingApp.git
cd NoteTakingApp
```

#### 2. **Dependencies Installation**

```bash
# Install Flutter dependencies
flutter pub get

# Clean build cache (if needed)
flutter clean
```

#### 3. **Firebase Configuration**

```bash
# Login to Firebase
firebase login

# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase for your project
flutterfire configure
```

**Manual Firebase Setup:**

- Create Firebase project at [Firebase Console](https://console.firebase.google.com)
- Enable Authentication (Email/Password)
- Create Firestore Database
- Download config files:
  - `google-services.json` → `android/app/`
  - `GoogleService-Info.plist` → `ios/Runner/`

**Firestore Security Rules:**

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /notes/{noteId} {
      allow read, write: if request.auth != null &&
                          request.auth.uid == resource.data.userId;
    }
  }
}
```

#### 4. **Build Commands**

**Debug Build:**

```bash
# Run on connected device/emulator
flutter run

# Run with hot reload
flutter run --hot
```

**Release Build:**

```bash
# Android APK
flutter build apk --release

# Android App Bundle (for Play Store)
flutter build appbundle --release

# iOS (requires macOS)
flutter build ios --release
```

#### 5. **Testing**

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/
```

#### 6. **Deployment**

```bash
# Deploy Firestore rules
firebase deploy --only firestore:rules

# Build artifacts location:
# Android: build/app/outputs/flutter-apk/app-release.apk
# iOS: build/ios/archive/Runner.xcarchive
```

## 📂 Project Structure

```
    /lib
    ├── main.dart
    ├── models/
    ├── screens/
    ├── services/
    ├── widgets/
    └── utils/
```

## Author

Names – @terrymanzi
Email - m.terry@alustudent.com

📃 License
This project is licensed under the MIT License.

## Built with ❤ using Flutter and Firebase,

## Happy note taking... ✍
