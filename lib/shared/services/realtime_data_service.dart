import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../core/config/app_config.dart';
import '../models/metric_data.dart';
import '../models/chart_data.dart';

/// Real-time data service using WebSocket
class RealtimeDataService {
  WebSocketChannel? _channel;
  final StreamController<MetricData> _metricsController = StreamController.broadcast();
  final StreamController<TimeSeriesData> _timeSeriesController = StreamController.broadcast();
  
  Stream<MetricData> get metricsStream => _metricsController.stream;
  Stream<TimeSeriesData> get timeSeriesStream => _timeSeriesController.stream;
  
  bool _isConnected = false;
  bool get isConnected => _isConnected;

  /// Connect to WebSocket server
  Future<void> connect() async {
    try {
      _channel = WebSocketChannel.connect(
        Uri.parse(AppConfig.wsUrl),
      );
      
      _isConnected = true;
      
      _channel!.stream.listen(
        _handleMessage,
        onError: _handleError,
        onDone: _handleDisconnect,
      );
    } catch (e) {
      _isConnected = false;
      rethrow;
    }
  }

  /// Handle incoming WebSocket messages
  void _handleMessage(dynamic message) {
    try {
      final data = jsonDecode(message as String) as Map<String, dynamic>;
      final type = data['type'] as String;
      
      switch (type) {
        case 'metric':
          final metric = MetricData.fromJson(data['payload'] as Map<String, dynamic>);
          _metricsController.add(metric);
          break;
        case 'timeseries':
          final timeSeries = TimeSeriesData.fromJson(data['payload'] as Map<String, dynamic>);
          _timeSeriesController.add(timeSeries);
          break;
      }
    } catch (e) {
      // Handle parsing errors
      _handleError(e);
    }
  }

  /// Handle WebSocket errors
  void _handleError(dynamic error) {
    _isConnected = false;
    // Log error or handle reconnection logic
  }

  /// Handle WebSocket disconnection
  void _handleDisconnect() {
    _isConnected = false;
    // Implement reconnection logic if needed
  }

  /// Send message to WebSocket server
  void send(Map<String, dynamic> message) {
    if (_isConnected && _channel != null) {
      _channel!.sink.add(jsonEncode(message));
    }
  }

  /// Disconnect from WebSocket server
  Future<void> disconnect() async {
    _isConnected = false;
    await _channel?.sink.close();
    _channel = null;
  }

  /// Clean up resources
  void dispose() {
    disconnect();
    _metricsController.close();
    _timeSeriesController.close();
  }
}
