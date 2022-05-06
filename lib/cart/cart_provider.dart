import 'package:flutter/cupertino.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details_model.dart';
import 'package:sasto_wholesale/DBHelper/db_helper.dart';
import 'package:sasto_wholesale/cart/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewCartProvider extends ChangeNotifier {

  DBHelper dbHelper = DBHelper();

  List<CartModel> myCartItemsList = [];
  int productCount = 0;
  double total = 0;

  int _counter = 0;

  int get counter => _counter;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  late Future<List<CartModel>> _cartList;

  Future<List<CartModel>> get cartModel => _cartList ;

  Future<List<CartModel>> getData() async {
    _cartList = dbHelper.getCartList();
    return _cartList;
  }

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

  // double cartValue = 0;

  addToCart(CartModel data) {
    myCartItemsList.add(data);
    // cartValue += data.price;
    notifyListeners();
    print("added To cart");
  }

  void removeCart(int index) {
    myCartItemsList.removeAt(index);
    if (productCount != 0) {
      productCount--;
    }
    calculatePrice();
    notifyListeners();
  }

  void calculatePrice() {
    total = 0;
    myCartItemsList.forEach((element) {
      total += element.productPrice * element.quantity;
    });
    notifyListeners();
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


}
