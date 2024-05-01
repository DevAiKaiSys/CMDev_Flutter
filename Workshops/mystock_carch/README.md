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
│   │   ├── api_config.dart        # Configuration for API base URL
│   │   ├── theme_config.dart      # Configuration for app theme
│   │   └── settings_config.dart   # Configuration for other app settings
│   │
│   ├── constants/                 # Constants used throughout the app
│   │   ├── app_constants.dart     # General application constants
│   │   └── ...
│   │
│   ├── data/                      # Data layer containing data sources and repositories
│   │   ├── datasources/           # Data sources (e.g., API, local database)
│   │   ├── models/                # Data models
│   │   ├── repositories/          # Repositories for data access
│   │   └── ...
│   │
│   ├── domain/                    # Domain layer containing business logic
│   │   ├── entities/              # Business entities
│   │   ├── repositories/          # Abstract repository interfaces
│   │   ├── usecases/              # Use cases or interactors
│   │   └── ...
│   │
│   ├── presentation/              # Presentation layer containing UI, BLoCs, and widgets
│   │   ├── pages/                 # Screen pages
│   │   │   ├── home_page.dart    # Main application page
│   │   │   └── ...
│   │   ├── widgets/               # Reusable UI components
│   │   ├── blocs/                 # BLoCs for state management
│   │   ├── utils/                 # Utility functions and classes
│   │   ├── app.dart               # Main application widget
│   │   └── ...
│   │
│   ├── main.dart                  # Entry point of the application
│   └── ...
│
├── test/                          # Test directory containing unit and widget tests
│   └── ...
│
├── assets/                        # Asset files such as images, fonts, etc.
│
└── pubspec.yaml                   # Flutter project dependencies and configurations
```