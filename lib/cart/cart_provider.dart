import 'package:flutter/cupertino.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details_model.dart';
import 'package:sasto_wholesale/DBHelper/db_helper.dart';
import 'package:sasto_wholesale/cart/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Cart Notifier
class CartItemProvider with ChangeNotifier {
  DBHelper? dbHelper = DBHelper();

  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  // List<CartModel> myCartItemsList = [];

  late Future<List<CartModel>?> _cartList;

  Future<List<CartModel>?> get cartModel => _cartList;

  Future<List<CartModel>?> getData() async {
    _cartList = dbHelper!.getCartList();
    notifyListeners();
    return _cartList;
  }

  int _counter = 0;

  int get counter => _counter;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  void _setPrefItems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('cart_item', _counter);
    preferences.setDouble('total_price', _totalPrice);
  }

  void _getPrefItems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counter = preferences.getInt('cart_item') ?? 0;
    _totalPrice = preferences.getDouble('total_price') ?? 0.0;
  }

  //Counter increase decrease
  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    notifyListeners();
    return _counter;
  }

  //Total Price
  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  void addItem(int id, String vendorId, String name, String imageUrl,
      String price, int quantity, String totalPrice, String shippingCharge) {
    dbHelper?.insert(CartModel(
        id: id,
        name: name,
        imageUrl: imageUrl,
        price: price,
        quantity: quantity,
        totalPrice: totalPrice,
        shippingCharge: shippingCharge,
        vendorId: vendorId));
    addCounter();
    notifyListeners();
    // if (_items.containsKey(vendorId)) {
    //   dbHelper?.insert(CartModel(
    //       id: id,
    //       name: name,
    //       imageUrl: imageUrl,
    //       price: price,
    //       quantity: quantity,
    //       totalPrice: totalPrice,
    //       shippingCharge: shippingCharge,
    //       vendorId: vendorId));
    //   addCounter();
    //   notifyListeners();
      // addTotalPrice(double.parse(totalPrice.toString()));
      // _items.update(
      //     vendorId,
      //     (existingCartItem) => CartModel(
      //         id: existingCartItem.id,
      //         name: existingCartItem.name,
      //         imageUrl: existingCartItem.imageUrl,
      //         price: existingCartItem.price,
      //         quantity: existingCartItem.quantity,
      //         totalPrice: existingCartItem.totalPrice,
      //         vendorId: vendorId,
      //         shippingCharge: existingCartItem.shippingCharge));
    // } else {
    //   _items.putIfAbsent(
    //     vendorId,
    //     () => CartModel(
    //       id: id,
    //       name: name,
    //       imageUrl: imageUrl,
    //       price: price,
    //       quantity: quantity,
    //       shippingCharge: shippingCharge,
    //       totalPrice: totalPrice,
    //       vendorId: vendorId,
    //     ),
    //   );
    // }
   // notifyListeners();
  }
}
