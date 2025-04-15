import 'package:flutter/material.dart';
import 'AuthService.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '',
      password = '',
      firstName = '',
      lastName = '',
      role = 'student';
  final AuthService _auth = AuthService();

  void register() async {
    if (_formKey.currentState!.validate()) {
      String? result = await _auth.registerUser(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        role: role,
      );

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
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "First Name"),
                onChanged: (val) => firstName = val,
                validator: (val) => val!.isEmpty ? "Enter first name" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Last Name"),
                onChanged: (val) => lastName = val,
                validator: (val) => val!.isEmpty ? "Enter last name" : null,
              ),
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
              DropdownButtonFormField(
                value: role,
                items:
                    ['student', 'admin'].map((String role) {
                      return DropdownMenuItem(value: role, child: Text(role));
                    }).toList(),
                onChanged: (val) => role = val!,
                decoration: InputDecoration(labelText: "Role"),
              ),
              ElevatedButton(onPressed: register, child: Text("Register")),
            ],
          ),
        ),
      ),
    );
  }
}
