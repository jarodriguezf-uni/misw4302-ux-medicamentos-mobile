import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/responsive.dart';
import '../../onboarding/widgets/onboarding_components.dart';
import '../widgets/affiliation_components.dart';

class EpsConfirmScreen extends StatelessWidget {
  const EpsConfirmScreen({required this.epsName, super.key});

  final String epsName;

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
                    title: 'Confirma tus datos',
                    onBack: () => context.pop(),
                  ),
                  const SizedBox(height: 26),
                  const AffiliationSummaryRow(
                    label: 'Documento',
                    value: '52 •••890',
                  ),
                  const AffiliationSummaryRow(
                    label: 'Nombre',
                    value: 'María P.',
                  ),
                  AffiliationSummaryRow(
                    label: 'EPS',
                    value: epsName,
                    valueKey: const Key('eps-confirm-name'),
                  ),
                  const SizedBox(height: 30),
                  OnboardingPrimaryButton(
                    label: 'Confirmar',
                    buttonKey: const Key('eps-confirm-submit'),
                    onPressed: () => context.goNamed('signup-eps-validating'),
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
