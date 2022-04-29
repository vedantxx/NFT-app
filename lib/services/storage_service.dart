import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath,String fileName, String folder) async {
    File file = File(filePath);

    try{
      await storage.ref("$folder/$fileName").putFile(file);
    } on firebase_core.FirebaseException
    catch(e){
      debugPrint(e.toString());
    }
  }

  // void pickFile(BuildContext context) async{
  //
  //   final results = await FilePicker.platform.pickFiles(
  //     allowMultiple: false,
  //     type: FileType.custom,
  //     allowedExtensions: ['png','jpg','gif','jpeg'],
  //   );
  //   if(results == null){
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("No file Selected")));
  //     return;
  //   }
  //
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("File Uploaded")));
  //
  //   final path = results.files.single.path;
  //   final pathName = results.files.single.name;
  //   debugPrint(path);
  //   debugPrint(pathName);
  //   // if(FirebaseAuth.instance.currentUser!.email != null
  //   //     && FirebaseAuth.instance.currentUser!.email != ""){
  //   //   storage.uploadFile(
  //   //       path!,
  //   //       pathName,
  //   //       // widget.id.toString(),
  //   //       // "orders",
  //   //       // FirebaseAuth.instance.currentUser!.email.toString(),
  //   //       widget.id,
  //   //       "orders").then((value) => debugPrint('done'));
  //   //
  //   //
  //   //
  //   // }
  //   // else if(FirebaseAuth.instance.currentUser!.phoneNumber != null
  //   //     && FirebaseAuth.instance.currentUser!.phoneNumber != ""){
  //   //   storage.uploadFile(
  //   //       path!,
  //   //       pathName,
  //   //       // "orders",
  //   //       // FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
  //   //       widget.id,
  //   //       "orders").then((value) => debugPrint('done'));
  //   // }
  //   await _productOrders.doc(widget.id.toString()).set({
  //     "refImg" : pathName,
  //     // ds['question'].toString(): controllers[index].text.toString(),
  //     // "IsCompleted" : "0"
  //     // "price": price
  //   },
  //       SetOptions(merge : true)
  //   );
  //   debugPrint(pathName);
  // }

  Widget LoadImage(String imageName,String folder) => FutureBuilder(
      future: downloadURL(imageName, folder),
      builder: (
          BuildContext context, AsyncSnapshot<String> snapshot){
        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          return Container(
            // color: Colors.grey,
            width: MediaQuery.of(context).size.width * 0.8,//300
            // height: 300,
            height: MediaQuery.of(context).size.height * 0.32,//300
            child: Image.network(
              snapshot.data!,fit: BoxFit.contain,
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
  );

  Future<firebase_storage.ListResult> listFile(String folder)  async {
    firebase_storage.ListResult results = await storage.ref(folder).listAll();

    results.items.forEach((firebase_storage.Reference ref) {
      debugPrint('Found file: $ref');
    });

    return results;
  }

  Future<String> downloadURL(String imageName,String folder) async {
    String downloadURL = await storage.ref('$folder/$imageName').getDownloadURL();
    return downloadURL;
  }
}