// import 'package:crypto_dashboard/pages/home/widgets/account_balance.dart';
// import 'package:crypto_dashboard/pages/home/widgets/notification_bell.dart';
// import 'package:crypto_dashboard/pages/home/widgets/other_coins.dart';
// import 'package:crypto_dashboard/pages/home/widgets/user_balance.dart';
import 'package:flutter/material.dart';
import 'package:test2/animations/animations.dart';
import 'package:test2/screens/screens/crypto_dash/pages/home/widgets/account_balance.dart';
import 'package:test2/screens/screens/crypto_dash/pages/home/widgets/notification_bell.dart';
import 'package:test2/screens/screens/crypto_dash/pages/home/widgets/other_coins.dart';
import 'package:test2/screens/screens/crypto_dash/pages/home/widgets/user_balance.dart';

class CryptoDashHomePage extends StatelessWidget {
  const CryptoDashHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          // FlutterIcons.menu_fea,
        ),
        centerTitle: true,
        title: const Text("My Money"),
        backgroundColor: Colors.black,
        actions: const [
          NotificationBell(),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 25.0,
            ),
            SlideAnimation(child: AccountBalance()),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color.fromRGBO(97, 99, 119, 1),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            SlideAnimation(
              begin: Offset(600, 0),
              child: UserBalance(),
            ),
            SizedBox(
              height: 15.0,
            ),
            SlideAnimation(begin: Offset(1000, 0),child: OtherCoins()),
            SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
