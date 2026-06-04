import 'package:flutter/material.dart';
import 'package:omla/core/const/app_color.dart';
import 'package:omla/core/const/app_test_style.dart';
import 'package:omla/provider/change_amount.dart';
import 'package:provider/provider.dart';

class LiveRate extends StatelessWidget {
  const LiveRate({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeAmountProvider provider = Provider.of<ChangeAmountProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(9999),
      ),
      height: 66,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Icon(Icons.spoke, color: AppColor.secondaryColor),
          Text(
            "Live Rate:",
            style: AppTestStyle.live.copyWith(color: AppColor.secondaryColor),
          ),
          Row(
            children: [
              Text(
                "1 ${provider.sourceCurrencyCode} = ",
                style: AppTestStyle.live,
              ),
              Text(
                "${provider.currentRate.toStringAsFixed(4)} ",
                style: AppTestStyle.live,
              ),
              Text(provider.targetCurrencyCode, style: AppTestStyle.live),
            ],
          ),
        ],
      ),
    );
  }
}
