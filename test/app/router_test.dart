// Verifica que el router cubre los 31 frames del inventario móvil.

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

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
  test('el router declara las 31 rutas del inventario móvil', () {
    final names = _leafGoRoutes(
      appRouter.configuration.routes,
    ).map((route) => route.name).whereType<String>().toSet();

    expect(names, hasLength(31));
    expect(
      names,
      containsAll(<String>[
        'welcome',
        'login',
        'signup',
        'signup-verify-code',
        'signup-eps',
        'signup-eps-validating',
        'signup-eps-status',
        'home',
        'medicines-search',
        'medicines-results',
        'medicines-prescription-losartan',
        'medicines-prescription-losartan-potasico',
        'medicines-prescription-losartan-mk',
        'signup-eps-confirm-sanitas',
        'signup-eps-confirm-compensar',
        'medicines-treatment-losartan',
        'medicines-treatment-losartan-potasico',
        'medicines-treatment-losartan-mk',
        'locations-filters',
        'locations',
        'locations-detail',
        'locations-availability',
        'appointments-schedule',
        'appointments-confirm',
        'appointments-confirmed',
        'appointments',
        'home-pickup-decision',
        'appointments-pending-registration',
        'home-pickup-complete',
        'history',
        'appointments-empty',
      ]),
    );
  });
}
