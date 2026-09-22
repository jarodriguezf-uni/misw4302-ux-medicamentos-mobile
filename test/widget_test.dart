import 'package:flutter_test/flutter_test.dart';

import 'package:misw4302_ux_medicamentos_mobile/app/app.dart';

void main() {
  testWidgets('La app abre en Bienvenida (frame 01) sin errores', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    expect(find.text('01 — Bienvenida'), findsOneWidget);
    expect(find.text('Nodo Figma 8:1355 · pendiente en M2'), findsOneWidget);
  });
}
