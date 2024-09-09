import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 144,
        decoration: BoxDecoration(
          color: AppColors.grey2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: CupertinoButton(
          onPressed: () {
            if (title == 'Daily Bonus') {
              context.push('/bonus');
            } else {
              context.push('/flight');
            }
          },
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: AppColors.white10,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    title == 'Daily Bonus'
                        ? 'assets/home1.svg'
                        : 'assets/home2.svg',
                  ),
                ),
              ),
              const Spacer(),
              TextM(title, fontSize: 16),
            ],
          ),
        ),
      ),
    );
  }
}
