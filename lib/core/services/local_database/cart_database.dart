import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../modules/cart/models/cart_product_model.dart';
import '../../utils/storage_keys.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._privateConstructor();

  static final CartDatabaseHelper instance =
      CartDatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "cartProduct.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${StorageKeys.cartProductsTable} (
    id INTEGER PRIMARY KEY,
    ${StorageKeys.productIdColumn} TEXT,
    ${StorageKeys.nameColumn} TEXT,
    ${StorageKeys.imageColumn} TEXT,
    ${StorageKeys.priceColumn} TEXT,
    ${StorageKeys.quantityColumn} INTEGER
    )   
    ''');
  }

  Future<int> insertData(CartProduct cartProduct) async {
    Database db = await instance.database;
    return await db.insert(
      StorageKeys.cartProductsTable,
      cartProduct.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartProduct>> getData() async {
    Database db = await instance.database;
    List<Map> products = await db.query(StorageKeys.cartProductsTable);

    List<CartProduct> productsList = products.isNotEmpty
        ? products.map((product) => CartProduct.fromJson(product)).toList()
        : [];
    return productsList;
  }

  Future<int> updateData(CartProduct cartProduct) async {
    Database db = await instance.database;
    return await db.update(
      StorageKeys.cartProductsTable,
      cartProduct.toJson(),
      where: '${StorageKeys.productIdColumn} = ?',
      whereArgs: [cartProduct.productID],
    );
  }

  Future<int> deleteData(String productId) async {
    Database db = await instance.database;
    return await db.delete(
      StorageKeys.cartProductsTable,
      where: '${StorageKeys.productIdColumn} = ?',
      whereArgs: [productId],
    );
  }
}
