import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'registro_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  void _login(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final box = Hive.box('usuarios');
    final usuario = box.get(username);

    if (usuario != null && usuario['password'] == password) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login bem-sucedido!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário ou senha incorretos!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE1EEF6), // Cor de fundo do AppBar
        elevation: 0, // Remove a sombra do AppBar
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
                  width: 250, // Tamanho da logo
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
                width: 300, // Largura do campo
                height: 60, // Altura do campo
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
                width: 300, // Largura do campo
                height: 60, // Altura do campo
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
              // Botão de login
              SizedBox(
                width: 200, // Largura do botão
                height: 50, // Altura do botão
                child: ElevatedButton(
                  onPressed: () => _login(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2BB0A7), // Cor de fundo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18, // Tamanho da fonte
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espaçamento entre o botão e o texto de registro
              // Texto de registro
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroScreen()),
                  );
                },
                child: Text(
                  'Não tem uma conta? Registre-se',
                  style: TextStyle(
                    color: Color(0xFF007EE3),
                    fontSize: 16, // Tamanho da fonte
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