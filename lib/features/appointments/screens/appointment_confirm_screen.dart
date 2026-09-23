import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../affiliation/widgets/affiliation_components.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../models/appointment_selection.dart';

class AppointmentConfirmScreen extends StatelessWidget {
  const AppointmentConfirmScreen({required this.selection, super.key});

  final AppointmentSelection selection;

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
                    title: 'Confirmar turno',
                    onBack: () => context.pop(),
                  ),
                  const SizedBox(height: 26),
                  const AffiliationSummaryRow(
                    label: 'Punto',
                    value: 'Éxito Norte',
                  ),
                  AffiliationSummaryRow(
                    label: 'Día',
                    value: selection.dayLabel,
                    valueKey: const Key('confirm-day'),
                  ),
                  AffiliationSummaryRow(
                    label: 'Hora',
                    value: selection.timeLabel,
                    valueKey: const Key('confirm-time'),
                  ),
                  const AffiliationSummaryRow(
                    label: 'Medicamento',
                    value: 'Losartán 50 mg',
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Center(
                    child: Text(
                      'Reservando tu turno…',
                      style: AppTextStyles.bodySmall,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  OnboardingPrimaryButton(
                    label: 'Confirmar turno',
                    buttonKey: const Key('confirm-appointment-submit'),
                    onPressed: () =>
                        context.pushNamed('appointments-confirmed'),
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
