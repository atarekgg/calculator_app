# 🧮 My Flutter Task 2 - Professional Calculator App

A modern, fully-functional calculator application built with Flutter and the BLoC (Business Logic Component) pattern. This app features a sleek dark theme UI with smooth animations, a splash screen, and professional design principles.

---

## 📋 Table of Contents

- [Features](#-features)
- [Screenshots](#-screenshots)
- [Project Structure](#-project-structure)
- [Architecture](#-architecture)
- [File-by-File Explanation](#-file-by-file-explanation)
- [UI/UX Design](#-uiux-design)
- [Technology Stack](#-technology-stack)
- [Getting Started](#-getting-started)
- [BLoC Architecture Deep Dive](#-bloc-architecture-deep-dive)
- [Code Highlights](#-code-highlights)
- [Future Enhancements](#-future-enhancements)
- [License](#-license)

---

## ✨ Features

### Core Functionality
- **Basic Arithmetic Operations**: Addition (+), Subtraction (-), Multiplication (×), Division (÷)
- **Advanced Features**: 
  - Percentage calculations (%)
  - Decimal support for precise calculations
- **User Controls**:
  - **Clear (AC)** - Reset calculator to initial state
  - **Delete (⌫)** - Remove last entered digit
  - **Real-time equation display** - Shows the full operation being performed

### App Flow
1. **Splash Screen**: Beautiful full-screen image splash displayed for 3 seconds
2. **Calculator Screen**: Main calculator interface with responsive button grid

### Technical Highlights
- **BLoC Architecture Pattern** for predictable state management
- **Clean Code Structure** with separated concerns
- **Dark Theme Design** optimized for eye comfort
- **Responsive UI** that adapts to different screen sizes
- **Smooth Animations** for button interactions
- **Professional Typography** with carefully chosen font sizes and weights
- **Material Design 3** principles applied

---

## 📁 Project Structure

```
my_flutter_task2/
├── android/                          # Android platform-specific code
│   ├── app/
│   │   ├── build.gradle.kts
│   │   └── src/main/
│   │       ├── AndroidManifest.xml
│   │       ├── kotlin/com/example/my_flutter_task2/MainActivity.kt
│   │       └── res/                  # App icons and launch backgrounds
│   ├── build.gradle.kts
│   ├── gradle.properties
│   └── settings.gradle.kts
├── ios/                              # iOS platform-specific code
│   ├── Runner/
│   │   ├── AppDelegate.swift
│   │   ├── Info.plist
│   │   ├── SceneDelegate.swift
│   │   └── Assets.xcassets/          # iOS app icons
│   ├── Runner.xcodeproj/
│   └── Runner.xcworkspace/
├── web/                              # Web platform files
│   ├── index.html
│   ├── manifest.json
│   └── icons/                        # Web app icons (192x192, 512x512)
├── assets/
│   └── images/
│       └── my.jpg                    # Splash screen background image
├── lib/                              # Main Dart source code
│   ├── main.dart                     # Application entry point
│   ├── assets/
│   │   └── app_images.dart           # Centralized image asset paths
│   ├── bloc/                         # BLoC state management
│   │   ├── calculator_bloc.dart      # Business logic & event handlers
│   │   ├── calculator_event.dart     # User interaction events
│   │   └── calculator_state.dart     # Application state definitions
│   ├── screen/                       # UI screens
│   │   ├── App_SplashScreen.dart     # Splash screen with 3-sec timer
│   │   └── calculator_screen.dart    # Main calculator UI
│   └── theme/                        # App theming & styling
│       ├── app_colors.dart           # Color palette constants
│       ├── app_responsive.dart       # Responsive sizing utilities
│       ├── app_string.dart           # Text string constants
│       ├── app_text_style.dart       # Typography style definitions
│       └── app_theme.dart            # Material theme configuration
├── pubspec.yaml                      # Project dependencies & config
├── analysis_options.yaml             # Dart linting rules
└── test/
    └── widget_test.dart              # Unit tests
```

---

## 🏗️ Architecture

This project follows the **BLoC (Business Logic Component) Pattern** for state management, ensuring:

- **Separation of Concerns**: UI, business logic, and data are completely separate
- **Testability**: Business logic can be tested independently of the UI
- **Predictability**: State changes are unidirectional and traceable
- **Scalability**: Easy to add new features without breaking existing code

### Architecture Flow

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   User      │────▶│   Event     │────▶│    BLoC     │────▶│    State    │
│   Action    │     │  (Input)    │     │  (Logic)    │     │  (Output)   │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
                                                                   │
                                                                   ▼
                                                            ┌─────────────┐
                                                            │   UI Rebuild │
                                                            │  (BlocBuilder)│
                                                            └─────────────┘
```

---

## 📖 File-by-File Explanation

### 1. `pubspec.yaml` - Project Configuration

```yaml
name: my_flutter_task2
description: "A new Flutter project."
version: 1.0.0+1

environment:
  sdk: ^3.11.1

dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^9.1.1      # BLoC state management library
  equatable: ^2.0.5         # Value equality for Dart objects
  cupertino_icons: ^1.0.8   # iOS-style icons

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0     # Recommended coding practices

flutter:
  uses-material-design: true
  assets:
    - assets/images/        # Registers image assets for use in app
```

**Key Points:**
- **Flutter SDK**: `^3.11.1` - Uses latest Dart/Flutter features
- **flutter_bloc**: `^9.1.1` - State management via BLoC pattern
- **equatable**: `^2.0.5` - Simplifies equality comparisons for states/events
- **Assets**: The `assets/images/` folder is registered for image access

---

### 2. `lib/main.dart` - Application Entry Point

```dart
import 'package:flutter/material.dart';
import 'package:my_flutter_task2/screen/App_SplashScreen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,    // Removes debug banner
      theme: AppTheme.darkTheme,             // Applies dark theme globally
      home: SplashScreen(),                  // First screen shown
    );
  }
}
```

**Key Points:**
- `debugShowCheckedModeBanner: false` - Hides the red "DEBUG" banner
- `theme: AppTheme.darkTheme` - Applies the custom dark theme to entire app
- `home: SplashScreen()` - Sets the splash screen as the initial route

---

### 3. `lib/assets/app_images.dart` - Asset Path Management

```dart
class AppImages {
  static const SplashScreenbg = 'assets/images/my.jpg';
  // static const SplashScreenlogo = 'assets/images/logo1.png';
}
```

**Key Points:**
- Centralizes all image asset paths in one file
- Uses `const` for compile-time optimization
- Makes it easy to change asset paths without searching through code
- Follows the **DRY (Don't Repeat Yourself)** principle

---

### 4. `lib/bloc/calculator_event.dart` - User Events

```dart
part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
  @override
  List<Object> get props => [];
}

class NumberPressed extends CalculatorEvent {
  final String number;
  const NumberPressed(this.number);
  @override
  List<Object> get props => [number];
}

class OperatorPressed extends CalculatorEvent {
  final String operator;
  const OperatorPressed(this.operator);
  @override
  List<Object> get props => [operator];
}

class ClearPressed extends CalculatorEvent {}
class EqualsPressed extends CalculatorEvent {}
class DecimalPressed extends CalculatorEvent {}
class DeletePressed extends CalculatorEvent {}
```

## 👨‍💻 Developer

Ahmed T. Abdelwahed
