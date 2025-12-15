import 'package:flutter/material.dart';
import '../../../shared/widgets/time_series_chart.dart';
import '../../../shared/widgets/bar_chart.dart';
import '../../../shared/models/chart_data.dart';

/// Dashboard chart section with sample data
class DashboardChartSection extends StatelessWidget {
  const DashboardChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Performance Overview',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: 300,
            child: TimeSeriesLineChart(
              data: _getSampleTimeSeriesData(),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Category Breakdown',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: 300,
            child: CustomBarChart(
              data: _getSampleBarChartData(),
            ),
          ),
        ),
      ],
    );
  }

  List<TimeSeriesData> _getSampleTimeSeriesData() {
    final now = DateTime.now();
    
    return [
      TimeSeriesData(
        id: '1',
        name: 'Users',
        color: '#2196F3',
        data: List.generate(
          10,
          (i) => ChartDataPoint(
            timestamp: now.subtract(Duration(hours: 10 - i)),
            value: 100 + (i * 10) + (i % 2 == 0 ? 5 : -5),
            label: i % 2 == 0 ? '${10 - i}h' : null,
          ),
        ),
      ),
      TimeSeriesData(
        id: '2',
        name: 'Revenue',
        color: '#4CAF50',
        data: List.generate(
          10,
          (i) => ChartDataPoint(
            timestamp: now.subtract(Duration(hours: 10 - i)),
            value: 80 + (i * 8) + (i % 3 == 0 ? 10 : 0),
          ),
        ),
      ),
    ];
  }

  List<BarChartDataPoint> _getSampleBarChartData() {
    return const [
      BarChartDataPoint(label: 'Mon', value: 85),
      BarChartDataPoint(label: 'Tue', value: 92),
      BarChartDataPoint(label: 'Wed', value: 78),
      BarChartDataPoint(label: 'Thu', value: 95),
      BarChartDataPoint(label: 'Fri', value: 88),
      BarChartDataPoint(label: 'Sat', value: 70),
      BarChartDataPoint(label: 'Sun', value: 65),
    ];
  }
}
