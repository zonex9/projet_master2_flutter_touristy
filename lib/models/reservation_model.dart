
class ReservationModel{
  String? uid;
  String? imageprincipale;
  String? titre;
  String? prix;
  String? category;
  String? longitude;
  String? latitude;
  String? datedebut;
  String? datefin;
  String? ville;
  String? chambres;
  String? passagers;

  ReservationModel({this.uid,this.imageprincipale,this.titre,this.category,this.prix,this.latitude,this.longitude,this.datedebut,this.datefin,this.ville,this.chambres,this.passagers});

  // receiving data from server
  factory ReservationModel.fromMap(map)
  {
    return ReservationModel(
      uid: map['uid'],
      imageprincipale: map['imageprincipale'],
      titre: map['titre'],
      category: map['category'],
      prix: map['prix'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      datedebut: map['datedebut'],
      datefin: map['datefin'],
      ville: map['ville'],
      chambres: map['chambres'],
      passagers: map['passagers'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'imageprincipale': imageprincipale,
      'titre': titre,
      'category': category,
      'prix' : prix,
      'latitude' : latitude,
      'longitude': longitude,
      'datedebut': datedebut,
      'datefin': datefin,
      'ville' : ville,
      'chambres' : chambres,
      'passagers' : passagers,
    };
  }
}