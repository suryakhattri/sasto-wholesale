import 'package:sasto_wholesale/cart/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:sasto_wholesale/CategoryDetails/category_details_model.dart';

class DBHelper {

  static Database? _db;

  Future<Database?> get db async {
    if(_db != null) {
      return _db!;
    }
    _db = await initDataBase();
  }

  initDataBase() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cartModel.db');
    var db = await openDatabase(path, version: 1, onCreate: _oncreate,);
    return db;
  }
  _oncreate(Database db, int version) async{
      await db.execute(
        'CREATE TABLE cartModel(id INTEGER PRIMARY KEY, productCategoryId INTEGER, productName TEXT, productPrice INTEGER, image TEXT, quantity INTEGER, unitTag TEXT)'
      );
  }

  Future<CartModel> insert(CartModel cartData) async{
    var dbClient = await db;
    await dbClient!.insert('cartModel', cartData.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return cartData;
  }

  Future<List<CartModel>> getCartList() async{
    var dbClient = await db;
    final List<Map<String, Object?>> quaryResult = await dbClient!.query('cartModel');
    return quaryResult.map((e) => CartModel.fromMap(e)).toList();

  }
}
