import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/texts/text_r.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/onboard.svg',
                width: MediaQuery.of(context).size.width >= 300 ? 300 : null,
                height: MediaQuery.of(context).size.width >= 300 ? 300 : null,
              ),
              const Spacer(),
              const TextM(
                'Welcome to',
                fontSize: 14,
                color: AppColors.main,
              ),
              const TextM('Aviatorly Flight Utility', fontSize: 22),
              const SizedBox(height: 24),
              TextM(
                'Keep a record of flight information, mark different places visited, get extra bonuses',
                fontSize: 14,
                center: true,
                color: AppColors.white40,
              ),
              const Spacer(flex: 3),
              PrimaryButton(
                title: 'Get Started',
                width: 214,
                onPressed: () async {
                  context.go('/account');
                },
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
