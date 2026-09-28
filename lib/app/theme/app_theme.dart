import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme(BuildContext context) {
    final colorScheme = ColorScheme.fromSwatch(
      primarySwatch: AppColors.primary,
      accentColor: AppColors.accent.shade500,
      backgroundColor: AppColors.background,
    ).copyWith(onPrimary: Colors.white);

    return ThemeData(
      useMaterial3: true,
      primarySwatch: AppColors.primary,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,

      textTheme: GoogleFonts.nunitoTextTheme(),
      fontFamily: GoogleFonts.nunito().fontFamily,

      dividerTheme: const DividerThemeData(
        color: Colors.grey,
        thickness: 1,
        space: 0,
      ),

      cardTheme: const CardThemeData(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: MediaQuery.textScalerOf(context).scale(16),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hintStyle: TextStyle(
          color: AppColors.text.shade300,
          fontWeight: FontWeight.w400,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColors.primary, width: 2.5),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: _MaterialStateExtender<Color>(
            defaultValue: AppColors.primary.shade700,
            states: {
              WidgetState.pressed: AppColors.primary.shade500,
              WidgetState.focused: AppColors.primary.shade300,
              WidgetState.hovered: AppColors.primary.shade400,
            },
          ),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        centerTitle: true,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
          fontSize: MediaQuery.textScalerOf(context).scale(16),
        ),
      ),
    );
  }
}

class _MaterialStateExtender<T> extends WidgetStateProperty<T> {
  final T defaultValue;
  final Map<WidgetState, T> states;

  _MaterialStateExtender({required this.defaultValue, required this.states});

  @override
  T resolve(Set<WidgetState> states) {
    for (final state in this.states.keys) {
      if (states.contains(state)) return this.states[state]!;
    }
    return defaultValue;
  }
}
