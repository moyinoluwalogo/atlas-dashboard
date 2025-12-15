# Atlas Dashboard Documentation

## Table of Contents

1. [Getting Started](#getting-started)
2. [Architecture](#architecture)
3. [Features](#features)
4. [API Integration](#api-integration)
5. [Customization](#customization)
6. [Testing](#testing)
7. [Deployment](#deployment)

## Getting Started

### Prerequisites

- Flutter SDK 3.0 or higher
- Dart SDK 3.0 or higher
- An IDE with Flutter support (VS Code, Android Studio, IntelliJ)
- Git for version control

### Quick Start

```bash
# Clone the repository
git clone https://github.com/moyinoluwalogo/atlas-dashboard.git

# Navigate to project directory
cd atlas-dashboard

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## Architecture

### Overview

Atlas Dashboard follows a feature-based architecture with clear separation of concerns:

```
├── core/           # Core functionality
├── features/       # Feature modules
└── shared/         # Shared resources
```

### State Management

We use Riverpod for state management because it provides:
- Compile-time safety
- Better testability
- Automatic resource disposal
- Excellent developer experience

### Data Flow

1. **UI Layer**: Widgets consume providers
2. **Provider Layer**: Riverpod providers manage state
3. **Service Layer**: API and WebSocket services
4. **Data Layer**: Models and repositories

## Features

### Dashboard

The main dashboard provides:
- Real-time metric updates
- Key performance indicators
- Quick access to analytics
- Interactive charts

### Analytics

Detailed analytics include:
- Time-series analysis
- Comparative charts
- Custom filters
- Data export (coming soon)

### Settings

Configurable options:
- Theme selection (light/dark/system)
- Data sync preferences
- Notification settings
- Performance options

## API Integration

### REST API

Configure API endpoints in `lib/core/config/app_config.dart`:

```dart
static const String baseUrl = 'https://your-api.com';
```

Expected endpoints:
- `GET /metrics` - Current metrics
- `GET /timeseries` - Historical data
- `GET /analytics/summary` - Summary data

### WebSocket

Real-time updates via WebSocket:

```dart
static const String wsUrl = 'wss://your-api.com/ws';
```

Message format:
```json
{
  "type": "metric",
  "payload": { ... }
}
```

## Customization

### Theming

Modify colors in `lib/core/theme/app_theme.dart`:

```dart
static const Color primaryColor = Color(0xFF2196F3);
static const Color secondaryColor = Color(0xFF00BCD4);
```

### Adding Charts

1. Import chart widget
2. Prepare data model
3. Add to screen
4. Configure appearance

Example:
```dart
TimeSeriesLineChart(
  data: yourData,
  showLegend: true,
  showGrid: true,
)
```

### Custom Widgets

Create reusable widgets in `lib/shared/widgets/`:

```dart
class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(...);
  }
}
```

## Testing

### Unit Tests

Test models and utilities:
```bash
flutter test test/models/
flutter test test/utils/
```

### Widget Tests

Test UI components:
```bash
flutter test test/widgets/
```

### Integration Tests

Full app testing:
```bash
flutter test integration_test/
```

### Coverage

Generate coverage report:
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## Deployment

### Android

```bash
# Debug build
flutter build apk

# Release build
flutter build apk --release

# App bundle
flutter build appbundle --release
```

### iOS

```bash
# Debug build
flutter build ios

# Release build
flutter build ios --release
```

### Web

```bash
# Build for web
flutter build web --release

# Configure base href
flutter build web --release --base-href /your-app/
```

### Desktop

```bash
# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release
```

## Performance Tips

1. **Lazy Loading**: Use `ListView.builder` for large lists
2. **Const Widgets**: Mark widgets as const when possible
3. **Caching**: Enable caching for frequently accessed data
4. **Image Optimization**: Use optimized image formats
5. **Code Splitting**: Load features on demand

## Troubleshooting

### Common Issues

**Flutter not found**
```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

**Dependencies error**
```bash
flutter clean
flutter pub get
```

**Build issues**
```bash
flutter clean
flutter pub get
flutter run
```

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Riverpod Documentation](https://riverpod.dev)
- [FL Chart Documentation](https://github.com/imaNNeo/fl_chart)

## Support

- GitHub Issues: Report bugs and request features
- Discussions: Ask questions and share ideas
- Email: Contact maintainers directly

---

Last updated: 2024-12-15
