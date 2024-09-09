import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/flight.dart';
import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/flight_bloc.dart';
import '../widgets/flight_field.dart';

class FlightAddPage extends StatefulWidget {
  const FlightAddPage({super.key});

  @override
  State<FlightAddPage> createState() => _FlightAddPageState();
}

class _FlightAddPageState extends State<FlightAddPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  int miles = 0;
  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
        controller4,
      ]);
    });
  }

  void onDone() {
    if (controller1.text.isNotEmpty && controller2.text.isNotEmpty) {
      setState(() {
        miles = getRandomMiles();
      });
    }
  }

  void onSave() {
    context.read<FlightBloc>().add(
          AddFlightEvent(
            flight: Flight(
              id: getCurrentTimestamp(),
              from: controller1.text,
              to: controller2.text,
              date: controller3.text,
              time: controller4.text,
              miles: miles,
            ),
          ),
        );
    context.pop();
  }

  void onCancel() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('New Flight'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 12),
                const TextM(
                  'From',
                  fontSize: 14,
                  color: AppColors.main,
                ),
                const SizedBox(height: 12),
                FlightField(
                  controller: controller1,
                  hintText: 'From',
                  prefixID: 1,
                  onChanged: checkActive,
                  onDone: onDone,
                ),
                const SizedBox(height: 24),
                const TextM(
                  'To',
                  fontSize: 14,
                  color: AppColors.main,
                ),
                const SizedBox(height: 12),
                FlightField(
                  controller: controller2,
                  hintText: 'To',
                  prefixID: 2,
                  onChanged: checkActive,
                  onDone: onDone,
                ),
                const SizedBox(height: 24),
                const TextM(
                  'Select a date',
                  fontSize: 14,
                  color: AppColors.main,
                ),
                const SizedBox(height: 12),
                FlightField(
                  controller: controller3,
                  hintText: 'Select a date',
                  prefixID: 3,
                  date: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                const TextM(
                  'Select a time',
                  fontSize: 14,
                  color: AppColors.main,
                ),
                const SizedBox(height: 12),
                FlightField(
                  controller: controller4,
                  hintText: 'Select a time',
                  prefixID: 4,
                  time: true,
                  suffix: false,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 12),
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.grey1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: TextM('$miles bonus miles', fontSize: 14),
                  ),
                ),
                const SizedBox(height: 80),
                PrimaryButton(
                  title: 'Save',
                  active: active,
                  onPressed: onSave,
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  title: 'Cancel',
                  grey: true,
                  onPressed: onCancel,
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
