import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metric_data.dart';
import '../services/analytics_api_service.dart';
import '../services/realtime_data_service.dart';

/// Provider for Analytics API Service
final analyticsApiServiceProvider = Provider<AnalyticsApiService>((ref) {
  return AnalyticsApiService();
});

/// Provider for Realtime Data Service
final realtimeDataServiceProvider = Provider<RealtimeDataService>((ref) {
  final service = RealtimeDataService();
  ref.onDispose(() => service.dispose());
  return service;
});

/// Provider for metrics data
final metricsProvider = FutureProvider<List<MetricData>>((ref) async {
  final apiService = ref.watch(analyticsApiServiceProvider);
  return apiService.fetchMetrics();
});

/// Provider for realtime metrics stream
final realtimeMetricsProvider = StreamProvider<MetricData>((ref) {
  final realtimeService = ref.watch(realtimeDataServiceProvider);
  
  // Initialize connection if not connected
  if (!realtimeService.isConnected) {
    realtimeService.connect();
  }
  
  return realtimeService.metricsStream;
});

/// Provider for dashboard refresh trigger
final refreshTriggerProvider = StateProvider<int>((ref) => 0);

/// Provider to manually trigger data refresh
void refreshDashboard(WidgetRef ref) {
  ref.read(refreshTriggerProvider.notifier).state++;
}
