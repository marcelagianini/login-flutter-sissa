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
      appBar: AppBar(title: Text('Login')),
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
              // Botão de login
              SizedBox(
                width: 126,
                height: 43,
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
                    style: TextStyle(color: Colors.white), // Cor da fonte
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                  style: TextStyle(color: Color(0xFF007EE3)), // Cor da fonte
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}