import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

late Database database;

class LocaldbController extends GetxController {
  createDataBase() async {
    // Get a location using getDatabasesPath
    var dataPath = await getDatabasesPath();
    print(dataPath);
    String path = join(dataPath, "Price.db");
    print(path);
    // open
    database = await openDatabase(path, version: 1, onCreate: (db, version) {
      db
          .execute(
              'CREATE TABLE Price (id INTEGER PRIMARY KEY ,listName TEXT, itemName TEXT, price TEXT, type TEXT, image TEXT)')
          .then((value) {
        print("Table crated ");
      }).catchError((error) {
        print(error);
      });
    }, onOpen: (db) {
      getDataBase(db);
      print("DataBase opened");
    });
  }

  insertDataBase(
      {required String itemName,
      required String price,
      required String image}) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Price (itemName, price, type, image) VALUES("$itemName","$price","all","$image")')
          .then((value) {
        print("$value record inserted");
        getDataBase(database);
      }).catchError((error) {
        print(error);
      });
    });
  }

  insertListName({
    required String itemName,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert('INSERT INTO Price (listName) VALUES("$itemName")')
          .then((value) {
        print("$value record inserted");
        getDataBase(database);
      }).catchError((error) {
        print(error);
      });
    });
  }

  updateDataBase(
      {required int id,
      required String itemName,
      required String price,
      required String image}) async {
    await database.rawUpdate(
        'UPDATE Price SET itemName = ?, price = ?, image = ?, WHERE id = ?',
        [itemName, price, image, id]).then((value) {
      print("$value update");
      getDataBase(database);
    }).catchError((error) {
      print(error);
    });
  }

// update type
  addOrRemoveFavorite({required String type, required int id}) async {
    await database.rawUpdate(
        'UPDATE Price SET type = ? WHERE id = ?', [type, id]).then((value) {
      print("$value update type");
      getDataBase(database);
    }).catchError((error) {
      print("type updated");
    });
  }

// delete
  deleteContact({required int id}) async {
    await database
        .rawDelete('DELETE FROM Price WHERE id = ?', [id]).then((value) {
      print("$value is deleted");
      getDataBase(database);
    }).catchError((error) {
      print(error);
    });
  }

  var PriceList = [].obs;
  var favoriteList = [].obs;

  getDataBase(Database database) {
    PriceList.clear();
    favoriteList.clear();
    database.rawQuery('SELECT * FROM Price').then((value) {
      for (Map<String, Object?> element in value) {
        PriceList.add(element);

        if (element['type'] == 'favorite') {
          favoriteList.add(element);
        }
      }
      print(PriceList);
    }).catchError((error) {
      print(error);
    });
  }

  addToMyList() {}
}
