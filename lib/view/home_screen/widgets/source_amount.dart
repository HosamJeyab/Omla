import 'package:flutter/material.dart';
import 'package:omla/core/const/app_color.dart';
import 'package:omla/core/const/app_test_style.dart';
import 'package:omla/provider/change_amount.dart';
import 'package:provider/provider.dart';

class SourceAmount extends StatelessWidget {
  final List<String>? sourceCurrency;
  final Map<String, dynamic> rates;

  const SourceAmount({
    super.key,
    required this.sourceCurrency,
    required this.rates,
  });
  @override
  Widget build(BuildContext context) {
    ChangeAmountProvider provider = Provider.of<ChangeAmountProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),

      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SOURCE AMOUNT",
                  style: AppTestStyle.sourceAmountTextStyle,
                ),
                DropdownButton<String>(
                  value: sourceCurrency![provider.getIndex()],
                  items:
                      sourceCurrency!.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      provider.setIndex1(
                        sourceCurrency!.indexOf(value),
                        rates,
                        sourceCurrency!,
                      );
                      provider.sourceCurrencyCode = value;
                    }
                  },
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Text(
                  sourceCurrency![provider.getIndex()],
                  style: AppTestStyle.sourceAmountMoneyTextStyle,
                ),

                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "0.00",
                      hintStyle: AppTestStyle.moneyTextStyle,
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                    style: AppTestStyle.moneyTextStyle,
                    onChanged: (value) {
                      provider.amount = double.tryParse(value) ?? 0.0;
                      provider.changeAmount(rates, sourceCurrency!);
                    },
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
