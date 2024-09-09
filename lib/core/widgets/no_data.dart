import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'texts/text_r.dart';

class NoData extends StatelessWidget {
  const NoData(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextM(
        title,
        fontSize: 14,
        center: true,
        color: AppColors.white20,
      ),
    );
  }
}
