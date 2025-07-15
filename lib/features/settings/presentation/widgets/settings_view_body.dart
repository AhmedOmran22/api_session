import 'package:api_session/core/routes/app_routes.dart';
import 'package:api_session/core/widgets/theme_switcher.dart';
import 'package:api_session/features/settings/presentation/widgets/settings_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/prefs.dart';
import 'custom_divider.dart';

class SetingsViewBody extends StatelessWidget {
  const SetingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SettingsItem(
          icon: Icons.person,
          title: 'change Password',
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.changePassword),
        ),
        const CustomDivider(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SettingsItem(
                icon: Icons.dark_mode,
                title: 'Change Theme',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: ThemeSwitcher(),
            ),
          ],
        ),
        const CustomDivider(),
        SettingsItem(
          icon: Icons.logout_sharp,
          title: 'Logout',
          onTap: () {
            Prefs.removeData(key: kToken);
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}
