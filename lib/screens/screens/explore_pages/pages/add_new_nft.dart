import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/providers/bottom_navy_bar_provider.dart';
import 'package:test2/services/storage_service.dart';

class AddNewNft extends StatefulWidget {
  const AddNewNft({Key? key}) : super(key: key);

  @override
  State<AddNewNft> createState() => _AddNewNftState();
}

class _AddNewNftState extends State<AddNewNft> {
  TextEditingController tc = TextEditingController();
  TextEditingController pc = TextEditingController();
  TextEditingController dc = TextEditingController();
  late String temp;
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Title",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Dsignes"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: TextField(
                    // minLines: ds['reqarea'] ==
                    //     "small"
                    //     ? 2 : 8,
                    onChanged: (val) async {
                      // orderNumber();
                      // await _productOrders.doc(widget.id.toString()).set({
                      //   ds['question'].toString(): controllers[index].text.toString(),
                      //   "IsCompleted" : "0",
                      //
                      //   // "price": price
                      // },
                      //     SetOptions(merge : true)
                      // );

                      // _createOrUpdate(widget.id,ds['question'].toString(), controllers[index].text);
                    },

                    cursorColor: const Color(0xff56B760),
                    cursorHeight: 30,
                    controller: tc,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(
                      height: 1,
                      color: Colors.black,
                    ),

                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Color(0xff56B760))
                      // ),

                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffB1DEB6), width: 1),
                        // borderRadius: BorderRadius.all(23)
                      ),
                      fillColor: Color(0xffEDEDEF),
                      filled: true,
                      // border: BorderSide.none,
                      // border:
                      //     OutlineInputBorder(),
                      // hintText:
                      //     'Enter an anwser'
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Price",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Dsignes"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: TextField(
                    // minLines: ds['reqarea'] ==
                    //     "small"
                    //     ? 2 : 8,
                    onChanged: (val) async {
                      // orderNumber();
                      // await _productOrders.doc(widget.id.toString()).set({
                      //   ds['question'].toString(): controllers[index].text.toString(),
                      //   "IsCompleted" : "0",
                      //
                      //   // "price": price
                      // },
                      //     SetOptions(merge : true)
                      // );

                      // _createOrUpdate(widget.id,ds['question'].toString(), controllers[index].text);
                    },

                    cursorColor: const Color(0xff56B760),
                    cursorHeight: 30,
                    controller: pc,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(
                      height: 1,
                      color: Colors.black,
                    ),

                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Color(0xff56B760))
                      // ),

                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffB1DEB6), width: 1),
                        // borderRadius: BorderRadius.all(23)
                      ),
                      fillColor: Color(0xffEDEDEF),
                      filled: true,
                      // border: BorderSide.none,
                      // border:
                      //     OutlineInputBorder(),
                      // hintText:
                      //     'Enter an anwser'
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Descryption",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Dsignes"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: TextField(
                    // minLines: ds['reqarea'] ==
                    //     "small"
                    //     ? 2 : 8,
                    onChanged: (val) async {
                      // orderNumber();
                      // await _productOrders.doc(widget.id.toString()).set({
                      //   ds['question'].toString(): controllers[index].text.toString(),
                      //   "IsCompleted" : "0",
                      //
                      //   // "price": price
                      // },
                      //     SetOptions(merge : true)
                      // );

                      // _createOrUpdate(widget.id,ds['question'].toString(), controllers[index].text);
                    },

                    cursorColor: const Color(0xff56B760),
                    cursorHeight: 30,
                    controller: dc,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(
                      height: 1,
                      color: Colors.black,
                    ),

                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Color(0xff56B760))
                      // ),

                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffB1DEB6), width: 1),
                        // borderRadius: BorderRadius.all(23)
                      ),
                      fillColor: Color(0xffEDEDEF),
                      filled: true,
                      // border: BorderSide.none,
                      // border:
                      //     OutlineInputBorder(),
                      // hintText:
                      //     'Enter an anwser'
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Add ART",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Dsignes"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      final results = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.custom,
                        allowedExtensions: ['png', 'jpg', 'gif', 'jpeg'],
                      );
                      if (results == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("No file Selected")));
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("File Uploaded")));

                      final path = results.files.single.path;
                      final pathName = results.files.single.name;
                      debugPrint(path);
                      debugPrint(pathName);
                      setState(() {
                        temp = pathName;
                      });

                      storage
                          .uploadFile(
                            path!,
                            pathName,
                            "Home",
                            // FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
                            // widget.id,
                          )
                          .then((value) => debugPrint('done'));
                      // if(FirebaseAuth.instance.currentUser!.email != null
                      //     && FirebaseAuth.instance.currentUser!.email != ""){
                      //   storage.uploadFile(
                      //       path!,
                      //       pathName,
                      //       // widget.id.toString(),
                      //       // "orders",
                      //       // FirebaseAuth.instance.currentUser!.email.toString(),
                      //       widget.id,
                      //       "orders").then((value) => debugPrint('done'));
                      //
                      //
                      //
                      // }
                      // else if(FirebaseAuth.instance.currentUser!.phoneNumber != null
                      //     && FirebaseAuth.instance.currentUser!.phoneNumber != ""){
                      //   storage.uploadFile(
                      //       path!,
                      //       pathName,
                      //       // "orders",
                      //       // FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
                      //       widget.id,
                      //       "orders").then((value) => debugPrint('done'));
                      // }

                      debugPrint(pathName);
                    },
                    child: const Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey.shade300),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("counters")
                        .snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData &&
                          streamSnapshot.data != null) {
                        final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[0];
                        Map<String, dynamic> ds =
                        documentSnapshot.data() as Map<String, dynamic>;
                        return SizedBox(
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (temp != "") {
                                await FirebaseFirestore.instance
                                    .collection("counters")
                                    .doc("temp")
                                    .set({"home_cnt": FieldValue.increment(1)},
                                    SetOptions(merge: true));
                                await FirebaseFirestore.instance
                                    .collection('Home')
                                    .doc(ds["home_cnt"].toString())
                                    .set({
                                  "imgName": temp,
                                  "desc": dc.text,
                                  "title": tc.text,
                                  "price": int.parse(pc.text),
                                  "ownedBy": "@venomxx",
                                  "order": ds["home_cnt"],
                                  // ds['question'].toString(): controllers[index].text.toString(),
                                  // "IsCompleted" : "0"
                                  // "price": price
                                }, SetOptions(merge: true));
                                Navigator.of(context).pop();
                                // final pro = Provider(create: create)
                                final provider = Provider.of<BottomNavyBarProvider>(context,listen: false);
                                provider.changePage(0);

                              }
                            },
                            child: const Text("Mint"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey),
                          ),
                        );
                      } else if (streamSnapshot.connectionState ==
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
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
