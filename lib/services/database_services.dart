import 'package:charikati/models/sell.dart';
import 'package:charikati/models/client.dart';
import 'package:charikati/models/designation.dart';
import 'package:charikati/models/order.dart';
import 'package:charikati/models/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  final String designationTable = 'designation';
  final String productsTable = 'products';
  final String buyTable = 'sell';
  final String orderTable = 'orderi';
  final String clientTable = 'client';
  final String createClientTable =
      'CREATE TABLE client (id INTEGER PRIMARY KEY, name TEXT, phone TEXT, email TEXT)';
  final String createBuyTable =
      'CREATE TABLE sell (id INTEGER PRIMARY KEY, date TEXT, clientId INTEGER ,total INTEGER DEFAULT 0 ,FOREIGN KEY (clientId) REFERENCES client(id) ON DELETE SET NULL)';
  final String createOrderTable =
      'CREATE TABLE orderi (id INTEGER PRIMARY KEY, contity INTEGER,total INTEGER , sellId INTEGER, productId INTEGER, FOREIGN KEY (productId) REFERENCES products(id),  FOREIGN KEY (sellId) REFERENCES sell(id) ON DELETE SET NULL)';

  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'flutter_sqflite_database.db');

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Run the CREATE {designation} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE $designationTable(id INTEGER PRIMARY KEY, name TEXT)',
    );
    await db.execute(
      'CREATE TABLE $productsTable(id INTEGER PRIMARY KEY, name TEXT, price INTEGER, designationId INTEGER, FOREIGN KEY (designationId) REFERENCES $designationTable(id) ON DELETE SET NULL)',
    );
    await db.execute(createClientTable);
    await db.execute(createBuyTable);
    await db.execute(createOrderTable);
  }

  Future<void> insertDesignation(Designation designation) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    await db.insert(
      designationTable,
      designation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertProduct(Product product) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    await db.insert(
      productsTable,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertClient(Client client) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    await db.insert(
      clientTable,
      client.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertSell(Sell sell) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    await db.insert(
      buyTable,
      sell.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertOrder(Order order) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    await db.insert(
      orderTable,
      order.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Designation>> getDesignations() async {
    final db = await _databaseService.database;

    final List<Map<String, dynamic>> maps = await db.query(designationTable);

    return List.generate(
        maps.length, (index) => Designation.fromMap(maps[index]));
  }

  Future<List<Client>> getClients() async {
    final db = await _databaseService.database;

    final List<Map<String, dynamic>> maps = await db.query(clientTable);

    return List.generate(maps.length, (index) => Client.fromMap(maps[index]));
  }

  Future<List<Sell>> getClientBuys(int clientId) async {
    final db = await _databaseService.database;

    final List<Map<String, dynamic>> maps =
        await db.query(buyTable, where: 'clientId = ?', whereArgs: [clientId]);

    return List.generate(maps.length, (index) => Sell.fromMap(maps[index]));
  }

  Future<List<Order>> getBuyOrders(int buyId) async {
    final db = await _databaseService.database;

    final List<Map<String, dynamic>> maps =
        await db.query(orderTable, where: 'sellId = ?', whereArgs: [buyId]);

    return List.generate(maps.length, (index) => Order.fromMap(maps[index]));
  }

  Future<List<Product>> getProducts() async {
    final db = await _databaseService.database;

    final List<Map<String, dynamic>> maps = await db.query(productsTable);

    return List.generate(maps.length, (index) => Product.fromMap(maps[index]));
  }

  Future<Designation> designation(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query(designationTable, where: 'id = ?', whereArgs: [id]);
    return Designation.fromMap(maps[0]);
  }
  Future<Product> product(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query(productsTable, where: 'id = ?', whereArgs: [id]);
    return Product.fromMap(maps[0]);
  }
  Future<Sell> sell(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query(buyTable, where: 'id = ?', whereArgs: [id]);
    return Sell.fromMap(maps[0]);
  }
  Future<Client> client(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query(clientTable, where: 'id = ?', whereArgs: [id]);
    return Client.fromMap(maps[0]);
  }

  Future<void> updateSell (Sell sell, int id) async {
final db = await _databaseService.database;
    await db.rawUpdate('''
    UPDATE $buyTable 
    SET total = ? 
    WHERE id = ?
    ''',
    [sell.total, id]);
    
    // await db.update(buyTable, sell.toMap(),
    // where: 'id = ?', whereArgs: [id]);
    }
 
  Future<void> updateOrder (Order order, int id) async {
    final db = await _databaseService.database;
    await db.update(orderTable, order.toMap(),
    where: 'id = ?', whereArgs: [id]);}

  
 }