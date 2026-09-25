import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../onboarding/widgets/onboarding_components.dart';

class PendingRegistrationScreen extends StatelessWidget {
  const PendingRegistrationScreen({super.key});

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
                          title: 'Registrar pendiente',
                          onBack: () => context.canPop()
                              ? context.pop()
                              : context.goNamed('home'),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.outlineVariant),
                            borderRadius: BorderRadius.circular(
                              AppSpacing.cardRadius,
                            ),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Metformina 850 mg',
                                style: AppTextStyles.cardTitle,
                              ),
                              SizedBox(height: 5),
                              Text('Medicamento',
                                  style: AppTextStyles.bodySmall),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        Text('CANTIDAD PENDIENTE',
                            style: AppTextStyles.overline),
                        const SizedBox(height: AppSpacing.sm),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.outlineVariant),
                            borderRadius: BorderRadius.circular(
                              AppSpacing.cardRadius,
                            ),
                          ),
                          child:
                              const Text('30', style: AppTextStyles.cardTitle),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        const Text(
                          'La droguería tiene 48 h para entregar el '
                          'pendiente.',
                          style: AppTextStyles.bodySmall,
                        ),
                        const SizedBox(height: AppSpacing.xxl),
                        OnboardingPrimaryButton(
                          label: 'Registrar pendiente',
                          buttonKey: const Key('register-pending'),
                          onPressed: () =>
                              context.goNamed('home-pickup-complete'),
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
