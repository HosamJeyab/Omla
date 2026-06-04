import 'package:flutter/material.dart';

class ChangeAmountProvider extends ChangeNotifier {
  int _index1 = 0;
  int _index2 = 72;

  double currentRate = 0.7090;
  String sourceCurrencyCode = "USD";
  String targetCurrencyCode = "JOD";

  TextEditingController resultController = TextEditingController(text: "0.00");

  double amount = 0.0;

  int getIndex() => _index1;
  int getIndex2() => _index2;

  void setIndex1(
    int index,
    Map<String, dynamic> rates,
    List<String> currencies,
  ) {
    _index1 = index;
    changeAmount(rates, currencies);
  }

  void setIndex2(
    int index,
    Map<String, dynamic> rates,
    List<String> currencies,
  ) {
    _index2 = index;
    changeAmount(rates, currencies);
  }

  void changeAmount(Map<String, dynamic> rates, List<String> currencies) {
    if (currencies.isEmpty || rates.isEmpty) {
      return;
    }
    String fromCurrency = currencies[_index1];
    String toCurrency = currencies[_index2];

    double fromRate =
        (rates[fromCurrency] is num)
            ? (rates[fromCurrency] as num).toDouble()
            : 1.0;
    double toRate =
        (rates[toCurrency] is num)
            ? (rates[toCurrency] as num).toDouble()
            : 1.0;

    if (fromRate != 0) {
      double result = (amount / fromRate) * toRate;
      currentRate = toRate / fromRate;
      resultController.text = result.toStringAsFixed(4);
    }
    notifyListeners();
  }
}
