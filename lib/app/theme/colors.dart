import 'package:flutter/material.dart';

// Paleta confirmada contra Figma (oX2LEnqkcmrH5FwXSHa2kz, página 0:1).
abstract final class AppColors {
  static const primary = Color(0xFF127E76);
  static const onPrimary = Colors.white;
  static const primaryContainer = Color(0xFFD7F3EF);
  static const onPrimaryContainer = Color(0xFF00443D); // nodo 65:91

  static const surface = Colors.white;
  static const onSurface = Color(0xFF1A1C1C);
  static const onSurfaceVariant = Color(0xFF49454F);
  static const textMuted = Color(0xFF79747E); // nodo 24:93

  static const outline = Color(0xFF8F9998); // nodo 65:104
  static const outlineVariant = Color(0xFFDDE4E3); // nodo 24:70
  static const fieldBackground = Color(0xFFEEF1F0); // nodo 24:68

  // Badges de disponibilidad, nodo 24:60.
  static const successBg = Color(0xFFB6F2CF);
  static const successFg = Color(0xFF00210F);
  static const successText = Color(0xFF278651); // nodo 65:93
  static const warningBg = Color(0xFFFFE0B0);
  static const warningFg = Color(0xFF2A1700);
  static const dangerBg = Color(0xFFFFDAD4);
  static const dangerFg = Color(0xFF410E0B);

  // Tab activo de la barra inferior, nodo 24:105.
  static const tabActiveBg = Color(0xFFFFDBCB);
  static const tabActiveFg = Color(0xFF3A0F00);

  // Loader de validación de afiliación, nodo 8:1445.
  static const loaderBackground = Color(0xFFA6F2E8);
  static const loaderCaption = Color(0xFF3A4A47);
  static const loaderStatus = Color(0xFF00201D);

  static const scrim = Colors.black;
  static const scrimOpacity = 0.45; // nodo 65:97

  static ColorScheme scheme() {
    return ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
    ).copyWith(
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      surface: surface,
      onSurface: onSurface,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      errorContainer: dangerBg,
      onErrorContainer: dangerFg,
      scrim: scrim,
    );
  }
}

// Colores sin equivalente en ColorScheme (badges, tab activo, texto muted).
@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.successBg,
    required this.successFg,
    required this.successText,
    required this.warningBg,
    required this.warningFg,
    required this.dangerBg,
    required this.dangerFg,
    required this.tabActiveBg,
    required this.tabActiveFg,
    required this.textMuted,
    required this.fieldBackground,
  });

  factory AppSemanticColors.defaults() => const AppSemanticColors(
    successBg: AppColors.successBg,
    successFg: AppColors.successFg,
    successText: AppColors.successText,
    warningBg: AppColors.warningBg,
    warningFg: AppColors.warningFg,
    dangerBg: AppColors.dangerBg,
    dangerFg: AppColors.dangerFg,
    tabActiveBg: AppColors.tabActiveBg,
    tabActiveFg: AppColors.tabActiveFg,
    textMuted: AppColors.textMuted,
    fieldBackground: AppColors.fieldBackground,
  );

  final Color successBg;
  final Color successFg;
  final Color successText;
  final Color warningBg;
  final Color warningFg;
  final Color dangerBg;
  final Color dangerFg;
  final Color tabActiveBg;
  final Color tabActiveFg;
  final Color textMuted;
  final Color fieldBackground;

  @override
  AppSemanticColors copyWith({
    Color? successBg,
    Color? successFg,
    Color? successText,
    Color? warningBg,
    Color? warningFg,
    Color? dangerBg,
    Color? dangerFg,
    Color? tabActiveBg,
    Color? tabActiveFg,
    Color? textMuted,
    Color? fieldBackground,
  }) {
    return AppSemanticColors(
      successBg: successBg ?? this.successBg,
      successFg: successFg ?? this.successFg,
      successText: successText ?? this.successText,
      warningBg: warningBg ?? this.warningBg,
      warningFg: warningFg ?? this.warningFg,
      dangerBg: dangerBg ?? this.dangerBg,
      dangerFg: dangerFg ?? this.dangerFg,
      tabActiveBg: tabActiveBg ?? this.tabActiveBg,
      tabActiveFg: tabActiveFg ?? this.tabActiveFg,
      textMuted: textMuted ?? this.textMuted,
      fieldBackground: fieldBackground ?? this.fieldBackground,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;
    return AppSemanticColors(
      successBg: Color.lerp(successBg, other.successBg, t)!,
      successFg: Color.lerp(successFg, other.successFg, t)!,
      successText: Color.lerp(successText, other.successText, t)!,
      warningBg: Color.lerp(warningBg, other.warningBg, t)!,
      warningFg: Color.lerp(warningFg, other.warningFg, t)!,
      dangerBg: Color.lerp(dangerBg, other.dangerBg, t)!,
      dangerFg: Color.lerp(dangerFg, other.dangerFg, t)!,
      tabActiveBg: Color.lerp(tabActiveBg, other.tabActiveBg, t)!,
      tabActiveFg: Color.lerp(tabActiveFg, other.tabActiveFg, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      fieldBackground: Color.lerp(fieldBackground, other.fieldBackground, t)!,
    );
  }
}
