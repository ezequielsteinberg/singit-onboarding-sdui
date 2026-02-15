# 🎨 Singit Onboarding SDUI

A Flutter-based **Server-Driven UI (SDUI)** engine for dynamic onboarding flows, featuring conditional navigation, real-time template resolution, and multi-language support.

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Key Concepts](#-key-concepts)
- [SDUI Implementation](#-sdui-implementation)
- [State Management](#-state-management)
- [Internationalization](#-internationalization)
- [Design System](#-design-system)

---

## 🎯 Overview

This project implements a **configuration-driven onboarding system** where the entire flow (screens, navigation, content, and logic) is determined by a JSON configuration from the server. The system is designed to be:

- **UI-Agnostic**: Components can be added/modified without changing core logic
- **Flexible**: Supports conditional navigation based on user selections
- **Resilient**: Handles unsupported components gracefully
- **Maintainable**: Clear separation of concerns following Clean Architecture

### 🎥 Demo

- **Video**: [Onboarding Flow Demo](https://drive.google.com/file/d/1BKvK9TGsXeU4mBBQZ8Zp6PwqX_gyCIkx/view?usp=sharing)
- **Figma**: [Design Specifications](https://www.figma.com/design/2muj2uABBMCzYTqpr22VpO/Onboarding-Assignment)

---

## ✨ Features

### Core Features

- ✅ **Server-Driven UI**: Entire onboarding flow controlled by JSON configuration
- ✅ **Conditional Navigation**: Dynamic routing based on user selections
- ✅ **Template Resolution**: Real-time variable substitution (e.g., `{{name}}`)
- ✅ **Back Navigation**: Full history stack with proper state restoration
- ✅ **Multi-language Support**: i18n with automatic device language detection
- ✅ **Component Registry**: Extensible widget system ("Alchemist" pattern)
- ✅ **Type-Safe Models**: Freezed-based immutable data structures
- ✅ **Responsive Design**: Adapts to different screen sizes

### UI Components

- 📋 **List Component**: Multi-select options with custom styling
- 🎓 **English Journey Component**: Interactive progress visualization with animations
- 🎨 **Custom Animations**: Smooth transitions and micro-interactions
- 🌈 **Material 3 Design**: Modern theming with Google Fonts

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles with three distinct layers:

```
┌─────────────────────────────────────────────────────────┐
│                    PRESENTATION                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │   Screens    │  │   Widgets    │  │   Providers  │  │
│  │  (UI Layer)  │  │ (Components) │  │   (State)    │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│                      DOMAIN                              │
│  ┌──────────────┐  ┌──────────────┐                     │
│  │   Entities   │  │ Repositories │                     │
│  │  (Business)  │  │ (Interfaces) │                     │
│  └──────────────┘  └──────────────┘                     │
└─────────────────────────────────────────────────────────┘
                           ↓
┌─────────────────────────────────────────────────────────┐
│                  INFRASTRUCTURE                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │    Models    │  │ Repositories │  │   Services   │  │
│  │    (DTOs)    │  │    (Impl)    │  │   (Data)     │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
└─────────────────────────────────────────────────────────┘
```

### Layer Responsibilities

#### 🎨 Presentation Layer (`lib/presentation/`)
- **Screens**: UI pages that compose widgets
- **Widgets**: Reusable UI components (SDUI components)
- **Providers**: State management with Riverpod
- **Router**: Navigation configuration

#### 🧠 Domain Layer (`lib/domain/`)
- **Entities**: Pure business models (Freezed classes)
- **Repository Interfaces**: Contracts for data access

#### 🔧 Infrastructure Layer (`lib/infrastructure/`)
- **Models (DTOs)**: Data Transfer Objects for JSON parsing
- **Repository Implementations**: Concrete data access logic
- **Services**: External data sources (API, local storage)

---

## 📁 Project Structure

```
lib/
├── config/
│   └── theme/                    # Design system
│       ├── app_dimens.dart       # Spacing constants
│       ├── app_images.dart       # Asset paths
│       ├── color_schema.dart     # Color palette
│       ├── text_theme.dart       # Typography
│       ├── theme_data.dart       # Material theme
│       └── theme_extension.dart  # Custom theme extensions
│
├── domain/
│   └── sdui/
│       └── entities/             # Business entities
│           ├── onboarding_entities.dart
│           └── onboarding_entities.freezed.dart
│
├── infrastructure/
│   ├── core/
│   │   └── network_module.dart   # Network configuration
│   ├── models/
│   │   └── sdui/
│   │       └── onboarding_dtos.dart  # JSON DTOs
│   └── repositories/
│       └── onboarding_repository.dart
│
├── presentation/
│   ├── providers/                # State management
│   │   ├── base_state_notifier.dart
│   │   ├── onboarding_provider.dart
│   │   └── onboarding_provider.freezed.dart
│   ├── router/
│   │   └── app_router.dart       # Navigation config
│   ├── sdui/
│   │   └── widgets/
│   │       ├── alchemist_sdui.dart  # Component renderer
│   │       └── components/
│   │           ├── list/         # List component
│   │           └── english_journey/  # Journey component
│   └── ui/
│       └── screens/
│           ├── onboarding_page.dart
│           └── home_page.dart
│
├── main.dart                     # App entry point
└── router.dart                   # Route definitions

assets/
├── env/
│   └── .env                      # Environment variables
├── images/
│   └── Gift.svg                  # UI assets
├── json/
│   └── onboarding_response.json  # SDUI configuration
└── translations/
    ├── en-EN.json                # English translations
    └── es-ES.json                # Spanish translations
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK: `>=3.0.0 <4.0.0`
- Dart SDK: `>=3.0.0`

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/singit-onboarding-sdui.git
   cd singit-onboarding-sdui
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (Freezed, JSON serialization)
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Environment Setup

Create `assets/env/.env` file:
```env
API_BASE_URL=https://api.example.com
```

---

## 🔑 Key Concepts

### 1. Server-Driven UI (SDUI)

The entire onboarding flow is defined by a JSON configuration:

```json
{
  "onboarding_flow": {
    "steps": [
      {
        "id": "step_1",
        "stepIndex": 7,
        "componentType": "list",
        "content": {
          "title": "What brings you to Singit?",
          "description": "Select all that apply"
        },
        "options": [...],
        "nextSteps": [
          {
            "nextStepId": "step_2",
            "conditions": [
              { "stepId": "step_1", "optionId": "option_a" }
            ]
          }
        ]
      }
    ]
  }
}
```

### 2. Component Registry Pattern ("Alchemist")

The `AlchemistSDUI` widget acts as a dispatcher that maps component types to widgets:

```dart
class AlchemistSDUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    switch (step.componentType) {
      case 'list':
        return ListComponent(step: step);
      case 'englishJourney':
        return EnglishJourneyComponent(step: step);
      default:
        return UnsupportedComponent(step: step);
    }
  }
}
```

### 3. Conditional Navigation

Navigation is predicate-based, evaluating user answers against conditions:

```dart
void _goToNextStep(OnboardingStep currentStep) {
  for (final rule in currentStep.nextSteps!) {
    bool allConditionsMet = true;
    for (final condition in rule.conditions) {
      final userAnswer = state.answers[condition.stepId];
      if (userAnswer != condition.optionId) {
        allConditionsMet = false;
        break;
      }
    }
    if (allConditionsMet) {
      navigateToStep(rule.nextStepId);
      break;
    }
  }
}
```

### 4. Template Resolution

Dynamic content with variable substitution:

```dart
// Configuration: "Welcome, {{name}}!"
// Runtime: "Welcome, John!"

String resolveTemplate(String template, Map<String, String> variables) {
  return template.replaceAllMapped(
    RegExp(r'\{\{(\w+)\}\}'),
    (match) => variables[match.group(1)] ?? match.group(0)!,
  );
}
```

---

## 🎨 SDUI Implementation

### Adding a New Component

1. **Define the component type** in your JSON configuration
2. **Create the widget** in `lib/presentation/sdui/widgets/components/`
3. **Register in Alchemist** by adding a case in `AlchemistSDUI.build()`

Example:

```dart
// 1. JSON Configuration
{
  "componentType": "button",
  "content": {
    "text": "Continue",
    "action": "next"
  }
}

// 2. Create Widget
class ButtonComponent extends StatelessWidget {
  final OnboardingStep step;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => handleAction(step.content['action']),
      child: Text(step.content['text']),
    );
  }
}

// 3. Register in Alchemist
case 'button':
  return ButtonComponent(step: step);
```

---

## 🔄 State Management

### Architecture

The app uses **Riverpod** with a custom `BaseStateNotifier` pattern:

```dart
abstract class BaseStateNotifier<S, A> extends StateNotifier<S> {
  final Ref ref;
  
  BaseStateNotifier({required S state, required this.ref}) : super(state);
  
  void reducer({required A action});
}
```

### State & Actions

```dart
@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(false) bool isLoading,
    OnboardingFlow? flow,
    OnboardingStep? currentStep,
    @Default({}) Map<String, String> answers,
    @Default([]) List<OnboardingStep> history,
    String? error,
  }) = _OnboardingState;
}

