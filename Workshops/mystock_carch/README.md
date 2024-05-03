# icons

[font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)

```
flutter pub add font_awesome_flutter
```

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
│   │   ├── theme.dart            # Configuration for app theme
│   │   └── ...
│   │
│   ├── constants/                # Constants used throughout the app
│   │   ├── asset_constants.dart  # Constants related to assets
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
│   │   │   │   ├── login_page.dart
│   │   │   └── ...
│   │   ├── widgets/              # Reusable UI components
│   │   ├── blocs/                # BLoCs for state management
│   │   ├── utils/                # Utility functions and classes
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
