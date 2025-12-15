import 'package:flutter/material.dart';

/// Analytics filters widget
class AnalyticsFilters extends StatelessWidget {
  final String selectedPeriod;
  final String selectedMetric;
  final ValueChanged<String> onPeriodChanged;
  final ValueChanged<String> onMetricChanged;

  const AnalyticsFilters({
    super.key,
    required this.selectedPeriod,
    required this.selectedMetric,
    required this.onPeriodChanged,
    required this.onMetricChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filters',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time Period',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedPeriod,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(value: '1d', child: Text('Last 24 Hours')),
                        DropdownMenuItem(value: '7d', child: Text('Last 7 Days')),
                        DropdownMenuItem(value: '30d', child: Text('Last 30 Days')),
                        DropdownMenuItem(value: '90d', child: Text('Last 90 Days')),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          onPeriodChanged(value);
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Metric Type',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedMetric,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(value: 'all', child: Text('All Metrics')),
                        DropdownMenuItem(value: 'users', child: Text('Users')),
                        DropdownMenuItem(value: 'revenue', child: Text('Revenue')),
                        DropdownMenuItem(value: 'performance', child: Text('Performance')),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          onMetricChanged(value);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
