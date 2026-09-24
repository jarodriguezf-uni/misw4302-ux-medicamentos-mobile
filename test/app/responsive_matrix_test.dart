// Matriz visual de las 31 rutas en tres anchos lógicos (teléfono pequeño,
// baseline y teléfono grande, sección 12/17 del plan técnico) y dos escalas
// de texto, para detectar overflow sin depender de un emulador/dispositivo
// físico (no disponible en este entorno). Complementa navigation_smoke_test.

import 'dart:ui';

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

const _scenarios = <(String label, double width, double height)>[
  ('teléfono pequeño (320)', 320, 690),
  ('baseline (360)', 360, 800),
  ('teléfono grande (414)', 414, 896),
];

void main() {
  for (final scenario in _scenarios) {
    for (final textScale in [1.0, 1.3]) {
      testWidgets('${scenario.$1} · escala de texto ${textScale}x: '
          'las 31 rutas no producen overflow', (tester) async {
        final view = tester.view;
        view.physicalSize =
            Size(scenario.$2, scenario.$3) * view.devicePixelRatio;
        tester.platformDispatcher.textScaleFactorTestValue = textScale;
        addTearDown(view.resetPhysicalSize);
        addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

        await tester.pumpWidget(const MedicamentosApp());
        await tester.pumpAndSettle();

        final names = _leafGoRoutes(
          appRouter.configuration.routes,
        ).map((route) => route.name).whereType<String>().toList();

        expect(names, hasLength(31));

        for (final name in names) {
          appRouter.goNamed(name);
          await tester.pumpAndSettle();
          expect(
            tester.takeException(),
            isNull,
            reason:
                'la ruta "$name" desbordó en ${scenario.$1} '
                'con escala de texto ${textScale}x',
          );
        }
      });
    }
  }
}
