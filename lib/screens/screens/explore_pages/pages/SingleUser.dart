import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:test2/models/Collocation.dart';
import 'package:test2/models/User.dart';
import 'package:test2/providers/web3api.dart';
import 'package:test2/screens/screens/explore_pages/helper/Colorsys.dart';
import 'package:test2/services/storage_service.dart';
import 'package:test2/utils/my_constants.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/web3dart.dart';
// import 'package:flutter_photography/data/Sample.dart';
// import 'package:flutter_photography/helper/Colorsys.dart';
// import 'package:flutter_photography/models/Collocation.dart';
// import 'package:flutter_photography/models/User.dart';

class SingleUser extends StatefulWidget {
  final User? user;

  const SingleUser({Key? key, this.user}) : super(key: key);
  
  @override
  _SingleUserState createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  final Storage storage = Storage();
  late Web3Client client;
  late Client httpClient;
  static const String privateKey =
      '0x63CCdc03433E88592a0BE1FDA5523127A239af88';
  static const String rpcUrl = 'https://rinkeby.infura.io/v3/6017b5f55ebd4b7c88f50ff4893578a2';

  Future<void> myInitState() async{
    // String apiUrl = "http://localhost:58862/"; //Replace with your API
    httpClient = Client();
    client = Web3Client(rpcUrl, httpClient);

    final credentials = EthPrivateKey.fromHex(my_prvt_key);
    final address = credentials.address;

    debugPrint(address.hexEip55);
    try {

      var balance = await client.getBalance(address);
      debugPrint(balance.toString());
    } on Exception catch (e) {
      // TODO
      debugPrint(e.toString());
    }
    getBalance();
    await client.dispose();
  }
  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0xFdb861cBE7D883044E9A899a6dF37c5D86c1A8E5";
    // var jsonAbi = jsonDecode(abi);
    // String _abiCode = jsonEncode(jsonAbi['abi']);
    // final credentials = EthPrivateKey.fromHex(privateKey);
    ContractAbi contractAbi = ContractAbi.fromJson(abi, "TestCoin");
    DeployedContract contract = DeployedContract(contractAbi,EthereumAddress.fromHex(contractAddress));
    // List<dynamic> listtest = contract.abi.functions;
    print("laoded");
    debugPrint(contract.abi.name.toString());

    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await client.call(contract: contract, function: ethFunction, params: [

    ],);

