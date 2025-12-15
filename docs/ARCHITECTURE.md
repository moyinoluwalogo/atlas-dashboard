# Atlas Dashboard Architecture

## System Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                     ATLAS DASHBOARD                          │
│                  Flutter Application                         │
└─────────────────────────────────────────────────────────────┘
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
        ▼                   ▼                   ▼
┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│  Dashboard   │   │  Analytics   │   │   Settings   │
│   Feature    │   │   Feature    │   │   Feature    │
└──────────────┘   └──────────────┘   └──────────────┘
        │                   │                   │
        └───────────────────┼───────────────────┘
                            │
                            ▼
        ┌───────────────────────────────────────┐
        │      SHARED COMPONENTS LAYER          │
        │                                       │
        │  ┌─────────┐  ┌─────────┐           │
        │  │ Widgets │  │ Models  │           │
        │  └─────────┘  └─────────┘           │
        │                                       │
        │  ┌─────────┐  ┌──────────┐          │
        │  │Services │  │Providers │          │
        │  └─────────┘  └──────────┘          │
        └───────────────────────────────────────┘
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
        ▼                   ▼                   ▼
┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│  REST API    │   │  WebSocket   │   │Local Storage │
│   Service    │   │   Service    │   │   Service    │
└──────────────┘   └──────────────┘   └──────────────┘
        │                   │
        └───────────────────┘
                    │
                    ▼
        ┌────────────────────┐
        │   BACKEND API      │
        │  (Your Server)     │
        └────────────────────┘
```

## Layer Details

### 1. Presentation Layer (UI)

```
Features/
├── Dashboard Feature
│   ├── DashboardScreen
│   ├── DashboardHeader
│   └── DashboardChartSection
│
├── Analytics Feature
│   ├── AnalyticsScreen
│   └── AnalyticsFilters
│
└── Settings Feature
    └── SettingsScreen
```

**Responsibilities:**
- Display data to users
- Handle user interactions
- Navigate between screens
- Show loading/error states

### 2. Shared Components Layer

```
Shared/
├── Widgets/
│   ├── MetricCard (KPI display)
│   ├── TimeSeriesLineChart (trends)
│   ├── CustomBarChart (comparisons)
│   └── CommonWidgets (loading, errors)
│
├── Models/
│   ├── MetricData (business data)
│   └── ChartData (visualization data)
│
├── Providers/ (Riverpod)
│   ├── metricsProvider
│   ├── realtimeMetricsProvider
│   └── themeModeProvider
│
└── Services/
    ├── AnalyticsApiService (REST)
    └── RealtimeDataService (WebSocket)
```

**Responsibilities:**
- Reusable UI components
- Data models and serialization
- State management
- Business logic

### 3. Core Layer

```
Core/
├── Config/ (app settings)
├── Constants/ (static values)
├── Routing/ (navigation)
├── Theme/ (styling)
└── Utils/ (helpers)
```

**Responsibilities:**
- App-wide configuration
- Centralized theme
- Navigation setup
- Utility functions

### 4. Data Layer

```
Data Sources:
├── REST API
│   └── HTTP requests
├── WebSocket
│   └── Real-time streams
└── Local Storage
    └── Cached data
```

## Data Flow

### Request Flow (REST API)

```
User Action
    │
    ▼
Widget (UI)
    │
    ▼
Provider (State)
    │
    ▼
Service (API)
    │
    ▼
HTTP Request
    │
    ▼
Backend API
    │
    ▼
Response
    │
    ▼
Model Parsing
    │
    ▼
Provider Update
    │
    ▼
UI Rebuild
```

### Real-time Flow (WebSocket)

```
WebSocket Connection
    │
    ▼
Message Received
    │
    ▼
RealtimeDataService
    │
    ▼
Stream Controller
    │
    ▼
Provider Listener
    │
    ▼
