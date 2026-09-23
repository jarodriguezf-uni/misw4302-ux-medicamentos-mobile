import 'package:flutter/material.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';

class DaySlotChip extends StatelessWidget {
  const DaySlotChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.chipKey,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Key? chipKey;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.onSurface : AppColors.surface,
      borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
      child: InkWell(
        key: chipKey,
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
            border:
                selected ? null : Border.all(color: AppColors.outlineVariant),
          ),
          child: Text(
            label,
            style: AppTextStyles.bodyMediumBold.copyWith(
              color: selected ? AppColors.surface : AppColors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentStatusBadge extends StatelessWidget {
  const AppointmentStatusBadge({
    required this.label,
    required this.active,
    super.key,
  });

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.badgeHeight + 6,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? AppColors.loaderBackground : AppColors.fieldBackground,
        borderRadius: BorderRadius.circular(AppSpacing.badgeRadius + 3),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmallBold.copyWith(
          color: active ? AppColors.loaderStatus : AppColors.textMuted,
        ),
      ),
    );
  }
}

class AppointmentRow extends StatelessWidget {
  const AppointmentRow({
    required this.title,
    required this.subtitle,
    required this.statusLabel,
    required this.active,
    this.rowKey,
    super.key,
  });

  final String title;
  final String subtitle;
  final String statusLabel;
  final bool active;
  final Key? rowKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: rowKey,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.outlineVariant),
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.cardTitle),
                const SizedBox(height: 6),
                Text(subtitle, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          AppointmentStatusBadge(label: statusLabel, active: active),
        ],
      ),
    );
  }
}

class TurnTicketCard extends StatelessWidget {
  const TurnTicketCard({
    required this.code,
    required this.point,
    required this.etaLabel,
    super.key,
  });

  final String code;
  final String point;
  final String etaLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: AppColors.loaderBackground,
        borderRadius: BorderRadius.circular(AppSpacing.highlightCardRadius),
      ),
      child: Column(
        children: [
          Text(
            code,
            style: AppTextStyles.heroTitle.copyWith(
              fontSize: 40,
              color: AppColors.loaderStatus,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            point,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'hora estimada: $etaLabel',
            style: AppTextStyles.bodyMediumBold.copyWith(
              color: AppColors.loaderStatus,
            ),
          ),
        ],
      ),
    );
  }
}
