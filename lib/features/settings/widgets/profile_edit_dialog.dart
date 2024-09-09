import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/db/prefs.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/profile_bloc.dart';
import 'profile_images.dart';

class ProfileEditDialog extends StatefulWidget {
  const ProfileEditDialog({super.key});

  @override
  State<ProfileEditDialog> createState() => _ProfileEditDialogState();
}

class _ProfileEditDialogState extends State<ProfileEditDialog> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  int imageID = 1;

  void onImage(int id) {
    setState(() {
      imageID = id;
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
    context.read<ProfileBloc>().add(GetProfileEvent());
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    controller1.text = profileName;
    controller2.text = profileEmail;
    imageID = profileImageID;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 448,
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 24),
                const TextB('Edit Profile', fontSize: 24),
                const Spacer(),
                CupertinoButton(
                  onPressed: () {
                    context.pop();
                  },
                  padding: EdgeInsets.zero,
                  minSize: 30,
                  child: SvgPicture.asset('assets/close.svg'),
                ),
                const SizedBox(width: 24),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                SizedBox(width: 24),
                TextM(
                  'Select Profile Picture:',
                  fontSize: 14,
                  color: AppColors.main,
                ),
              ],
            ),
            const SizedBox(height: 8),
            ProfileImages(onImage: onImage),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextM(
                    'Your Name:',
                    fontSize: 14,
                    color: AppColors.main,
                  ),
                  const SizedBox(height: 8),
                  TxtField(
                    controller: controller1,
                    hintText: 'Enter Your Name',
                    onChanged: () {},
                  ),
                  const SizedBox(height: 20),
                  const TextM(
                    'Your Email:',
                    fontSize: 14,
                    color: AppColors.main,
                  ),
                  const SizedBox(height: 8),
                  TxtField(
                    controller: controller2,
                    hintText: 'Enter Your Email',
                    onChanged: () {},
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    title: 'Save',
                    onPressed: onSave,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
