import 'package:flutter/material.dart';
import 'AuthService.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '', password = '';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  void login() async {
    if (_formKey.currentState!.validate()) {
      String? result = await _auth.loginUser(email: email, password: password);

      if (result == null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(result)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (val) => email = val,
                validator:
                    (val) => val!.contains('@') ? null : "Enter valid email",
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                onChanged: (val) => password = val,
                validator: (val) => val!.length < 6 ? "6+ characters" : null,
              ),
              ElevatedButton(onPressed: login, child: Text("Login")),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text("Don't have an account? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
