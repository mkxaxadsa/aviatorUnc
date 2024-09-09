import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/db/prefs.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({super.key});

  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  bool canEarn = true;
  bool earned = false;
  int earnedPoints = 0;
  int lastEarn = 0;
  List<int> points = [0, 50, 100, 150, 200];

  void checkCanEarn() async {
    final prefs = await SharedPreferences.getInstance();
    lastEarn = prefs.getInt('lastEarn') ?? 0;
    int total = getCurrentTimestamp() - lastEarn;
    log(total.toString());
    points.shuffle();
    setState(() {
      if (total >= 43200) {
        canEarn = true;
      } else {
        canEarn = false;
      }
    });
  }

  void onGift(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('lastEarn', getCurrentTimestamp());
    prefs.setInt('points', profilePoints += value);
    profilePoints += value;
    setState(() {
      earned = true;
      earnedPoints = value;
    });
  }

  @override
  void initState() {
    super.initState();
    checkCanEarn();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('Daily Bonus', settings: true),
          const SizedBox(height: 12),
          Image.asset(
            canEarn ? 'assets/gift2.png' : 'assets/gift1.png',
            height: 166,
            width: 166,
          ),
          const SizedBox(height: 14),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 46),
            child: TextM(
              'This is a daily quiz that runs 2 times a day!',
              fontSize: 22,
              center: true,
              color: AppColors.main,
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46),
            child: TextM(
              'Your task is to choose one of the cards and find out what awaits you under it:',
              fontSize: 14,
              center: true,
              color: AppColors.white40,
            ),
          ),
          const SizedBox(height: 48),
          if (canEarn)
            if (earned)
              TextM(
                '$earnedPoints points',
                fontSize: 22,
                color: AppColors.yellow,
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _GiftCard(
                    value: points[0],
                    onPressed: onGift,
                  ),
                  const SizedBox(width: 12),
                  _GiftCard(
                    value: points[1],
                    onPressed: onGift,
                  ),
                  const SizedBox(width: 12),
                  _GiftCard(
                    value: points[2],
                    onPressed: onGift,
                  ),
                ],
              ),
        ],
      ),
    );
  }
}

class _GiftCard extends StatelessWidget {
  const _GiftCard({
    required this.value,
    required this.onPressed,
  });

  final int value;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        onPressed(value);
      },
      padding: EdgeInsets.zero,
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          color: AppColors.grey2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: SvgPicture.asset('assets/s3.svg'),
        ),
      ),
    );
  }
}
