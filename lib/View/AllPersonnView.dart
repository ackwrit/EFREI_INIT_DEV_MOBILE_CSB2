import 'package:firstappg2_efrei_2025/controller/firebaseHelper.dart';
import 'package:firstappg2_efrei_2025/globale.dart';
import 'package:firstappg2_efrei_2025/model/myuser.dart';
import 'package:flutter/material.dart';

class AllPersonView extends StatefulWidget {
  const AllPersonView({super.key});

  @override
  State<AllPersonView> createState() => _AllPersonViewState();
}

class _AllPersonViewState extends State<AllPersonView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MyFirebaseHelper().cloudUsers.snapshots(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else {
          if (snap.data == null) {
            return Center(
              child: Text("Il n'y a aucune personnes dans la base de donnée"),
            );
          } else {
            List documents = snap.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                Myuser others = Myuser.bdd(documents[index]);
                if (monUtilisateur.id == others.id) {
                  return SizedBox();
                } else {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(others.avatar!),
                      ),
                      title: Text(others.nom),
                      subtitle: Text(others.email),
                    ),
                  );
                }
              },
            );
          }
        }
      },
    );
  }
}
