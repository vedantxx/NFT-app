import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:test2/animations/slide_animation.dart';
import 'package:test2/models/Post.dart';
import 'package:test2/screens/screens/explore_pages/data/Sample.dart';
import 'package:test2/screens/screens/explore_pages/helper/Colorsys.dart';
import 'package:test2/screens/screens/explore_pages/pages/SingleUser.dart';
import 'package:test2/screens/screens/explore_pages/pages/add_new_nft.dart';
import 'package:test2/services/storage_service.dart';

import 'pages/SinglePost.dart';

class ExploreHomePage extends StatefulWidget {
  const ExploreHomePage({Key? key}) : super(key: key);

  @override
  _ExploreHomePageState createState() => _ExploreHomePageState();
}

class _ExploreHomePageState extends State<ExploreHomePage> {

  final PageController _pageController = PageController();
  final Storage storage = Storage();

  int selectedPageFilter = 0;

  void onTabSelected(int index){
    setState((){
      selectedPageFilter = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colorsys.lightGrey,
        // leading: IconButton(
        //   icon: Icon(Icons.menu, color: Colorsys.darkGray,), onPressed: () {  },
        // ),
        actions: [
          IconButton(onPressed: ()async{


            // final results = await FilePicker.platform.pickFiles(
            //   allowMultiple: false,
            //   type: FileType.custom,
            //   allowedExtensions: ['png','jpg','gif','jpeg'],
            // );
            // if(results == null){
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text("No file Selected")));
            //   return;
            // }
            //
            // ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text("File Uploaded")));
            //
            // final path = results.files.single.path;
            // final pathName = results.files.single.name;
            // debugPrint(path);
            // debugPrint(pathName);
            // await FirebaseFirestore
            //     .instance
            //     .collection(
            //     "counters")
            //     .doc("temp")
            //     .set(
            //     {
            //       "home_cnt":
            //       FieldValue
            //           .increment(
            //           1)
            //     },
            //     SetOptions(
            //         merge:
            //         true));
            // storage.uploadFile(
            //     path!,
            //     pathName,
            //     "Home",
            //     // FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
            //     // widget.id,
            // ).then((value) => debugPrint('done'));
            // // if(FirebaseAuth.instance.currentUser!.email != null
            // //     && FirebaseAuth.instance.currentUser!.email != ""){
            // //   storage.uploadFile(
            // //       path!,
            // //       pathName,
            // //       // widget.id.toString(),
            // //       // "orders",
            // //       // FirebaseAuth.instance.currentUser!.email.toString(),
            // //       widget.id,
            // //       "orders").then((value) => debugPrint('done'));
            // //
            // //
            // //
            // // }
            // // else if(FirebaseAuth.instance.currentUser!.phoneNumber != null
            // //     && FirebaseAuth.instance.currentUser!.phoneNumber != ""){
            // //   storage.uploadFile(
            // //       path!,
            // //       pathName,
            // //       // "orders",
            // //       // FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
            // //       widget.id,
            // //       "orders").then((value) => debugPrint('done'));
            // // }
            // await FirebaseFirestore.instance.collection('Home').doc("8").set({
            //   "imgName" : pathName,
            //   // ds['question'].toString(): controllers[index].text.toString(),
            //   // "IsCompleted" : "0"
            //   // "price": price
            // },
            //     SetOptions(merge : true)
            // );
            //
            // debugPrint(pathName);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddNewNft()));
          }, icon: const Icon(Icons.add,color: Colors.black,))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            // SlideAnimation(child: searchBox()),
            const SizedBox(height: 8,),
            SlideAnimation(
              begin: const Offset(600, 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.82,
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                    ),
                    color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("For you", style: TextStyle(
                        color: Colorsys.darkGray,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 20,),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(
                              color: Colorsys.lightGrey
                          ))
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              onTabSelected(0);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  alignment: Alignment.center,
                                  height: 48,
                                  width: 120,
                                  color: (selectedPageFilter == 0)
                                      ?
                                  Colors.blueGrey.withOpacity(0.2)
                                      : Colors.transparent,
                                  child: Text("Recommend", style: TextStyle(
                                      color: Colorsys.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  height: 4,
                                  // width: 4,
                                  color: Colors.blue,
                                  width: (selectedPageFilter == 0) ? 48 : 0,
                                  padding: const EdgeInsets.only(bottom: 10),
                                  // decoration: BoxDecoration(
                                  //     border: Border(bottom: BorderSide(
                                  //         color: Colorsys.orange,
                                  //         width: 48
                                  //     ))
                                  // ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 20,),
                          // GestureDetector(
                          //   onTap: (){
                          //     onTabSelected(1);
                          //   },
                          //   child: Column(
                          //     children: [
                          //       AnimatedContainer(
                          //         duration: const Duration(milliseconds: 500),
                          //         alignment: Alignment.center,
                          //         height: 48,
                          //         width: 120,
                          //         color: (selectedPageFilter == 1)
                          //             ?
                          //         Colors.blueGrey.withOpacity(0.2)
                          //             : Colors.transparent,
                          //         child: Text("Likes", style: TextStyle(
                          //             color: Colorsys.grey,
                          //             fontWeight: FontWeight.w500,
                          //             fontSize: 15
                          //         ),),
                          //       ),
                          //       AnimatedContainer(
                          //         duration: const Duration(milliseconds: 500),
                          //         height: 4,
                          //         // width: 4,
                          //         color: Colors.blue,
                          //         width: (selectedPageFilter == 1) ? 48 : 0,
                          //         padding: const EdgeInsets.only(bottom: 10),
                          //         // decoration: BoxDecoration(
                          //         //     border: Border(bottom: BorderSide(
                          //         //         color: Colorsys.orange,
                          //         //         width: 48
                          //         //     ))
                          //         // ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // GestureDetector(
                          //   onTap: (){
                          //     onFilterSelectedCat(setState, index);
                          //   },
                          //   child: Container(
                          //     child: Row(
                          //       children: [
                          //         AnimatedContainer(
                          //           duration: const Duration(milliseconds: 500),
                          //           height: (selectedPageFilter == index) ? 48 : 0,
                          //           width: 4,
                          //           color: Colors.blue,
                          //         ),
                          //         Expanded(
                          //           child: AnimatedContainer(
                          //             duration: const Duration(milliseconds: 500),
                          //             alignment: Alignment.center,
                          //             height: 48,
                          //             color:
                          //             (selectedPageFilter == index)
                          //                 ?
                          //             Colors.blueGrey.withOpacity(0.2)
                          //             // ,
                          //                 :
                          //             Colors.transparent,
                          //             child: const Padding(
                          //               padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 4),
                          //               // child: Text(
                          //               //     (index == 0) ? "projects" :
                          //               //     (index == 1) ? "buildings" :
                          //               //     (index == 2) ? "wings" :
                          //               //     (index == 3) ? "floors" :
                          //               //     (index == 4) ? "unit type" :
                          //               //     (index == 5) ? "alloted" : "hi"),
                          //             ),
                          //           ),),
                          //       ],
                          //     ),
                          //   ),
                          // )

                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Expanded(
                      // height: MediaQuery.of(context).size.height * 0.72,
                      child: PageView(
                        controller: _pageController,
                        children: [
                          SingleChildScrollView(
                            // physics: const RangeMaintainingScrollPhysics(),
                            // height: MediaQuery.of(context).size.height * 0.8,
                            child: Column(
                              // physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: makePost(Sample.postOne,true),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: makePost(Sample.postTwo,false),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: const Center(
                              child: Text("Hi"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makePost(Post post,bool isFirst) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SingleUser(user: post.user)
              ));
            },
            child: Row(
              children: <Widget>[
                Hero(
                  transitionOnUserGestures: true,
                  tag: post.user!.username.toString(),
                  child: CircleAvatar(
                    maxRadius: 28,
                    backgroundImage: AssetImage(post.user!.profilePicture.toString()),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(post.user!.name.toString(), style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                      ),),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(post.location.toString(), style: TextStyle(
                              fontSize: 13,
                              color: Colorsys.grey
                          ),),
                          // Text(post.dateAgo.toString(), style: TextStyle(
                          //     fontSize: 13,
                          //     color: Colorsys.grey
                          // ),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SlideAnimation(
            begin: const Offset(1000, 0),
            child: Container(
              height: 300,
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: post.photos!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SinglePost(
                            post: post,
                            image: post.photos![index],
                            isFirst: isFirst,
                            heroTag: isFirst ? (index + 4).toString() : (index + 13).toString(),
                          )
                      ));
                    },
                    child: Hero(
                      tag: isFirst ? (index + 4).toString() : (index + 13).toString(),
                      child: AspectRatio(
                        aspectRatio: 1.2 / 1,
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(post.photos![index]),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.orange
                          ),
                          child: Stack
                            (
                            children: <Widget>[
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      ClipRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                color: Colors.grey[600]!.withOpacity(0.1)
                                            ),
                                            child: Center(
                                                child: Image.asset('assets/icons/link.png')
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      ClipRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                color: Colors.grey[600]!.withOpacity(0.1)
                                            ),
                                            child: Center(
                                                child: Image.asset('assets/icons/heart.png')
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget searchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20,),
          Text("Best place to \nExplore awesome NFTs", style: TextStyle(
              fontSize: 22,
              color: Colorsys.darkGray,
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 30,),
          Container(
            height: 50,
            padding: const EdgeInsets.only(left: 20, right: 3, top: 3, bottom: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search for an NFT",
                        hintStyle: TextStyle(color: Colorsys.grey),
                        border: InputBorder.none
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  height: double.infinity,
                  minWidth: 50,
                  elevation: 0,
                  color: Colorsys.orange,
                  child: const Icon(Icons.search, color: Colors.white,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}