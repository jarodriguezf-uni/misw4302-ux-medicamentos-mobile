import 'package:flutter/material.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';

enum LocationAvailability { available, unknown, unavailable }

(String label, Color background, Color foreground) _availabilityStyle(
  LocationAvailability status,
) =>
    switch (status) {
      LocationAvailability.available => (
          'Disponible',
          AppColors.successBg,
          AppColors.successFg,
        ),
      LocationAvailability.unknown => (
          'Sin dato',
          AppColors.warningBg,
          AppColors.warningFg,
        ),
      LocationAvailability.unavailable => (
          'Agotado',
          AppColors.dangerBg,
          AppColors.dangerFg,
        ),
    };

class AvailabilityBadge extends StatelessWidget {
  const AvailabilityBadge({required this.status, super.key});

  final LocationAvailability status;

  @override
  Widget build(BuildContext context) {
    final (label, background, foreground) = _availabilityStyle(status);

    return Container(
      height: AppSpacing.badgeHeight,
      padding: const EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppSpacing.badgeRadius),
      ),
      // `Center(widthFactor: 1)` en vez del `alignment` de `Container`: ver
      // la nota en `DaySlotChip` sobre por qué `alignment` sin `width` puede
      // expandir el pill al ancho disponible en vez de ajustarse al texto.
      child: Center(
        widthFactor: 1,
        child: Text(
          label,
          style: AppTextStyles.badgeLabel.copyWith(color: foreground),
        ),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  const LocationCard({
    required this.name,
    required this.distance,
    required this.status,
    this.onTap,
    this.cardKey,
    super.key,
  });

  final String name;
  final String distance;
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppTextStyles.cardTitle),
                    const SizedBox(height: 5),
                    Text(distance, style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              AvailabilityBadge(status: status),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicationAvailabilityPill extends StatelessWidget {
  const MedicationAvailabilityPill({
    required this.medicationLabel,
    required this.status,
    super.key,
  });

  final String medicationLabel;
  final LocationAvailability status;

  @override
  Widget build(BuildContext context) {
    final (statusLabel, background, foreground) = _availabilityStyle(status);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppSpacing.badgeRadius + 3),
      ),
      child: Text(
        '$medicationLabel · $statusLabel',
        style: AppTextStyles.bodyMediumBold.copyWith(color: foreground),
      ),
    );
  }
}

class LocationMapPlaceholder extends StatelessWidget {
  const LocationMapPlaceholder({this.height, super.key});

  /// Cuando es `null`, ocupa el alto que le dé el padre (pensado para
  /// envolver este widget en `Expanded`).
  final double? height;

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
      alignment: Alignment.center,
      child: Text('Mapa', style: AppTextStyles.bodySmall),
    );
  }
}
