import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/theme/app_theme.dart';
import '../models/chart_data.dart';

/// Line chart widget for time series data
class TimeSeriesLineChart extends StatelessWidget {
  final List<TimeSeriesData> data;
  final bool showLegend;
  final bool showGrid;
  final double? minY;
  final double? maxY;

  const TimeSeriesLineChart({
    super.key,
    required this.data,
    this.showLegend = true,
    this.showGrid = true,
    this.minY,
    this.maxY,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        if (showLegend) _buildLegend(theme),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: LineChart(
              _buildLineChartData(theme),
              duration: const Duration(milliseconds: 250),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLegend(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Wrap(
        spacing: 16,
        runSpacing: 8,
        children: data.map((series) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _parseColor(series.color),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                series.name,
                style: theme.textTheme.bodySmall,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  LineChartData _buildLineChartData(ThemeData theme) {
    return LineChartData(
      minY: minY,
      maxY: maxY,
      lineBarsData: data.asMap().entries.map((entry) {
        final index = entry.key;
        final series = entry.value;
        
        return LineChartBarData(
          spots: series.data
              .asMap()
              .entries
              .map((e) => FlSpot(
                    e.key.toDouble(),
                    e.value.value,
                  ))
              .toList(),
          isCurved: true,
          color: _parseColor(series.color),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: series.data.length < 20,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: _parseColor(series.color).withOpacity(0.1),
          ),
        );
      }).toList(),
      gridData: FlGridData(
        show: showGrid,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: theme.dividerColor.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: theme.dividerColor.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: theme.textTheme.bodySmall,
              );
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: (value, meta) {
              if (data.isEmpty || data.first.data.isEmpty) {
                return const SizedBox();
              }
              
              final index = value.toInt();
              if (index >= 0 && index < data.first.data.length) {
                final label = data.first.data[index].label;
                if (label != null) {
                  return Text(
                    label,
                    style: theme.textTheme.bodySmall,
                  );
                }
              }
              return const SizedBox();
            },
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.2),
        ),
      ),
    );
  }

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return AppTheme.primaryColor;
    }
  }
}
