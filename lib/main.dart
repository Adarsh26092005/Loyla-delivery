import 'package:flutter/material.dart';

import 'app/theme/app_theme.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const LoylaDeliveryApp());
}

class LoylaDeliveryApp extends StatelessWidget {
  const LoylaDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loyla Delivery',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      home: const SplashScreen(),
    );
  }
}
