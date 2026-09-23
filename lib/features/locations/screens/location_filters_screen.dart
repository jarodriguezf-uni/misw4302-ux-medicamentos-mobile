import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../onboarding/widgets/onboarding_components.dart';

class LocationFiltersScreen extends StatefulWidget {
  const LocationFiltersScreen({super.key});

  @override
  State<LocationFiltersScreen> createState() => _LocationFiltersScreenState();
}

class _LocationFiltersScreenState extends State<LocationFiltersScreen> {
  String _eps = 'Compensar';
  String _city = 'Bogotá';
  String _distance = '3 km';

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
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenPadding,
              8,
              AppSpacing.screenPadding,
              AppSpacing.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OnboardingBackTitle(
                  title: 'Filtros',
                  onBack: () => context.canPop()
                      ? context.pop()
                      : context.goNamed('medicines-search'),
                ),
                const SizedBox(height: 30),
                _FilterDropdown(
                  label: 'EPS',
                  fieldKey: const Key('filter-eps'),
                  value: _eps,
                  items: const ['Compensar', 'Sanitas'],
                  onChanged: (value) => setState(() => _eps = value),
                ),
                const SizedBox(height: 20),
                _FilterDropdown(
                  label: 'Ciudad',
                  fieldKey: const Key('filter-city'),
                  value: _city,
                  items: const ['Bogotá', 'Medellín', 'Cali'],
                  onChanged: (value) => setState(() => _city = value),
                ),
                const SizedBox(height: 26),
                Text('Distancia', style: AppTextStyles.bodyMediumBold),
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: ['1 km', '3 km', '5 km', 'Cualquiera']
                      .map(
                        (distance) => ChoiceChip(
                          key: Key('distance-$distance'),
                          label: Text(distance),
                          selected: _distance == distance,
                          onSelected: (_) =>
                              setState(() => _distance = distance),
                          showCheckmark: false,
                          selectedColor: AppColors.primaryContainer,
                          backgroundColor: AppColors.surface,
                          side: BorderSide(
                            color: _distance == distance
                                ? AppColors.primary
                                : AppColors.outline,
                          ),
                          labelStyle: AppTextStyles.bodySmall.copyWith(
                            color: _distance == distance
                                ? AppColors.onPrimaryContainer
                                : AppColors.onSurface,
                            fontWeight: _distance == distance
                                ? FontWeight.w700
                                : FontWeight.w400,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 38),
                OnboardingPrimaryButton(
                  label: 'Aplicar filtros',
                  buttonKey: const Key('apply-location-filters'),
                  onPressed: () => context.goNamed('locations'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  const _FilterDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.fieldKey,
  });

  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;
  final Key fieldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OnboardingFieldLabel(label),
        const SizedBox(height: AppSpacing.xs),
        Container(
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.fieldBackground,
            borderRadius: BorderRadius.circular(6),
          ),
          child: PopupMenuButton<String>(
            key: fieldKey,
            initialValue: value,
            onSelected: onChanged,
            itemBuilder: (context) => items
                .map(
                  (item) => PopupMenuItem<String>(
                    value: item,
                    child: Text(item, style: AppTextStyles.bodySmall),
                  ),
                )
                .toList(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.onSurface,
                      ),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, size: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
