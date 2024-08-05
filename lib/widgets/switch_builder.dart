import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/provider/theme_provider.dart';

class SwitchBuilder extends ConsumerWidget {
  const SwitchBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    return Switch(
      thumbIcon: WidgetStateProperty.all(
        Icon(
          color: isDarkMode ? Colors.black : Colors.white,
          isDarkMode ? Icons.dark_mode : Icons.light_mode,
        ),
      ),
      activeColor: isDarkMode ? Colors.white : Colors.black,
      inactiveThumbColor: isDarkMode ? Colors.white : Colors.black,
      value: isDarkMode,
      onChanged: (value) {
        ref.read(themeProvider.notifier).toggleTheme(value);
      },
    );
  }
}
