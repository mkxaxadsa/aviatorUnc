import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/db/prefs.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../flight/bloc/flight_bloc.dart';
import '../widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('Profile', settings: true),
          const SizedBox(height: 12),
          const ProfileCard(),
          const SizedBox(height: 14),
          BlocBuilder<FlightBloc, FlightState>(
            builder: (context, state) {
              if (state is FlightLoadedState) {
                return _Tile(
                  title: 'Miles',
                  amount: getMiles(state.flights).toString(),
                );
              }
              return Container();
            },
          ),
          const SizedBox(height: 14),
          _Tile(title: 'Points', amount: '$profilePoints'),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.amount,
  });

  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          TextM(title, fontSize: 16),
          const Spacer(),
          TextM(
            amount,
            fontSize: 16,
            color: title == 'Miles' ? AppColors.main : AppColors.yellow,
          ),
        ],
      ),
    );
  }
}
