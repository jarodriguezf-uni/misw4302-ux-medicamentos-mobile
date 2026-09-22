import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/typography.dart';

class EpsValidatingScreen extends StatefulWidget {
  const EpsValidatingScreen({super.key});

  @override
  State<EpsValidatingScreen> createState() => _EpsValidatingScreenState();
}

class _EpsValidatingScreenState extends State<EpsValidatingScreen> {
  Timer? _advanceTimer;

  @override
  void initState() {
    super.initState();
    _advanceTimer = Timer(const Duration(milliseconds: 1400), () {
      if (mounted) context.goNamed('signup-eps-status');
    });
  }

  @override
  void dispose() {
    _advanceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loaderBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.medication,
                  size: 44,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 116),
              Text(
                'Cargando...',
                key: const Key('eps-validating-status'),
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.loaderCaption,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: const LinearProgressIndicator(
                    key: Key('eps-validating-progress'),
                    value: 0.55,
                    minHeight: 6,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Validando afiliación...',
                style: AppTextStyles.cardTitle.copyWith(
                  color: AppColors.loaderStatus,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
