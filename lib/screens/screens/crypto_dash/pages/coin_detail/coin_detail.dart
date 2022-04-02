// import 'package:crypto_dashboard/models/coin.dart';
// import 'package:crypto_dashboard/pages/coin_detail/widgets/coin_chart.dart';
// import 'package:crypto_dashboard/pages/coin_detail/widgets/coin_stats.dart';
// import 'package:crypto_dashboard/pages/coin_detail/widgets/single_coin_balance.dart';
// import 'package:crypto_dashboard/pages/home/widgets/notification_bell.dart';
// import 'package:crypto_dashboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:test2/models/coin.dart';
import 'package:test2/screens/screens/crypto_dash/pages/coin_detail/widgets/coin_chart.dart';
import 'package:test2/screens/screens/crypto_dash/pages/coin_detail/widgets/coin_stats.dart';
import 'package:test2/screens/screens/crypto_dash/pages/coin_detail/widgets/single_coin_balance.dart';

import '../../utils/constants.dart';
import '../home/widgets/notification_bell.dart';

class CoinDetail extends StatelessWidget {
  final Coin? coin;
  CoinDetail({this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            // FlutterIcons.keyboard_backspace_mdi,
            Icons.keyboard,
          ),
        ),
        centerTitle: true,
        title: Text("${coin.toString()} (${coin!.getCoinAbbr()})"),
        backgroundColor: Colors.black,
        actions: [
          NotificationBell(),
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 25.0,
              ),
              CoinStats(),
              const SizedBox(
                height: 50.0,
              ),
              CoinChart(),
              const SizedBox(
                height: 30.0,
              ),
              const SingleCoinBalance(),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "BUY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: kSuccessColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "SELL",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Color.fromRGBO(247, 71, 104, 1),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
