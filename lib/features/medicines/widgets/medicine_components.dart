import 'package:flutter/material.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';

class MedicineRow extends StatelessWidget {
  const MedicineRow({
    required this.title,
    required this.subtitle,
    this.onTap,
    this.showChevron = true,
    this.rowKey,
    super.key,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool showChevron;
  final Key? rowKey;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      child: InkWell(
        key: rowKey,
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.outlineVariant),
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          ),
          child: Row(
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
              if (showChevron)
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: AppColors.onSurface,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormulaValidBadge extends StatelessWidget {
  const FormulaValidBadge({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.fieldBackground,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: Row(
        children: [
          const Icon(Icons.check, size: 18, color: AppColors.onSurface),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(label, style: AppTextStyles.bodyMedium)),
        ],
      ),
    );
  }
}
