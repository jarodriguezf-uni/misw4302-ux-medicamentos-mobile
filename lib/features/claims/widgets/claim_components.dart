import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../home/screens/home_screen.dart';

class ClaimModalShell extends StatelessWidget {
  const ClaimModalShell({
    required this.child,
    this.referenceHeight = 420,
    super.key,
  });

  final Widget child;
  final double referenceHeight;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final sheetHeight = math.min(referenceHeight, screenHeight * 0.65);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: const Color(0xFF999999),
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned.fill(child: IgnorePointer(child: HomeScreen())),
            Positioned.fill(
              child: ColoredBox(
                color: AppColors.scrim.withValues(
                  alpha: AppColors.scrimOpacity,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Semantics(
                scopesRoute: true,
                namesRoute: true,
                explicitChildNodes: true,
                child: Container(
                  width: double.infinity,
                  height: sheetHeight,
                  padding: EdgeInsets.fromLTRB(
                    AppSpacing.screenPadding,
                    12,
                    AppSpacing.screenPadding,
                    math.max(
                      AppSpacing.xl,
                      MediaQuery.paddingOf(context).bottom + AppSpacing.md,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppSpacing.sheetTopRadius),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: AppSpacing.sheetHandleWidth,
                          height: AppSpacing.sheetHandleHeight,
                          decoration: BoxDecoration(
                            color: AppColors.outlineVariant,
                            borderRadius: BorderRadius.circular(
                              AppSpacing.sheetHandleRadius,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      Expanded(child: SingleChildScrollView(child: child)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ClaimHistoryStatus { complete, partial }

class ClaimHistoryCard extends StatelessWidget {
  const ClaimHistoryCard({
    required this.medicine,
    required this.location,
    required this.dateLabel,
    required this.status,
    super.key,
  });

  final String medicine;
  final String location;
  final String dateLabel;
  final ClaimHistoryStatus status;

  @override
  Widget build(BuildContext context) {
    final isComplete = status == ClaimHistoryStatus.complete;
    final background = isComplete ? AppColors.successBg : AppColors.warningBg;
    final foreground = isComplete ? AppColors.successFg : AppColors.warningFg;
    final statusLabel = isComplete ? 'Completo' : 'Parcial';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.outlineVariant),
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(medicine, style: AppTextStyles.cardTitle)),
              const SizedBox(width: AppSpacing.sm),
              Container(
                height: AppSpacing.badgeHeight,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(AppSpacing.badgeRadius),
                ),
                child: Text(
                  statusLabel,
                  style: AppTextStyles.badgeLabel.copyWith(color: foreground),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(location, style: AppTextStyles.bodySmall),
          const SizedBox(height: 5),
          Text(dateLabel, style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}
