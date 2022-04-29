import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test2/animations/page_transition.dart';
import 'package:test2/animations/slide_animation.dart';
import 'package:test2/screens/screens/nft_screen.dart';
import 'package:test2/screens/screens/onboarding_screen.dart';
import 'package:test2/services/storage_service.dart';
import 'package:test2/utils/constants_nft.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MyNFTHomePage extends StatefulWidget {
  const MyNFTHomePage({Key? key}) : super(key: key);

  @override
  State<MyNFTHomePage> createState() => _MyNFTHomePageState();
}

class _MyNFTHomePageState extends State<MyNFTHomePage> {
  final double _padding = 24;
  late PageController _pageController;
  final Storage storage = Storage();
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
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Home').orderBy("order",descending: true).snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData && streamSnapshot.data != null)
                    {
                      return SizedBox(
                        height: 560,
                        child: PageView.builder(
                          controller: _pageController,
                          // itemCount: 4,
                          // shrinkWrap: true,
                          // reverse: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                            Map<String, dynamic> ds =
                            documentSnapshot.data() as Map<String, dynamic>;
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                      child: NFTScreen(
                                        heroTag: index.toString(),
                                        order: ds["order"],
                                        isHomePage: true,
                                        imgUrl: imgUrls[index],),
                                      type: PageTransitionType.fadeIn,
                                    ));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.black26),
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
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
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
                                          //   ds["imgName"].toString(),
                                          //   style: const TextStyle(
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
                                          // decoration: BoxDecoration(
                                          //   color: Theme
                                          //       .of(context)
                                          //       .primaryColor,
                                          //   image: DecorationImage(
                                          //     image: AssetImage(
                                          //       imgUrls[index].toString(),
                                          //     ),
                                          //     fit: BoxFit.cover,
                                          //   ),
                                          // ),
                                          child: FutureBuilder(
                                              future: storage.downloadURL(ds["imgName"], "Home"),
                                              builder: (
                                                  BuildContext context, AsyncSnapshot<String> snapshot){
                                                if(snapshot.connectionState == ConnectionState.done
                                                    && snapshot.hasData){
                                                  return Container(
                                                    // color: Colors.grey,
                                                    // width: MediaQuery.of(context).size.width * 0.8,//300
                                                    // height: 300,
                                                    // height: MediaQuery.of(context).size.height * 0.32,//300
                                                    child: Image.network(
                                                      snapshot.data!,fit: BoxFit.cover,
                                                    ),
                                                  );
                                                }
                                                if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                                                  return const Center(
                                                    // child: CircularProgressIndicator(),
                                                    child: Text("Loading"),
                                                  );
                                                }
                                                return Container();
                                              }
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
                                        children: <Widget>[
                                          EventStat(
                                            title: ds["title"],
                                            subtitle: 'By ${ds["ownedBy"]}',
                                          ),
                                          EventStat(
                                            title: "${ds["price"]} TESTCOIN",
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
                      );
                    }
                    else if (streamSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      color: Colors.grey,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const Text("No internet connection"),
                    );
                  }
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
