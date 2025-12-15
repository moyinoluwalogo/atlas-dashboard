import 'package:flutter_test/flutter_test.dart';
import 'package:atlas_dashboard/core/utils/format_utils.dart';

void main() {
  group('FormatUtils', () {
    test('formatNumber should format with thousand separators', () {
      expect(FormatUtils.formatNumber(1234567), '1,234,567');
      expect(FormatUtils.formatNumber(1234.567, decimals: 2), '1,234.57');
    });

    test('formatCurrency should format as currency', () {
      expect(FormatUtils.formatCurrency(1234.56), '\$1,234.56');
      expect(FormatUtils.formatCurrency(999, decimals: 0), '\$999');
    });

    test('formatPercentage should format as percentage', () {
      expect(FormatUtils.formatPercentage(12.345), '12.3%');
      expect(FormatUtils.formatPercentage(12.345, includeSign: true), '+12.3%');
      expect(FormatUtils.formatPercentage(-5.5, includeSign: true), '-5.5%');
    });

    test('formatCompact should use K, M, B suffixes', () {
      expect(FormatUtils.formatCompact(999), '999');
      expect(FormatUtils.formatCompact(1500), '1.5K');
      expect(FormatUtils.formatCompact(1500000), '1.5M');
      expect(FormatUtils.formatCompact(1500000000), '1.5B');
    });

    test('formatRelativeTime should format relative time strings', () {
      final now = DateTime.now();
      
      expect(
        FormatUtils.formatRelativeTime(now.subtract(const Duration(seconds: 30))),
        'Just now',
      );
      
      expect(
        FormatUtils.formatRelativeTime(now.subtract(const Duration(minutes: 30))),
        '30m ago',
      );
      
      expect(
        FormatUtils.formatRelativeTime(now.subtract(const Duration(hours: 5))),
        '5h ago',
      );
    });

    test('formatDuration should format durations correctly', () {
      expect(
        FormatUtils.formatDuration(const Duration(hours: 2, minutes: 30)),
        '2h 30m',
      );
      
      expect(
        FormatUtils.formatDuration(const Duration(minutes: 5, seconds: 30)),
        '5m 30s',
      );
      
      expect(
        FormatUtils.formatDuration(const Duration(seconds: 45)),
        '45s',
      );
    });
  });
}
