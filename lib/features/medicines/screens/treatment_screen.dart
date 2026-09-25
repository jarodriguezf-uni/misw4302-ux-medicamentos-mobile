import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../widgets/medicine_components.dart';

class TreatmentScreen extends StatelessWidget {
  const TreatmentScreen({
    required this.medicineName,
    required this.quantityLabel,
    super.key,
  });

  final String medicineName;
  final String quantityLabel;

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
              padding: EdgeInsets.symmetric(
                horizontal: context.screenHorizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  OnboardingBackTitle(
                    title: 'Tu tratamiento',
                    onBack: () => context.canPop()
                        ? context.pop()
                        : context.goNamed('home'),
                  ),
                  const SizedBox(height: 26),
                  MedicineRow(
                    rowKey: const Key('treatment-medicine-row'),
                    title: medicineName,
                    subtitle: quantityLabel,
                    onTap: () {},
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Medicamentos de tu fórmula',
                    style: AppTextStyles.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  OnboardingPrimaryButton(
                    label: 'Buscar dónde reclamar',
                    buttonKey: const Key('treatment-find-location'),
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
