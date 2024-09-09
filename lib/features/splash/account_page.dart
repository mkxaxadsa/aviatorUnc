import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/db/prefs.dart';
import '../../core/utils.dart';
import '../../core/config/app_colors.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/textfields/txt_field.dart';
import '../../core/widgets/texts/text_r.dart';
import '../settings/bloc/profile_bloc.dart';
import '../settings/widgets/profile_images.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  bool active = false;

  int imageID = 1;

  void onImage(int id) {
    setState(() {
      imageID = id;
    });
  }

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
      ]);
    });
  }

  void onSave() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('profileImageID', imageID);
    prefs.setString('profileName', controller1.text);
    prefs.setString('profileEmail', controller2.text);
    profileImageID = imageID;
    profileName = controller1.text;
    profileEmail = controller2.text;
    await saveData().then((value) {
      context.read<ProfileBloc>().add(GetProfileEvent());
      context.go('/home');
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 24 + getStatusBar(context)),
          const Row(
            children: [
              SizedBox(width: 20),
              TextM('Let\'s get acquainted!', fontSize: 22),
            ],
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              SizedBox(width: 20),
              TextM(
                'Select Profile Picture:',
                fontSize: 14,
                color: AppColors.main,
              ),
            ],
          ),
          const SizedBox(height: 10),
          ProfileImages(onImage: onImage),
          const SizedBox(height: 32),
          const Row(
            children: [
              SizedBox(width: 20),
              TextM(
                'Name:',
                fontSize: 14,
                color: AppColors.main,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TxtField(
              controller: controller1,
              hintText: 'Enter Your Name',
              onChanged: checkActive,
            ),
          ),
          const SizedBox(height: 32),
          const Row(
            children: [
              SizedBox(width: 20),
              TextM(
                'Email:',
                fontSize: 14,
                color: AppColors.main,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TxtField(
              controller: controller2,
              hintText: 'Enter Your Email',
              onChanged: checkActive,
            ),
          ),
          const SizedBox(height: 64),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PrimaryButton(
              title: 'Send',
              active: active,
              onPressed: onSave,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PrimaryButton(
              title: 'Skip',
              grey: true,
              onPressed: () async {
                await saveData().then((value) {
                  context.go('/home');
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
