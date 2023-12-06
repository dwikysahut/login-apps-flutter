import 'package:login_apps/model/food/food_model.dart';

class CartModel extends FoodModel {
  int? qty;

  CartModel({super.id, super.nama, this.qty});

  CartModel.fromJson(Map<String, dynamic> json) {
    qty = json['qty'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qty'] = id;
    data['nama'] = nama;
    return data;
  }
}
