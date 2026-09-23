import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../home/widgets/medication_bottom_navigation.dart';
import '../widgets/appointment_components.dart';

class AppointmentsListScreen extends StatelessWidget {
  const AppointmentsListScreen({required this.hasActive, super.key});

  final bool hasActive;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.surface,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        bottomNavigationBar: const MedicationBottomNavigation(
          selectedTab: MedicationTab.appointments,
        ),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenPadding,
              33,
              AppSpacing.screenPadding,
              AppSpacing.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mis turnos', style: AppTextStyles.greetingTitle),
                const SizedBox(height: 25),
                AppointmentRow(
                  rowKey: const Key('appointment-a045'),
                  title: 'A-045 · Éxito Norte',
                  subtitle: 'Hoy 10:30',
                  statusLabel: hasActive ? 'Activo' : 'Reclamado',
                  active: hasActive,
                ),
                const SizedBox(height: AppSpacing.sm),
                const AppointmentRow(
                  rowKey: Key('appointment-b012'),
                  title: 'B-012 · Cruz Verde',
                  subtitle: 'Ayer',
                  statusLabel: 'Reclamado',
                  active: false,
                ),
                if (!hasActive) ...[
                  const SizedBox(height: AppSpacing.xl),
                  Center(
                    child: Text(
                      'No tienes turnos activos.',
                      style: AppTextStyles.bodySmall,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
