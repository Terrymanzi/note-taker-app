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

## 🧪 Installation

### Prerequisites:

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase Project: [Set up Firebase](https://firebase.google.com/docs/flutter/setup)

### Setup

1. **Clone the repo**

   ```bash
   git clone https://github.com/terrymanzi/NoteTakingApp.git
   cd NoteTakingApp
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Set up Firebase**

- Create a Firebase project.
- Add Android/iOS apps to the project.
- Download and place google-services.json (Android) and GoogleService-Info.plist (iOS) in the respective directories.
- Enable Authentication and Firestore Database in Firebase Console.

  **Firebase Rules (example: what I used)**

  ```
      rules_version = '2';
      service cloud.firestore {
          match /databases/{database}/documents {
              match /notes/{noteId} {
              allow read, write: if request.auth != null && request.auth.uid == resource.data.userId;
              }
          }
      }
  ```

4. **Run the app**

   ```bash
   flutter run
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

## Built with ❤ using Flutter and Firebase, Happy note taking

## updates loading...
