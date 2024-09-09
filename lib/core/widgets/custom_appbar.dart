import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../utils.dart';
import 'buttons/arrow_back_button.dart';
import 'texts/text_r.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar(
    this.title, {
    super.key,
    this.settings = false,
  });

  final String title;
  final bool settings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24 + getStatusBar(context),
        bottom: 12,
      ),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            const SizedBox(width: 20),
            const ArrowBackButton(),
            const SizedBox(width: 20),
            Expanded(child: TextM(title, fontSize: 22)),
            if (!settings)
              CupertinoButton(
                onPressed: () {
                  context.push('/settings');
                },
                padding: EdgeInsets.zero,
                minSize: 40,
                child: SvgPicture.asset('assets/settings.svg'),
              ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
