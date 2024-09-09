import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/profile_bloc.dart';
import 'logout_dialog.dart';
import 'profile_edit_dialog.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoadedState) {
                return Center(
                  child: Column(
                    children: [
                      Container(
                        height: 124,
                        width: 124,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffFF3249),
                              Color(0xff741E99),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Container(
                            height: 118,
                            width: 118,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: AppColors.grey2,
                            ),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(70),
                                child: Image.asset(
                                  'assets/p${state.imageID}.png',
                                  width: 104,
                                  height: 104,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextM(
                        state.name.isEmpty ? 'User' : state.name,
                        fontSize: 24,
                      ),
                      const SizedBox(height: 10),
                      TextM(
                        state.email,
                        fontSize: 14,
                        color: AppColors.white40,
                      ),
                      const SizedBox(height: 14),
                      Container(
                        height: 38,
                        width: 160,
                        decoration: BoxDecoration(
                          color: AppColors.main,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CupertinoButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const ProfileEditDialog();
                              },
                            );
                          },
                          padding: EdgeInsets.zero,
                          minSize: 38,
                          child: const Center(
                            child: TextB('Edit Profile', fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Container();
            },
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CupertinoButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const LogoutDialog();
                  },
                );
              },
              padding: EdgeInsets.zero,
              minSize: 40,
              child: SvgPicture.asset('assets/logout.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
