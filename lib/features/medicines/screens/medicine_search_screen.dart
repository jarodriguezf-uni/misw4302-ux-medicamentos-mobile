import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../home/widgets/medication_bottom_navigation.dart';
import '../../onboarding/widgets/onboarding_components.dart';

class MedicineSearchScreen extends StatelessWidget {
  const MedicineSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.surface,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        bottomNavigationBar: const MedicationBottomNavigation(
          selectedTab: MedicationTab.medicines,
        ),
        body: SafeArea(
          bottom: false,
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
                    title: 'Buscar medicamento',
                    onBack: () => context.canPop()
                        ? context.pop()
                        : context.goNamed('home'),
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    width: double.infinity,
                    height: AppSpacing.buttonHeight,
                    child: OutlinedButton.icon(
                      key: const Key('scan-prescription'),
                      onPressed: () => context.pushNamed('medicines-results'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                      ),
                      icon: const Icon(Icons.camera_alt_outlined, size: 18),
                      label: const Text('Escanear mi fórmula'),
                    ),
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
