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
      appBar: AppBar(
        backgroundColor: Color(0xFFE1EEF6), // Cor de fundo do AppBar
        elevation: 0, // Remove a sombra do AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Ícone de seta
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      backgroundColor: Color(0xFFE1EEF6), // Cor de fundo da tela
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagem no centro com padding na parte inferior
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0), // Padding inferior
                child: Image.asset(
                  'assets/images/LOGO-APPsissa.png',
                  width: 250, // Aumentei o tamanho da logo
                  height: 250,
                ),
              ),
              SizedBox(height: 20),
              // Texto "Usuário:" antes do campo de usuário
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0), // Alinhamento à esquerda
                  child: Text(
                    'Usuário:',
                    style: TextStyle(
                      fontSize: 16, // Tamanho da fonte
                      fontWeight: FontWeight.bold, // Texto em negrito
                      color: Colors.black, // Cor do texto
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8), // Espaçamento entre o texto e o campo
              // Campo de usuário
              SizedBox(
                width: 300, // Aumentei a largura do campo
                height: 60, // Aumentei a altura do campo
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espaçamento entre os campos
              // Texto "Senha:" antes do campo de senha
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0), // Alinhamento à esquerda
                  child: Text(
                    'Senha:',
                    style: TextStyle(
                      fontSize: 16, // Tamanho da fonte
                      fontWeight: FontWeight.bold, // Texto em negrito
                      color: Colors.black, // Cor do texto
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8), // Espaçamento entre o texto e o campo
              // Campo de senha
              SizedBox(
                width: 300, // Aumentei a largura do campo
                height: 60, // Aumentei a altura do campo
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 30), // Espaçamento entre os campos e o botão
              // Botão de registrar
              SizedBox(
                width: 200, // Aumentei a largura do botão
                height: 50, // Aumentei a altura do botão
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18, // Aumentei o tamanho da fonte
                    ),
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