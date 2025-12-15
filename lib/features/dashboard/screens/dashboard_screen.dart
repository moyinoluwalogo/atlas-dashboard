import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/app_router.dart';
import '../../../shared/providers/data_providers.dart';
import '../../../shared/widgets/metric_card.dart';
import '../../../shared/widgets/common_widgets.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_chart_section.dart';

/// Main dashboard screen
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final metricsAsync = ref.watch(metricsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atlas Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              refreshDashboard(ref);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push(AppRouter.settings);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          refreshDashboard(ref);
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardHeader(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Key Metrics',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 12),
              _buildMetricsSection(metricsAsync),
              const SizedBox(height: 24),
              const DashboardChartSection(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          
          switch (index) {
            case 0:
              context.go(AppRouter.dashboard);
              break;
            case 1:
              context.go(AppRouter.analytics);
              break;
            case 2:
              context.go(AppRouter.settings);
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsSection(AsyncValue metricsAsync) {
    return metricsAsync.when(
      data: (metrics) {
        if (metrics.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: EmptyState(
              message: 'No metrics available',
              icon: Icons.bar_chart,
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: metrics.length,
            itemBuilder: (context, index) {
              return MetricCard(
                metric: metrics[index],
                onTap: () {
                  context.push(AppRouter.analytics);
                },
              );
            },
          ),
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.all(48.0),
        child: LoadingIndicator(message: 'Loading metrics...'),
      ),
      error: (error, stack) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ErrorDisplay(
          message: error.toString(),
          onRetry: () => refreshDashboard(ref),
        ),
      ),
    );
  }
}
