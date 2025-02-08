import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/usuarios.dart';

class RegistroScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegistroScreen({super.key});

  void _registrar(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      final usuario = Usuario(username: username, password: password);
      final box = Hive.box('usuarios');
      box.put(username, usuario.toMap()); // Salva o usuário no Hive
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário registrado com sucesso!')),
      );
      Navigator.pop(context); // Volta para a tela de login
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      backgroundColor: Color(0xFFE1EEF6), // Cor de fundo
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagem no centro
              Image.asset(
                'assets/images/LOGO-APPsissa.png',
                width: 150, // Ajuste o tamanho conforme necessário
                height: 150,
              ),
              SizedBox(height: 20),
              // Campo de usuário
              SizedBox(
                width: 256,
                height: 43,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nome de usuário',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Campo de senha
              SizedBox(
                width: 256,
                height: 43,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              // Botão de registrar
              SizedBox(
                width: 126,
                height: 43,
                child: ElevatedButton(
                  onPressed: () => _registrar(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2BB0A7), // Cor de fundo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Registrar',
                    style: TextStyle(color: Colors.white), // Cor da fonte
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}