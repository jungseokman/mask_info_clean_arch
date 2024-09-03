class StoreModel {
  int? count;
  List<Stores>? stores;

  StoreModel({this.count, this.stores});

  StoreModel.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["stores"] is List) {
      stores = json["stores"] == null
          ? null
          : (json["stores"] as List).map((e) => Stores.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    if (stores != null) {
      data["stores"] = stores?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Stores {
  String? addr;
  String? code;
  String? createdAt;
  double? lat;
  double? lng;
  String? name;
  String? remainStat;
  String? stockAt;
  String? type;

  Stores(
      {this.addr,
      this.code,
      this.createdAt,
      this.lat,
      this.lng,
      this.name,
      this.remainStat,
      this.stockAt,
      this.type});

  Stores.fromJson(Map<String, dynamic> json) {
    if (json["addr"] is String) {
      addr = json["addr"];
    }
    if (json["code"] is String) {
      code = json["code"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["lat"] is double) {
      lat = json["lat"];
    }
    if (json["lng"] is double) {
      lng = json["lng"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["remain_stat"] is String) {
      remainStat = json["remain_stat"];
    }
    if (json["stock_at"] is String) {
      stockAt = json["stock_at"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["addr"] = addr;
    data["code"] = code;
    data["created_at"] = createdAt;
    data["lat"] = lat;
    data["lng"] = lng;
    data["name"] = name;
    data["remain_stat"] = remainStat;
    data["stock_at"] = stockAt;
    data["type"] = type;
    return data;
  }
}
