import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../home/widgets/medication_bottom_navigation.dart';
import '../widgets/claim_components.dart';

class ClaimHistoryScreen extends StatelessWidget {
  const ClaimHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.surface,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        bottomNavigationBar: const MedicationBottomNavigation(
          selectedTab: MedicationTab.claim,
        ),
        body: SafeArea(
          bottom: false,
          child: ResponsiveScreenWidth(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                context.screenHorizontalPadding,
                33,
                context.screenHorizontalPadding,
                AppSpacing.xl,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Historial del reclamo',
                    style: AppTextStyles.greetingTitle,
                  ),
                  SizedBox(height: 25),
                  ClaimHistoryCard(
                    medicine: 'Losartán 50 mg',
                    location: 'Éxito Norte',
                    dateLabel: 'Hoy · 10:30',
                    status: ClaimHistoryStatus.complete,
                  ),
                  SizedBox(height: AppSpacing.md),
                  ClaimHistoryCard(
                    medicine: 'Metformina 850 mg',
                    location: 'Cruz Verde 127',
                    dateLabel: 'Ayer · 4:15 p. m.',
                    status: ClaimHistoryStatus.partial,
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
