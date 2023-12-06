class FoodModel {
  String? id;
  String? nama;

  FoodModel({this.id, this.nama});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nama'] = nama;
    return data;
  }
}
