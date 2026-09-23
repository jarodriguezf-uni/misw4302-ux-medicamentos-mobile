import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../affiliation/widgets/affiliation_components.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../widgets/medicine_components.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({
    required this.medicineName,
    required this.nextRouteName,
    super.key,
  });

  final String medicineName;
  final String nextRouteName;

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
                    title: 'Datos de la fórmula',
                    onBack: () => context.pop(),
                  ),
                  const SizedBox(height: 26),
                  AffiliationSummaryRow(
                    label: 'Medicamento',
                    value: medicineName,
                    valueKey: const Key('prescription-medicine-name'),
                  ),
                  const AffiliationSummaryRow(
                    label: 'Dosis',
                    value: '1 tableta al día',
                  ),
                  const AffiliationSummaryRow(label: 'Cantidad', value: '30'),
                  const SizedBox(height: AppSpacing.lg),
                  const FormulaValidBadge(
                    label: 'Fórmula vigente hasta 12/2026',
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  OnboardingPrimaryButton(
                    label: 'Continuar',
                    buttonKey: const Key('prescription-continue'),
                    onPressed: () => context.pushNamed(nextRouteName),
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
