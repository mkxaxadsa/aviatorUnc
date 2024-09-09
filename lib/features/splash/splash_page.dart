import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/texts/text_r.dart';
import '../flight/bloc/flight_bloc.dart';
import '../settings/bloc/profile_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void load() async {
    context.read<FlightBloc>().add(GetFlightEvent());

    await getData().then((value) {
      context.read<ProfileBloc>().add(GetProfileEvent());
      Future.delayed(const Duration(seconds: 2), () {
        if (onboard) {
          context.go('/onboard');
        } else {
          context.go('/home');
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Logo(),
            SizedBox(height: 23),
            TextM('Loading', fontSize: 12),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xffFF3249),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 13,
            left: 6,
            child: SvgPicture.asset('assets/splash1.svg'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset('assets/splash2.svg'),
          ),
        ],
      ),
    );
  }
}
