import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test2/models/currency_model.dart';
import 'package:http/http.dart' as http;

class CryptoApi{
  static const _key = "19f671b10845471d610e23dd40f2cdd16182a0f7";

  static Future<List<Currency>> getCurrencies() async {
    const url = "https://api.nomics.com/v1/currencies/ticker?key=$_key&interval=1d,30d&convert=INR&per-page=100&page=1";
    final Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = json.decode(response.body) as List;
    debugPrint(response.body.toString());

    return body.map((item) => Currency.fromJson(item)).toList();
  }
}