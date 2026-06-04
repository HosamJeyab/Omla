import 'package:flutter/material.dart';
import 'package:omla/core/const/app_color.dart';
import 'package:omla/core/const/app_test_style.dart';
import 'package:omla/provider/change_amount.dart';
import 'package:provider/provider.dart';

class ConvertedAmount extends StatelessWidget {
  final List<String> convert;
  final Map<String, dynamic> rates;

  const ConvertedAmount({
    super.key,
    required this.convert,
    required this.rates,
  });

  @override
  Widget build(BuildContext context) {
    ChangeAmountProvider provider = Provider.of<ChangeAmountProvider>(context);
    String currentCurrency = convert[provider.getIndex2()];

    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "CONVERTED AMOUNT",
                  style: AppTestStyle.sourceAmountTextStyle,
                ),
                DropdownButton<String>(
                  value: currentCurrency,
                  items:
                      convert.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      provider.setIndex2(
                        convert.indexOf(value),
                        rates,
                        convert,
                      );
                      provider.targetCurrencyCode = value;
                    }
                  },
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Text(
                  currentCurrency,
                  style: AppTestStyle.sourceAmountMoneyTextStyle,
                ),
                Expanded(
                  child: TextFormField(
                    controller: provider.resultController,
                    enabled: false,
                    decoration: const InputDecoration(border: InputBorder.none),
                    style: AppTestStyle.moneyTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
