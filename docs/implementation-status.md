# Estado de implementación — misw4302-ux-medicamentos-mobile

Este archivo es el relevo autocontenido entre checkpoints (sección 0 del
`plan-tecnico-figma.md`). Se actualiza dentro del mismo commit que integra
cada checkpoint; no se crean commits separados solo para tocar este archivo.

## Último checkpoint integrado

```text
Repositorio: misw4302-ux-medicamentos-mobile
Checkpoint integrado: M1
SHA visible en origin/main: (pendiente — se completa tras el merge fast-forward)
Autor real: Persona A
Frames/nodos cubiertos: 31/31 (rutas placeholder). Tokens confirmados contra
  Figma para los nodos 24:60 (Puntos en convenio) y 65:85 (modal ¿Recibiste
  tu medicamento?); capturas de referencia reales para 8:1355, 24:60, 65:85
  en docs/design/references/ (local, no versionado — ver desviaciones).
Rutas o estados reproducibles: las 31 rutas declaradas en lib/app/router.dart
  abren desde /welcome sin error (ver test/app/router_test.dart y
  test/widget_test.dart).
Comandos de validación y resultado:
  - flutter pub get → resuelto (go_router 18.0.1, flutter_svg 2.3.0 añadidos).
  - flutter analyze → "No issues found!".
  - flutter test → 3/3 passed (widget_test: abre en Bienvenida sin error;
    router_test: 31/31 rutas nombradas declaradas; navigation_smoke_test:
    las 31 rutas navegan con goNamed() sin excepción).
  - dart format --set-exit-if-changed . → sin cambios pendientes.
  Nota: hubo que correr `flutter upgrade` (3.41.9 → 3.47.5 / Dart 3.13.4) en
  esta máquina porque el scaffold original (commit 580487b) se generó con un
  SDK más nuevo que el instalado; quien continúe en otra máquina debe
  verificar `flutter --version` cumple `sdk: ^3.12.2` antes de `pub get`.
Desviaciones conocidas:
  - El archivo Figma no publica variables (get_variable_defs devuelve {}); el
    manifest y el tema salen de get_design_context/get_screenshot nodo a
    nodo, no de variables.
  - Solo 2 de los 31 frames tienen su assets/tokens confirmados por completo
    (24:60 y 65:85). El resto queda con "assets.status": "pending-extraction"
    en design-manifest.json — cada checkpoint (M2…M9) debe completarlo para
    sus propios frames antes de darlos por terminados.
  - Fuentes reales empaquetadas (Inter y Plus Jakarta Sans, variable fonts
    OFL descargadas de google/fonts) en vez de placeholders; el eje `wght`
    cubre Regular/Medium/Bold sin necesitar un .ttf estático por peso.
  - No se descargaron los SVG de iconos aún (solo se registraron sus nodeId
    y tamaño en el manifest); quedan pendientes para el checkpoint que
    implemente cada pantalla.
  - docs/design/references/*.png no se versiona (agregado a .gitignore):
    el plan (sección 16.5) pide confirmar permiso de redistribución antes de
    subir capturas de Figma a un repo público. Quedan locales; el manifest
    solo registra la ruta esperada.
Siguiente checkpoint habilitado: M2 (Persona B) — Bienvenida, login, registro
  y OTP, sobre lib/features/onboarding/.
```

## Cómo continuar

1. Leer `plan-tecnico-figma.md` completo, este archivo y
   `docs/design/design-manifest.json` antes de tocar código.
2. `git fetch origin && git switch main && git pull --ff-only`.
3. Confirmar que el SHA de `origin/main` coincide con el indicado arriba.
4. Ejecutar la validación de entrada de M2: repetir `flutter pub get`,
   `flutter analyze`, `flutter test`.
5. Crear `feature/M2-bienvenida-login-registro-otp` desde ese `main`.
6. Reemplazar los `PlaceholderScreen` de los frames 01-04
   (`lib/features/onboarding/screens/`) por la implementación real, usando
   `get_design_context` sobre los nodos `8:1355`, `8:1369`, `8:1384`,
   `8:1409` y actualizando su entrada en `design-manifest.json`
   (`codeStatus`, `assets`, `referenceCapture`).
