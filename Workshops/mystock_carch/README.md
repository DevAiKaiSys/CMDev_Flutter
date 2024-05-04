# icons

[font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)

```
flutter pub add font_awesome_flutter
```

# toasts

[another_flushbar](https://pub.dev/packages/another_flushbar)

```
flutter pub add another_flushbar
```

# data storage

[shared_preferences](https://pub.dev/packages/shared_preferences)

```
flutter pub add shared_preferences
```

## checking data storage

### Android

View->Tool Windows->Device Explorer->(select device)->Files.

Path: /data/data/(packagename)/shared_prefs/FlutterSharedPreferences.xml

if cannot open checking

- Project SDK
  - File->Project Structure->Project Settings->Project->SDK:
- Facets
  - File->Project Structure->Project Settings->Facets->+->Android
- Adb (optional)

### Windows

In the roaming AppData directory

%USER_PATH%/AppData/Roaming/(packagename)/(projectname)/shared_preferences.json

### Web

LocalStorage

# run unit test

```
flutter test
```

# Project Structure

```
project_root/
│
├── lib/
│   │
│   ├── configs/
│   │   ├── route.dart
│   │   ├── theme.dart            # Configuration for app theme
│   │   └── ...
│   │
│   ├── constants/                # Constants used throughout the app
│   │   ├── asset_constants.dart  # Constants related to assets
│   │   ├── setting.dart
│   │   └── ...
│   │
│   ├── data/                     # Data layer containing data sources and repositories
│   │   ├── datasources/          # Data sources (e.g., API, local database)
│   │   ├── models/               # Data models
│   │   ├── repositories/         # Repositories for data access
│   │   └── ...
│   │
│   ├── domain/                   # Domain layer containing business logic
│   │   ├── entities/             # Business entities
│   │   ├── repositories/         # Abstract repository interfaces
│   │   ├── usecases/             # Use cases or interactors
│   │   └── ...
│   │
│   ├── presentation/             # Presentation layer containing UI, BLoCs, and widgets
│   │   ├── pages/                # Screen pages
│   │   │   ├── home/
│   │   │   │   ├── home_page.dart    # Main application page
│   │   │   ├── login/
│   │   │   │   ├── widgets/          # Widgets specific to login page
│   │   │   │   │   ├── login_form.dart
│   │   │   │   │   └── ...
│   │   │   │   ├── login_page.dart
│   │   │   ├── index.dart
│   │   │   └── ...
│   │   ├── widgets/              # Reusable UI components
│   │   ├── viewmodels/            # View models for UI logic
│   │   │   ├── single_sign_on_view_model.dart
│   │   ├── blocs/                # BLoCs for state management
│   │   ├── utils/                # Utility functions and classes
│   │   │   ├── regex_validator.dart
│   │   │   ├── format.dart
│   │   ├── app.dart              # Main application widget
│   │   └── ...
│   │
│   ├── main.dart                 # Entry point of the application
│   └── ...
│
├── test/                         # Test directory containing unit and widget tests
│   └── ...
│
├── assets/                       # Asset files such as images, fonts, etc.
│   └── images/                   # Directory for image assets
│
└── pubspec.yaml                  # Flutter project dependencies and configurations
```
