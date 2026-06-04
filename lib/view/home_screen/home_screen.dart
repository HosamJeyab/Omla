import 'package:flutter/material.dart';
import 'package:omla/controller/api_service.dart';
import 'package:omla/core/const/app_color.dart';
import 'package:omla/core/const/app_test_style.dart';
import 'package:omla/model/model.dart';
import 'package:omla/view/home_screen/widgets/converted_amount.dart';
import 'package:omla/view/home_screen/widgets/live_rate.dart';
import 'package:omla/view/home_screen/widgets/source_amount.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Rate> ratesFuture;

  void initState() {
    super.initState();
    ratesFuture = APIService().fetchExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: const Text("Omla", style: AppTestStyle.appBarTitleTextStyle),
        leading: Padding(
          padding: const EdgeInsets.all(1),
          child: Image.asset(
            "assets/images/logo_trans.png",
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ratesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No data found"));
          }
          final rates = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
            child: SingleChildScrollView(
              child: Column(
                spacing: 16,
                children: [
                  Text("last update: " + rates.timeLastUpdateUtc.split("+")[0]),
                  SourceAmount(
                    rates: rates.conversionRates,
                    sourceCurrency: rates.conversionRates.keys.toList(),
                  ),
                  ConvertedAmount(
                    convert: rates.conversionRates.keys.toList(),
                    rates: rates.conversionRates,
                  ),
                  LiveRate(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
