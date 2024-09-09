import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../texts/text_r.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    super.key,
    required this.title,
    required this.onYes,
  });

  final String title;
  final void Function() onYes;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(24),
        height: 208,
        child: Column(
          children: [
            TextB(
              title,
              fontSize: 18,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Button(
                  title: 'NO',
                  color: AppColors.grey1,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 14),
                _Button(
                  title: 'YES',
                  color: AppColors.main,
                  onPressed: () {
                    Navigator.pop(context);
                    onYes();
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
