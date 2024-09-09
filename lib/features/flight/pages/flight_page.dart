import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/no_data.dart';
import '../bloc/flight_bloc.dart';
import '../widgets/flight_card.dart';

class FlightPage extends StatelessWidget {
  const FlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const CustomAppbar('My Flight'),
              Expanded(
                child: BlocBuilder<FlightBloc, FlightState>(
                  builder: (context, state) {
                    if (state is FlightLoadedState) {
                      if (state.flights.isEmpty) {
                        return const NoData(
                          'You have not added flight\ninformation yet',
                        );
                      }

                      return ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          const SizedBox(height: 12),
                          ...List.generate(
                            state.flights.length,
                            (index) {
                              return FlightCard(flight: state.flights[index]);
                            },
                          ),
                          SizedBox(height: 130 + getBottom(context)),
                        ],
                      );
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                title: 'Add New Flight',
                width: 214,
                onPressed: () {
                  context.push('/flight/add');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
