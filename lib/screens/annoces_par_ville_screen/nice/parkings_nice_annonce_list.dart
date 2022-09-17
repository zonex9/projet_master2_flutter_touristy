import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_annuel/dummy_data.dart';

import 'package:flutter/material.dart';
import 'package:projet_annuel/screens/nos_coups_de_coeur/components/nice/others_parkings_nice_detail_screen.dart';


class ParkingsNiceAnnoncesList extends StatefulWidget {
  const ParkingsNiceAnnoncesList({Key? key}) : super(key: key);

  @override
  State<ParkingsNiceAnnoncesList> createState() => _ParkingsNiceAnnoncesListState();
}

 final _auth = FirebaseAuth.instance;
 User? user = _auth.currentUser;
 String titre = "" ;


class _ParkingsNiceAnnoncesListState extends State<ParkingsNiceAnnoncesList> {
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
                  builder: ((context) => OthersParkingsNiceScreen(
                        popularModel: parkingsListNice[i],
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
                              image: AssetImage(parkingsListNice[i].pictureprincipale),
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
                              Text(parkingsListNice[i].title),
                           
                            ],
                          ),
                          //save to whishlist
                          IconButton(
                          
                            onPressed: () {
    
                            },
                            
                            icon: parkingsListNice[i].favorite
     
                                ? const Icon(
                                  //boolean
                                    Icons.favorite,
                                    color: Color.fromARGB(255, 54, 216, 244),
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
          childCount: parkingsListNice.length,
        ),
      ),
    );
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
