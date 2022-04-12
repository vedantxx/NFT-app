import 'package:flutter/material.dart';
import 'package:test2/utils/currency_data_source.dart';

class Currency {
  final String? id;
  final String? logoUrl;
  final String? name;
  final double? price;
  final OneHour? oneHourChange;
  final OneDay? oneDayChange;
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
      oneDayChange: OneDay.fromJson(json["1d"]),
      // oneHourChange: OneHour.fromJson(json["1h"]),
      // oneDayChange: double.parse(json['1d']['price_change_pct']),
      // oneHourChange:double.parse( json['1h']['price_change_pct']),
      marketCap: double.parse(json['market_cap']),
      rank: int.parse(json['rank']),
      rankDelta: int.parse(json['rank_delta']),
    );
  }
}

class OneDay {
  final double? price_change;
  OneDay({this.price_change});
  factory OneDay.fromJson(Map<String,dynamic> json){
    return OneDay(
      price_change: double.parse(json["price_change"]),
    );
  }
}

class OneHour {
  final double? price_change;
  OneHour({this.price_change});
  factory OneHour.fromJson(Map<String,dynamic> json){
    return OneHour(
      price_change: double.parse(json["price_change"]),
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
        return self.oneDayChange!.price_change!.compareTo(other.oneDayChange!.price_change!);
      // case CurrencyColumn.oneHChange:
      //   return self.oneHourChange!.price_change!.compareTo(other.oneHourChange!.price_change!);
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