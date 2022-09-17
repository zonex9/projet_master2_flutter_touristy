import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/components/app_buttons.dart';
import 'package:projet_annuel/dummy_data.dart';
import 'package:projet_annuel/models/popular_model.dart';
import 'package:projet_annuel/models/whishlist_model.dart';
import 'package:projet_annuel/screens/detail_screen/components/hotels_screen/reservation_hotel_calendar_screen.dart';
import 'package:projet_annuel/screens/detail_screen/components/select_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../clipper.dart';

class HotelsDetailScreen extends StatelessWidget {
  final PopularModel popularModel;
  final _auth = FirebaseAuth.instance;

  
   HotelsDetailScreen({
    Key? key,
    required this.popularModel,
  }) : super(key: key);


 //picture1
  Widget nonTransparentWidget1() => FullScreenWidget(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipPath(
            clipper: MyClipper(),
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
                //première petite imagz
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
                                      
                    children: <Widget>[
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: nonTransparentWidget1(),
                      ),
                   
                    ],
                  ),
                ],
              ), 
              
          ),
            ],
          ),
                ),
              //deuxième petite image
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
                                      
                    children: <Widget>[
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: nonTransparentWidget2(),
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
                                      
                    children: <Widget>[
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: nonTransparentWidget3(),
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
                      '\€${popularModel.price} par nuit',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined),
                ),
              ],
            ),
          ),        
          const SizedBox(height: 10),
         /* const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Sélectionner une date de réservation',
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
            BoxShadow(color: AppColors.lightGrey, blurRadius: 20),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            SvgPicture.asset(
              '../assets/svg/gps.svg',
              height: 20,
              width: 20,
              color: Colors.black,
            ),
            const SizedBox(width: 25),
            /*SvgPicture.asset(
              'assets/svg/shop.svg',
              height: 20,
              width: 20,
              color: Colors.black,
            ),*/
            const SizedBox(width: 35),
            Expanded(
            //  child: AppButton.normalButton(title: 'Réserver maintenant', height: 40),
            child: ElevatedButton(
                      child: Text('Procéder à la réservation', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                      onPressed: () async {
                        List<String> reservationAnnonce = [popularModel.title, popularModel.pictureprincipale,popularModel.price.toString()];
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setStringList('reservationAnnonce', reservationAnnonce);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ReservationHotelCalendarScreen()));
                      },
                    )
            ),
          ],
        ),
      ),
    );
  }



  

  //insert to database 

 postDetailsToFirestore(String imageprincipale, String image1, String image2, String image3, String titre, String description, int prix) async
  {
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

    await firebaseFirestore.collection("whishlist").doc(user?.uid).set(whishlistModel.toMap());

    Fluttertoast.showToast(msg: "Element bien Ajouté aux favoris :)");



  }


}
