import 'dart:async';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

/// Todas las pruebas de widgets corren sobre el viewport lógico base del
/// plan técnico (360×800, sección 17) en vez del surface por defecto de
/// `flutter_test` (800×600), que ocultaba overflows y desajustes de layout
/// que solo aparecen en el ancho real del dispositivo.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  final view = binding.platformDispatcher.implicitView!;
  view.physicalSize = const Size(360, 800) * view.devicePixelRatio;
  await testMain();
}
