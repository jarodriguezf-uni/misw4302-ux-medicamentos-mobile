import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../home/widgets/medication_bottom_navigation.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../widgets/location_components.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  String _query = '';

  static const _locations = [
    (
      name: 'Éxito Norte',
      distance: '1.2 km',
      status: LocationAvailability.available,
    ),
    (
      name: 'Cruz Verde 127',
      distance: '2.5 km',
      status: LocationAvailability.unknown,
    ),
    (
      name: 'Audifarma Chapinero',
      distance: '3.1 km',
      status: LocationAvailability.unavailable,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final visibleLocations = _locations
        .where(
          (location) =>
              location.name.toLowerCase().contains(_query.trim().toLowerCase()),
        )
        .toList();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.surface,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        bottomNavigationBar: const MedicationBottomNavigation(
          selectedTab: MedicationTab.claim,
        ),
        body: SafeArea(
          bottom: false,
          child: ResponsiveScreenWidth(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                context.screenHorizontalPadding,
                8,
                context.screenHorizontalPadding,
                AppSpacing.xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OnboardingBackTitle(
                    title: 'Dónde reclamar',
                    onBack: () => context.canPop()
                        ? context.pop()
                        : context.goNamed('locations-filters'),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  SizedBox(
                    height: 44,
                    child: TextField(
                      key: const Key('location-search'),
                      onChanged: (value) => setState(() => _query = value),
                      decoration: const InputDecoration(
                        hintText: 'Filtra por punto',
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  for (final location in visibleLocations) ...[
                    LocationCard(
                      cardKey: Key('location-${location.name}'),
                      name: location.name,
                      distance: location.distance,
                      status: location.status,
                      onTap: location.name == 'Éxito Norte'
                          ? () => context.pushNamed('locations-detail')
                          : () {},
                    ),
                    const SizedBox(height: AppSpacing.md),
                  ],
                  const SizedBox(height: AppSpacing.sm),
                  OnboardingOutlineButton(
                    label: 'Filtros',
                    buttonKey: const Key('open-location-filters'),
                    onPressed: () => context.pushNamed('locations-filters'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
