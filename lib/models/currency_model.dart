import 'package:flutter/material.dart';
import 'package:test2/utils/currency_data_source.dart';

class Currency {
  final String? id;
  final String? logoUrl;
  final String? name;
  final double? price;
  final double? oneHourChange;
  final double? oneDayChange;
  final double? marketCap;
  final int? rank;
  final int? rankDelta;

  const Currency({
    this.id,
    this.logoUrl,
    this.name,
    this.price,
    this.oneHourChange,
    this.oneDayChange,
    this.marketCap,
    this.rank,
    this.rankDelta,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'],
      logoUrl: json['logo_url'],
      name: json['name'],
      price: double.parse(json['price']),
      // oneDayChange: double.parse(json['1d']['price_change_pct']),
      // oneHourChange:double.parse( json['1h']['price_change_pct']),
      marketCap: double.parse(json['market_cap']),
      rank: int.parse(json['rank']),
      rankDelta: int.parse(json['rank_delta']),
    );
  }
}

class CurrencyComparable{
  final CurrencyColumn column;
  final Currency currency;
  const CurrencyComparable(this.currency,this.column);

  int compareTo(CurrencyComparable otherComparable){
    final self =  currency;
    final other = otherComparable.currency;

    switch(column){
      case CurrencyColumn.rank:
        return self.rank!.compareTo(other.rank!);
      case CurrencyColumn.oneDChange:
        return self.oneDayChange!.compareTo(other.oneDayChange!);
      case CurrencyColumn.oneHChange:
        return self.oneHourChange!.compareTo(other.oneHourChange!);
      case CurrencyColumn.marketCap:
        return self.marketCap!.compareTo(other.marketCap!);
      case CurrencyColumn.price:
        return self.price!.compareTo(other.price!);
      case CurrencyColumn.name:
        return self.name!.compareTo(other.name!);

      case CurrencyColumn.id:
        return self.id!.compareTo(other.id!);
    }
  }
}