import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/theme/app_theme.dart';
import '../models/metric_data.dart';
import 'package:intl/intl.dart';

/// Metric card widget for displaying key metrics
class MetricCard extends StatelessWidget {
  final MetricData metric;
  final VoidCallback? onTap;

  const MetricCard({
    super.key,
    required this.metric,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trendColor = _getTrendColor(metric.trend);
    final trendIcon = _getTrendIcon(metric.trend);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    metric.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    trendIcon,
                    color: trendColor,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    NumberFormat('#,##0.##').format(metric.value),
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      metric.unit,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    metric.change >= 0
                        ? FontAwesomeIcons.arrowUp
                        : FontAwesomeIcons.arrowDown,
                    size: 12,
                    color: trendColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${metric.change >= 0 ? '+' : ''}${metric.change.toStringAsFixed(1)}%',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: trendColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _formatTimestamp(metric.timestamp),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTrendColor(MetricTrend trend) {
    switch (trend) {
      case MetricTrend.up:
        return AppTheme.successColor;
      case MetricTrend.down:
        return AppTheme.errorColor;
      case MetricTrend.stable:
        return AppTheme.warningColor;
    }
  }

  IconData _getTrendIcon(MetricTrend trend) {
    switch (trend) {
      case MetricTrend.up:
        return FontAwesomeIcons.arrowTrendUp;
      case MetricTrend.down:
        return FontAwesomeIcons.arrowTrendDown;
      case MetricTrend.stable:
        return FontAwesomeIcons.minus;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else {
      return DateFormat('MMM d, HH:mm').format(timestamp);
    }
  }
}
