import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test2/animations/page_transition.dart';
import 'package:test2/animations/slide_animation.dart';
import 'package:test2/screens/screens/nft_screen.dart';
import 'package:test2/screens/screens/onboarding_screen.dart';
import 'package:test2/utils/constants_nft.dart';

class MyNFTHomePage extends StatefulWidget {
  const MyNFTHomePage({Key? key}) : super(key: key);

  @override
  State<MyNFTHomePage> createState() => _MyNFTHomePageState();
}

class _MyNFTHomePageState extends State<MyNFTHomePage> {
  final double _padding = 24;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: const _AppBar(),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: const _Header(),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: const SlideAnimation(child: _CategoryList()),
            ),
            const SizedBox(height: 24),
            SlideAnimation(
              begin: const Offset(400, 0),
              child: SizedBox(
                height: 560,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              child: NFTScreen(heroTag: index.toString(),
                                imgUrl: imgUrls[index],),
                              type: PageTransitionType.fadeIn,
                            ));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text(
                                    'A. ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  // Text(
                                  //   'DAY 74',
                                  //   style: TextStyle(
                                  //     fontSize: 14,
                                  //   ),
                                  // ),
                                  Spacer(),
                                  // Text(
                                  //   '@Mark Rise',
                                  //   style: TextStyle(
                                  //     fontSize: 14,
                                  //     color: Colors.black54,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Hero(
                                tag: '$index',
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        imgUrls[index].toString(),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  EventStat(
                                    title: 'Abstract Monster',
                                    subtitle: 'By @venomxx',
                                  ),
                                  EventStat(
                                    title: '15.97 ETH',
                                    subtitle: 'Highest Bid',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  const BottomIcon({Key? key, required this.icon, this.isActive = false})
      : super(key: key);
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Divider(
          thickness: 2,
          indent: 25,
          endIndent: 25,
          color: isActive ? Colors.black : Colors.transparent,
        )
      ],
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({Key? key}) : super(key: key);

  final List<String> _options = const [
    'Trending',
    'Digital Arts',
    '3D Videos',
    'Games',
    'Collections',
    'Lands',
    'Real Estate',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _options.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: index == 0 ? Colors.black : null,
            ),
            padding: EdgeInsets.only(
              left: 22,
              right: index == 0 ? 22 : 0,
            ),
            child: Center(
              child: Text(
                _options[index],
                style: TextStyle(
                  fontSize: 14,
                  color: index == 0 ? Colors.white : Colors.black54,
                  fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            // Text(
            //   'Live',
            //   style: bodyTextStyle,
            // ),
            SizedBox(height: 8),
            Text(
              'Auctions',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Enjoy! The latest hot auctions',
              style: bodyTextStyle,
            ),
          ],
        ),
        const Icon(Iconsax.setting_4),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        AppLogo(),
        // Container(
        //   width: 40,
        //   height: 40,
        //   decoration: const BoxDecoration(
        //     shape: BoxShape.circle,
        //     image: DecorationImage(
        //       image: AssetImage('assets/images/profile.jpg'),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
