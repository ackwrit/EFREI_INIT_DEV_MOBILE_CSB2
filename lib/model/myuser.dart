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

  //méthode
}
