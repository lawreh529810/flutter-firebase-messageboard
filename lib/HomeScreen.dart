import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messageBoards = [
    {'name': 'General Chat', 'icon': Icons.chat_bubble},
    {'name': 'Tech Talk', 'icon': Icons.computer},
    {'name': 'Gaming Zone', 'icon': Icons.videogame_asset},
    {'name': 'Random Stuff', 'icon': Icons.casino},
  ];

  void _openBoard(BuildContext context, String boardName) {
    Navigator.pushNamed(context, '/chat', arguments: boardName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Boards'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.forum),
              title: Text('Message Boards'),
              onTap: () {
                Navigator.pop(context); // Stay on Home
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: messageBoards.length,
        itemBuilder: (context, index) {
          final board = messageBoards[index];
          return Card(
            child: ListTile(
              leading: Icon(board['icon']),
              title: Text(board['name']),
              onTap: () => _openBoard(context, board['name']),
            ),
          );
        },
      ),
    );
  }
}
