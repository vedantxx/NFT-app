import 'package:flutter/material.dart';
import 'package:test2/providers/currency_provider.dart';
import 'package:test2/utils/currency_data_source.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CurrenciesWidget extends StatefulWidget {
  const CurrenciesWidget({Key? key}) : super(key: key);

  @override
  State<CurrenciesWidget> createState() => _CurrenciesWidgetState();
}

class _CurrenciesWidgetState extends State<CurrenciesWidget> {
  @override
  Widget build(BuildContext context) {
    final provider =  Provider.of<CurrencyProvider>(context);
    final currencyDataSource = provider.currencyDataSource;
    // return Scaffold(
    //   body: currencyDataSource == null ? Center(child: CircularProgressIndicator(),) :
    //   SfDataGrid(source: currencyDataSource, columns: buildGridColumns()),
    // );
    if(currencyDataSource == null){
      return const Center(child: CircularProgressIndicator(),);
    }
    else {
      return SfDataGrid(
        allowSorting: true,
        frozenColumnsCount: 1,
        columns: buildGridColumns(),
        source: currencyDataSource,
        defaultColumnWidth: 120,
      );
    }
  }

  List<GridColumn> buildGridColumns() => <GridColumn>[
    GridColumn(columnName: CurrencyColumn.id.toString(), label: buildLabel("ID"),
        // columnWidthMode: ColumnWidthMode.auto
    ),
    GridColumn(columnName: CurrencyColumn.rank.toString(), label: buildLabel("Rank")),
    GridColumn(columnName: CurrencyColumn.name.toString(), label: buildLabel("Name")),
    GridColumn(columnName: CurrencyColumn.price.toString(), label: buildLabel("Price")),
    GridColumn(columnName: CurrencyColumn.oneDChange.toString(), label: buildLabel("ID")),
    GridColumn(columnName: CurrencyColumn.oneHChange.toString(), label: buildLabel("ID")),
    GridColumn(columnName: CurrencyColumn.marketCap.toString(), label: buildLabel("marketCap")),



    // GridTextColumn(columnName: CurrencyColumn.id.toString(), label: buildLabel("ID")),
    // GridTextColumn(columnName: CurrencyColumn.id.toString(), label: buildLabel("ID")),
  ];

  Widget buildLabel(String text) => Container(
    alignment: Alignment.center,
      child: Text(text),
  );
}
