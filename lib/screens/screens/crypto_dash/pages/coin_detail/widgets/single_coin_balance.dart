import 'package:flutter/material.dart';
// import 'package:crypto_dashboard/utils/adaptive_height_extension.dart';

class SingleCoinBalance extends StatelessWidget {
  const SingleCoinBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      height: 90.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      width: double.infinity,
      color: const Color.fromRGBO(55, 66, 92, 0.4),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your BTC balance",
                  style: themeData.textTheme.caption,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "0.00692133 BTC",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "USD",
                style: themeData.textTheme.caption,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                "\$23.35",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
