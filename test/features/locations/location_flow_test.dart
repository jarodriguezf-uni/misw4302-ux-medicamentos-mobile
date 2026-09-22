import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:misw4302_ux_medicamentos_mobile/app/app.dart';
import 'package:misw4302_ux_medicamentos_mobile/app/router.dart';
import 'package:misw4302_ux_medicamentos_mobile/features/locations/widgets/location_components.dart';

void main() {
  testWidgets('los filtros cambian de selección y conducen a los tres puntos', (
    tester,
  ) async {
    appRouter.goNamed('locations-filters');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    expect(find.text('Compensar'), findsOneWidget);
    expect(find.text('Bogotá'), findsOneWidget);

    final initialChip = tester.widget<ChoiceChip>(
      find.byKey(const Key('distance-3 km')),
    );
    expect(initialChip.selected, isTrue);

    await tester.tap(find.byKey(const Key('distance-5 km')));
    await tester.pump();
    expect(
      tester
          .widget<ChoiceChip>(find.byKey(const Key('distance-5 km')))
          .selected,
      isTrue,
    );

    await tester.tap(find.byKey(const Key('apply-location-filters')));
    await tester.pumpAndSettle();

    expect(find.text('Éxito Norte'), findsOneWidget);
    expect(find.text('Cruz Verde 127'), findsOneWidget);
    expect(find.text('Audifarma Chapinero'), findsOneWidget);
    expect(find.byType(AvailabilityBadge), findsNWidgets(3));
    expect(find.text('Disponible'), findsOneWidget);
    expect(find.text('Sin dato'), findsOneWidget);
    expect(find.text('Agotado'), findsOneWidget);
  });

  testWidgets('búsqueda local filtra los puntos por nombre', (tester) async {
    appRouter.goNamed('locations');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('location-search')),
      'Cruz Verde',
    );
    await tester.pump();

    expect(find.text('Cruz Verde 127'), findsOneWidget);
    expect(find.text('Éxito Norte'), findsNothing);
    expect(find.text('Audifarma Chapinero'), findsNothing);
  });

  testWidgets('recorrido puntos, ficha y disponibilidad llega a elegir turno', (
    tester,
  ) async {
    appRouter.goNamed('locations');
    await tester.pumpWidget(const MedicamentosApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('location-Éxito Norte')));
    await tester.pumpAndSettle();
    expect(find.text('Disponibilidad del medicamento'), findsOneWidget);
    expect(find.text('Mapa del punto'), findsOneWidget);

    await tester.tap(find.byKey(const Key('location-call')));
    await tester.pump();
    expect(find.text('Éxito Norte'), findsOneWidget);

    await tester.tap(find.byKey(const Key('location-check-availability')));
    await tester.pumpAndSettle();
    expect(find.text('Éxito Norte · actualizado hace 2 h'), findsOneWidget);
    expect(find.byKey(const Key('choose-appointment')), findsOneWidget);

    await tester.tap(find.byKey(const Key('choose-appointment')));
    await tester.pumpAndSettle();
    expect(find.text('18 — Elegir día y franja'), findsOneWidget);
  });
}
