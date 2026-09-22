import 'package:flutter_test/flutter_test.dart';

import 'package:misw4302_ux_medicamentos_mobile/app/app.dart';
import 'package:misw4302_ux_medicamentos_mobile/app/router.dart';

void main() {
  testWidgets('La app abre en la Bienvenida implementada', (
    WidgetTester tester,
  ) async {
    appRouter.goNamed('welcome');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    expect(
      find.text('Reclama tus\nmedicamentos\nsin filas ni viajes en vano'),
      findsOneWidget,
    );
    expect(find.text('Crear cuenta'), findsOneWidget);
    expect(find.text('Ya tengo cuenta'), findsOneWidget);
  });
}
