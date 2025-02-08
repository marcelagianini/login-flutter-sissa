import 'package:hive/hive.dart';

part 'usuarios.g.dart' ;

@HiveType(typeId: 0) // Define um tipo único para o modelo
class Usuario {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final String password;

  Usuario({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }
}