UI Update
```

## State Management Architecture

```
┌─────────────────────────────────────┐
│         Riverpod Provider            │
│                                     │
│  ┌───────────────────────────┐     │
│  │   FutureProvider          │     │
│  │   (Async API Calls)       │     │
│  └───────────────────────────┘     │
│                                     │
│  ┌───────────────────────────┐     │
│  │   StreamProvider          │     │
│  │   (Real-time Updates)     │     │
│  └───────────────────────────┘     │
│                                     │
│  ┌───────────────────────────┐     │
│  │   StateProvider           │     │
│  │   (Simple State)          │     │
│  └───────────────────────────┘     │
│                                     │
└─────────────────────────────────────┘
              │
              ▼
    ┌──────────────────┐
    │  Consumer Widget │
    │  (Auto Rebuild)  │
    └──────────────────┘
```

## Component Communication

### Widget to Provider
```dart
// Read value
final metrics = ref.watch(metricsProvider);

// Modify state
ref.read(themeModeProvider.notifier).state = ThemeMode.dark;
```

### Service to Provider
```dart
// Provider creates service
final apiService = ref.watch(analyticsApiServiceProvider);

// Service returns data
return apiService.fetchMetrics();
```

### Provider to Widget
```dart
// Widget consumes provider
ref.watch(metricsProvider).when(
  data: (metrics) => MetricsList(metrics),
  loading: () => LoadingIndicator(),
  error: (err, stack) => ErrorDisplay(err),
);
```

## Routing Architecture

```
go_router
    │
    ├─ / (root)
    │   └─ DashboardScreen
    │
    ├─ /analytics
    │   └─ AnalyticsScreen
    │
    └─ /settings
        └─ SettingsScreen

Navigation Bar
    ├─ Dashboard Tab → /
    ├─ Analytics Tab → /analytics
    └─ Settings Tab → /settings
```

## Theme Architecture

```
AppTheme
    │
    ├─ Light Theme
    │   ├─ Primary Color: #2196F3
    │   ├─ Background: #F5F5F5
    │   └─ Text: #212121
    │
    ├─ Dark Theme
    │   ├─ Primary Color: #2196F3
    │   ├─ Background: #121212
    │   └─ Text: #E0E0E0
    │
    └─ System Theme
        └─ Follows device setting
```

## Performance Optimization Strategy

### 1. Widget Optimization
- ✅ Const constructors
- ✅ Avoid rebuilding entire trees
- ✅ Use Keys for list items
- ✅ Separate stateful parts

### 2. Data Optimization
- ✅ Lazy loading
- ✅ Pagination ready
- ✅ Caching strategy
- ✅ Debouncing

### 3. Rendering Optimization
- ✅ Efficient chart rendering
- ✅ ListView.builder for lists
- ✅ Cached network images ready
- ✅ Reduced opacity layers

## Security Considerations

```
Security Layer
    │
    ├─ API Authentication (ready to add)
    ├─ Secure Storage (ready to add)
    ├─ HTTPS Only
    ├─ Input Validation
    └─ Error Handling (no sensitive data)
```

## Scalability Features

### Horizontal Scalability
- Modular feature structure
- Easy to add new features
- Plugin-ready architecture

### Vertical Scalability
- State management handles complexity
- Service layer abstracts API
- Repository pattern ready

## Testing Strategy

```
Testing Pyramid
    │
    ├─ Unit Tests (70%)
    │   ├─ Models
    │   ├─ Services
    │   └─ Utils
    │
    ├─ Widget Tests (20%)
    │   ├─ Widgets
    │   └─ Screens
    │
    └─ Integration Tests (10%)
        └─ User Flows
```

## Deployment Architecture

```
Source Code (GitHub)
    │
    ▼
CI/CD Pipeline (Ready)
    │
    ├─ Android
    │   └─ Play Store
    │
    ├─ iOS
    │   └─ App Store
    │
    ├─ Web
    │   └─ Hosting (Firebase, etc.)
    │
    └─ Desktop
        ├─ Windows (EXE)
        ├─ macOS (DMG)
        └─ Linux (AppImage)
```

---

This architecture provides:
- ✅ **Separation of Concerns**: Clean layer separation
- ✅ **Scalability**: Easy to add features
- ✅ **Maintainability**: Clear structure
- ✅ **Testability**: All layers can be tested
- ✅ **Performance**: Optimized rendering
- ✅ **Cross-platform**: Single codebase
