import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../widgets/medication_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.surface,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        bottomNavigationBar: const MedicationBottomNavigation(
          selectedTab: MedicationTab.home,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hola, María', style: AppTextStyles.greetingTitle),
                  const SizedBox(height: 25),
                  _CurrentClaimCard(
                    onTap: () =>
                        context.goNamed('medicines-treatment-losartan'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'ÚLTIMAS NOTIFICACIONES',
                    style: AppTextStyles.overline,
                  ),
                  const SizedBox(height: 13),
                  _NotificationCard(
                    onTap: () => context.goNamed('home-pickup-decision'),
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

class _CurrentClaimCard extends StatelessWidget {
  const _CurrentClaimCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.loaderBackground.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(AppSpacing.highlightCardRadius),
      child: InkWell(
        key: const Key('current-claim-card'),
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.highlightCardRadius),
        child: SizedBox(
          width: double.infinity,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 150),
            child: const Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Reclamo de medicamento en curso',
                      style: AppTextStyles.cardTitle,
                    ),
                  ),
                  SizedBox(height: 36),
                  Text('Losartán 50 mg', style: AppTextStyles.bodySmall),
                  SizedBox(height: 7),
                  Text(
                    'Turno A-045 · hoy 10:30',
                    style: AppTextStyles.bodySmall,
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Éxito Norte · Disponible',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                      color: AppColors.successText,
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

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
      child: InkWell(
        key: const Key('medicine-available-notification'),
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 76),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 13),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tu medicamento está disponible',
                          style: AppTextStyles.cardTitle,
                        ),
                        SizedBox(height: 7),
                        Text('hace 1 h', style: AppTextStyles.bodySmall),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/chevron-right.svg',
                    width: 20,
                    height: 20,
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
