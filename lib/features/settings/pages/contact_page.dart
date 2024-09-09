import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('Contact Us', settings: true),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 12),
                const TextM(
                  'Name:',
                  fontSize: 14,
                  color: AppColors.main,
                ),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller1,
                  hintText: 'Enter Your Name',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 30),
                const TextM(
                  'Email:',
                  fontSize: 14,
                  color: AppColors.main,
                ),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller2,
                  hintText: 'Enter Your Email',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 30),
                const TextM(
                  'Message:',
                  fontSize: 14,
                  color: AppColors.main,
                ),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller3,
                  hintText: 'Write a Message',
                  multiline: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  title: 'Send',
                  active: active,
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
