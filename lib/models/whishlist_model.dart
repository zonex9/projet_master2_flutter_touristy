
class WhishlistModel{
  String? uid;
  String? imageprincipale;
  String? image1;
  String? image2;
  String? image3;
  String? titre;
  String? description;
  int? prix;
  String? latitude;
  String? longitude;


  WhishlistModel({this.uid,this.imageprincipale,this.image1,this.image2,this.image3,this.titre,this.description,this.prix,this.latitude,this.longitude});

  // receiving data from server
  factory WhishlistModel.fromMap(map)
  {
    return WhishlistModel(
      uid: map['uid'],
      imageprincipale: map['imageprincipale'],
      image1: map['image1'],
      image2: map['image2'],
      image3: map['image3'],
      titre: map['titre'],
      description: map['description'],
      prix: map['prix'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'imageprincipale': imageprincipale,
      'image1': image1,
      'image2': image2,
      'image3' : image3,
      'titre' : titre,
      'description': description,
      'prix': prix,
      'latitude': latitude, 
      'longitude': longitude,
    };
  }
}