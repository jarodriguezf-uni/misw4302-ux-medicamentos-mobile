import 'package:flutter/widgets.dart';

import 'spacing.dart';

/// Debajo de este ancho lógico el padding lateral se reduce a 16 px
/// (teléfonos pequeños, p. ej. 320 de ancho). Sección 12 del plan técnico.
const double _compactWidthBreakpoint = 360;

/// Ancho total máximo del contenido (padding + contentWidth + padding) en
/// teléfonos grandes: se conserva la composición aprobada en el baseline de
/// 360 en vez de estirarla; el ancho extra se centra como margen.
const double _maxContentTotalWidth =
    AppSpacing.screenPadding * 2 + AppSpacing.contentWidth;

extension ResponsiveScreen on BuildContext {
  /// Padding horizontal de borde de pantalla: 16 px por debajo del baseline
  /// de 360, 20 px en el baseline y en teléfonos grandes.
  double get screenHorizontalPadding {
    final width = MediaQuery.sizeOf(this).width;
    return width < _compactWidthBreakpoint
        ? AppSpacing.lg
        : AppSpacing.screenPadding;
  }
}

/// Envuelve el cuerpo de una pantalla para que, en teléfonos grandes, el
/// contenido no se estire más allá del ancho de diseño y quede centrado en
/// vez de separar los elementos del borde.
class ResponsiveScreenWidth extends StatelessWidget {
  const ResponsiveScreenWidth({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _maxContentTotalWidth),
        child: child,
      ),
    );
  }
}
