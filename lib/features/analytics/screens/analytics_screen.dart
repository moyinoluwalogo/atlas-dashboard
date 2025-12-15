import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/time_series_chart.dart';
import '../../../shared/widgets/bar_chart.dart';
import '../../../shared/models/chart_data.dart';
import '../widgets/analytics_filters.dart';

/// Analytics screen with detailed charts and insights
class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> {
  String _selectedPeriod = '7d';
  String _selectedMetric = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              // Export functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Export functionality coming soon')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnalyticsFilters(
              selectedPeriod: _selectedPeriod,
              selectedMetric: _selectedMetric,
              onPeriodChanged: (value) {
                setState(() {
                  _selectedPeriod = value;
                });
              },
              onMetricChanged: (value) {
                setState(() {
                  _selectedMetric = value;
                });
              },
            ),
            const SizedBox(height: 24),
            _buildAnalyticsSection(
              context,
              title: 'Trend Analysis',
              child: SizedBox(
                height: 350,
                child: TimeSeriesLineChart(
                  data: _getAnalyticsData(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildAnalyticsSection(
              context,
              title: 'Comparative Analysis',
              child: SizedBox(
                height: 350,
                child: CustomBarChart(
                  data: _getComparativeData(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildInsightsSection(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsSection(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Card(child: child),
        ],
      ),
    );
  }

  Widget _buildInsightsSection(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Insights',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildInsightItem(
                    icon: Icons.trending_up,
                    title: 'User Growth',
                    description: 'User base increased by 23% this week',
                    color: Colors.green,
                  ),
                  const Divider(height: 24),
                  _buildInsightItem(
                    icon: Icons.warning_amber,
                    title: 'Performance Alert',
                    description: 'Response time increased by 12% in the last 24h',
                    color: Colors.orange,
                  ),
                  const Divider(height: 24),
                  _buildInsightItem(
                    icon: Icons.star,
                    title: 'Top Performing',
                    description: 'Mobile platform shows highest engagement',
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightItem({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<TimeSeriesData> _getAnalyticsData() {
    final now = DateTime.now();
    
    return [
      TimeSeriesData(
        id: '1',
        name: 'Active Users',
        color: '#2196F3',
        data: List.generate(
          15,
          (i) => ChartDataPoint(
            timestamp: now.subtract(Duration(days: 15 - i)),
            value: 1000 + (i * 50) + ((i % 3) * 30),
            label: i % 3 == 0 ? '${15 - i}d' : null,
          ),
        ),
      ),
      TimeSeriesData(
        id: '2',
        name: 'Sessions',
        color: '#4CAF50',
        data: List.generate(
          15,
          (i) => ChartDataPoint(
            timestamp: now.subtract(Duration(days: 15 - i)),
            value: 1500 + (i * 70) + ((i % 2) * 40),
          ),
        ),
      ),
      TimeSeriesData(
        id: '3',
        name: 'Revenue',
        color: '#FF9800',
        data: List.generate(
          15,
          (i) => ChartDataPoint(
            timestamp: now.subtract(Duration(days: 15 - i)),
            value: 800 + (i * 40) + ((i % 4) * 25),
          ),
        ),
      ),
    ];
  }

  List<BarChartDataPoint> _getComparativeData() {
    return const [
      BarChartDataPoint(label: 'Web', value: 145),
      BarChartDataPoint(label: 'Mobile', value: 198),
      BarChartDataPoint(label: 'Tablet', value: 87),
      BarChartDataPoint(label: 'Desktop', value: 132),
      BarChartDataPoint(label: 'Other', value: 45),
    ];
  }
}
