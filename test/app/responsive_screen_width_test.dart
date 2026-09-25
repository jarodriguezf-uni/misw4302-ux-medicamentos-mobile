// Regresión: `ResponsiveScreenWidth` centraba el ancho con `Center`, que
// también afloja las restricciones de alto. Un hijo con poco contenido
// (p. ej. un `SingleChildScrollView` corto) se encogía a su tamaño natural
// en vez de llenar la pantalla, y quedaba centrado verticalmente con huecos
// enormes arriba y abajo — visible en dispositivo real aunque
// `responsive_matrix_test.dart` no lo detectaba (no hay overflow, solo
// espacio vacío).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:misw4302_ux_medicamentos_mobile/app/theme/responsive.dart';

void main() {
  const contentKey = Key('responsive-width-probe');

  Future<void> pump(
    WidgetTester tester,
    double width,
    double height, {
    required Widget child,
  }) async {
    final view = tester.view;
    view.physicalSize = Size(width, height) * view.devicePixelRatio;
    addTearDown(view.resetPhysicalSize);
    await tester.pumpWidget(
      MaterialApp(home: ResponsiveScreenWidth(child: child)),
    );
  }

  testWidgets('un hijo con poco contenido igual llena el alto disponible', (
    tester,
  ) async {
    await pump(
      tester,
      360,
      800,
      child: const SingleChildScrollView(
        key: contentKey,
        child: SizedBox(height: 50, child: Text('poco contenido')),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.getSize(find.byKey(contentKey)).height, 800);
  });

  testWidgets('en teléfonos angostos usa el ancho real sin desbordar', (
    tester,
  ) async {
    await pump(tester, 320, 690, child: const SizedBox(key: contentKey));
    await tester.pumpAndSettle();

    expect(tester.getSize(find.byKey(contentKey)).width, 320);
    expect(tester.takeException(), isNull);
  });

  testWidgets('el baseline conserva el ancho aprobado de 360', (tester) async {
    await pump(tester, 360, 800, child: const SizedBox(key: contentKey));
    await tester.pumpAndSettle();

    final size = tester.getSize(find.byKey(contentKey));
    final topLeft = tester.getTopLeft(find.byKey(contentKey));
    expect(size.width, 360);
    expect(topLeft.dx, 0);
  });

  testWidgets('un teléfono grande usa todo el ancho disponible', (
    tester,
  ) async {
    await pump(tester, 448, 998, child: const SizedBox(key: contentKey));
    await tester.pumpAndSettle();

    final size = tester.getSize(find.byKey(contentKey));
    final topLeft = tester.getTopLeft(find.byKey(contentKey));
    expect(size.width, 448);
    expect(size.height, 998);
    expect(topLeft.dx, 0);
  });

  testWidgets('en tablets limita el ancho y lo centra', (tester) async {
    await pump(tester, 720, 1024, child: const SizedBox(key: contentKey));
    await tester.pumpAndSettle();

    final size = tester.getSize(find.byKey(contentKey));
    final topLeft = tester.getTopLeft(find.byKey(contentKey));
    expect(size.width, 600);
    expect(size.height, 1024);
    expect(topLeft.dx, 60);
  });
}
