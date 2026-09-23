import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../widgets/claim_components.dart';

class PickupDecisionScreen extends StatelessWidget {
  const PickupDecisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClaimModalShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('¿Recibiste tu medicamento?', style: AppTextStyles.sheetTitle),
          const SizedBox(height: 14),
          Text(
            'A continuación selecciona alguna de las siguientes opciones:',
            style: AppTextStyles.bodySmall,
          ),
          const SizedBox(height: AppSpacing.xl),
          OnboardingPrimaryButton(
            label: 'Sí, completo',
            buttonKey: const Key('pickup-complete'),
            onPressed: () => context.goNamed('home-pickup-complete'),
          ),
          const SizedBox(height: AppSpacing.md),
          OnboardingOutlineButton(
            label: 'Solo una parte',
            buttonKey: const Key('pickup-partial'),
            onPressed: () =>
                context.goNamed('appointments-pending-registration'),
          ),
          const SizedBox(height: AppSpacing.md),
          OnboardingOutlineButton(
            label: 'No había',
            buttonKey: const Key('pickup-unavailable'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
