import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Importe o modelo de usuário
import 'screens/login_screen.dart'; // Importe a tela de login
import 'adapters/hive_adapter.dart';

void main() async {
  // Inicializa o Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Hive
  await Hive.initFlutter();

  // Registra o adaptador do modelo Usuario
  registerAdapters(); // Chama a função para registrar os adaptadores

  // Abre a caixa (box) para armazenar os usuários
  await Hive.openBox('usuarios');

  // Executa o aplicativo
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(), // Define a tela de login como a tela inicial
    );
  }
}