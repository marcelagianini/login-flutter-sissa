import 'package:hive_flutter/hive_flutter.dart';
import '../models/usuarios.dart'; // Importe o modelo Usuario

void registerAdapters() {
  Hive.registerAdapter(UsuarioAdapter()); // Registra o adaptador gerado
}