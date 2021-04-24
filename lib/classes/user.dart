class User{
  int id;
  String login;
  String nome;
  String cpf;
  String email;
  String senha;
  String endereco;

  User({
    this.id,
    this.login,
    this.nome,
    this.cpf,
    this.email, 
    this.senha,
    this.endereco,
  });

  User.fromJson(Map<String, dynamic> json){
    id = json['ID'];
    login = json['LOGIN'];
    nome = json['NOME'];
    cpf = json['CPF'];
    email = json['EMAIL'];
    senha = json['SENHA'];
    endereco = json['ENDERECO'];
  }

  Map<String, dynamic> toMap(){
    return {
      'ID': id,
      'LOGIN': login,
      'NOME': nome,
      'CPF': cpf,
      'EMAIL': email,
      'SENHA': senha,
      'ENDERECO': endereco,
    };
  }
}