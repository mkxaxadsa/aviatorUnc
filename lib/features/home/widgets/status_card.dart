import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../pages/status_page.dart';

class StatusCard extends StatelessWidget {
  const StatusCard(this.status, {super.key});

  final StatusModel status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextM('Your current status:', fontSize: 14),
                const SizedBox(height: 10),
                TextB(
                  status.name,
                  fontSize: 30,
                  color: AppColors.yellow,
                ),
                const SizedBox(height: 44),
                TextR(
                  status.desc,
                  fontSize: 14,
                  color: AppColors.white56,
                ),
                const SizedBox(height: 14),
                CupertinoButton(
                  onPressed: () {
                    context.push('/home/status');
                  },
                  padding: EdgeInsets.zero,
                  minSize: 30,
                  child: Container(
                    height: 30,
                    width: 96,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: TextB('Details', fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          SvgPicture.asset(status.image),
        ],
      ),
    );
  }
}
