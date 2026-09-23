import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../models/appointment_selection.dart';
import '../widgets/appointment_components.dart';

const _days = ['Hoy', 'Mañana', 'Mié 20'];

const _slotTimes = <String, String>{
  '8–10': '8:00 – 8:30',
  '10–12': '10:00 – 10:30',
  '2–4': '2:00 – 2:30',
};

class AppointmentScheduleScreen extends StatefulWidget {
  const AppointmentScheduleScreen({super.key});

  @override
  State<AppointmentScheduleScreen> createState() =>
      _AppointmentScheduleScreenState();
}

class _AppointmentScheduleScreenState extends State<AppointmentScheduleScreen> {
  String _selectedDay = 'Hoy';
  String _selectedSlot = '10–12';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.surface,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                OnboardingBackTitle(
                  title: 'Elegir turno',
                  onBack: () => context.pop(),
                ),
                const SizedBox(height: 26),
                Text('DÍA', style: AppTextStyles.overline),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    for (final day in _days)
                      DaySlotChip(
                        chipKey: Key('day-${day.toLowerCase()}'),
                        label: day,
                        selected: day == _selectedDay,
                        onTap: () => setState(() => _selectedDay = day),
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Text('FRANJA HORARIA', style: AppTextStyles.overline),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    for (final slot in _slotTimes.keys)
                      DaySlotChip(
                        chipKey: Key(
                          'slot-${slot.replaceAll('–', '-').replaceAll(' ', '')}',
                        ),
                        label: slot,
                        selected: slot == _selectedSlot,
                        onTap: () => setState(() => _selectedSlot = slot),
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xl),
                OnboardingPrimaryButton(
                  label: 'Continuar',
                  buttonKey: const Key('schedule-continue'),
                  onPressed: () => context.pushNamed(
                    'appointments-confirm',
                    extra: AppointmentSelection(
                      dayLabel: _selectedDay,
                      timeLabel: _slotTimes[_selectedSlot]!,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
