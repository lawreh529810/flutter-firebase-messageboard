// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Placeholder data – normally you’d load this from Firestore
  String firstName = 'John';
  String lastName = 'Doe';
  String role = 'student';

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: firstName,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              TextFormField(
                initialValue: lastName,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              TextFormField(
                initialValue: role,
                decoration: InputDecoration(labelText: 'Role'),
                readOnly: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: Text('Save Changes')),
            ],
          ),
        ),
      ),
    );
  }
}
