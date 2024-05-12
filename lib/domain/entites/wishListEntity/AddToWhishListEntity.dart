/// data : ["6428ebc6dc1175abc65ca0b9"]

class AddToWishListEntity {
  AddToWishListEntity({
      this.data,});

  AddToWishListEntity.fromJson(dynamic json) {
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  List<String>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    return map;
  }

}