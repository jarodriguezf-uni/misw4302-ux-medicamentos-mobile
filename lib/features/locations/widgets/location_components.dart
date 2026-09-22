import 'package:flutter/material.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';

enum LocationAvailability { available, unknown, unavailable }

class AvailabilityBadge extends StatelessWidget {
  const AvailabilityBadge({required this.status, super.key});

  final LocationAvailability status;

  @override
  Widget build(BuildContext context) {
    final (label, icon, background, foreground) = switch (status) {
      LocationAvailability.available => (
        'Disponible',
        Icons.check,
        AppColors.successBg,
        AppColors.successFg,
      ),
      LocationAvailability.unknown => (
        'Sin dato',
        Icons.schedule,
        AppColors.warningBg,
        AppColors.warningFg,
      ),
      LocationAvailability.unavailable => (
        'Agotado',
        Icons.close,
        AppColors.dangerBg,
        AppColors.dangerFg,
      ),
    };

    return Container(
      height: AppSpacing.badgeHeight,
      padding: const EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppSpacing.badgeRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: foreground),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.badgeLabel.copyWith(color: foreground),
          ),
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  const LocationCard({
    required this.name,
    required this.distance,
    required this.address,
    required this.status,
    this.onTap,
    this.cardKey,
    super.key,
  });

  final String name;
  final String distance;
  final String address;
  final LocationAvailability status;
  final VoidCallback? onTap;
  final Key? cardKey;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
      child: InkWell(
        key: cardKey,
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text(name, style: AppTextStyles.cardTitle)),
                  const SizedBox(width: AppSpacing.sm),
                  AvailabilityBadge(status: status),
                ],
              ),
              const SizedBox(height: 7),
              Text(address, style: AppTextStyles.bodySmall),
              const SizedBox(height: 5),
              Text(distance, style: AppTextStyles.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationMapPlaceholder extends StatelessWidget {
  const LocationMapPlaceholder({this.height = 132, super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.fieldBackground,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.map_outlined, size: 30, color: AppColors.textMuted),
          const SizedBox(height: AppSpacing.sm),
          Text('Mapa del punto', style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}
