import 'package:flutter/material.dart';
import 'package:test2/apis/crypto_api.dart';
import 'package:test2/models/currency_model.dart';
import 'package:test2/utils/currency_data_source.dart';

class CurrencyProvider extends ChangeNotifier {
    CurrencyDataSource? currencyDataSource;
    List<Currency> currencies = [];

    CurrencyProvider(){
      loadCurrencies();
    }

    Future loadCurrencies() async {
      final currencies = await CryptoApi.getCurrencies();
      this.currencies = currencies;

      currencyDataSource = CurrencyDataSource(currencies: currencies);
      notifyListeners();
    }
}