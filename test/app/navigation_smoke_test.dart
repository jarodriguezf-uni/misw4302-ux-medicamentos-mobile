// Recorre las 31 rutas y confirma que cada una abre sin excepciones.

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:misw4302_ux_medicamentos_mobile/app/app.dart';
import 'package:misw4302_ux_medicamentos_mobile/app/router.dart';

Iterable<GoRoute> _leafGoRoutes(Iterable<RouteBase> routes) sync* {
  for (final route in routes) {
    if (route is GoRoute) {
      yield route;
      yield* _leafGoRoutes(route.routes);
    }
  }
}

void main() {
  testWidgets('las 31 rutas abren sin excepciones', (tester) async {
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    final names = _leafGoRoutes(appRouter.configuration.routes)
        .map((route) => route.name)
        .whereType<String>()
        .toList();

    expect(names, hasLength(31));

    for (final name in names) {
      appRouter.goNamed(name);
      await tester.pumpAndSettle();
      expect(
        tester.takeException(),
        isNull,
        reason: 'la ruta "$name" lanzó una excepción al abrir',
      );
    }
  });
}
