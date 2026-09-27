import 'package:flutter/material.dart';

class AppTheme{
    AppTheme._();
    static const Color primaryColor = Color(0xFF1E88E5);
    static const Color secondaryColor = Color(0xFF43A047);
    static const Color errorColor = Color(0xFFE53935);
    static const Color backgroundColor = Color(0xFFF5F7FA);
    static const Color surfaceColor = Colors.white;

    static ThemeData get LightTheme {
        final colourScheme = ColorScheme.light(
            seedColor: primaryColor,
            primary: primaryColor,
            secondary: secondaryColor,
            error: errorColor,
            surface: surfaceColor,
        );
        return ThemeData(
            useMaterial3: true,
            colorScheme: colorScheme,
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 0,
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(52),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                    ),
                ),
            ),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                ),
            ),
        );
    }
}