import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:test2/animations/fade_animation.dart';
import 'package:test2/animations/slide_animation.dart';
import 'package:test2/providers/bottom_navy_bar_provider.dart';
import 'package:test2/providers/web3api.dart';
import 'package:test2/services/storage_service.dart';
import 'package:test2/utils/constants_nft.dart';
// import 'package:test2/constants.dart';

class NFTScreen extends StatefulWidget {
  final String heroTag,imgUrl;
  final bool isHomePage;
  final int order;
  const NFTScreen({Key? key,required this.heroTag,required this.imgUrl,required this.isHomePage,required this.order}) : super(key: key);

  @override
  State<NFTScreen> createState() => _NFTScreenState();
}

class _NFTScreenState extends State<NFTScreen> {
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:
          widget.isHomePage ?
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Home")
                .where("order",isEqualTo: widget.order).snapshots(),
            builder: (context,  AsyncSnapshot<QuerySnapshot> streamSnapshot) {

              if (streamSnapshot.hasData && streamSnapshot.data != null)
              {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[0];
                Map<String, dynamic> ds =
                documentSnapshot.data() as Map<String, dynamic>;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      const _AppBar(),
                      const SizedBox(height: 32),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                        ),
                        child: Hero(
                          tag: widget.heroTag,
                          child:
                          widget.isHomePage ? FutureBuilder(
                              future: storage.downloadURL(ds["imgName"], "Home"),
                              builder: (
                                  BuildContext context, AsyncSnapshot<String> snapshot){
                                if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                                  return Container(
                                    // color: Colors.grey,
                                    width: MediaQuery.of(context).size.width * 0.8,//300
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
                                    child: Text("DIGI"),
                                  );
                                }
                                return Container();
                              }
                          ):
                          Image.asset(
                            widget.imgUrl,
                            height: 260,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SlideAnimation(
                        intervalStart: 0.4,
                        begin: const Offset(0, 30),
                        child: FadeAnimation(
                          intervalStart: 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // const Text(
                              //   'DAY 74',
                              //   style: TextStyle(
                              //     fontSize: 24,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              const SizedBox(height: 8),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/users/vedant.jpeg',
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ) ,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      '@venomxx',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Who we were and what we will become are there, they are around us, they are batting, they are resting and they are being watched...More',
                                style: bodyTextStyle,
                              ),
                              const SizedBox(height: 8),
                              const Divider(),
                              const SizedBox(height: 8),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'assets/images/user.jpeg',
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: const Text('Highest Bid Placed By'),
                                subtitle: const Text(
                                  'Merry Rose',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  "${ds["price"]} TESTCOIN",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Button(
                                order: widget.order,
                                amt: widget.isHomePage ? double.parse(ds["price"].toString()) : 15.37,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
          ) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const _AppBar(),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black26),
                ),
                child: Hero(
                  tag: widget.heroTag,
                  child:
                  // widget.isHomePage ? FutureBuilder(
                  //     future: storage.downloadURL(ds["imgName"], "Home"),
                  //     builder: (
                  //         BuildContext context, AsyncSnapshot<String> snapshot){
                  //       if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                  //         return Container(
                  //           // color: Colors.grey,
                  //           width: MediaQuery.of(context).size.width * 0.8,//300
                  //           // height: 300,
                  //           // height: MediaQuery.of(context).size.height * 0.32,//300
                  //           child: Image.network(
                  //             snapshot.data!,fit: BoxFit.cover,
                  //           ),
                  //         );
                  //       }
                  //       if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                  //         return const Center(
                  //           // child: CircularProgressIndicator(),
                  //           child: Text("DIGI"),
                  //         );
                  //       }
                  //       return Container();
                  //     }
                  // ):
                  Image.asset(
                    widget.imgUrl,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SlideAnimation(
                intervalStart: 0.4,
                begin: const Offset(0, 30),
                child: FadeAnimation(
                  intervalStart: 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // const Text(
                      //   'DAY 74',
                      //   style: TextStyle(
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      const SizedBox(height: 8),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/users/vedant.jpeg',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ) ,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              '@venomxx',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Who we were and what we will become are there, they are around us, they are batting, they are resting and they are being watched...More',
                        style: bodyTextStyle,
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      const SizedBox(height: 8),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/user.jpeg',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: const Text('Highest Bid Placed By'),
                        subtitle: const Text(
                          'Merry Rose',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: const Text(
                          "15.37",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Button(
                        amt: 15.37,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatefulWidget {
  final double? amt;
  final int? order;
  const Button({Key? key,this.amt,this.order}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        // final provider =  Provider.of<BottomNavyBarProvider>(context,listen: false);
        // provider.changePage(3);
        Navigator.of(context).pop();
        final providerWeb3 =  Provider.of<Web3Api>(context,listen: false);
        var temp = providerWeb3.withdrawCoin(widget.amt!.toDouble());
        await FirebaseFirestore.instance
            .collection('Home')
            .doc(widget.order.toString())
            .set({
          // "imgName": temp,
          // "desc": dc.text,
          // "title": tc.text,
          // "price": int.parse(pc.text),
          "ownedBy": "@venomxx",
          // "order": -1,
          // ds['question'].toString(): controllers[index].text.toString(),
          // "IsCompleted" : "0"
          // "price": price
        }, SetOptions(merge: true));

      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Buy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text(
            //   '20h: 35m: 08s',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 18,
            //   ),
            // ),
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
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        const SizedBox(width: 16),
        const Text(
          'Auctions',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        // const Icon(
        //   Iconsax.heart5,
        //   color: Colors.red,
        // ),
        // const SizedBox(width: 16),
        // const Icon(Iconsax.menu_1),
      ],
    );
  }
}
