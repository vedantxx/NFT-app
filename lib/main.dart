import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test2/providers/bottom_navy_bar_provider.dart';
import 'package:test2/providers/currency_provider.dart';
import 'package:test2/providers/web3api.dart';
import 'package:test2/screens/home_page.dart';
import 'package:test2/screens/my_onboarding_screen.dart';
import 'package:test2/screens/screens/home_screen.dart';
import 'package:test2/screens/screens/onboarding_screen.dart';
import 'package:test2/widgets/currency_widgets.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrencyProvider>(create: (_) => CurrencyProvider()),
        ChangeNotifierProvider<BottomNavyBarProvider>(create: (_) => BottomNavyBarProvider()),
        ChangeNotifierProvider<Web3Api>(create: (_) => Web3Api()),
      ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: OnBoardingScreen(),
    );
  }
}
