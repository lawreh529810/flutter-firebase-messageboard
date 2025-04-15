import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'LoginScreen.dart';
import 'RegisterScreen.dart';
import 'SplashScreen.dart';
import 'HomeScreen.dart';

// Placeholder imports for screens you'll build or stub
import 'ProfileScreen.dart';
import 'SettingsScreen.dart';
import 'ChatPage.dart'; // coming next

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message Board App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}
