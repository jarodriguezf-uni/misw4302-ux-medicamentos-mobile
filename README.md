# Medicamentos EPS — aplicación móvil

Prototipo no funcional para Android desarrollado para la materia **MISW4302 —
UX: mejoramiento de la experiencia de usuario**. Reproduce en Flutter el flujo
completo de consulta y reclamo de medicamentos definido en los mockups móviles.

La aplicación no usa backend, autenticación real ni APIs. Todos los datos y
estados son locales y simulados.

## Requisitos

- Flutter 3.44.2 (canal stable).
- Dart 3.12.2.
- Java 17 y Android SDK configurado.
- Un emulador o dispositivo Android visible en `flutter devices`.
- `adb` disponible para instalar el APK desde terminal.

Estas son las versiones con las que se verificó la entrega. El SDK de Dart
admitido por el proyecto está declarado en `pubspec.yaml`.

## Instalar dependencias y ejecutar

```bash
flutter pub get
flutter devices
flutter run -d <device-id>
```

La aplicación abre en Bienvenida. Para ejecutar sin indicar dispositivo, usa
`flutter run` y selecciona un Android cuando Flutter lo solicite.

## Verificación local

```bash
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
```

Las pruebas cubren la apertura de las 31 rutas/estados, los recorridos
principales y la adaptación a tamaños Android pequeños, base y grandes.

## APK precompilado

El entregable Android está disponible en
[`release/medicamentos-eps-android.apk`](release/medicamentos-eps-android.apk).
Su SHA-256 se encuentra en [`release/SHA256SUMS`](release/SHA256SUMS).

Para instalarlo en un dispositivo o emulador conectado:

```bash
adb install -r release/medicamentos-eps-android.apk
```

## Generar e instalar el APK

```bash
flutter build apk --release
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

El artefacto queda en:

```text
build/app/outputs/flutter-apk/app-release.apk
```

Para calcular su checksum:

```bash
shasum -a 256 build/app/outputs/flutter-apk/app-release.apk
```

El build release usa la firma de evaluación incluida por Flutter. No contiene
un keystore de publicación ni secretos versionados y no está preparado para
publicarse en Play Store.

## Flujo y rutas reproducibles

| Módulo | Rutas/estados principales |
| --- | --- |
| Alta | `/welcome`, `/login`, `/signup`, `/signup/verify-code` |
| EPS | `/signup/eps`, validación, estado y confirmación para Sanitas o Compensar |
| Inicio | `/home` y notificación de medicamento disponible |
| Medicamentos | búsqueda, resultados y fórmula/tratamiento para tres variantes de Losartán |
| Puntos | filtros, listado, detalle y disponibilidad |
| Turnos | selección, confirmación, comprobante, lista activa y lista vacía |
| Retiro | decisión completa/parcial, registro pendiente y confirmación |
| Historial | `/history` con estados completo y parcial |

Datos simulados relevantes: Sanitas, Compensar, Losartán 50 mg, Losartán
potásico 50 mg, Losartán MK 50 mg, Éxito Norte y Cruz Verde 127.

## Comportamiento acordado

- “Sí, completo” y “Solo una parte” terminan en “Reclamo completado”.
- Cuenta, Reclamar, “No había” y “Calificar el punto” conservan feedback táctil
  pero no navegan ni inventan estados adicionales.
- El estado se mantiene solo cuando es necesario para el recorrido actual; no
  hay persistencia al cerrar la aplicación.

## Adaptación Android

- Referencia visual: viewport lógico de 360 × 800, orientación vertical.
- `SafeArea`, áreas desplazables y `viewInsets` mantienen visibles contenido,
  navegación y CTA con teclado abierto o en teléfonos bajos.
- Los anchos se limitan en teléfonos grandes y se verifican escalas de texto de
  hasta 1.3 sin overflow.
- La actividad Android está fijada a orientación portrait.

## Assets y fuentes

Los recursos se encuentran en `assets/icons`, `assets/images` y
`assets/fonts`. Inter y Plus Jakarta Sans se empaquetan localmente; sus
licencias OFL están junto a los archivos de fuente. La aplicación no descarga
fuentes ni imágenes durante la ejecución.

## Limitaciones

- No hay backend, autenticación, consumo de APIs, notificaciones reales ni
  almacenamiento persistente.
- Las ubicaciones, disponibilidades, turnos y respuestas son datos simulados.
- El material de referencia de diseño se conserva externamente y no forma parte
  del historial Git ni del APK.
