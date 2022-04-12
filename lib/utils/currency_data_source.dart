import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test2/models/currency_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

enum CurrencyColumn{id,rank,name,price,oneDChange,marketCap}

class CurrencyDataSource extends DataGridSource {
  late List<DataGridRow> _currencies;

  @override
  List<DataGridRow> get rows => _currencies;

  CurrencyDataSource({required List<Currency> currencies}){
    buildDataGrid(currencies);
  }
  void buildDataGrid(List<Currency> currencies) => _currencies = currencies.map<DataGridRow>(
          (currency) => DataGridRow(cells: CurrencyColumn.values.map((column) => DataGridCell<CurrencyComparable>(
              columnName: column.toString(), value: CurrencyComparable(currency,column),)).toList())).toList();
  // @override
  // DataGridRowAdapter? buildRow(DataGridRow row) {
  //   // TODO: implement buildRow
  //   throw UnimplementedError();
  // }
  @override
  DataGridRowAdapter buildRow(DataGridRow row) => DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell){

        final CurrencyComparable currencyWrapper = dataGridCell.value;
        final currency = currencyWrapper.currency;
        final column = CurrencyColumn.values.firstWhere((value)
        => value.toString() == dataGridCell.columnName);

        switch(column){
          case CurrencyColumn.marketCap:
            return buildPriceRow(currency.marketCap.toString());
          case CurrencyColumn.rank:
            return buildPriceRow(currency.rank.toString());
          case CurrencyColumn.name:
            return buildPriceRow(currency.name.toString());
          case CurrencyColumn.price:
            return buildPriceRow(currency.price.toString());
          case CurrencyColumn.id:
            return buildIDRow(currency);
          case CurrencyColumn.oneDChange:
            return buildOneDayChangeRow(currency.oneDayChange!.price_change.toString());
          default:
            return const Text("Hello",style: TextStyle(color: Colors.white),);
        }


      }).toList());

  Widget buildPriceRow(String price) => Container(
    padding: const EdgeInsets.all(16),
    child: Text(
      price,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );

  Widget buildIDRow(Currency currency) => Container(
    padding: const EdgeInsets.all(12),
    child: Row(
      children: [
        buildLogo(currency),
        const SizedBox(width: 12,),
        Expanded(child: Text(currency.id.toString(),overflow: TextOverflow.ellipsis,style: const TextStyle(color: Colors.white),)),
      ],
    ),
  );

  Widget buildLogo(Currency currency) {
    final isSvg = currency.logoUrl!.endsWith('.svg');

    return CircleAvatar(
      radius: 10,
      child: isSvg ? SvgPicture.network(currency.logoUrl.toString()) :
      Image.network(currency.logoUrl.toString()),
    );
  }

  Widget buildOneDayChangeRow(String price) => Container(
    padding: const EdgeInsets.all(16),
    child: Container(
      // width: 32,
      // color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            child: Text(
              price,
              style: TextStyle(
                color: double.parse(price) > 0 ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
          ),
          Container(
            width: 20,
            alignment: Alignment.topCenter,
            child: Icon(double.parse(price) > 0 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: double.parse(price) > 0 ? Colors.greenAccent : Colors.redAccent,),
          ),
        ],
      ),
    ),
  );

}