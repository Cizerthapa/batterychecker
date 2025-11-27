# Battery Monitor App 🔋

A beautiful Flutter application that monitors your device's battery status with delightful confetti animations when fully charged!

## Features ✨

- **Real-time Battery Monitoring**: Track battery level and status
- **Visual Battery Indicator**: Beautiful battery icon with dynamic filling
- **Confetti Celebration**: Festive confetti animation when battery reaches 100%
- **Refresh Capability**: Manual refresh to get latest battery data
- **Multi-flavor Support**: Development, staging, and production environments
- **Responsive Design**: Adapts to different screen sizes using ScreenUtil
- **Dark Theme**: Beautiful dark theme with customizable color scheme

## Screenshots 🖼️

_(Add your app screenshots here)_

## Installation 🚀

### Prerequisites

- Flutter SDK (version 3.0 or higher)
- Dart (version 2.17 or higher)

### Steps

1. **Clone the repository**

   ```bash
   git clone <your-repo-url>
   cd batterylearn
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   # Development flavor
   flutter run --dart-define=flavor=development

   # Staging flavor
   flutter run --dart-define=flavor=staging

   # Production flavor
   flutter run --dart-define=flavor=production
   ```

## Project Structure 🏗️

```
lib/
├── features/
│   └── home/
│       ├── presentation/
│       │   ├── screen/
│       │   │   └── home_screen.dart
│       │   └── widgets/
│       │       ├── battery_icon_widget.dart
│       │       ├── battery_level_card.dart
│       │       ├── battery_status_card.dart
│       │       └── action_buttons_widget.dart
│       └── domain/
│           └── controller/
│               └── battery_controller.dart
├── core/
│   ├── config/
│   │   ├── app_config.dart
│   │   └── flavor_config.dart
│   └── utils/
└── main.dart
```

## Architecture 🏛️

The app follows a clean architecture pattern with:

- **Provider**: State management using ChangeNotifierProvider
- **MVVM**: Model-View-ViewModel pattern separation
- **Dependency Injection**: Proper scoping of providers

## Key Components 🔧

### BatteryController

Manages battery state and business logic:

- Battery level monitoring
- Battery status tracking
- Confetti controller management
- Data refresh functionality

### HomeScreen

Main screen featuring:

- App bar with refresh button
- Battery visualization
- Status information
- Confetti overlay

### Custom Widgets

- `BatteryIconWidget`: Visual battery representation
- `BatteryLevelCard`: Displays current battery percentage
- `BatteryStatusCard`: Shows charging status and health
- `ActionButtonsWidget`: Additional battery actions

## Configuration ⚙️

### Flavors

The app supports three flavors:

1. **Development**: Debug banner enabled, development configuration
2. **Staging**: Staging environment settings
3. **Production**: Production environment with optimized settings

### Theme

- Material 3 design system
- Custom color scheme based on seed color
- Dark theme support
- Inter font family

## Dependencies 📦

### Core Dependencies

- `provider`: State management
- `flutter_screenutil`: Responsive UI
- `confetti`: Celebration animations

### Dev Dependencies

- `flutter_lints`: Code quality and best practices

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5
  flutter_screenutil: ^5.8.4
  confetti: ^0.7.0

dev_dependencies:
  flutter_lints: ^2.0.0
```

## Usage Examples 💡

### Accessing Battery Controller

```dart
Consumer<BatteryController>(
  builder: (context, batteryController, child) {
    return Text('Battery: ${batteryController.batteryLevel}%');
  },
)
```

### Triggering Confetti

```dart
if (batteryController.batteryLevel == 100) {
  batteryController.confettiController.play();
}
```

## Contributing 🤝

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License 📄

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments 🙏

- Flutter team for the amazing framework
- Confetti package authors for the celebration animations
- Provider package for state management solutions

## Support 💬

If you have any questions or issues, please open an issue on GitHub or contact the development team.

---

**Made with ❤️ using Flutter**
