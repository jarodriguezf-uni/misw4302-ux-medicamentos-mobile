import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../widgets/affiliation_components.dart';

class EpsScreen extends StatefulWidget {
  const EpsScreen({super.key});

  @override
  State<EpsScreen> createState() => _EpsScreenState();
}

class _EpsScreenState extends State<EpsScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                OnboardingBackTitle(
                  title: 'Vincular tu EPS',
                  onBack: () => context.pop(),
                ),
                const SizedBox(height: 26),
                EpsSearchField(controller: _searchController),
                const SizedBox(height: 20),
                EpsOptionCard(
                  label: 'Sanitas',
                  cardKey: const Key('eps-sanitas'),
                  onTap: () => context.goNamed('signup-eps-confirm-sanitas'),
                ),
                const SizedBox(height: AppSpacing.sm),
                EpsOptionCard(
                  label: 'Compensar',
                  cardKey: const Key('eps-compensar'),
                  onTap: () => context.goNamed('signup-eps-confirm-compensar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
