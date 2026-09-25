import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../affiliation/widgets/affiliation_components.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../widgets/location_components.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({super.key});

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
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                context.screenHorizontalPadding,
                8,
                context.screenHorizontalPadding,
                AppSpacing.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OnboardingBackTitle(
                    title: 'Éxito Norte',
                    onBack: () => context.canPop()
                        ? context.pop()
                        : context.goNamed('locations'),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const AffiliationSummaryRow(
                    label: 'Dirección',
                    value: 'Cra. 15 # 100-20',
                  ),
                  const AffiliationSummaryRow(
                    label: 'Horario',
                    value: '8:00 a. m. – 8:00 p. m.',
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const MedicationAvailabilityPill(
                    medicationLabel: 'Losartán 50 mg',
                    status: LocationAvailability.available,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const Expanded(child: LocationMapPlaceholder()),
                  const SizedBox(height: AppSpacing.lg),
                  Row(
                    children: [
                      Expanded(
                        child: OnboardingPrimaryButton(
                          label: 'Sacar turno aquí',
                          buttonKey: const Key(
                            'location-check-availability',
                          ),
                          compact: true,
                          onPressed: () =>
                              context.pushNamed('locations-availability'),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: OnboardingOutlineButton(
                          label: 'Llamar al punto',
                          buttonKey: const Key('location-call'),
                          compact: true,
                          onPressed: () {},
                        ),
                      ),
                    ],
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
