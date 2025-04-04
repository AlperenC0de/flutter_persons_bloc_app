# Flutter Persons BLoC App

A simple Flutter application managing persons using BLoC architecture. 
Includes registration, listing, and detail pages.

---

## Features
- List persons
- Register a new person
- View person details
- Delete persons
- BLoC Pattern with Cubit
- Clean architecture: Entity, Repository, Cubit, UI layers

---

## Project Structure
```
lib/
├── data/
│   ├── entity/
│   │   └── persons.dart
│   └── repo/
│       └── person_dao_repository.dart
├── ui/
│   ├── cubit/
│   │   ├── mainPage_cubit.dart
│   │   └── registration_cubit.dart
│   └── views/
│       ├── detailPage.dart
│       ├── mainPage.dart
│       └── registration.dart
└── main.dart
```

---

## Getting Started

1. **Clone the repository**
   ```
   git clone https://github.com/kullanici-adin/flutter_persons_bloc_app.git
   ```

2. **Navigate into the project directory**
   ```
   cd flutter_persons_bloc_app
   ```

3. **Install dependencies**
   ```
   flutter pub get
   ```

4. **Run the app**
   ```
   flutter run
   ```

Make sure you have an emulator running or a physical device connected.

---

## Dependencies
- flutter_bloc

Add in `pubspec.yaml` if missing:
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc:
```



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
