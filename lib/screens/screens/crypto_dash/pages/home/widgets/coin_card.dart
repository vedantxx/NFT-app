// import 'package:crypto_dashboard/models/coin.dart';
// import 'package:crypto_dashboard/pages/coin_detail/coin_detail.dart';
// import 'package:crypto_dashboard/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:crypto_dashboard/utils/adaptive_height_extension.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// import 'package:flutter/material.dart.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/apis/crypto_api.dart';
import 'package:test2/models/currency_model.dart';
import 'package:test2/providers/currency_provider.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import '../../../../../../models/coin.dart';
import '../../../utils/constants.dart';
import '../../coin_detail/coin_detail.dart';

class CoinCard extends StatefulWidget {
  final Coin? coin;
  final int index;
  const CoinCard({Key? key, this.coin,required this.index}) : super(key: key);

  @override
  State<CoinCard> createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {

  late List<Currency> currencies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // myInitState();
  }

  // Future<void> myInitState() async {
  //   currencies = await CryptoApi.getCurrencies();
  // }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final provider =  Provider.of<CurrencyProvider>(context);
    final currencyDataSource = provider.currencies;
    debugPrint(currencyDataSource.toString());
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return CoinDetail(coin: widget.coin);
              },
            ),
          );
        },
        child: Container(
          height: 90.0,
          color: const Color.fromRGBO(55, 66, 92, 0.4),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              Container(
                width: 40.0,
                child: Image.asset(
                  widget.coin!.getImagePath(),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.coin.toString()} (${widget.coin!.getCoinAbbr()})",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "${widget.coin!.balance}",
                    style: themeData.textTheme.caption!.copyWith(fontSize: 14.0),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // currencies[0].price != null ?
                  Text(
                    // "${currencies[0].price}",
                    "${currencyDataSource[widget.index].price}",
                    // "\$${widget.coin!.currentPrice}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ) ,
                      // : const Text("Loading",style: TextStyle(color: Colors.grey),),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        getCoinProgress(widget.coin!),
                        style: TextStyle(
                          color: widget.coin!.trend == Trend.UP
                              ? kSuccessColor
                              : kDangerColor,
                          fontSize: 13.0,
                        ),
                      ),
                      Icon(
                        widget.coin!.trend == Trend.UP
                            // ? FlutterIcons.caret_up_faw
                            // : FlutterIcons.caret_down_faw,
                        ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        size: 14.0,
                        color: widget.coin!.trend == Trend.UP
                            ? kSuccessColor
                            : kDangerColor,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          color: kDangerColor,
          // icon: FlutterIcons.x_fea,
          icon: Icons.gif_box,
          foregroundColor: Colors.white,
          onTap: () => null,
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          color: kSuccessColor,
          // icon: FlutterIcons.plus_fea,
          icon: Icons.add,
          foregroundColor: Colors.white,
          onTap: () => null,
        ),
      ],
    );
  }
}

String getCoinProgress(Coin coin) {
  String returnValue = "";

  if (coin.trend == Trend.UP) {
    returnValue += "+";
  } else {
    returnValue += "-";
  }

  returnValue += "\$${coin.amountProgress} (${coin.percentProgress}%)";

  return returnValue;
}
