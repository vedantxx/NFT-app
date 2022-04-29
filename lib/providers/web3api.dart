import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:test2/utils/my_constants.dart';
import 'package:web3dart/web3dart.dart';

class Web3Api extends ChangeNotifier {
  late Web3Client client;
  late Client httpClient;
  BigInt _bal = BigInt.from(0);
  BigInt get bal => _bal;
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
    notifyListeners();
  }
  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0x9a4D5c7a52D365ED85cF19665054Fb78F6940406";
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
    final result = await client.call(contract: contract, function: ethFunction, params: args,);

    return result;
  }

  Future<void> getBalance() async {
    // EthereumAddress address = EthereumAddress.fromHex(targetAddress);
    try {
      List<dynamic> result = await query("getBalance", []);
      _bal = result[0];
      debugPrint(result.toString());
      // client.
    } on Exception catch (e) {
      // TODO
      debugPrint(e.toString());
    }
    notifyListeners();
    // debugPrint(result.toString());
  }
  Future<void> addBalance() async {
    // EthereumAddress address = EthereumAddress.fromHex(targetAddress);
    try {
      List<dynamic> result = await query("depositeBalance", [BigInt.from(100000000000)]);
      // _bal = result[0];
      debugPrint(result.toString());
      // client.
    } on Exception catch (e) {
      // TODO
      debugPrint(e.toString());
    }
    getBalance();
    notifyListeners();
    // debugPrint(result.toString());
  }
  Future<String> submit(String functionName, List<dynamic> args) async
  {
    final credentials =
    EthPrivateKey.fromHex("ff9b2411c761224a5cbd9057039637051a1173358b5727bb707ac30bc24872e8");
    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);

    final result = await client.sendTransaction(credentials,
        Transaction.callContract(
            contract: contract, function: ethFunction, parameters: args),
        chainId: 4);
    return result;
  }
  Future<String> sendCoin() async
  {
    var bigAmount = BigInt.from(100);

    var response = await submit("depositeBalance", [bigAmount]);
    print("Deposited");

    getBalance();

    notifyListeners();
    return response;

  }


  Future<String> withdrawCoin(double amt) async {
    var bigAmount = BigInt.from(amt);

    var response = await submit("withdrawBalance",[bigAmount]);

    print("Withdrawn");
    getBalance();

    notifyListeners();
    return response;
  }




  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   myInitState();
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }
}