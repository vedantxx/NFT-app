import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:test2/animations/animations.dart';
import 'package:test2/animations/fade_animation.dart';
import 'package:test2/animations/slide_animation.dart';
import 'package:test2/providers/currency_provider.dart';
import 'package:test2/utils/constants_nft.dart';
// import 'package:test2/constants.dart';

import 'home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  final double _padding = 40;
  final _headingStyle = const TextStyle(
    fontWeight: FontWeight.w200,
    fontFamily: 'Dsignes',
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    final provider =  Provider.of<CurrencyProvider>(context);
    final currencyDataSource = provider.currencies;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: const _AppBar(),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: FadeAnimation(
                intervalEnd: 0.4,
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/flash.svg',
                    ),
                    SizedBox(width: 8),
                    const Text(
                      'Started',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                intervalEnd: 0.6,
                child: FadeAnimation(
                  intervalEnd: 0.6,
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Dsignes',
                        color: Colors.black,
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: 'Discover ',
                          style: _headingStyle,
                        ),
                        const TextSpan(
                          text: 'Rare \nCollections ',
                        ),
                        TextSpan(
                          text: 'Of ',
                          style: _headingStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                intervalEnd: 0.6,
                begin: const Offset(0, 30),
                child: FadeAnimation(
                  intervalEnd: 0.6,
                  child: Row(
                    children: const <Widget>[
                      Text(
                        'Art & ',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Dsignes',
                          color: Colors.black,
                          height: 1.3,
                        ),
                      ),
                      ColoredText(text: 'NFTs'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: FadeAnimation(
                child: Text(
                  'Digital marketplace for crypto collectibles and non-fungible tokens',
                  style: bodyTextStyle,
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 200,
              padding: EdgeInsets.only(left: _padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SlideAnimation(
                    intervalStart: 0.4,
                    begin: const Offset(0, 20),
                    child: FadeAnimation(
                      intervalStart: 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          EventStat(
                            title: '12.1K+',
                            subtitle: 'Art Work',
                          ),
                          EventStat(
                            title: '1.7M+',
                            subtitle: 'Artist',
                          ),
                          EventStat(
                            title: '45K+',
                            subtitle: 'Auction',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 60),
                  Expanded(
                    child: SlideAnimation(
                      intervalStart: 0.2,
                      child: FadeAnimation(
                        intervalEnd: 0.2,
                        child: Container(
                          padding: EdgeInsets.all(24),
                          decoration: const BoxDecoration(
                            color: Color(0xffe6d9fe),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: HomeScreen(),
                                      type: PageTransitionType.fadeIn,
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffcab2ff),
                                  ),
                                  child: const Icon(Iconsax.arrow_right_1),
                                ),
                              ),
                              SizedBox(height: 24),
                              const Text(
                                'Discover \nArtwork',
                                style: TextStyle(
                                  fontSize: 24,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 9,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Divider(
                                thickness: 2,
                                endIndent: 120,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                begin: const Offset(0, 20),
                intervalStart: 0.6,
                child: FadeAnimation(
                  intervalStart: 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Supported By',
                        style: bodyTextStyle,
                      ),
                      SvgPicture.asset(
                        'assets/images/binance.svg',
                        width: 24,
                      ),
                      SvgPicture.asset(
                        'assets/images/huobi.svg',
                        width: 22,
                      ),
                      SvgPicture.asset(
                        'assets/images/xrp.svg',
                        width: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const AppLogo(),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: const Center(
            child: Icon(
              Iconsax.wallet_1,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'A.',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ColoredText extends StatelessWidget {
  const ColoredText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            bottom: 0,
            left: 10,
            child: Container(
              width: 85,
              height: 30,
              color: const Color(0xffaafaff),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Dsignes',
              color: Colors.black,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class EventStat extends StatelessWidget {
  const EventStat({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
