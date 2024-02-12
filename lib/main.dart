import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/light_theme.dart';
import 'package:resto_admin/features/authentication/presentation/pages/homepage.dart';

void main() {
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      theme: ref.watch(lightThemeProvider),
      title: 'Flutter SAMPLEEEE',
      home: const HomePage(),
    );
  }
}
