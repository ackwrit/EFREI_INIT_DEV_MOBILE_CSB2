import 'package:firstappg2_efrei_2025/View/dashboardView.dart';
import 'package:flutter/material.dart';

class MyAuthentification extends StatefulWidget {
  const MyAuthentification({super.key});

  @override
  State<MyAuthentification> createState() => _MyAuthentificationState();
}

class _MyAuthentificationState extends State<MyAuthentification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Application,"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("lib/assets/samu.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                hintText: "Entrer votre mail",
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                hintText: "Entrer votre password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyDashBoard()),
                );
              },
              child: Text("Connexion"),
            ),
            SizedBox(height: 15),
            TextButton(onPressed: () {}, child: Text("Inscription")),
          ],
        ),
      ),
    );
  }
}