    return result;
  }

  Future<void> getBalance() async {
    // EthereumAddress address = EthereumAddress.fromHex(targetAddress);
    try {
      List<dynamic> result = await query("getBalance", []);
      debugPrint(result.toString());
      // client.
    } on Exception catch (e) {
      // TODO
      debugPrint(e.toString());
    }
    // debugPrint(result.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // myInitState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final providerWeb3 =  Provider.of<Web3Api>(context,listen: false);
    providerWeb3.myInitState();
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colorsys.grey,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz, size: 25, color: Colorsys.grey,), onPressed: () {  },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                color: Colors.white
              ),
              child: Column(
                children: <Widget>[
                  Hero(
                    transitionOnUserGestures: true,
                    tag: widget.user!.username.toString(),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.user!.profilePicture.toString()),
                      maxRadius: 40,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(widget.user!.name.toString(), style: TextStyle(
                    fontSize: 20,
                    color: Colorsys.black,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 5,),
                  Text(widget.user!.username.toString(), style: TextStyle(
                    fontSize: 15,
                    color: Colorsys.grey
                  ),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      makeFollowWidgets(
                        count: providerWeb3.bal,
                        // count: widget.user!.followers,
                        name: "TESTCOIN"
                      ),
                      Container(
                        width: 2,
                        height: 15,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colorsys.lightGrey,
                      ),
                      makeFollowWidgets(
                        count: widget.user!.following,
                        name: "Collections"
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  makeActionButtons()
                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(
                        color: Colorsys.grey300!,
                      ))
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Collection", style: TextStyle(
                              color: Colorsys.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            ),),
                            Container(
                              width: 50,
                              padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                  color: Colorsys.orange,
                                  width: 3
                                ))
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 20,),
                        Text("Likes", style: TextStyle(
                          color: Colorsys.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                        ),)
                      ],
                    ),
                  ),
                  makeColloction(widget.user!.collocation!.toList())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget makeColloction(List<Collocation> collocation) {
    return Container(
      child: Column(
        children: <Widget>[
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Home")
                .where("ownedBy",isEqualTo: "@venomxx").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData && streamSnapshot.data != null)
              {
                  return Container(
                    padding: EdgeInsets.only(top: 20),
                    height: 320,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // itemCount: collocation.length,
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                        Map<String, dynamic> ds =
                        documentSnapshot.data() as Map<String, dynamic>;
                        return AspectRatio(
                          aspectRatio: 1.2 / 1,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(right: 20),
                                    // decoration: BoxDecoration(
                                    //     image: DecorationImage(
                                    //         image: AssetImage(collocation[index]
                                    //             .thumbnail
                                    //             .toString()),
                                    //         fit: BoxFit.cover),
                                    //     borderRadius: BorderRadius.circular(20),
                                    //     color: Colors.orange),
                                    child: Stack(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        children: <Widget>[
                                          Container(
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
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 10, sigmaY: 10),
                                              child: Container(
                                                  height: 100,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        ds["desc"].toString(),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        ds["price"].toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        ])),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Container(
                              //   height: 32,
                              //   margin: EdgeInsets.only(right: 20),
                              //   child: ListView.builder(
                              //     scrollDirection: Axis.horizontal,
                              //     itemCount: collocation[index].tags!.length,
                              //     itemBuilder: (context, tagIndex) => Container(
                              //       margin: EdgeInsets.only(right: 10),
                              //       padding: EdgeInsets.symmetric(
                              //           horizontal: 25, vertical: 5),
                              //       decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(5),
                              //           color: Colorsys.grey300),
                              //       child: Center(
                              //         child: Text(
                              //           "Test",
                              //           // collocation[index].tags![tagIndex],
                              //           style: TextStyle(),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // )
                            ],
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
          )
        ],
      ),
    );
  }

  Widget makeFollowWidgets({count, name}) {
    return Row(
      children: <Widget>[
        Text(count.toString(),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colorsys.black
          ),
        ),
      SizedBox(width: 5,),
      Text(name, 
        style: TextStyle(
          fontSize: 15,
          color: Colorsys.darkGray
        ),
      ),
      ],
    );
  }

  Widget makeActionButtons() {
    return Transform.translate(
      offset: Offset(0, 20),
      child: Container(
        height: 65,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 20,
              offset: Offset(0, 10)
            )
          ]
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                height: double.infinity,
                elevation: 0,
                onPressed: () {
                  final providerWeb3 =  Provider.of<Web3Api>(context,listen: false);
                  var temp = providerWeb3.sendCoin();
                  // providerWeb3.getBalance();
                  setState(() {

                  });
                },
                color: Colorsys.orange,
                child: Text("Add", style: TextStyle(
                  color: Colors.white,
                ),)
              ),
            ),
            Expanded(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                height: double.infinity,
                elevation: 0,
                onPressed: () {
                  final providerWeb3 =  Provider.of<Web3Api>(context,listen: false);
                  var temp = providerWeb3.withdrawCoin();
                  // providerWeb3.getBalance();
                  setState(() {

                  });
                },
                color: Colors.transparent,
                child: Text("Remove", style: TextStyle(
                  color: Colorsys.black, 
                  fontWeight: FontWeight.w400
                ),)
              ),
            ),
            Expanded(
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: double.infinity,
                  elevation: 0,
                  onPressed: () {
                    final providerWeb3 =  Provider.of<Web3Api>(context,listen: false);
                    providerWeb3.getBalance();
                    setState(() {

                    });
                  },
                  color: Colors.transparent,
                  child: Text("Refresh", style: TextStyle(
                      color: Colorsys.black,
                      fontWeight: FontWeight.w400
                  ),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}