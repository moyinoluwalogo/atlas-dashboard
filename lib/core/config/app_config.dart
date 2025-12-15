/// Application configuration constants
class AppConfig {
  static const String appName = 'Atlas Dashboard';
  static const String version = '1.0.0';
  
  // API Configuration
  static const String baseUrl = 'https://api.example.com';
  static const String wsUrl = 'wss://api.example.com/ws';
  
  // Timing Configuration
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration refreshInterval = Duration(seconds: 5);
  static const Duration animationDuration = Duration(milliseconds: 300);
  
  // UI Configuration
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
  static const int maxRetries = 3;
  
  // Chart Configuration
  static const int maxDataPoints = 50;
  static const bool enableAnimations = true;
  
  // Performance Configuration
  static const bool enablePerformanceMonitoring = true;
  static const int listCacheExtent = 500;
}
