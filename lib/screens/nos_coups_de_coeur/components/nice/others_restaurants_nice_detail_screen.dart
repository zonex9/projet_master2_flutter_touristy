import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/components/app_buttons.dart';
import 'package:projet_annuel/components/app_buttons_reserver.dart';
import 'package:projet_annuel/dummy_data.dart';
import 'package:projet_annuel/models/popular_model.dart';
import 'package:projet_annuel/models/whishlist_model.dart';
import 'package:projet_annuel/screens/detail_screen/components/hotels_screen/reservation_hotel_calendar_screen.dart';
import 'package:projet_annuel/screens/detail_screen/components/select_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_annuel/screens/nos_coups_de_coeur/components/nice/plus_activite_nice_screen.dart';
import 'package:projet_annuel/screens/nos_coups_de_coeur/components/nice/plus_restaurants_nice_screen.dart';
import 'package:projet_annuel/screens/reservations_screen/reservation_hotel_nice_screen_1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';



class OthersRestaurantsNiceScreen extends StatelessWidget {
 final PopularModel popularModel;
  final _auth = FirebaseAuth.instance;

  
   OthersRestaurantsNiceScreen({
    Key? key,
    required this.popularModel,
  }) : super(key: key);



 //picture1
 /* Widget nonTransparentWidget1() => FullScreenWidget(
        backgroundColor: Colors.purple,
        backgroundIsTransparent: false,
        child: Center(
          child: Hero(
            tag: "nonTransparent",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                popularModel.picture1,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

 //picture2
 Widget nonTransparentWidget2() => FullScreenWidget(
        backgroundColor: Colors.purple,
        backgroundIsTransparent: false,
        child: Center(
          child: Hero(
            tag: "nonTransparent",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                popularModel.picture2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
 //picture3
 Widget nonTransparentWidget3() => FullScreenWidget(
        backgroundColor: Colors.purple,
        backgroundIsTransparent: false,
        child: Center(
          child: Hero(
            tag: "nonTransparent",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                popularModel.picture3,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipPath(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(popularModel.pictureprincipale),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 15,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                //premi??re petite imagz
                Positioned(
                  top: 70,
                  left: 15,
                       child: Row(
              children: <Widget>[

              SizedBox(
                width: 200, 
             child:  GridView.count(

                primary: false,
                shrinkWrap: true,
                crossAxisCount: 2,
                
                children: <Widget>[  
           
                  Column(
                                      
                    children: const <Widget>[
                      
                      Padding(
                        padding: EdgeInsets.all(8.0),
                   //     child: nonTransparentWidget1(),
                      ),
                   
                    ],
                  ),
                ],
              ), 
              
          ),
            ],
          ),
                ),
              //deuxi??me petite image
                Positioned(
                      top: 140,
                  left: 15,
                       child: Row(
              children: <Widget>[

              SizedBox(
                width: 200, 
             child:  GridView.count(

                primary: false,
                shrinkWrap: true,
                crossAxisCount: 2,
                
                children: <Widget>[  
           
                  Column(
                                      
                    children: const <Widget>[
                      
                      Padding(
                        padding: EdgeInsets.all(8.0),
                       // child: nonTransparentWidget2(),
                      ),
                   
                    ],
                  ),
                ],
              ), 
              
          ),
            ],
          )  
                ),
              //troisieme petite image
              Positioned(
                      top: 210,
                  left: 15,
                       child: Row(
              children: <Widget>[

              SizedBox(
                width: 200, 
             child:  GridView.count(

                primary: false,
                shrinkWrap: true,
                crossAxisCount: 2,
                
                children: <Widget>[  
           
                  Column(
                                      
                    children: const <Widget>[
                      
                      Padding(
                        padding: EdgeInsets.all(8.0),
                     //   child: nonTransparentWidget3(),
                      ),
                   
                    ],
                  ),
                ],
              ), 
              
          ),
            ],
          )  
                ),



              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      popularModel.title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      '\???${popularModel.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
               IconButton(
                          
                            onPressed: () {
    
                           //     postDetailsToFirestore(restaurantsListNice[0].pictureprincipale,restaurantsListNice[0].picture1, restaurantsListNice[0].picture2,restaurantsListNice[0].picture3, restaurantsListNice[0].title, restaurantsListNice[0].desc, restaurantsListNice[0].price);
                            print("uid :");
                            print(user?.uid);
                            print("titre : ");
                            print(restaurantsListNice[0].title);                     
                             
                            },
                            
                            icon: restaurantsListNice[0].favorite
     
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
          const SizedBox(height: 10),
         /* const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'S??lectionner une date de r??servation',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
         
          ),*/
          const SizedBox(height: 15),
          //const BookingCalendarDemoApp(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              popularModel.desc,
              style: const TextStyle(color: AppColors.grey),
            ),
          ),
          const SizedBox(height: 25),
           const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Photos',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height:10),
          // ************* start photos ***************//
             Padding(
                    padding: const EdgeInsets.only(left: 10),

              child: Row( //column : les widgets spnt a en bas de l'autre, row : les widgets sont a cot??
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: [
                   
                    Container(
                      height: 160,
                      width: 120,      
                      decoration:  BoxDecoration(
                     borderRadius: BorderRadius.circular(15),

                        image:  DecorationImage(
                          image:  AssetImage(
                            popularModel.picture1
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                      
                    ),
                         const SizedBox(width:1),
                    Padding(
                         padding: const EdgeInsets.only(left: 10),
                      child: Column( //column : les widgets spnt a en bas de l'autre, row : les widgets sont a cot??
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: [
                   
                     Container(
                      height: 80,
                      width: 215,      
                      decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                       // borderRadius: BorderRadius.circular(15),
                        image:  DecorationImage(
                          image:  AssetImage(
                             popularModel.picture2,
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                      
                    ),
                        const SizedBox(height:3),

                      Container(
                      height: 80,
                      width: 215,      
                      decoration:  BoxDecoration(
                                           borderRadius: BorderRadius.circular(15),

                       // borderRadius: BorderRadius.circular(15),
                        image:  DecorationImage(
                          image:  AssetImage(
                            popularModel.picture3
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                      
                    ),
                  ]
                      )
                    )
                        
                  
                  ],
                ),
             ),
          //************* end photos*******************//
       const SizedBox(height: 15),
       //***************plus d'activites **********************/

         const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Plus de restaurants ?? Nice",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
        
          ),
       const SizedBox(height: 15),

          
            //**********start plus activite **************/
                       const   PlusRestaurantsNiceList(),


            //*********** end plus activite */
        ],
     
      ),

      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(color: Color.fromARGB(255, 0, 171, 184), blurRadius: 20),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            
            Expanded(
            //  child: AppButton.normalButton(title: 'R??server maintenant', height: 40),
            child: AppButtonReserver.normalButton(
                title: 'R??server',
                  onPress: () async {
                 
                                  },
              
              ),
            ),
            const SizedBox(width: 10),
             SvgPicture.asset(
              'assets/svg/gps.svg',
              height: 20,
              width: 20,
              color: const Color.fromARGB(255, 31, 160, 235),
            ),
                           const SizedBox(width: 7),

            SvgPicture.asset(
              'assets/svg/share.svg',
              height: 20,
              width: 20,
              color: const Color.fromARGB(255, 31, 160, 235),
            ),

          ],
        ),
      ),
    );
  }



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

    Fluttertoast.showToast(msg: "Element bien Ajout?? aux favoris :)");



  }
  

}
