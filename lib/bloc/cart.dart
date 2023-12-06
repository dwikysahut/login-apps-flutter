import 'package:bloc/bloc.dart';
import 'package:login_apps/model/cart/cart.dart';

class CartProvider extends Cubit<List<CartModel>> {
  CartProvider() : super([]);

  late List<CartModel> data;

  void addToCart(CartModel cartModel) {
    CartModel newData = cartModel;
    emit([...state, newData]);
  }

  void removeFromCart(id) {
    List<CartModel> newState = List.from(state);
    newState.removeWhere((element) => element.id == id);
    emit([...state]);
  }

  @override
  void onChange(Change<List<CartModel>> change) {
    // TODO: implement onChange
    super.onChange(change);
    change.currentState.forEach((e) => print(e.nama));
  }
}
