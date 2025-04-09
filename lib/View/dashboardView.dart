import 'package:firstappg2_efrei_2025/globale.dart';
import 'package:flutter/material.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({super.key});

  @override
  State<MyDashBoard> createState() => _MyDashBoard();
}

class _MyDashBoard extends State<MyDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nouvelle page"), centerTitle: true),
      body: Text(monUtilisateur.email),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "Message",
          ),
        ],
      ),
    );
  }
}
