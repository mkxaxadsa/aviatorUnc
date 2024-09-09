import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('Settings', settings: true),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 12),
                const TextM('Account', fontSize: 14),
                const SizedBox(height: 12),
                SettingsTile(
                  id: 1,
                  title: 'Profile',
                  onPressed: () {
                    context.push('/settings/profile');
                  },
                ),
                const SizedBox(height: 10),
                SettingsTile(
                  id: 2,
                  title: 'Notifications',
                  onPressed: () {
                    context.push('/settings/notifications');
                  },
                ),
                const SizedBox(height: 10),
                SettingsTile(
                  id: 3,
                  title: 'Daily Bonus',
                  onPressed: () {
                    context.push('/bonus');
                  },
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 12),
                const TextM('Application', fontSize: 14),
                const SizedBox(height: 12),
                SettingsTile(
                  id: 4,
                  title: 'Contact Us',
                  onPressed: () {
                    context.push('/settings/contact');
                  },
                ),
                const SizedBox(height: 30),
                const TextM('Terms', fontSize: 14),
                const SizedBox(height: 12),
                _Tile(
                  title: 'Terms of Use',
                  onTap: () {
                    _launchURL(
                        'https://docs.google.com/document/d/1CP4UHywZT0-HDfsIzB_V3R27CavQbP6tF6vUi07zzBo/edit?usp=sharing');
                  },
                ),
                const SizedBox(height: 10),
                _Tile(
                  title: 'Privacy Policy',
                  onTap: () {
                    _launchURL(
                        'https://docs.google.com/document/d/1t4fb3Y0FWwhIeqlhTTx1miWth9sEq-RVMP94aybU9Z8/edit?usp=sharing');
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.title, required this.onTap});
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: CupertinoButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            TextM(title, fontSize: 16),
          ],
        ),
      ),
    );
  }
}
