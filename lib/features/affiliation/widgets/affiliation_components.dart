import 'package:flutter/material.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';

class EpsSearchField extends StatelessWidget {
  const EpsSearchField({this.controller, super.key});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        key: const Key('eps-search'),
        controller: controller,
        style: AppTextStyles.bodyMedium,
        decoration: InputDecoration(
          hintText: 'Busca tu EPS',
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textMuted,
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 18,
            color: AppColors.textMuted,
          ),
          filled: true,
          fillColor: AppColors.fieldBackground,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class AffiliationSummaryRow extends StatelessWidget {
  const AffiliationSummaryRow({
    required this.label,
    required this.value,
    this.valueKey,
    super.key,
  });

  final String label;
  final String value;
  final Key? valueKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.outlineVariant)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              value,
              key: valueKey,
              style: AppTextStyles.cardTitle,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class EpsOptionCard extends StatelessWidget {
  const EpsOptionCard({
    required this.label,
    required this.onTap,
    this.cardKey,
    super.key,
  });

  final String label;
  final VoidCallback onTap;
  final Key? cardKey;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      child: InkWell(
        key: cardKey,
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.outlineVariant),
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          ),
          child: Row(
            children: [
              Expanded(child: Text(label, style: AppTextStyles.cardTitle)),
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
