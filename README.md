# Atlas Dashboard

A cross-platform analytics dashboard built with Flutter and Dart, focused on real-time insights, modular data visualization, and performance-aware UI architecture.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.0+-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

## Features

### 🎯 Core Features
- **Real-time Data Streaming**: WebSocket integration for live metric updates
- **Interactive Charts**: Beautiful, responsive charts using FL Chart
- **Modular Architecture**: Clean separation of concerns with feature-based structure
- **State Management**: Efficient state handling with Riverpod
- **Responsive Design**: Optimized for mobile, tablet, and desktop platforms
- **Theme Support**: Light, dark, and system theme modes
- **Performance Monitoring**: Built-in performance tracking and optimization

### 📊 Analytics & Visualization
- Time-series line charts with multiple data series
- Bar charts for comparative analysis
- Metric cards with trend indicators
- Real-time data updates
- Customizable filters and date ranges
- Export functionality (coming soon)

### ⚡ Performance-Aware Architecture
- Efficient widget rendering
- Lazy loading for large datasets
- Optimized list views with cache extent
- Smooth animations with configurable durations
- Memory-efficient data structures

## Project Structure

```
lib/
├── core/
│   ├── config/          # App configuration
│   ├── constants/       # Constants and enums
│   ├── routing/         # Navigation setup
│   ├── theme/           # Theme configuration
│   └── utils/           # Utility functions
├── features/
│   ├── dashboard/       # Main dashboard feature
│   │   ├── screens/
│   │   └── widgets/
│   ├── analytics/       # Detailed analytics feature
│   │   ├── screens/
│   │   └── widgets/
│   └── settings/        # App settings feature
│       └── screens/
└── shared/
    ├── models/          # Data models
    ├── providers/       # Riverpod providers
    ├── services/        # API and WebSocket services
    └── widgets/         # Reusable UI components
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/moyinoluwalogo/atlas-dashboard.git
cd atlas-dashboard
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Building for Production

```bash
# Build for Android
flutter build apk --release

# Build for iOS
flutter build ios --release

# Build for Web
flutter build web --release

# Build for Desktop (Windows/macOS/Linux)
flutter build windows --release
flutter build macos --release
flutter build linux --release
```

## Configuration

### API Configuration

Update the API endpoints in `lib/core/config/app_config.dart`:

```dart
static const String baseUrl = 'https://your-api.com';
static const String wsUrl = 'wss://your-api.com/ws';
```

### Theme Customization

Customize colors and theme in `lib/core/theme/app_theme.dart`:

```dart
static const Color primaryColor = Color(0xFF2196F3);
static const Color secondaryColor = Color(0xFF00BCD4);
```

## Key Technologies

- **Flutter**: Cross-platform UI framework
- **Riverpod**: State management solution
- **FL Chart**: Chart library for data visualization
- **Go Router**: Declarative routing
- **WebSocket**: Real-time data communication
- **HTTP**: REST API integration

## Architecture

### State Management
The app uses Riverpod for state management, providing:
- Type-safe provider system
- Compile-time safety
- Better testability
- Automatic disposal of resources

### Data Layer
- **Models**: Immutable data classes with JSON serialization
- **Services**: API and WebSocket communication
- **Providers**: State and data providers for the UI layer

### UI Layer
- **Screens**: Full-page views for each feature
- **Widgets**: Reusable, composable UI components
- **Theme**: Centralized theming system

## API Integration

### REST API
The app expects the following endpoints:

- `GET /metrics` - Fetch current metrics
- `GET /timeseries?start={date}&end={date}` - Fetch time series data
- `GET /analytics/summary` - Fetch analytics summary

### WebSocket
The app connects to WebSocket for real-time updates:

```json
{
  "type": "metric",
  "payload": {
    "id": "1",
    "title": "Active Users",
    "value": 1234,
    "change": 12.5,
    "unit": "users",
    "timestamp": "2024-01-01T00:00:00Z",
    "trend": "up"
  }
}
```

## Development

### Code Style
The project follows Flutter's official style guide and uses:
- `analysis_options.yaml` for linting rules
- `flutter_lints` package
- Consistent naming conventions

### Adding New Features

1. Create feature directory in `lib/features/`
2. Add screens and widgets
3. Create necessary providers
4. Update routing in `app_router.dart`
5. Add tests

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework
- FL Chart for beautiful charts
- Riverpod for excellent state management

## Support

For support, please open an issue in the GitHub repository.

---

Made with ❤️ using Flutter
