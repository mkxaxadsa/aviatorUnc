import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/db/db.dart';
import '../../../core/db/prefs.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../settings/bloc/profile_bloc.dart';
import '../widgets/home_card.dart';
import '../widgets/status_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> statusState = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      statusState.value = getMiles(flightsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 24 + getStatusBar(context)),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return Row(
                  children: [
                    TextM(
                      profileName.isEmpty ? 'Hi, Guest' : 'Hi, $profileName',
                      fontSize: 14,
                      color: AppColors.main,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: TextM(
                    'We have prepared statistics for you',
                    fontSize: 22,
                  ),
                ),
                const Spacer(),
                CupertinoButton(
                  onPressed: () {
                    context.push('/settings');
                  },
                  padding: EdgeInsets.zero,
                  minSize: 40,
                  child: SvgPicture.asset('assets/settings.svg'),
                ),
              ],
            ),
            const SizedBox(height: 35),
            ValueListenableBuilder(
              valueListenable: statusState,
              builder: (context, value, child) {
                return StatusCard(getStatus(statusState.value));
              },
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                HomeCard(title: 'Daily Bonus'),
                SizedBox(width: 20),
                HomeCard(title: 'My Flight'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
