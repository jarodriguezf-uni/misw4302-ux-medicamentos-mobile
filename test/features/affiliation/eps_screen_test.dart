import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:misw4302_ux_medicamentos_mobile/app/app.dart';
import 'package:misw4302_ux_medicamentos_mobile/app/router.dart';

void main() {
  testWidgets('Sanitas y Compensar navegan a su confirmación', (tester) async {
    appRouter.goNamed('signup-eps');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    expect(find.text('Vincular tu EPS'), findsOneWidget);
    expect(find.byKey(const Key('eps-search')), findsOneWidget);

    await tester.tap(find.byKey(const Key('eps-sanitas')));
    await tester.pumpAndSettle();
    expect(find.text('Confirma tus datos'), findsOneWidget);
    expect(find.text('Sanitas'), findsOneWidget);

    await tester.tap(find.byKey(const Key('back-button')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('eps-compensar')));
    await tester.pumpAndSettle();
    expect(find.text('Confirma tus datos'), findsOneWidget);
    expect(find.text('Compensar'), findsOneWidget);
  });

  testWidgets('Confirmar EPS avanza automáticamente al Inicio (06→07→08)', (
    tester,
  ) async {
    appRouter.goNamed('signup-eps-confirm-sanitas');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('eps-confirm-submit')));
    await tester.pumpAndSettle();
    expect(find.text('Validando afiliación...'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pumpAndSettle();
    expect(find.text('Tu EPS quedó vinculada'), findsOneWidget);

    await tester.tap(find.byKey(const Key('eps-status-continue')));
    await tester.pumpAndSettle();
    expect(find.text('Hola, María'), findsOneWidget);
  });
}
