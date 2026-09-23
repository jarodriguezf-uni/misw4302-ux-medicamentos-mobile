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
                        Center(
                          child: Container(
                            width: 132,
                            height: 132,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.successBg,
                              border: Border.all(
                                color: AppColors.successFg,
                                width: 2,
                              ),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  size: 38,
                                  color: AppColors.successFg,
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'Disponible',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.successFg,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        const Center(
                          child: Text(
                            'Losartán 50 mg',
                            style: AppTextStyles.screenTitle,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Center(
                          child: Text(
                            'Éxito Norte · actualizado hace 2 h',
                            style: AppTextStyles.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 26),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          decoration: BoxDecoration(
                            color: AppColors.fieldBackground,
                            borderRadius: BorderRadius.circular(
                              AppSpacing.cardRadius,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.info_outline,
                                size: 20,
                                color: AppColors.onSurfaceVariant,
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Text(
                                  'La disponibilidad puede cambiar mientras '
                                  'llegas al punto.',
                                  style: AppTextStyles.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxl),
                        OnboardingPrimaryButton(
                          label: 'Elegir turno',
                          buttonKey: const Key('choose-appointment'),
                          onPressed: () =>
                              context.goNamed('appointments-schedule'),
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
