import 'package:intl/intl.dart';

/// Utility class for formatting values
class FormatUtils {
  /// Format number with thousand separators
  static String formatNumber(num value, {int decimals = 0}) {
    final formatter = NumberFormat('#,##0${decimals > 0 ? '.' + ('0' * decimals) : ''}');
    return formatter.format(value);
  }

  /// Format currency
  static String formatCurrency(num value, {String symbol = '\$', int decimals = 2}) {
    final formatted = formatNumber(value, decimals: decimals);
    return '$symbol$formatted';
  }

  /// Format percentage
  static String formatPercentage(num value, {int decimals = 1, bool includeSign = false}) {
    final sign = includeSign && value > 0 ? '+' : '';
    return '$sign${value.toStringAsFixed(decimals)}%';
  }

  /// Format large numbers with K, M, B suffixes
  static String formatCompact(num value) {
    if (value >= 1000000000) {
      return '${(value / 1000000000).toStringAsFixed(1)}B';
    } else if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }
    return value.toString();
  }

  /// Format date and time
  static String formatDateTime(DateTime dateTime, {String? format}) {
    final formatter = DateFormat(format ?? 'MMM d, yyyy HH:mm');
    return formatter.format(dateTime);
  }

  /// Format relative time (e.g., "2 hours ago")
  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return DateFormat('MMM d').format(dateTime);
    }
  }

  /// Format duration
  static String formatDuration(Duration duration) {
    if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ${duration.inSeconds % 60}s';
    } else {
      return '${duration.inSeconds}s';
    }
  }
}
