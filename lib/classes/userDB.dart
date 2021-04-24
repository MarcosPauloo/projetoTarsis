import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDB{
  Database _db;

  Future<Database> get db async{
    _db = await _initDB();
    return _db;
  }

  _initDB() async {
    String databasesPath = await databaseFactory.getDatabasesPath();
    
    String path = join(databasesPath, 'users8.db');
    print(path);

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);

    return db;
  }

  _onCreate(Database db, int version) async {
    String sql = 
        'CREATE TABLE USUARIOS (ID INTEGER PRIMARY KEY, LOGIN VARCHAR(100), NOME VARCHAR(100), CPF VARCHAR(14), EMAIL VARCHAR(50), SENHA VARCHAR(50), ENDERECO VARCHAR(200) );';
    await db.execute(sql);

    sql = "INSERT INTO USUARIOS(ID, LOGIN, NOME, CPF, EMAIL, SENHA, ENDERECO) VALUES (12, 'usuario12', 'Usuario Um', '123.456.789-12', 'usuario1@gmail.com', 'senha1', 'casa do usuario um');";
    await db.execute(sql);
  
    sql = "INSERT INTO USUARIOS(ID, LOGIN, NOME, CPF, EMAIL, SENHA, ENDERECO) VALUES (13, 'usuario13', 'Usuario Dois', '122.222.222-33', 'usuario2@gmail.com', 'senha2', 'casa do usuario dois');";
    await db.execute(sql);
  }

}