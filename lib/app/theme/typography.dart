import 'package:flutter/material.dart';

import 'colors.dart';

const _interFamily = 'Inter';
const _jakartaFamily = 'Plus Jakarta Sans';

// Estilos confirmados contra Figma. Line-height 1.25 en todos (visto en
// nodos 24:60 y 65:85).
abstract final class AppTextStyles {
  static const heroTitle = TextStyle(
    fontFamily: _jakartaFamily,
    fontWeight: FontWeight.w700,
    fontSize: 26,
    height: 1.25,
    color: AppColors.onSurface,
  );

  static const greetingTitle = TextStyle(
    fontFamily: _jakartaFamily,
    fontWeight: FontWeight.w700,
    fontSize: 24, // nodo 65:88
    height: 1.25,
    color: AppColors.onSurface,
  );

  static const screenTitle = TextStyle(
    fontFamily: _jakartaFamily,
    fontWeight: FontWeight.w700,
    fontSize: 20, // nodo 24:67
    height: 1.25,
    color: AppColors.onSurface,
  );

  static const sheetTitle = TextStyle(
    fontFamily: _jakartaFamily,
    fontWeight: FontWeight.w700,
    fontSize: 19, // nodo 65:100
    height: 1.25,
    color: AppColors.onSurface,
  );

  static const buttonLabel = TextStyle(
    fontFamily: _interFamily,
    fontWeight: FontWeight.w700,
    fontSize: 15, // nodo 65:103
    color: AppColors.onSurface,
  );

  static const cardTitle = TextStyle(
    fontFamily: _interFamily,
    fontWeight: FontWeight.w700,
    fontSize: 15, // nodo 24:71
    height: 1.25,
    color: AppColors.onSurface,
  );

  static const bodyMedium = TextStyle(
    fontFamily: _interFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.25,
    color: AppColors.onSurface,
  );

  static const bodyMediumBold = TextStyle(
    fontFamily: _interFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14, // nodo 65:96
    height: 1.25,
    color: AppColors.onSurface,
  );

  static const bodySmall = TextStyle(
    fontFamily: _interFamily,
    fontWeight: FontWeight.w400,
    fontSize: 13, // nodo 65:101
    height: 1.25,
    color: AppColors.onSurfaceVariant,
  );

  static const bodySmallBold = TextStyle(
    fontFamily: _interFamily,
    fontWeight: FontWeight.w700,
    fontSize: 13, // nodo 65:93
    height: 1.25,
  );

  static const caption = TextStyle(
    fontFamily: _interFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.25,
    color: AppColors.onSurface,
  );

  static const badgeLabel = TextStyle(
    fontFamily: _interFamily,
    fontWeight: FontWeight.w700,
    fontSize: 11, // nodo 24:74
    height: 1.25,
  );

  static const overline = TextStyle(
    fontFamily: _interFamily,
    fontWeight: FontWeight.w700,
    fontSize: 11, // nodo 65:94
    height: 1.25,
    color: AppColors.textMuted,
    letterSpacing: 0.5,
  );

  static const navLabel = TextStyle(
    fontFamily: _interFamily,
    fontWeight: FontWeight.w500,
    fontSize: 10, // nodo 24:93
    height: 1.25,
    color: AppColors.textMuted,
  );

  static TextTheme textTheme() {
    return const TextTheme(
      headlineLarge: heroTitle,
      headlineMedium: greetingTitle,
      titleLarge: screenTitle,
      titleMedium: sheetTitle,
      titleSmall: cardTitle,
      bodyLarge: buttonLabel,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: buttonLabel,
      labelMedium: badgeLabel,
      labelSmall: navLabel,
    );
  }
}
