import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:misw4302_ux_medicamentos_mobile/app/app.dart';
import 'package:misw4302_ux_medicamentos_mobile/app/router.dart';

void main() {
  setUp(() {
    appRouter.goNamed('home-pickup-decision');
  });

  testWidgets('Sí, completo abre confirmación y conduce al historial', (
    tester,
  ) async {
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    expect(find.text('¿Recibiste tu medicamento?'), findsOneWidget);
    await tester.tap(find.byKey(const Key('pickup-complete')));
    await tester.pumpAndSettle();

    expect(find.text('¡Reclamo completado!'), findsOneWidget);
    await tester.tap(find.byKey(const Key('rate-location')));
    await tester.pump();
    expect(find.text('¡Reclamo completado!'), findsOneWidget);

    await tester.tap(find.byKey(const Key('view-history')));
    await tester.pumpAndSettle();

    expect(find.text('Historial del reclamo'), findsOneWidget);
    expect(find.text('Completo'), findsOneWidget);
    expect(find.text('Parcial'), findsOneWidget);
  });

  testWidgets('Solo una parte registra pendiente y converge en confirmación', (
    tester,
  ) async {
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('pickup-partial')));
    await tester.pumpAndSettle();
    // El título y el botón comparten el mismo texto, igual que en el mockup.
    expect(find.text('Registrar pendiente'), findsNWidgets(2));
    expect(find.text('Metformina 850 mg'), findsOneWidget);
    expect(find.text('CANTIDAD PENDIENTE'), findsOneWidget);
    expect(find.text('30'), findsOneWidget);

    await tester.tap(find.byKey(const Key('register-pending')));
    await tester.pumpAndSettle();
    expect(find.text('¡Reclamo completado!'), findsOneWidget);
  });

  testWidgets('No había responde sin abandonar el modal', (tester) async {
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('pickup-unavailable')));
    await tester.pump();

    expect(find.text('¿Recibiste tu medicamento?'), findsOneWidget);
    expect(appRouter.state.name, 'home-pickup-decision');
  });
}
