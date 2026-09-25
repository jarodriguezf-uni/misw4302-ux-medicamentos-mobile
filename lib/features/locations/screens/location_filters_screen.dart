import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../affiliation/widgets/affiliation_components.dart';
import '../../appointments/widgets/appointment_components.dart';
import '../../onboarding/widgets/onboarding_components.dart';

class LocationFiltersScreen extends StatefulWidget {
  const LocationFiltersScreen({super.key});

  @override
  State<LocationFiltersScreen> createState() => _LocationFiltersScreenState();
}

class _LocationFiltersScreenState extends State<LocationFiltersScreen> {
  String _distance = '3 km';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.surface,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        body: SafeArea(
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
                    title: 'Filtros',
                    onBack: () => context.canPop()
                        ? context.pop()
                        : context.goNamed('medicines-search'),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const AffiliationSummaryRow(label: 'EPS', value: 'Compensar'),
                  const AffiliationSummaryRow(label: 'Ciudad', value: 'Bogotá'),
                  const SizedBox(height: AppSpacing.xl),
                  Text('DISTANCIA MÁXIMA', style: AppTextStyles.overline),
                  const SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: ['1 km', '3 km', '5 km', 'Cualquiera']
                        .map(
                          (distance) => DaySlotChip(
                            chipKey: Key('distance-$distance'),
                            label: distance,
                            selected: _distance == distance,
                            onTap: () => setState(() => _distance = distance),
                            compact: true,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  OnboardingPrimaryButton(
                    label: 'Aplicar filtros',
                    buttonKey: const Key('apply-location-filters'),
                    onPressed: () => context.pushNamed('locations'),
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
