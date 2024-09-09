import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: Fonts.regular,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.main,
    selectionColor: AppColors.main,
    selectionHandleColor: AppColors.main,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.grey1, // overscroll indicator color
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.grey2,
    insetPadding: EdgeInsets.symmetric(horizontal: 26),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
);
