// import 'package:crypto_dashboard/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Balance",
            style: themeData.textTheme.caption,
          ),
          const SizedBox(
            height: 6.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "\$378.15",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(55, 66, 92, 0.78),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Center(
                    child: Text(
                      "+ Add Bank",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2.0,
          ),
          Row(
            children: const [
              Text(
                "+2.14%",
                style: TextStyle(
                  color: kSuccessColor,
                  fontSize: 16.0,
                ),
              ),
              Icon(
                // FlutterIcons.caret_up_faw,
                Icons.arrow_drop_up,
                color: kSuccessColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
