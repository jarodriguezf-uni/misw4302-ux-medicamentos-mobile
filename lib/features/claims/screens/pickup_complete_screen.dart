import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../widgets/claim_components.dart';

class PickupCompleteScreen extends StatelessWidget {
  const PickupCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClaimModalShell(
      referenceHeight: 390,
      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: const BoxDecoration(
              color: AppColors.successBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              size: 30,
              color: AppColors.successFg,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Reclamo completado', style: AppTextStyles.sheetTitle),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Registramos la entrega de tus medicamentos.',
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          OnboardingPrimaryButton(
            label: 'Calificar el punto',
            buttonKey: const Key('rate-location'),
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacing.md),
          OnboardingOutlineButton(
            label: 'Ver historial',
            buttonKey: const Key('view-history'),
            onPressed: () => context.goNamed('history'),
          ),
        ],
      ),
    );
  }
}
