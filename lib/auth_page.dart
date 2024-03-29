import 'package:flutter/material.dart';
import 'rickandmorty.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login(BuildContext context) {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (_formKey.currentState!.validate()) {
      if (username == 'dmitry' && password == 'sherbakov') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RickAndMortyPage()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Ошибка'),
              content: Text('Invalid username or password.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ОКНО АВТОРИЗАЦИИ')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'ЛОГИН',
                  ),
                  textAlign: TextAlign.center,
                  maxLength: 15,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Логин не может быть пустым';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'ПАРОЛЬ',
                  ),
                  textAlign: TextAlign.center,
                  maxLength: 15,
                  obscureText: true,
                  onChanged: (value) {
                    _passwordController.text = value.trim();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ПАРОЛЬ НЕ МОЖЕТ БЫТЬ ПУСТЫМ';
                    } else if (value.length < 6) {
                      return 'ПАРОЛЬ должен быть длиннее 6 символов';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _login(context),
                  child: Text('ВХОД'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}