import 'package:proevent/app/data/model/notifications.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _db;
  static final int _version = 1;
  static final String _tablename = "events";
static Future<void> initDb () async{
  if( _db != null){
    return;
  }try{
    String _path = await getDatabasesPath() +'events.db';
    _db = await openDatabase(
      _path,
      version: _version,
      onCreate: (db , version){
        print("creationg a new one ");
        return db.execute(
          "CREATE TABLE $_tablename("
              "id INTEGER  PRIMARY KEY AUTOINCREMENT , "
              " name STRING  , place STRING , date STRING, "
              "startTime STRING , endTime STRING , "
              "type  STRING , namedept String , "
              "color INTEGER , "
              "isCompleted INTEGER )",

        );
      }
    );
  }catch(e){
    print(e);
  }
}
static Future<int> insert(Notifications? notifications) async{
  print("insert function called");
  return await _db?.insert(_tablename, notifications!.toJson())??1;
}

}