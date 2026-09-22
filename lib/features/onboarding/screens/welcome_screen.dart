import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.primary,
        systemNavigationBarColor: AppColors.primary,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 51),
                        const Center(child: _MedicineMark()),
                        const SizedBox(height: 34),
                        Text(
                          'Reclama tus\nmedicamentos\nsin filas ni viajes en vano',
                          style: AppTextStyles.heroTitle.copyWith(
                            color: AppColors.onPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Consulta el stock antes de salir y saca tu\nturno.',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.onPrimary,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: AppSpacing.buttonHeight,
                          child: FilledButton(
                            key: const Key('welcome-create-account'),
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.onPrimary,
                              foregroundColor: AppColors.primary,
                            ),
                            onPressed: () => context.goNamed('signup'),
                            child: const Text('Crear cuenta'),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        SizedBox(
                          width: double.infinity,
                          height: AppSpacing.buttonHeight,
                          child: OutlinedButton(
                            key: const Key('welcome-login'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.onPrimary,
                              side: const BorderSide(
                                color: AppColors.onPrimary,
                                width: 1.5,
                              ),
                            ),
                            onPressed: () => context.goNamed('login'),
                            child: const Text('Ya tengo cuenta'),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.screenPadding),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _MedicineMark extends StatelessWidget {
  const _MedicineMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.onPrimary.withValues(alpha: 0.20),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Container(
        width: 96,
        height: 96,
        decoration: const BoxDecoration(
          color: AppColors.onPrimary,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.medication,
          color: AppColors.primary,
          size: 36,
          semanticLabel: 'Medicamentos',
        ),
      ),
    );
  }
}
