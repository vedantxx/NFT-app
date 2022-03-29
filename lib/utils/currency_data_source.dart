import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test2/models/currency_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

enum CurrencyColumn{id,rank,name,price,oneHChange,oneDChange,marketCap}

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
          default:
            return const Text("Hello");
        }


      }).toList());

  Widget buildPriceRow(String price) => Container(
    padding: const EdgeInsets.all(16),
    child: Text(
      '${price}',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  Widget buildIDRow(Currency currency) => Container(
    padding: const EdgeInsets.all(12),
    child: Row(
      children: [
        buildLogo(currency),
        const SizedBox(width: 12,),
        Expanded(child: Text(currency.id.toString(),overflow: TextOverflow.ellipsis,)),
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

}