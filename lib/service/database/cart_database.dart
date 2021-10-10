import 'package:ecommerce_app/components/constant/endpoints.dart';
import 'package:ecommerce_app/model/cart_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase{
  CartDatabase._();
  static final CartDatabase db =CartDatabase._();
  static Database? _database;
  Future<Database?> get database async{
    if(_database !=null) return _database;
    _database =await initDb();
    return _database;

  }

  initDb()async {
    String paTh=join( await getDatabasesPath(),'CartProduct');
    return await openDatabase(paTh,version: 1,onCreate: (Database? db,int version)async{
        // await db!.execute('CREATE TABLE $tableCartProduct  (
        // Name ,
        // $columnImage TEXT ,
        // $columnPrice TEXT,
        // $columnQuantity INT,
        // );
      await db!.execute(
          'CREATE TABLE $tableCartProduct ( $columnProductId TEXT,$columnName TEXT, $columnQuantity INTEGER,  $columnImage TEXT, $columnPrice TEXT)');




    });


  }
 Future  <List <CartModel?>> getAllProduct()async{
    var dbClient=await database;
   List <Map> maps=await dbClient!.query(tableCartProduct);
    List <CartModel> list=maps.isNotEmpty?maps.map((product) => CartModel.fromJson(product)
).toList()
    :[];

return list;
  }

  insert (CartModel model)async{
    var dbClient=await database;
    await dbClient!.insert(tableCartProduct, model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);


  }
}