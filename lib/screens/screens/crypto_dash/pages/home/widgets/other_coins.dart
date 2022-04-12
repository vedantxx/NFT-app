// import 'package:crypto_dashboard/pages/home/widgets/coin_card.dart';
// import 'package:crypto_dashboard/utils/static_data.dart';
import 'package:flutter/material.dart';

import '../../../utils/static_data.dart';
import 'coin_card.dart';

class OtherCoins extends StatelessWidget {
  const OtherCoins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Other Coins",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CoinCard(
                coin: StaticData.otherCoins[index],
                index: index,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 15.0,
              );
            },
            itemCount: StaticData.otherCoins.length,
          )
        ],
      ),
    );
  }
}
