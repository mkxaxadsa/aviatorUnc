import 'package:avia_test/core/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/db/prefs.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/profile_bloc.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 208,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SvgPicture.asset('assets/logout.svg'),
            const Spacer(),
            const TextM(
              'Do you really want to leave your account?',
              center: true,
              fontSize: 16,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Button(
                  title: 'Cancel',
                  color: AppColors.grey1,
                  onPressed: () {
                    context.pop();
                  },
                ),
                const SizedBox(width: 14),
                _Button(
                  title: 'Leave',
                  color: AppColors.main,
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setInt('profileImageID', 1);
                    prefs.setString('profileName', '');
                    prefs.setString('profileEmail', '');
                    prefs.setString('profileEmail', '');
                    prefs.setInt('points', 0);
                    prefs.setInt('lastEarn', getCurrentTimestamp());
                    profileImageID = 1;
                    profileName = '';
                    profileEmail = '';
                    profilePoints = 0;
                    context.read<ProfileBloc>().add(GetProfileEvent());
                    context.pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.color,
    required this.onPressed,
  });

  final String title;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CupertinoButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          minSize: 38,
          child: Center(
            child: TextB(title, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
