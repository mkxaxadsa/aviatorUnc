import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

class FlightField extends StatefulWidget {
  const FlightField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixID,
    this.date = false,
    this.time = false,
    this.suffix = true,
    required this.onChanged,
    this.onDone,
  });

  final TextEditingController controller;
  final String hintText;
  final int prefixID;
  final bool date;
  final bool time;
  final bool suffix;
  final void Function() onChanged;
  final void Function()? onDone;

  @override
  State<FlightField> createState() => _FlightFieldState();
}

class _FlightFieldState extends State<FlightField> {
  void onDateTimeChanged(DateTime date) {
    setState(() {
      widget.controller.text = formatDateTime(date);
    });
    widget.onChanged();
  }

  void onTimeChanged(DateTime date) {
    setState(() {
      widget.controller.text = formatTime(date);
    });
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: widget.controller,
        readOnly: widget.date || widget.time ? true : false,
        inputFormatters: [
          LengthLimitingTextInputFormatter(30),
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontFamily: Fonts.medium,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset('assets/flight${widget.prefixID}.svg'),
          ),
          suffixIcon: widget.suffix
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 25,
                  ),
                  child: SvgPicture.asset('assets/flight5.svg'),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: AppColors.grey1,
            fontSize: 14,
            fontFamily: Fonts.medium,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
          if (widget.controller.text.isNotEmpty) {
            widget.onDone!();
          }
        },
        onChanged: (value) {
          widget.onChanged();
        },
        onEditingComplete: () {
          widget.onDone!();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: () async {
          if (widget.date) {
            await showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    color: AppColors.grey2,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          color: AppColors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      onDateTimeChanged: onDateTimeChanged,
                      initialDateTime: convertToDateTime(
                        widget.controller.text,
                      ),
                      mode: CupertinoDatePickerMode.date,
                      minimumYear: 1970,
                      maximumYear: DateTime.now().year,
                    ),
                  ),
                );
              },
            );
          } else if (widget.time) {
            await showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    color: AppColors.grey2,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          color: AppColors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      onDateTimeChanged: onTimeChanged,
                      initialDateTime: convertToDateTime(
                        widget.controller.text,
                      ),
                      mode: CupertinoDatePickerMode.time,
                      use24hFormat: true,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
