import 'package:flutter/material.dart';
import 'package:projet_annuel/screens/authentification_screen/authentification.dart';
import 'package:projet_annuel/screens/mes_informations_personnelles_screen/informations_personnelles.dart';
import 'package:projet_annuel/screens/reservations_screen/reservations_screen.dart';
import 'package:projet_annuel/screens/reservations_screen/reservations_screen_ancien.dart';
import 'package:projet_annuel/screens/whishlist_screen/whishlist_screen.dart';

import '../mes_informations_personnelles_screen/informations_personnelles_test.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}


class _BodyState extends State<Body> {

 // ignore: deprecated_member_use
  String? _categories;

  @override
  void initState() {
    super.initState();

    _getCategory().then((value) {
      _categories = value;
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
  
           extendBodyBehindAppBar: true,
       appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back,color: Color.fromARGB(255, 3, 200, 214)),
         onPressed: (){
           //passing to our root (login page)
           Navigator.of(context).pop();
         },
         ),
         ),
   
     body:Column(
        children: [
          
          SizedBox(height: 40),
          ProfilePic(),
          SizedBox(height: 40),

                      Text(
                        'Mon profil ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
           SizedBox(height: 40),

          ProfileMenu(
            text: "Mes informations personnelles",
            icon: "assets/svg/profile.svg",
            press: () => {
              print("categories"),
              print(_categories),
              Navigator.push(context, MaterialPageRoute(builder: (context) => MesInformationsPersonnellesScreen(_categories.toString())))
            },
          ),
         ProfileMenu(
            text: "Mes réservations",
            icon: "assets/svg/profile.svg",
            press: () => {
              print("categories"),
              print(_categories),
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ReservationsScreen()))
            },
          ),
        
          ProfileMenu(
            text: "Se deconnecter",
            icon: "../assets/svg/logout.svg",
            press: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthentificationScreen()));
            },
          ),
         
        ],
      ),
    );
  }

 _getCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   // List<String>? categoryList = prefs.getStringList('Categories');
     String?  categoryList = prefs.getString('Categories');
    print(categoryList);
    return categoryList;
  }
}