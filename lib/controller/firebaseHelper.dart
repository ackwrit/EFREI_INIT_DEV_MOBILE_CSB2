import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstappg2_efrei_2025/model/myuser.dart';

class MyFirebaseHelper {
  //attributs

  final auth = FirebaseAuth.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");

  Future<Myuser> createCompte({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    String uid = credential.user!.uid;
    Map<String, dynamic> data = {
      "EMAIL": email,
      "NOM": "",
      "PRENOM": "",
      "BIRTHDAY": DateTime.now(),
    };
    addUser(uid, data);
    return getUser(uid);
  }

  Future<Myuser> getUser(uid) async {
    DocumentSnapshot snapshot = await cloudUsers.doc(uid).get();
    return Myuser.bdd(snapshot);
  }

  addUser(String uid, Map<String, dynamic> data) {
    cloudUsers.doc(uid).set(data);
  }

  Future<Myuser> connexionCompte({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    String uid = userCredential.user!.uid;
    return getUser(uid);
  }
}
