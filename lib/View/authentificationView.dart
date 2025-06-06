import 'package:firstappg2_efrei_2025/View/dashboardView.dart';
import 'package:firstappg2_efrei_2025/controller/firebaseHelper.dart';
import 'package:firstappg2_efrei_2025/controller/myaninmation.dart';
import 'package:firstappg2_efrei_2025/controller/mybackground.dart';
import 'package:firstappg2_efrei_2025/globale.dart';
import 'package:flutter/material.dart';

class MyAuthentification extends StatefulWidget {
  const MyAuthentification({super.key});

  @override
  State<MyAuthentification> createState() => _MyAuthentificationState();
}

class _MyAuthentificationState extends State<MyAuthentification> {
  //variables
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("First Application"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          MyBackground(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MyAnimation(
                  timer: 1,
                  child: Container(
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
                ),
                SizedBox(height: 15),
                MyAnimation(
                  timer: 2,
                  child: TextField(
                    controller: mail,
                    decoration: InputDecoration(
                      hintText: "Entrer votre mail",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                MyAnimation(
                  timer: 3,
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      hintText: "Entrer votre password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                MyAnimation(
                  timer: 4,
                  child: ElevatedButton(
                    onPressed: () {
                      MyFirebaseHelper()
                          .connexionCompte(
                            email: mail.text,
                            password: password.text,
                          )
                          .then((onValue) {
                            setState(() {
                              monUtilisateur = onValue;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyDashBoard(),
                                ),
                              );
                            });
                          })
                          .catchError((onError) {
                            showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog.adaptive(
                                  content: Text("Erreur"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                    },
                    child: Text("Connexion"),
                  ),
                ),
                SizedBox(height: 15),
                MyAnimation(
                  timer: 5,
                  child: TextButton(
                    onPressed: () {
                      MyFirebaseHelper()
                          .createCompte(
                            email: mail.text,
                            password: password.text,
                          )
                          .then((onValue) {
                            setState(() {
                              monUtilisateur = onValue;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyDashBoard(),
                                ),
                              );
                            });
                          });
                    },
                    child: Text("Inscription"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
