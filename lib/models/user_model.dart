class UserModel{
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? universiteArrivee;
  String? paysOrigine;

  UserModel({this.uid,this.email,this.firstName,this.secondName,this.universiteArrivee,this.paysOrigine});

  // receiving data from server
  factory UserModel.fromMap(map)
  {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      universiteArrivee: map['universiteArrivee'],
      paysOrigine: map['paysOrigine'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'universiteArrivee' : universiteArrivee,
      'paysOrigine' : paysOrigine,
    };
  }
}