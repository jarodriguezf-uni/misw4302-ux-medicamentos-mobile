import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:misw4302_ux_medicamentos_mobile/app/app.dart';
import 'package:misw4302_ux_medicamentos_mobile/app/router.dart';

void main() {
  testWidgets('recorrido 18→19→20→21: elegir, confirmar y ver el turno', (
    tester,
  ) async {
    appRouter.goNamed('appointments-schedule');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    expect(find.text('Elegir turno'), findsOneWidget);
    await tester.tap(find.byKey(const Key('day-mañana')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('slot-8-10')));
    await tester.pump();

    await tester.tap(find.byKey(const Key('schedule-continue')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('confirm-appointment-submit')), findsOneWidget);
    expect(
      tester.widget<Text>(find.byKey(const Key('confirm-day'))).data,
      'Mañana',
    );
    expect(
      tester.widget<Text>(find.byKey(const Key('confirm-time'))).data,
      '8:00 – 8:30',
    );

    await tester.tap(find.byKey(const Key('confirm-appointment-submit')));
    await tester.pumpAndSettle();
    expect(find.text('Turno confirmado'), findsOneWidget);
    expect(find.text('A-045'), findsOneWidget);

    await tester.tap(find.byKey(const Key('confirmed-view-appointments')));
    await tester.pumpAndSettle();
    expect(find.text('Mis turnos'), findsOneWidget);
    expect(find.text('Activo'), findsOneWidget);
  });

  testWidgets('estado 26: Mis turnos sin activos no muestra badge Activo', (
    tester,
  ) async {
    appRouter.goNamed('appointments-empty');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    expect(find.text('Mis turnos'), findsOneWidget);
    expect(find.text('Activo'), findsNothing);
    expect(find.text('Reclamado'), findsNWidgets(2));
    expect(find.text('No tienes turnos activos.'), findsOneWidget);
  });
}
