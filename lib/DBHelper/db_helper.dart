import 'package:sasto_wholesale/Chat/ChatRoom/chat_room_model.dart';
import 'package:sasto_wholesale/cart/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {

  static Database? _db;

  Future<Database?> get db async {
    if(_db != null) {
      return _db;
    }
    _db = await initDataBase();
  }

  initDataBase() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cartModel.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate,);
    return db;
  }
  _onCreate(Database db, int version) async{
      await db.execute(
        'CREATE TABLE cartModel(id INTEGER PRIMARY KEY, name TEXT, imageUrl TEXT, price TEXT, quantity INTEGER, totalPrice TEXT, shippingCharge TEXT, vendorId TEXT)'
      );
  }


  Future<CartModel> insert(CartModel cartData) async{
    var dbClient = await db;
    await dbClient!.insert('cartModel', cartData.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return cartData;
  }

  Future<List<CartModel>?> getCartList() async{
    var dbClient = await db;
    final List<Map<String, Object?>>? quaryResult = await dbClient?.query('cartModel') ;
    return quaryResult?.map((e) => CartModel?.fromMap(e)).toList();

  }
  Future<int> delete(int id)async{
    var dbClient = await db ;
    return await dbClient!.delete(
        'cartModel',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  Future<int> updateQuantity(CartModel cart)async{
    var dbClient = await db ;
    return await dbClient!.update(
        'cart',
        cart.toMap(),
        where: 'id = ?',
        whereArgs: [cart.id]
    );
  }

  //locally Save Chat Room Data

  initDataBaseForChat() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'chatModel.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreatChat,);
    return db;
  }

  _onCreatChat(Database db, int version) async {
    await db.execute(
        'CREATE TABLE chatModel(id INTEGER PRIMARY KEY, chatRoomId TEXT, senderId INTEGER, readAt TEXT, key TEXT, createdAt TEXT, type TEXT, message TEXT)'
    );
  }

  Future<ChatRoomData> insertChat(ChatRoomData chatRoomData) async{
    var dbClient = await db;
    await dbClient!.insert('chatModel', chatRoomData.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    return chatRoomData;
  }

  Future<List<ChatRoomData>?> getChatList() async{
    var dbClient = await db;
    final List<Map<String, Object?>>? quaryResult = await dbClient?.query('chatModel') ;
    return quaryResult?.map((e) => ChatRoomData?.fromJson(e)).toList();

  }
}
