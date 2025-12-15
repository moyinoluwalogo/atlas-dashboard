import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';

/// Settings screen for app configuration
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildSection(
            context,
            title: 'Appearance',
            children: [
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Theme Mode'),
                subtitle: Text(_getThemeModeLabel(themeMode)),
                trailing: SegmentedButton<ThemeMode>(
                  segments: const [
                    ButtonSegment(
                      value: ThemeMode.light,
                      icon: Icon(Icons.light_mode, size: 16),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      icon: Icon(Icons.dark_mode, size: 16),
                    ),
                    ButtonSegment(
                      value: ThemeMode.system,
                      icon: Icon(Icons.settings, size: 16),
                    ),
                  ],
                  selected: {themeMode},
                  onSelectionChanged: (Set<ThemeMode> newSelection) {
                    ref.read(themeModeProvider.notifier).state = newSelection.first;
                  },
                ),
              ),
            ],
          ),
          const Divider(),
          _buildSection(
            context,
            title: 'Data',
            children: [
              SwitchListTile(
                secondary: const Icon(Icons.cloud_sync),
                title: const Text('Auto Sync'),
                subtitle: const Text('Automatically sync data in background'),
                value: true,
                onChanged: (value) {
                  // Handle auto sync toggle
                },
              ),
              SwitchListTile(
                secondary: const Icon(Icons.storage),
                title: const Text('Cache Data'),
                subtitle: const Text('Store data locally for offline access'),
                value: true,
                onChanged: (value) {
                  // Handle cache toggle
                },
              ),
              ListTile(
                leading: const Icon(Icons.refresh),
                title: const Text('Refresh Interval'),
                subtitle: const Text('Every 5 seconds'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Show refresh interval dialog
                },
              ),
            ],
          ),
          const Divider(),
          _buildSection(
            context,
            title: 'Notifications',
            children: [
              SwitchListTile(
                secondary: const Icon(Icons.notifications),
                title: const Text('Push Notifications'),
                subtitle: const Text('Receive updates and alerts'),
                value: true,
                onChanged: (value) {
                  // Handle notifications toggle
                },
              ),
              SwitchListTile(
                secondary: const Icon(Icons.warning),
                title: const Text('Alert Notifications'),
                subtitle: const Text('Get notified about critical alerts'),
                value: true,
                onChanged: (value) {
                  // Handle alert notifications toggle
                },
              ),
            ],
          ),
          const Divider(),
          _buildSection(
            context,
            title: 'Performance',
            children: [
              SwitchListTile(
                secondary: const Icon(Icons.speed),
                title: const Text('Performance Monitoring'),
                subtitle: const Text('Track app performance metrics'),
                value: true,
                onChanged: (value) {
                  // Handle performance monitoring toggle
                },
              ),
              SwitchListTile(
                secondary: const Icon(Icons.animation),
                title: const Text('Animations'),
                subtitle: const Text('Enable smooth transitions and effects'),
                value: true,
                onChanged: (value) {
                  // Handle animations toggle
                },
              ),
            ],
          ),
          const Divider(),
          _buildSection(
            context,
            title: 'About',
            children: [
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Version'),
                subtitle: const Text('1.0.0'),
              ),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Show privacy policy
                },
              ),
              ListTile(
                leading: const Icon(Icons.gavel),
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Show terms of service
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle logout
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout functionality coming soon')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Logout'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ...children,
      ],
    );
  }

  String _getThemeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }
}
