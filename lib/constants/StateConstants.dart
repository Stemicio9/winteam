


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