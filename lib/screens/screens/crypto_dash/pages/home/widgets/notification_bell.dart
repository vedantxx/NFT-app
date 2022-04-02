// import 'package:crypto_dashboard/utils/constants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';

import '../../../utils/constants.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(
              // FlutterIcons.bell_fea,
              Icons.doorbell,
            ),
            Container(
              width: 8.0,
              height: 8.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kDangerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
