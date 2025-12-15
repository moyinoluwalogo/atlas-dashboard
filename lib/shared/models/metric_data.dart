/// Metric data model for dashboard analytics
class MetricData {
  final String id;
  final String title;
  final double value;
  final double change;
  final String unit;
  final DateTime timestamp;
  final MetricTrend trend;

  const MetricData({
    required this.id,
    required this.title,
    required this.value,
    required this.change,
    required this.unit,
    required this.timestamp,
    required this.trend,
  });

  factory MetricData.fromJson(Map<String, dynamic> json) {
    return MetricData(
      id: json['id'] as String,
      title: json['title'] as String,
      value: (json['value'] as num).toDouble(),
      change: (json['change'] as num).toDouble(),
      unit: json['unit'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      trend: MetricTrend.values.firstWhere(
        (e) => e.name == json['trend'],
        orElse: () => MetricTrend.stable,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'change': change,
      'unit': unit,
      'timestamp': timestamp.toIso8601String(),
      'trend': trend.name,
    };
  }
}

enum MetricTrend {
  up,
  down,
  stable,
}
