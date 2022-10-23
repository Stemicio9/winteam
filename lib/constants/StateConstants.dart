


import 'package:flutter/material.dart';


FilterAnnunciLavoratore filterAnnunciLavoratore = FilterAnnunciLavoratore();

class Filter {
  int? page;
  int? size;
  String? filterOr;
  String? filterAnd;
  String? orders;

  Filter({this.page, this.size,this.filterOr,this.filterAnd,this.orders});

  Map<String,dynamic> toQueryParameters(){
     return {
       "page" : page ?? 0,
       "size" : size ?? 20,
       "filterOr" : filterOr ?? "",
       "filterAnd" : filterAnd ?? "",
       "orders" : orders ?? "email|ASC"
     };
  }

}







class FilterAnnunciLavoratore {

  //   filter.filterAnd = "email|like_insensitive|$filtro";

  final String SEPARATOR = "|";

  final String OPERATOR_EQUAL = "eq";
  final String OPERATOR_GREATER_THAN_OR_EQUAL_TO = "gte";
  final String OPERATOR_LESS_THAN_OR_EQUAL_TO = "lte";
  final String PAYMENT_STRING = "payment";
  final String DISTANCE_STRING = "distance";
  final String DATE = "date";
  final String HOUR_SLOT = "hourSlot";

  final String NUMBER_TYPE = "number";
  final String STRING_TYPE = "string";
  final String DATE_TYPE = "date";


  double? pagaMinima = 0;
  double? distanzaMassima = 10000;
  List<String>? fasceOrarie = [];
  DateTimeRange? dateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(days: 5)));
  String? state = 'all';


  FilterAnnunciLavoratore({this.pagaMinima, this.distanzaMassima, this.fasceOrarie, this.dateRange, this.state});


  Filter toFilter(int page, int size){
    Filter result = Filter();
    result.page = page;
    result.size = size;
    result.filterAnd = compileAnd();
    result.filterOr = compileOr();
    return result;
  }


  String compileAnd(){
    String result = "";
    bool first = true;
    if(pagaMinima != null && pagaMinima != 0){
      result = "$result$PAYMENT_STRING$SEPARATOR$OPERATOR_GREATER_THAN_OR_EQUAL_TO$SEPARATOR$pagaMinima$SEPARATOR$NUMBER_TYPE";
      first = false;
    }
    /*if(distanzaMassima != null && distanzaMassima != 0){
      if(!first){
        result = "$result&";
      }
      result = "$result$DISTANCE_STRING$SEPARATOR$OPERATOR_LESS_THAN_OR_EQUAL_TO$SEPARATOR$distanzaMassima$SEPARATOR$NUMBER_TYPE";
      first = false;
    }*/
    if(dateRange != null){
      if(dateRange!.start != null){
        DateTime start = dateRange!.start.subtract(const Duration(days: 1));
        if(!first){
          result = "$result&";
        }
        result = "$result$DATE$SEPARATOR$OPERATOR_GREATER_THAN_OR_EQUAL_TO$SEPARATOR${start.toIso8601String()}$SEPARATOR$DATE_TYPE";
        first = false;
      }
      if(dateRange!.end != null){
        DateTime end = dateRange!.end.add(const Duration(days: 1));
        if(!first){
          result = "$result&";
        }
        result = "$result$DATE$SEPARATOR$OPERATOR_LESS_THAN_OR_EQUAL_TO$SEPARATOR${end.toIso8601String()}$SEPARATOR$DATE_TYPE";
        first = false;
      }
    }
    return result;
  }

  String compileOr(){
    String result = "";
    bool first = true;

    if(fasceOrarie != null) {
      for (var current in fasceOrarie!) {
        if(!first){
          result = "$result&";
        }
        result = "$result$HOUR_SLOT$SEPARATOR$OPERATOR_EQUAL$SEPARATOR$current$SEPARATOR$STRING_TYPE";
        first = false;
      }
    }

    return result;
  }


}
