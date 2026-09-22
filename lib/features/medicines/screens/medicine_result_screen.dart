import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../widgets/medicine_components.dart';

class MedicineResultScreen extends StatelessWidget {
  const MedicineResultScreen({super.key});

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
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                OnboardingBackTitle(
                  title: 'Resultado',
                  onBack: () => context.pop(),
                ),
                const SizedBox(height: 26),
                MedicineRow(
                  rowKey: const Key('medicine-result-losartan'),
                  title: 'Losartán 50 mg',
                  subtitle: 'Tableta · caja x30',
                  showChevron: false,
                  onTap: () =>
                      context.pushNamed('medicines-prescription-losartan'),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text('EQUIVALENTES GENÉRICOS', style: AppTextStyles.overline),
                const SizedBox(height: AppSpacing.sm),
                MedicineRow(
                  rowKey: const Key('medicine-result-losartan-potasico'),
                  title: 'Losartán potásico 50 mg',
                  subtitle: 'genérico',
                  onTap: () => context.pushNamed(
                    'medicines-prescription-losartan-potasico',
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                MedicineRow(
                  rowKey: const Key('medicine-result-losartan-mk'),
                  title: 'Losartán MK 50 mg',
                  subtitle: 'genérico',
                  onTap: () =>
                      context.pushNamed('medicines-prescription-losartan-mk'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
