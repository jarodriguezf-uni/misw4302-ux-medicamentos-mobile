import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../onboarding/widgets/onboarding_components.dart';

class EpsStatusScreen extends StatelessWidget {
  const EpsStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveScreenWidth(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenHorizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  'Estado de la afiliación',
                  style: AppTextStyles.screenTitle,
                ),
                const SizedBox(height: 72),
                Center(
                  child: Container(
                    width: 176,
                    height: 176,
                    decoration: const BoxDecoration(
                      color: AppColors.successBg,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      size: 58,
                      color: AppColors.successText,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Tu EPS quedó vinculada',
                  style: AppTextStyles.screenTitle,
                ),
                const SizedBox(height: 8),
                Text(
                  'Ya puedes buscar tus medicamentos.',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 28),
                OnboardingPrimaryButton(
                  label: 'Continuar',
                  buttonKey: const Key('eps-status-continue'),
                  onPressed: () => context.goNamed('home'),
                ),
                const SizedBox(height: AppSpacing.sm),
                OnboardingOutlineButton(
                  label: 'Regresar',
                  buttonKey: const Key('eps-status-back'),
                  onPressed: () => context.canPop()
                      ? context.pop()
                      : context.goNamed('signup-eps'),
                ),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
