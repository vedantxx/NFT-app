import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test2/screens/screens/onboarding_screen.dart';
import 'package:test2/utils/my_constants.dart';
import 'package:test2/widgets/currency_widgets.dart';
import 'package:http/http.dart'; //You can also import the browser version
import 'package:web3dart/web3dart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    myInitState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto App"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoardingScreen()));
          }, icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CurrenciesWidget(),
          ),
      ),
    );
  }
}
