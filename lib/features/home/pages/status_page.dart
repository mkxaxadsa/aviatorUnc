import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../common/assets.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  CarouselSliderController sliderController = CarouselSliderController();

  ValueNotifier<int> indexPage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppbar('Status'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "You current status",
              style: TextStyle(color: AppColors.main, fontSize: 16),
            ),
          ),
          CarouselSlider(
            carouselController: sliderController,
            options: CarouselOptions(
              height: 370.0,
              // aspectRatio: 14 / 9,
              viewportFraction: .7,
              initialPage: 0,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                indexPage.value = index;
              },
              scrollDirection: Axis.horizontal,
            ),
            items: statuses.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ValueListenableBuilder(
                    valueListenable: indexPage,
                    builder: (context, value, child) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.grey2,
                          borderRadius: BorderRadius.circular(16),
                          border: value == statuses.indexOf(i)
                              ? Border.all(color: const Color(0xFFFF9900))
                              : null,
                          boxShadow: value == statuses.indexOf(i)
                              ? [
                                  BoxShadow(
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                    color:
                                        const Color(0xFFFF9900).withOpacity(.4),
                                  )
                                ]
                              : [],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            SvgPicture.asset(i.image),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    i.name,
                                    style: const TextStyle(
                                      fontFamily: 'Itern',
                                      color: Color(0xFFFF9900),
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      i.desc,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(.56),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16)
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            }).toList(),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey2,
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "You get a new status for every 5,000 miles flown. You are currently in gold status",
                    style: TextStyle(
                      color: AppColors.white.withOpacity(.35),
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                SvgPicture.asset(Assets.assetsInfo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatusModel {
  String name;
  String image;
  String desc;

  StatusModel({required this.name, required this.image, required this.desc});

  @override
  bool operator ==(Object other) {
    return (other as StatusModel).name == name;
  }
}
