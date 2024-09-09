import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.id,
    required this.title,
    required this.onPressed,
  });

  final int id;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            TextM(title, fontSize: 16),
            const Spacer(),
            SvgPicture.asset('assets/s$id.svg'),
          ],
        ),
      ),
    );
  }
}
