
import 'package:projetotarsisio/classes/user.dart';
import 'package:projetotarsisio/classes/userDB.dart';
import 'package:sqflite/sqflite.dart';

class UserDao{
  final tableName = 'USUARIOS';

  Future<List<User>> carregarUsuarios() async{

    UserDB database = UserDB();
    Database db = await database.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    List<User> listaUsuarios = <User>[];
    for(var json in result){
      listaUsuarios.add(User.fromJson(json));
      print(json);
    }

    return listaUsuarios;
  }

  Future<void> insertUser(User u) async {
    UserDB database = UserDB();
    final Database db = await database.db;
    
    String sql = "INSERT INTO USUARIOS(ID, LOGIN, NOME, CPF, EMAIL, SENHA, ENDERECO) VALUES ($u.id, $u.login, $u.nome, $u.cpf, $u.email, $u.senha, $u.endereco);";
    int result = await db.rawInsert(sql);
    return result;
  }
                                        
}