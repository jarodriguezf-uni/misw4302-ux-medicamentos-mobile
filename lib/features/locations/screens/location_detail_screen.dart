import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenPadding,
              8,
              AppSpacing.screenPadding,
              AppSpacing.xl,
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
                const _DetailRow(
                  icon: Icons.location_on_outlined,
                  label: 'Dirección',
                  value: 'Cra. 15 # 100-20',
                ),
                const SizedBox(height: AppSpacing.lg),
                const _DetailRow(
                  icon: Icons.schedule,
                  label: 'Horario',
                  value: '8:00 a. m. – 8:00 p. m.',
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  'Disponibilidad del medicamento',
                  style: AppTextStyles.bodyMediumBold,
                ),
                const SizedBox(height: AppSpacing.md),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.outlineVariant),
                    borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Losartán 50 mg',
                          style: AppTextStyles.cardTitle,
                        ),
                      ),
                      AvailabilityBadge(status: LocationAvailability.available),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                const LocationMapPlaceholder(),
                const SizedBox(height: AppSpacing.xl),
                OnboardingPrimaryButton(
                  label: 'Sacar turno aquí',
                  buttonKey: const Key('location-check-availability'),
                  onPressed: () => context.pushNamed('locations-availability'),
                ),
                const SizedBox(height: AppSpacing.md),
                OnboardingOutlineButton(
                  label: 'Llamar al punto',
                  buttonKey: const Key('location-call'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 21, color: AppColors.primary),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.bodySmall),
              const SizedBox(height: 3),
              Text(value, style: AppTextStyles.bodyMediumBold),
            ],
          ),
        ),
      ],
    );
  }
}
