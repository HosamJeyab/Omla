import 'package:flutter/material.dart';
import 'package:omla/core/const/app_color.dart';

class AppTestStyle {
  static const TextStyle appBarTitleTextStyle = TextStyle(
    fontSize: 36,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.bold,
    color: AppColor.appBarTitleColor,
  );
  static const TextStyle sourceAmountTextStyle = TextStyle(
    fontSize: 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    color: AppColor.sourceAmountColor,
  );
  static const TextStyle sourceAmountMoneyTextStyle = TextStyle(
    fontSize: 40,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.bold,
    color: AppColor.secondaryColor,
  );

  static const TextStyle moneyTextStyle = TextStyle(
    fontSize: 40,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.bold,
    color: AppColor.moneyColor,
  );

  static const TextStyle live = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: AppColor.moneyColor,
  );
}
