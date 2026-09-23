import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../widgets/appointment_components.dart';

class AppointmentConfirmedScreen extends StatelessWidget {
  const AppointmentConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.surface,
        systemNavigationBarColor: AppColors.surface,
      ),
      child: Scaffold(
        body: SafeArea(
          child: ResponsiveScreenWidth(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenHorizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  OnboardingBackTitle(
                    title: 'Turno confirmado',
                    onBack: () => context.pop(),
                  ),
                  const SizedBox(height: 26),
                  const TurnTicketCard(
                    code: 'A-045',
                    point: 'Éxito Norte',
                    etaLabel: '10:30 AM',
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const _NotifyRow(
                    icon: Icons.chat_bubble_outline,
                    label: 'Te lo enviaremos por WhatsApp',
                  ),
                  const SizedBox(height: AppSpacing.md),
                  const _NotifyRow(
                    icon: Icons.mail_outline,
                    label: 'y por correo electrónico',
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  OnboardingPrimaryButton(
                    label: 'Ver mis turnos',
                    buttonKey: const Key('confirmed-view-appointments'),
                    onPressed: () => context.goNamed('appointments'),
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

class _NotifyRow extends StatelessWidget {
  const _NotifyRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primary),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: Text(label, style: AppTextStyles.bodyMedium)),
      ],
    );
  }
}
