import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test2/animations/slide_animation.dart';
import 'package:test2/models/Post.dart';
import 'package:test2/screens/screens/explore_pages/data/Sample.dart';
import 'package:test2/screens/screens/explore_pages/helper/Colorsys.dart';
import 'package:test2/screens/screens/explore_pages/pages/SingleUser.dart';

import 'pages/SinglePost.dart';

class ExploreHomePage extends StatefulWidget {
  const ExploreHomePage({Key? key}) : super(key: key);

  @override
  _ExploreHomePageState createState() => _ExploreHomePageState();
}

class _ExploreHomePageState extends State<ExploreHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colorsys.lightGrey,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colorsys.darkGray,), onPressed: () {  },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SlideAnimation(child: searchBox()),
            const SizedBox(height: 40,),
            SlideAnimation(
              begin: const Offset(600, 0),
              child: Container(
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
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(
                              color: Colorsys.lightGrey
                          ))
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Recommend", style: TextStyle(
                                  color: Colorsys.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),),
                              Container(
                                width: 50,
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colorsys.orange,
                                        width: 3
                                    ))
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 20,),
                          Text("Likes", style: TextStyle(
                              color: Colorsys.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    makePost(Sample.postOne),
                    makePost(Sample.postTwo),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makePost(Post post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
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
                          Text(post.dateAgo.toString(), style: TextStyle(
                              fontSize: 13,
                              color: Colorsys.grey
                          ),)
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
                          builder: (context) => SinglePost(post: post, image: post.photos![index],)
                      ));
                    },
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
                        child: Stack(
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