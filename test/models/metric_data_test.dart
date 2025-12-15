import 'package:flutter_test/flutter_test.dart';
import 'package:atlas_dashboard/shared/models/metric_data.dart';

void main() {
  group('MetricData', () {
    test('should create MetricData instance', () {
      final metric = MetricData(
        id: '1',
        title: 'Users',
        value: 1234.56,
        change: 12.3,
        unit: 'users',
        timestamp: DateTime(2024, 1, 1),
        trend: MetricTrend.up,
      );

      expect(metric.id, '1');
      expect(metric.title, 'Users');
      expect(metric.value, 1234.56);
      expect(metric.change, 12.3);
      expect(metric.unit, 'users');
      expect(metric.trend, MetricTrend.up);
    });

    test('should create MetricData from JSON', () {
      final json = {
        'id': '1',
        'title': 'Users',
        'value': 1234.56,
        'change': 12.3,
        'unit': 'users',
        'timestamp': '2024-01-01T00:00:00.000',
        'trend': 'up',
      };

      final metric = MetricData.fromJson(json);

      expect(metric.id, '1');
      expect(metric.title, 'Users');
      expect(metric.value, 1234.56);
      expect(metric.change, 12.3);
      expect(metric.trend, MetricTrend.up);
    });

    test('should convert MetricData to JSON', () {
      final metric = MetricData(
        id: '1',
        title: 'Users',
        value: 1234.56,
        change: 12.3,
        unit: 'users',
        timestamp: DateTime(2024, 1, 1),
        trend: MetricTrend.up,
      );

      final json = metric.toJson();

      expect(json['id'], '1');
      expect(json['title'], 'Users');
      expect(json['value'], 1234.56);
      expect(json['change'], 12.3);
      expect(json['trend'], 'up');
    });
  });
}
