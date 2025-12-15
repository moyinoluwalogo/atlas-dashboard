import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/config/app_config.dart';
import '../models/metric_data.dart';
import '../models/chart_data.dart';

/// API service for fetching analytics data
class AnalyticsApiService {
  final http.Client _client;
  final String _baseUrl;

  AnalyticsApiService({
    http.Client? client,
    String? baseUrl,
  })  : _client = client ?? http.Client(),
        _baseUrl = baseUrl ?? AppConfig.baseUrl;

  /// Fetch current metrics
  Future<List<MetricData>> fetchMetrics() async {
    try {
      final response = await _client
          .get(
            Uri.parse('$_baseUrl/metrics'),
          )
          .timeout(AppConfig.apiTimeout);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List;
        return data.map((json) => MetricData.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to fetch metrics: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching metrics: $e');
    }
  }

  /// Fetch time series data
  Future<List<TimeSeriesData>> fetchTimeSeries({
    required DateTime startDate,
    required DateTime endDate,
    String? metricId,
  }) async {
    try {
      final queryParams = {
        'start': startDate.toIso8601String(),
        'end': endDate.toIso8601String(),
        if (metricId != null) 'metric_id': metricId,
      };

      final uri = Uri.parse('$_baseUrl/timeseries').replace(
        queryParameters: queryParams,
      );

      final response = await _client
          .get(uri)
          .timeout(AppConfig.apiTimeout);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List;
        return data.map((json) => TimeSeriesData.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to fetch time series: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching time series: $e');
    }
  }

  /// Fetch analytics summary
  Future<Map<String, dynamic>> fetchAnalyticsSummary() async {
    try {
      final response = await _client
          .get(
            Uri.parse('$_baseUrl/analytics/summary'),
          )
          .timeout(AppConfig.apiTimeout);

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to fetch analytics summary: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching analytics summary: $e');
    }
  }

  /// Clean up resources
  void dispose() {
    _client.close();
  }
}