@freezed
class OnboardingAction with _$OnboardingAction {
  const factory OnboardingAction.loadFlow() = _LoadFlow;
  const factory OnboardingAction.selectOption(String stepId, String optionId) = _SelectOption;
  const factory OnboardingAction.continueToNextStep() = _ContinueToNextStep;
  const factory OnboardingAction.goBack() = _GoBack;
}
```

### Usage in UI

```dart
class OnboardingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);
    
    return Scaffold(
      body: AlchemistSDUI(
        step: state.currentStep!,
        onOptionSelected: (optionId) {
          notifier.reducer(
            action: OnboardingAction.selectOption(
              state.currentStep!.id,
              optionId,
            ),
          );
        },
      ),
    );
  }
}
```

---

## 🌍 Internationalization

### Configuration

The app supports multiple languages with automatic device detection:

```dart
EasyLocalization(
  supportedLocales: const [Locale('en', 'EN'), Locale('es', 'ES')],
  path: 'assets/translations',
  fallbackLocale: const Locale('en', 'EN'),
  child: MyApp(),
)
```

### Translation Files

**`assets/translations/en-EN.json`**
```json
{
  "onboarding": {
    "continue": "Continue",
    "back": "Back"
  }
}
```

**`assets/translations/es-ES.json`**
```json
{
  "onboarding": {
    "continue": "Continuar",
    "back": "Volver"
  }
}
```

### Usage

```dart
Text('onboarding.continue'.tr())  // "Continue" or "Continuar"
```

---

## 🎨 Design System

### Theme Configuration

The app uses **Material 3** with a custom design system:

```dart
class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: AppColorScheme.light,
    textTheme: AppTextTheme.textTheme,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
}
```

### Design Tokens

- **Colors**: `lib/config/theme/color_schema.dart`
- **Typography**: `lib/config/theme/text_theme.dart`
- **Spacing**: `lib/config/theme/app_dimens.dart`
- **Assets**: `lib/config/theme/app_images.dart`

### Usage

```dart
// Colors
Container(color: Theme.of(context).colorScheme.primary)

// Typography
Text('Hello', style: Theme.of(context).textTheme.headlineMedium)

// Spacing
Padding(padding: EdgeInsets.all(AppDimens.paddingLarge))
```

---

## 📦 Dependencies

### Core
- **flutter_riverpod** `^2.4.9` - State management
- **go_router** `^12.1.0` - Navigation
- **freezed** `^2.4.6` - Immutable models
- **json_annotation** `^4.8.1` - JSON serialization

### UI
- **google_fonts** `^6.1.0` - Typography
- **flutter_svg** `^2.2.3` - SVG support
- **lottie** `^2.7.0` - Animations

### Utilities
- **easy_localization** `^3.0.3` - i18n
- **dio** `^5.4.0` - HTTP client
- **flutter_dotenv** `^5.1.0` - Environment variables

---

## 🧪 Testing

```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage
```

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👥 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## 📧 Contact

For questions or feedback, please contact [your-email@example.com](mailto:your-email@example.com)

---

**Built with ❤️ using Flutter**
