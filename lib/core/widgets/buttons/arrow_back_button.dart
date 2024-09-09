import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../texts/text_r.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 78,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        onPressed: () {
          Navigator.pop(context);
        },
        padding: EdgeInsets.zero,
        minSize: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/chevron.svg'),
            const SizedBox(width: 7),
            const TextB(
              'Back',
              fontSize: 14,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
