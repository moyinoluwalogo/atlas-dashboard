/// Chart data point model
class ChartDataPoint {
  final DateTime timestamp;
  final double value;
  final String? label;
  final Map<String, dynamic>? metadata;

  const ChartDataPoint({
    required this.timestamp,
    required this.value,
    this.label,
    this.metadata,
  });

  factory ChartDataPoint.fromJson(Map<String, dynamic> json) {
    return ChartDataPoint(
      timestamp: DateTime.parse(json['timestamp'] as String),
      value: (json['value'] as num).toDouble(),
      label: json['label'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'value': value,
      if (label != null) 'label': label,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// Time series data model
class TimeSeriesData {
  final String id;
  final String name;
  final List<ChartDataPoint> data;
  final String color;

  const TimeSeriesData({
    required this.id,
    required this.name,
    required this.data,
    required this.color,
  });

  factory TimeSeriesData.fromJson(Map<String, dynamic> json) {
    return TimeSeriesData(
      id: json['id'] as String,
      name: json['name'] as String,
      data: (json['data'] as List)
          .map((e) => ChartDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: json['color'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'data': data.map((e) => e.toJson()).toList(),
      'color': color,
    };
  }
}
