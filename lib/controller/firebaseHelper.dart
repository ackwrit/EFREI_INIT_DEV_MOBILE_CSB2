import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyFirebaseHelper {
  //attributs

  final auth = FirebaseAuth.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");

  createCompte({required String email, required String password}) async {
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
  }

  addUser(String uid, Map<String, dynamic> data) {
    cloudUsers.doc(uid).set(data);
  }

  connexionCompte() {}
}
