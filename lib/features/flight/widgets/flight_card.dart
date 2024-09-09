import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/flight.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/flight_bloc.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({super.key, required this.flight});

  final Flight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.grey2,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  flight.from,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontFamily: Fonts.medium,
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/home1.svg',
                color: AppColors.main,
              ),
              Expanded(
                child: Text(
                  flight.to,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontFamily: Fonts.medium,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 109,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.grey2,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              TextM(
                'Departure: ${flight.date}, ${flight.time}',
                fontSize: 14,
              ),
              const Spacer(),
              TextM(
                '${flight.miles} miles',
                fontSize: 18,
                color: AppColors.main,
              ),
              const Spacer(),
              CupertinoButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteDialog(
                        title: 'Delete Flight?',
                        onYes: () {
                          context
                              .read<FlightBloc>()
                              .add(DeleteFlightEvent(id: flight.id));
                        },
                      );
                    },
                  );
                },
                padding: EdgeInsets.zero,
                minSize: 24,
                child: SvgPicture.asset('assets/delete.svg'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
