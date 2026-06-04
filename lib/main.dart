import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:omla/splash_screen.dart';
import 'package:omla/provider/change_amount.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeAmountProvider()),
      ],
      child: const Omla(),
    ),
  );
}

class Omla extends StatelessWidget {
  const Omla({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omla',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
