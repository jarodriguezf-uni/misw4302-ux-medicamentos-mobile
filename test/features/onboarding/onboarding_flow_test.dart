import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:misw4302_ux_medicamentos_mobile/app/app.dart';
import 'package:misw4302_ux_medicamentos_mobile/app/router.dart';

void main() {
  testWidgets('Bienvenida conecta login y registro', (tester) async {
    appRouter.goNamed('welcome');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('welcome-login')));
    await tester.pumpAndSettle();
    expect(find.text('Iniciar sesión'), findsOneWidget);

    await tester.tap(find.byKey(const Key('login-create-account')));
    await tester.pumpAndSettle();
    expect(find.text('Crear cuenta'), findsOneWidget);
    expect(find.byKey(const Key('signup-document-type')), findsOneWidget);
  });

  testWidgets('Registro, OTP y reenvío responden con estado local', (
    tester,
  ) async {
    appRouter.goNamed('signup');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    final terms = find.byKey(const Key('signup-terms'));
    final continueButton = find.byKey(const Key('signup-continue'));

    await tester.tap(terms);
    await tester.pump();
    expect(tester.widget<FilledButton>(continueButton).onPressed, isNull);

    await tester.tap(terms);
    await tester.pump();
    expect(tester.widget<FilledButton>(continueButton).onPressed, isNotNull);

    await tester.tap(continueButton);
    await tester.pumpAndSettle();
    expect(find.text('Verificar código'), findsOneWidget);

    for (var index = 0; index < 4; index++) {
      await tester.enterText(
        find.byKey(Key('otp-digit-$index')),
        '${index + 1}',
      );
      await tester.pump();
    }

    await tester.tap(find.byKey(const Key('otp-resend')));
    await tester.pump();
    expect(find.text('Código reenviado'), findsOneWidget);

    await tester.tap(find.byKey(const Key('otp-verify')));
    await tester.pumpAndSettle();
    expect(find.text('Vincular tu EPS'), findsOneWidget);
  });

  testWidgets('Entrar conduce al Inicio simulado', (tester) async {
    appRouter.goNamed('login');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('login-identity')),
      'usuario@ejemplo.com',
    );
    await tester.tap(find.byKey(const Key('login-submit')));
    await tester.pumpAndSettle();

    expect(find.text('Hola, María'), findsOneWidget);
  });
}
