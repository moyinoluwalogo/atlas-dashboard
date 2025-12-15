/// Application constants
class AppConstants {
  // API Endpoints
  static const String apiMetrics = '/metrics';
  static const String apiTimeSeries = '/timeseries';
  static const String apiAnalytics = '/analytics/summary';
  
  // Storage Keys
  static const String keyThemeMode = 'theme_mode';
  static const String keyAutoSync = 'auto_sync';
  static const String keyCacheEnabled = 'cache_enabled';
  
  // Chart Configuration
  static const int maxChartDataPoints = 100;
  static const double chartAnimationDuration = 0.3;
  
  // Colors
  static const String colorPrimary = '#2196F3';
  static const String colorSecondary = '#00BCD4';
  static const String colorSuccess = '#4CAF50';
  static const String colorWarning = '#FFC107';
  static const String colorError = '#F44336';
  
  // Date Formats
  static const String dateFormatFull = 'yyyy-MM-dd HH:mm:ss';
  static const String dateFormatShort = 'MMM d, HH:mm';
  static const String dateFormatDate = 'yyyy-MM-dd';
}
