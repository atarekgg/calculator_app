# 🧮 My Flutter Task 2 - Professional Calculator App

A modern, fully-functional calculator application built with Flutter and the BLoC (Business Logic Component) pattern. This app features a sleek dark theme UI with smooth animations and professional design principles.

## ✨ Features

### Core Functionality
- **Basic Arithmetic Operations**: Addition, Subtraction, Multiplication, Division
- **Advanced Features**: Percentage calculations, Decimal support
- **User Controls**: 
  - Clear (AC) - Reset calculator to initial state
  - Delete (⌫) - Remove last digit
  - Real-time equation display

### Technical Highlights
- **BLoC Architecture Pattern** for state management
- **Clean Code Structure** with separated concerns
- **Dark Theme Design** optimized for eye comfort
- **Responsive UI** that adapts to different screen sizes
- **Smooth Animations** for button interactions
- **Professional Typography** with carefully chosen font sizes and weights
- **Material Design 3** principles applied

## 📁 Project Structure

```
lib/
├── main.dart                 # Application entry point
├── bloc/
│   ├── calculator_bloc.dart  # Business logic implementation
│   ├── calculator_event.dart # User interaction events
│   └── calculator_state.dart # Application state definitions
├── screen/
│   └── calculator_screen.dart # Main UI screen
└── theme/
    ├── app_colors.dart       # Color palette
    ├── app_text_style.dart   # Typography styles
    ├── app_string.dart       # String constants
    └── app_theme.dart        # Theme configuration
```

## 🎨 UI/UX Enhancements

### Design Features
- **Gradient-like Button Effects**: Visual feedback on button press
- **Shadow Depth**: Professional shadow system for depth perception
- **Color Scheme**:
  - Dark background (#0F0F0F)
  - Number buttons (#333333)
  - Operator buttons (#FF9F0A - Orange)
  - Function buttons (#5E5E62 - Grey)
  - Interactive hover states for all button types

### Typography
- **Display Large**: 72px, Light weight - Main calculation display
- **Display Small**: 28px, Regular weight - Equation preview
- **Button Text**: 32px for numbers, 24px for functions

### Animations & Interactions
- Button press animations with scale effect
- Shadow depth changes on press
- Color transitions on hover
- Smooth opacity animations for equation display

## 🛠️ Technology Stack

- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: BLoC 8.x + flutter_bloc
- **Architecture**: BLoC Pattern
- **Design System**: Material Design 3
- **Additional Libraries**:
  - `equatable`: Value equality for Dart objects
  - `flutter_bloc`: BLoC library for Flutter

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (included with Flutter)
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone or download the project**
   ```bash
   git clone <repository-url>
   cd my_flutter_task2
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

**Android**
```bash
flutter build apk --release
```

**iOS**
```bash
flutter build ios --release
```

**Web**
```bash
flutter build web
```

## 📱 Supported Platforms
- ✅ Android (API 21+)
- ✅ iOS (11.0+)
- ✅ Web (Chrome, Safari, Firefox, Edge)
- ✅ Windows (10+)
- ✅ macOS (10.11+)
- ✅ Linux

## 🏗️ BLoC Architecture Explained

### States
- **CalculatorInitial**: Contains current display value and equation history

### Events
- **NumberPressed**: User taps a number (0-9)
- **OperatorPressed**: User selects an operator (+, -, ×, ÷)
- **DecimalPressed**: User taps the decimal point
- **ClearPressed**: User taps AC to clear all
- **DeletePressed**: User taps ⌫ to remove last digit
- **EqualsPressed**: User taps = to calculate result

### Flow
```
User Input → Event → Bloc → State → UI Update
```

## 🎯 Code Highlights

### Example: Adding a Number
1. User taps "5" button
2. `NumberPressed('5')` event is triggered
3. BLoC processes the event and updates state
4. UI rebuilds showing the new number on display

### Calculation Handling
- Numbers are concatenated to build larger numbers
- Operators capture the current display and equation
- Equals button computes the result using equation history

## 📋 Feature Requirements Met

✅ Professional UI with dark theme
✅ Smooth animations and transitions
✅ BLoC pattern implementation
✅ Clean, maintainable code structure
✅ Material Design 3 compliance
✅ Error handling for edge cases
✅ Responsive design for all screen sizes
✅ Detailed project documentation

## 🔮 Future Enhancements

- [ ] History panel for calculation history
- [ ] Support for more complex operations (power, square root)
- [ ] Voice input for numbers
- [ ] Multiple theme options (Light, High Contrast)
- [ ] Calculation memory (M+, M-, MR, MC)
- [ ] Unit conversion features
- [ ] Offline usage optimization

## 📝 License

This project is open source and available under the MIT License.

## 👨‍💻 Developer Notes

### Best Practices Implemented
- **Separation of Concerns**: Logic, UI, and Theme are separate
- **Type Safety**: Strong typing with Dart
- **Immutability**: States are immutable for predictable behavior
- **Testability**: BLoC pattern makes testing straightforward
- **Scalability**: Easy to add new features or events

### Testing the App
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## 📞 Support & Feedback

For issues, suggestions, or contributions, please open an issue or submit a pull request.

---

**Made with ❤️ using Flutter**
