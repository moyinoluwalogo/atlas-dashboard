import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/theme/app_theme.dart';

/// Data point for bar chart
class BarChartDataPoint {
  final String label;
  final double value;
  final Color? color;

  const BarChartDataPoint({
    required this.label,
    required this.value,
    this.color,
  });
}

/// Custom bar chart widget
class CustomBarChart extends StatelessWidget {
  final List<BarChartDataPoint> data;
  final String? title;
  final bool showValues;
  final bool showGrid;

  const CustomBarChart({
    super.key,
    required this.data,
    this.title,
    this.showValues = true,
    this.showGrid = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title!,
              style: theme.textTheme.titleLarge,
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BarChart(
              _buildBarChartData(theme),
              swapAnimationDuration: const Duration(milliseconds: 250),
            ),
          ),
        ),
      ],
    );
  }

  BarChartData _buildBarChartData(ThemeData theme) {
    return BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: _getMaxY(),
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '${data[group.x.toInt()].label}\n${rod.toY.toStringAsFixed(1)}',
              theme.textTheme.bodySmall!.copyWith(color: Colors.white),
            );
          },
        ),
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
              final index = value.toInt();
              if (index >= 0 && index < data.length) {
                return Text(
                  data[index].label,
                  style: theme.textTheme.bodySmall,
                );
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
      gridData: FlGridData(
        show: showGrid,
        drawVerticalLine: false,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: theme.dividerColor.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.2),
        ),
      ),
      barGroups: data.asMap().entries.map((entry) {
        final index = entry.key;
        final point = entry.value;
        
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: point.value,
              color: point.color ?? AppTheme.chartColors[index % AppTheme.chartColors.length],
              width: 16,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
          ],
          showingTooltipIndicators: showValues ? [0] : [],
        );
      }).toList(),
    );
  }

  double _getMaxY() {
    if (data.isEmpty) return 100;
    final maxValue = data.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    return maxValue * 1.2;
  }
}
