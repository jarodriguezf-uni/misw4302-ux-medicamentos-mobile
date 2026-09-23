import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../home/widgets/medication_bottom_navigation.dart';
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
      address: 'Cra. 15 # 100-20',
      distance: '1,2 km',
      status: LocationAvailability.available,
    ),
    (
      name: 'Cruz Verde 127',
      address: 'Av. 19 # 127-10',
      distance: '2,5 km',
      status: LocationAvailability.unknown,
    ),
    (
      name: 'Audifarma Chapinero',
      address: 'Calle 63 # 13-21',
      distance: '3,0 km',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    context.screenHorizontalPadding,
                    22,
                    context.screenHorizontalPadding,
                    18,
                  ),
                  child: Text(
                    'Puntos en convenio',
                    style: AppTextStyles.screenTitle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenHorizontalPadding,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: TextField(
                            key: const Key('location-search'),
                            onChanged: (value) =>
                                setState(() => _query = value),
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.onSurface,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Buscar por nombre',
                              prefixIcon: Icon(Icons.search, size: 20),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      SizedBox(
                        width: 110,
                        height: 44,
                        child: OutlinedButton.icon(
                          key: const Key('open-location-filters'),
                          onPressed: () =>
                              context.pushNamed('locations-filters'),
                          icon: const Icon(Icons.tune, size: 18),
                          label: const Text('Filtros'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      context.screenHorizontalPadding,
                      0,
                      context.screenHorizontalPadding,
                      AppSpacing.xl,
                    ),
                    itemCount: visibleLocations.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: AppSpacing.md),
                    itemBuilder: (context, index) {
                      final location = visibleLocations[index];
                      return LocationCard(
                        cardKey: Key('location-${location.name}'),
                        name: location.name,
                        distance: location.distance,
                        address: location.address,
                        status: location.status,
                        onTap: location.name == 'Éxito Norte'
                            ? () => context.pushNamed('locations-detail')
                            : () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
