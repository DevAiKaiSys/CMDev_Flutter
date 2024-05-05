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

# badges

[badges](https://pub.dev/packages/badges)

```
flutter pub add badges
```

# text formatting

[intl](https://pub.dev/packages/intl)

```
flutter pub add intl
```

# make request to api

[dio](https://pub.dev/packages/dio)

```
flutter pub add dio
```

# service locator

[get_it](https://pub.dev/packages/get_it)

```
flutter pub add get_it
```

# picking images

[image_picker](https://pub.dev/packages/image_picker)

```
flutter pub add image_picker
```

# image crop

[image_cropper](https://pub.dev/packages/image_cropper)

```
flutter pub add image_cropper
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
│   │   ├── route.dart                 # Configuration for app routing
│   │   ├── theme.dart                 # Configuration for app theme
│   │   └── ...
│   │
│   ├── constants/                     # Constants used throughout the app
│   │   ├── asset_constants.dart       # Constants related to assets
│   │   ├── setting.dart
│   │   ├── api.dart
│   │   └── ...
│   │
│   ├── data/                          # Data layer containing data sources and repositories
│   │   ├── datasources/               # Data sources (e.g., API, local database)
│   │   ├── models/                    # Data models
│   │   ├── repositories/              # Repositories for data access
│   │   ├── services/         
│   │   │   ├── rest_api.dart          # Abstract definition for REST API service
│   │   │   └── rest_api_impl.dart     # Implementation of REST API service
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
│   │   │   ├── home/             # Home page related components
│   │   │   │   ├── home_page.dart    # Main application page
│   │   │   ├── login/
│   │   │   │   ├── widgets/          # Widgets specific to login page
│   │   │   │   │   ├── login_form.dart
│   │   │   │   │   └── ...
│   │   │   │   ├── login_page.dart
│   │   │   ├── index.dart        # Export file for pages
│   │   │   └── ...
│   │   ├── widgets/                   # Reusable UI components
│   │   │   ├── image_not_found.dart   # Widget for displaying when image is not found
│   │   ├── viewmodels/                # View models for UI logic
│   │   │   ├── single_sign_on_view_model.dart  # ViewModel for single sign-on functionality
│   │   ├── blocs/                     # BLoCs for state management
│   │   ├── utils/                     # Utility functions and classes
│   │   │   ├── regex_validator.dart   # Utility for regex validation
│   │   │   ├── format.dart            # Utility for formatting
│   │   ├── app.dart                   # Main application widget
│   │   └── ...
│   │
│   ├── injection_container.dart       # Container for dependency injection setup
│   ├── main.dart                      # Entry point of the application
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
