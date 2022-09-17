import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet_annuel/dummy_data.dart';
import 'package:projet_annuel/models/whishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:projet_annuel/screens/nos_coups_de_coeur/components/toulon/others_restaurants_detail_screen.dart';
import 'package:uuid/uuid.dart';


class RestaurantsToulonAnnoncesList extends StatefulWidget {
  const RestaurantsToulonAnnoncesList({Key? key}) : super(key: key);

  @override
  State<RestaurantsToulonAnnoncesList> createState() => _RestaurantsToulonAnnoncesListState();
}

 final _auth = FirebaseAuth.instance;
 User? user = _auth.currentUser;
 String titre = "" ;


class _RestaurantsToulonAnnoncesListState extends State<RestaurantsToulonAnnoncesList> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          childAspectRatio: .7,
        ),
        delegate: SliverChildBuilderDelegate(
          (ctx, i) {
            return GestureDetector(
             onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => OthersRestaurantsToulonScreen(
                        popularModel: restaurantsListToulon[i],
                      )),
                ),
              ),
              child: Card(
                elevation: .7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage(restaurantsListToulon[i].pictureprincipale),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(restaurantsListToulon[i].title),
                         
                            ],
                          ),
                          //save to whishlist
                          IconButton(
                          
                            onPressed: () {
    
                                postDetailsToFirestore(restaurantsListToulon[i].pictureprincipale,restaurantsListToulon[i].picture1, restaurantsListToulon[i].picture2,restaurantsListToulon[i].picture3, restaurantsListToulon[i].title, restaurantsListToulon[i].desc, restaurantsListToulon[i].price);
                            print("uid :");
                            print(user?.uid);
                            print("titre : ");
                            print(restaurantsListToulon[i].title);                     
                              setState(() {
                                restaurantsListToulon[i].favorite =
                                    !restaurantsListToulon[i].favorite;
                              });
                            },
                            
                            icon: restaurantsListToulon[i].favorite
     
                                ? const Icon(
                                  //boolean
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 18,
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: restaurantsListToulon.length,
        ),
      ),
    );
  }


 

  //insert to database 

  postDetailsToFirestore(String imageprincipale, String image1, String image2, String image3, String titre, String description, int prix) async
  {
      var uuid = Uuid();
        // calling our firestore
    // calling our user model
    // sending those values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    WhishlistModel whishlistModel = WhishlistModel();// writing all the values

    whishlistModel.uid = user?.uid;
 
    whishlistModel.imageprincipale = imageprincipale;
    whishlistModel.image1 = image1; 
    whishlistModel.image2 = image2;
    whishlistModel.image3 = image3;
    whishlistModel.titre = titre;
    whishlistModel.description = description;
    whishlistModel.prix = prix;

    //genere un id aleatoire
    await firebaseFirestore.collection("whishlist").doc(uuid.v4()).set(whishlistModel.toMap());

    Fluttertoast.showToast(msg: "Element bien Ajouté aux favoris :)");



  }


}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()..moveTo(0, 0);

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);

    path.lineTo(size.width - 20, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height - 25, size.width, size.height - 50);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
