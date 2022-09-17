class PopularModel {
  final String pictureprincipale;
  final String picture1;
  final String picture2;
  final String picture3;
  final String title;
  final String desc;
  final int price;
  bool favorite;

  PopularModel({
    required this.pictureprincipale,
    required this.picture1,
    required this.picture2,
    required this.picture3,
    required this.desc,
    required this.price,
    required this.title,
    this.favorite = false,
  });
}

