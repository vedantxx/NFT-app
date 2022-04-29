import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:test2/animations/page_transition.dart';
import 'package:test2/animations/slide_animation.dart';
import 'package:test2/providers/bottom_navy_bar_provider.dart';
import 'package:test2/screens/screens/explore_page.dart';
import 'package:test2/screens/screens/explore_pages/data/Sample.dart';
import 'package:test2/screens/screens/explore_pages/pages/SingleUser.dart';
import 'package:test2/screens/screens/my_nft_home_page.dart';
import 'package:test2/utils/constants_nft.dart';
// import 'package:test2/constants.dart';
// import 'package:test2/screens/onboarding_screen.dart';

// import '../test2/slide_animation.dart';
import 'crypto_dash/pages/home/cyrpto_dash_homepage.dart';
import 'explore_pages/explore_home_page.dart';
import 'nft_screen.dart';
import 'onboarding_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double _padding = 24;

  late PageController _pageController;
  final List<Widget> _children = [
    const MyNFTHomePage(),
    const ExploreHomePage(),
    // const ExplorePage(),
    const CryptoDashHomePage(),
    SingleUser(
      user: Sample.postOne.user,
    )
    // const ExplorePage(),
  ];

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<BottomNavyBarProvider>(context);
    return Scaffold(
      body: _children[context.watch<BottomNavyBarProvider>().currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 24,
        iconSize: 22,
        backgroundColor: context.watch<BottomNavyBarProvider>().currentIndex == 2 ? Colors.black : Colors.white,
        selectedItemColor: context.watch<BottomNavyBarProvider>().currentIndex == 2 ? Colors.greenAccent : Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: context.watch<BottomNavyBarProvider>().currentIndex,
        onTap: (index){
          setState(() {
            // currentIndex = index;
            final provider = Provider.of<BottomNavyBarProvider>(context,listen: false);
            debugPrint("Bottom nav changed using provider");
            provider.changePage(index);
          },
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: BottomIcon(
              icon: Iconsax.home,
              isActive: context.watch<BottomNavyBarProvider>().currentIndex == 0 ? true : false,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(
                icon: Iconsax.discover_1,
              isActive: context.watch<BottomNavyBarProvider>().currentIndex == 1 ? true : false,
            ),
            label: 'Discover',
          ),
          // BottomNavigationBarItem(
          //   icon: BottomIcon(icon: Iconsax.add_square,
          //     isActive: context.watch<BottomNavyBarProvider>().currentIndex == 2 ? true : false,),
          //   label: 'Add',
          // ),
          BottomNavigationBarItem(
            icon: BottomIcon(icon: Iconsax.shop,
              isActive: context.watch<BottomNavyBarProvider>().currentIndex == 2 ? true : false,),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(icon: Iconsax.profile_2user,
              isActive: context.watch<BottomNavyBarProvider>().currentIndex == 3 ? true : false,),
            label: 'Profile',
          ),
        ],
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
        Icon(icon,color: isActive ? context.watch<BottomNavyBarProvider>().currentIndex == 2 ? Colors.greenAccent : Colors.black : Colors.grey,),
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
          children: <Widget>[
            Text(
              'Live',
              style: bodyTextStyle,
            ),
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
              'Enjoy! The latest hot acutions',
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
      children: [
        const AppLogo(),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/profile.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
