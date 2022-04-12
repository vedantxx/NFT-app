import 'package:flutter/material.dart';
import 'package:test2/screens/home_page.dart';
import '../../../utils/static_data.dart';
import 'coin_card.dart';

class UserBalance extends StatelessWidget {
  const UserBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      // color: Colors.white,
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
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
                },
                child: const Text("View all",style: TextStyle(
                  color: Colors.greenAccent,
                ),),
              ),
              // Text(
              //   "Total amount \$378.15",
              //   style: themeData.textTheme.caption,
              // ),
            ],
          ),
          const SizedBox(height: 15.0),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CoinCard(
                coin: StaticData.userCoins[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
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
