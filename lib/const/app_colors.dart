import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFFFAFAFE);

  static const MaterialColor primary = MaterialColor(0xFF00CC2D, <int, Color>{
    50: Color(0xFFE0F9E6),
    100: Color(0xFFB3F0C0),
    200: Color(0xFF80E696),
    300: Color(0xFF4DDB6C),
    400: Color(0xFF26D44D),
    500: Color(0xFF00CC2D),
    600: Color(0xFF00C728),
    700: Color(0xFF00C022),
    800: Color(0xFF00B91C),
    900: Color(0xFF00AD11),
  });

  static const MaterialColor secondary = MaterialColor(0xFF00A81F, <int, Color>{
    50: Color(0xFFE0F5E4),
    100: Color(0xFFB3E5BC),
    200: Color(0xFF80D48F),
    300: Color(0xFF4DC262),
    400: Color(0xFF26B541),
    500: Color(0xFF00A81F),
    600: Color(0xFF00A01B),
    700: Color(0xFF009717),
    800: Color(0xFF008D12),
    900: Color(0xFF007D0A),
  });

  static const MaterialColor accent = MaterialColor(0xFF54D07D, <int, Color>{
    50: Color(0xFFEAF9EF),
    100: Color(0xFFCCF1D8),
    200: Color(0xFFAAE8BE),
    300: Color(0xFF87DEA4),
    400: Color(0xFF6ED791),
    500: Color(0xFF54D07D),
    600: Color(0xFF4DCB75),
    700: Color(0xFF43C46A),
    800: Color(0xFF3ABE60),
    900: Color(0xFF29B34D),
  });

  static const MaterialColor text = MaterialColor(0xFF333333, <int, Color>{
    50: Color(0xFFE7E7E7),
    100: Color(0xFFC2C2C2),
    200: Color(0xFF999999),
    300: Color(0xFF707070),
    400: Color(0xFF525252),
    500: Color(0xFF333333),
    600: Color(0xFF2E2E2E),
    700: Color(0xFF272727),
    800: Color(0xFF202020),
    900: Color(0xFF141414),
  });
}
