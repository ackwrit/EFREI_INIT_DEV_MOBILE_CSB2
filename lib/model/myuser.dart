import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstappg2_efrei_2025/globale.dart';

class Myuser {
  //attributs
  late String id;
  late String email;
  late String nom;
  late String prenom;
  String? avatar;
  late DateTime birthday;

  //constructeur
  Myuser() {
    id = "";
    email = "";
    nom = "";
    prenom = "";
    birthday = DateTime.now();
  }

  Myuser.bdd(DocumentSnapshot snapshot) {
    id = snapshot.id;
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    email = data["EMAIL"];
    nom = data["NOM"];
    prenom = data["PRENOM"];
    Timestamp timestamp = data["BIRTHDAY"];
    birthday = timestamp.toDate();
    avatar = data["AVATAR"] ?? imageDefault;
  }

  //méthode
}
