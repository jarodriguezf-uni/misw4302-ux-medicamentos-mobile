import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/typography.dart';

enum MedicationTab { home, account, medicines, claim, appointments }

class MedicationBottomNavigation extends StatelessWidget {
  const MedicationBottomNavigation({required this.selectedTab, super.key});

  final MedicationTab selectedTab;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.outlineVariant)),
      ),
      child: SizedBox(
        height: AppSpacing.bottomNavHeight,
        child: Row(
          children: [
            _NavigationItem(
              label: 'Inicio',
              assetName: 'assets/icons/nav-home.svg',
              selected: selectedTab == MedicationTab.home,
              onTap: () => context.goNamed('home'),
            ),
            _NavigationItem(
              label: 'Cuenta',
              assetName: 'assets/icons/nav-account.svg',
              selected: selectedTab == MedicationTab.account,
              onTap: () {},
            ),
            _NavigationItem(
              label: 'Medicinas',
              assetName: 'assets/icons/nav-medicines.svg',
              selected: selectedTab == MedicationTab.medicines,
              onTap: () => context.goNamed('medicines-search'),
            ),
            _NavigationItem(
              label: 'Reclamar',
              assetName: 'assets/icons/nav-claim.svg',
              selected: selectedTab == MedicationTab.claim,
              onTap: () {},
            ),
            _NavigationItem(
              label: 'Turno',
              assetName: 'assets/icons/nav-appointments.svg',
              selected: selectedTab == MedicationTab.appointments,
              onTap: () => context.goNamed('appointments'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.label,
    required this.assetName,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String assetName;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Semantics(
        button: true,
        selected: selected,
        label: label,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            key: Key('nav-${label.toLowerCase()}'),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(top: 9, bottom: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 52,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.tabActiveBg
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SvgPicture.asset(
                      assetName,
                      width: AppSpacing.iconSize,
                      height: AppSpacing.iconSize,
                      colorFilter: ColorFilter.mode(
                        selected ? AppColors.tabActiveFg : AppColors.textMuted,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                      style: AppTextStyles.navLabel.copyWith(
                        color: selected
                            ? AppColors.tabActiveFg
                            : AppColors.textMuted,
                      ),
                    ),
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
