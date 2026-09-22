// Medidas confirmadas contra Figma (sección 8 del plan técnico).
abstract final class AppSpacing {
  static const double screenPadding = 20;
  static const double contentWidth = 320;

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;

  // Controles.
  static const double buttonHeight = 44;
  static const double buttonRadius = 22; // pill
  static const double fieldRadius = 22; // pill (search/inputs)
  static const double cardRadius = 12;
  static const double highlightCardRadius = 16; // tarjeta de reclamo en curso
  static const double badgeRadius = 11; // pill (altura 22)
  static const double badgeHeight = 22;

  // Bottom sheet.
  static const double sheetTopRadius = 24;
  static const double sheetHandleWidth = 40;
  static const double sheetHandleHeight = 4;
  static const double sheetHandleRadius = 2;

  // Shell / navegación.
  static const double bottomNavHeight = 74;
  static const double bottomNavCellWidth = 72;
  static const double iconSize = 22;
  static const double backIconWidth = 20;
  static const double backIconHeight = 16;
}
