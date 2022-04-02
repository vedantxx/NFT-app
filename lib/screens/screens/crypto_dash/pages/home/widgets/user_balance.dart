// import 'package:crypto_dashboard/pages/home/widgets/coin_card.dart';
// import 'package:crypto_dashboardo_dashboard/utils/static_data.dart';
import 'package:flutter/material.dart';

import '../../../utils/static_data.dart';
import 'coin_card.dart';

class UserBalance extends StatelessWidget {
  const UserBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Your Coins",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Text(
                "Total amount \$378.15",
                style: themeData.textTheme.caption,
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CoinCard(
                coin: StaticData.userCoins[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 15.0,
              );
            },
            itemCount: StaticData.userCoins.length,
          )
        ],
      ),
    );
  }
}
