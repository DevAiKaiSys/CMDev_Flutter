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
│   │   ├── ...                   # Configuration files for various settings
│   │
│   ├── constants/                 # Constants used throughout the app
│   │   ├── asset.dart            # Constants related to assets
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
│   └── images/                    # Directory for image assets
│
└── pubspec.yaml                   # Flutter project dependencies and configurations
```