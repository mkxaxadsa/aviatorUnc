import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool notification = false;

  void onNotification() async {
    notification = !notification;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('notification', notification);
    setState(() {});
  }

  void getNotification() async {
    final prefs = await SharedPreferences.getInstance();
    notification = prefs.getBool('notification') ?? false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('Notifications', settings: true),
          const SizedBox(height: 12),
          Container(
            height: 68,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.grey2,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const TextM(
                  'Notifications',
                  fontSize: 14,
                ),
                const Spacer(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 18,
                  width: 40,
                  decoration: BoxDecoration(
                    color: notification ? AppColors.main : AppColors.white56,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CupertinoButton(
                    onPressed: onNotification,
                    padding: EdgeInsets.zero,
                    minSize: 18,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          top: 2,
                          right: notification ? 2 : 24,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: notification
                                  ? AppColors.white
                                  : AppColors.grey1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Row(
            children: [
              SizedBox(width: 20),
              TextM(
                'Daily Notifications:',
                fontSize: 14,
                color: AppColors.main,
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: TextM(
                'No notifications today',
                fontSize: 14,
                color: AppColors.white20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
