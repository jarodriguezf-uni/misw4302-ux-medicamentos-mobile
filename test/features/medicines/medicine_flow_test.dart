import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:misw4302_ux_medicamentos_mobile/app/app.dart';
import 'package:misw4302_ux_medicamentos_mobile/app/router.dart';

void main() {
  testWidgets('Buscar medicamento muestra la navegación con Medicinas activa', (
    tester,
  ) async {
    appRouter.goNamed('medicines-search');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('nav-inicio')), findsOneWidget);
    expect(find.byKey(const Key('nav-cuenta')), findsOneWidget);
    expect(find.byKey(const Key('nav-medicinas')), findsOneWidget);
    expect(find.byKey(const Key('nav-reclamar')), findsOneWidget);
    expect(find.byKey(const Key('nav-turno')), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Semantics &&
            widget.properties.label == 'Medicinas' &&
            widget.properties.selected == true,
      ),
      findsOneWidget,
    );

    await tester.tap(find.byKey(const Key('nav-inicio')));
    await tester.pumpAndSettle();
    expect(find.text('Hola, María'), findsOneWidget);
  });

  Future<void> expectBranchPreservesMedicine(
    WidgetTester tester, {
    required Key resultCardKey,
    required String medicineName,
  }) async {
    appRouter.goNamed('medicines-search');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('scan-prescription')));
    await tester.pumpAndSettle();
    expect(find.text('Resultado'), findsOneWidget);

    await tester.tap(find.byKey(resultCardKey));
    await tester.pumpAndSettle();
    expect(find.text('Datos de la fórmula'), findsOneWidget);
    expect(
      tester
          .widget<Text>(find.byKey(const Key('prescription-medicine-name')))
          .data,
      medicineName,
    );

    await tester.tap(find.byKey(const Key('prescription-continue')));
    await tester.pumpAndSettle();
    expect(find.text('Tu tratamiento'), findsOneWidget);
    expect(find.text(medicineName), findsOneWidget);
  }

  testWidgets('rama Losartán preserva el medicamento hasta tratamiento', (
    tester,
  ) async {
    await expectBranchPreservesMedicine(
      tester,
      resultCardKey: const Key('medicine-result-losartan'),
      medicineName: 'Losartán 50 mg',
    );
  });

  testWidgets(
    'rama Losartán potásico preserva el medicamento hasta tratamiento',
    (tester) async {
      await expectBranchPreservesMedicine(
        tester,
        resultCardKey: const Key('medicine-result-losartan-potasico'),
        medicineName: 'Losartán potásico 50 mg',
      );
    },
  );

  testWidgets('rama Losartán MK preserva el medicamento hasta tratamiento', (
    tester,
  ) async {
    await expectBranchPreservesMedicine(
      tester,
      resultCardKey: const Key('medicine-result-losartan-mk'),
      medicineName: 'Losartán MK 50 mg',
    );
  });
}
