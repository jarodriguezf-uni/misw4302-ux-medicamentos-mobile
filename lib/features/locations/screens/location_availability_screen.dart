import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../onboarding/widgets/onboarding_components.dart';

class LocationAvailabilityScreen extends StatelessWidget {
  const LocationAvailabilityScreen({super.key});

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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    context.screenHorizontalPadding,
                    8,
                    context.screenHorizontalPadding,
                    AppSpacing.xl,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 8 - AppSpacing.xl,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OnboardingBackTitle(
                          title: 'Disponibilidad',
                          onBack: () => context.canPop()
                              ? context.pop()
                              : context.goNamed('locations-detail'),
                        ),
                        const SizedBox(height: AppSpacing.xxl),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.successBg,
                            borderRadius: BorderRadius.circular(
                              AppSpacing.highlightCardRadius,
                            ),
                          ),
                          child: Text(
                            'Disponible',
                            style: AppTextStyles.screenTitle.copyWith(
                              color: AppColors.successFg,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Actualizado hace 2 h · el dato puede variar; '
                            'confirma al llegar.',
                            style: AppTextStyles.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxl),
                        OnboardingPrimaryButton(
                          label: 'Elegir turno',
                          buttonKey: const Key('choose-appointment'),
                          onPressed: () =>
                              context.pushNamed('appointments-schedule'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
