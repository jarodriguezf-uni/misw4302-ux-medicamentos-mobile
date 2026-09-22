import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:misw4302_ux_medicamentos_mobile/app/app.dart';
import 'package:misw4302_ux_medicamentos_mobile/app/router.dart';

void main() {
  setUp(() {
    appRouter.goNamed('home');
  });

  testWidgets('Inicio reproduce el reclamo y la última notificación', (
    tester,
  ) async {
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    expect(find.text('Hola, María'), findsOneWidget);
    expect(find.text('Reclamo de medicamento en curso'), findsOneWidget);
    expect(find.text('Tu medicamento está disponible'), findsOneWidget);
    expect(find.text('Éxito Norte · Disponible'), findsOneWidget);
  });

  testWidgets('Medicinas, Turno y la notificación conservan sus destinos', (
    tester,
  ) async {
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('nav-medicinas')));
    await tester.pumpAndSettle();
    expect(find.text('Buscar medicamento'), findsOneWidget);

    appRouter.goNamed('home');
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('nav-turno')));
    await tester.pumpAndSettle();
    expect(find.text('21 — Mis turnos'), findsOneWidget);

    appRouter.goNamed('home');
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('medicine-available-notification')));
    await tester.pumpAndSettle();
    expect(
      find.text('22 — ¿Recibiste tu medicamento? (modal)'),
      findsOneWidget,
    );
  });

  testWidgets('Cuenta y Reclamar responden sin abandonar Inicio', (
    tester,
  ) async {
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('nav-cuenta')));
    await tester.pump();
    expect(find.text('Hola, María'), findsOneWidget);

    await tester.tap(find.byKey(const Key('nav-reclamar')));
    await tester.pump();
    expect(find.text('Hola, María'), findsOneWidget);
  });
}
