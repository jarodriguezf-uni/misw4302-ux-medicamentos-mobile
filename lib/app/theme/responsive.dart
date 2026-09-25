import 'package:flutter/widgets.dart';

import 'spacing.dart';

/// Debajo de este ancho lógico el padding lateral se reduce a 16 px
/// (teléfonos pequeños, p. ej. 320 de ancho). Sección 12 del plan técnico.
const double _compactWidthBreakpoint = 360;

/// Hasta 600 px lógicos el cuerpo usa todo el ancho disponible; así los
/// teléfonos grandes conservan el padding lateral aprobado sin acumular un
/// segundo margen exterior. A partir de este ancho (tablets y superficies
/// mayores), el contenido se limita y se centra.
const double _maxContentTotalWidth = 600;

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
///
/// No usa `Center`/`Align`: ambos aflojan también las restricciones de alto
/// que llegan al hijo, lo que hace que un `SingleChildScrollView` se encoja
/// a la altura de su contenido en vez de llenar la pantalla (y quede
/// centrado verticalmente con huecos enormes arriba y abajo). Tampoco basta
/// un `Row` con el hijo suelto: al no ser flexible, recibe ancho máximo
/// *infinito* de `RenderFlex`, así que `ConstrainedBox` nunca ve el ancho
/// real del teléfono y en pantallas angostas termina reservando el ancho de
/// diseño completo (360) aunque el dispositivo mida menos, desbordando. Por
/// eso se mide el ancho disponible con `LayoutBuilder` y se fuerza con
/// `SizedBox` antes de centrar con `Row` + `crossAxisAlignment.stretch`
/// (que sí preserva el alto).
class ResponsiveScreenWidth extends StatelessWidget {
  const ResponsiveScreenWidth({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth < _maxContentTotalWidth
            ? constraints.maxWidth
            : _maxContentTotalWidth;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [SizedBox(width: width, child: child)],
        );
      },
    );
  }
}
