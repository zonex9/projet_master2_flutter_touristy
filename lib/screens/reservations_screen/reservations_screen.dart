
import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/screens/accueil_screen/accueil_screen.dart';
import 'package:projet_annuel/screens/accueil_screen/composants/big_title_reservations.dart';
import 'package:projet_annuel/screens/accueil_screen/composants/big_title_whishlist.dart';
import 'package:projet_annuel/screens/authentification_screen/authentification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_annuel/screens/profil_screen/body.dart';
import 'package:projet_annuel/screens/reservations_screen/composants/popular_list.dart';
import 'package:projet_annuel/screens/whishlist_screen/whishlist_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../components/home_bottom_menu_icon.dart';


class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
   // ignore: deprecated_member_use
 String? _categories;

  @override
  void initState() {
    super.initState();

    _getReservationAnnonce().then((value) {
      _categories = value;
      setState(() {});
    });
  }

  int bottomNavBarSelectedIndex = 0;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
            SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
         BigTitleReservations(title: 'Mes réservations'),
         ReservationsPopularList()
      //Blog(),     
        ],
      ),
      bottomNavigationBar: bottomMenu(),
    );
  }

 
 _getReservationAnnonce() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   // List<String>? categoryList = prefs.getStringList('Categories');
     String?  reservationAnnonce = prefs.getString('reservationAnnonce');
    print(reservationAnnonce);
    return reservationAnnonce;
  }



  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset('assets/svg/drawer_menu.svg'),
      ),
      title: Logo(),
      
    );
  }

  BottomNavigationBar bottomMenu() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      currentIndex: bottomNavBarSelectedIndex,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.darkGrey,
      onTap: (index) {
        setState(() {
          bottomNavBarSelectedIndex = index;
          if (index == 3){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Body()));
          }
          else if  (index == 2){
              print("envoi de données --->");
              print(_categories.toString());
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WhishlistScreen()));
          }

            else if  (index == 0){
              print("envoi de données --->");
              print(_categories.toString());
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AccueilScreen()));
          }

            else if  (index == 1){
              print("envoi de données --->");
              print(_categories.toString());
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ReservationsScreen()));
          }
      

      
        });
      },
      items: [
        homeBottomMenuIcon(
          currentIndex: bottomNavBarSelectedIndex,
          itemIndex: 0,
          svgPic: 'assets/svg/home.svg',
          title: '',
        ),
        homeBottomMenuIcon(
          itemIndex: bottomNavBarSelectedIndex,
          currentIndex: 1,
          svgPic: 'assets/svg/reservation.svg',
          title: '',
        ),
        homeBottomMenuIcon(
          currentIndex: bottomNavBarSelectedIndex,
          itemIndex: 2,
          svgPic: 'assets/svg/whishlist.svg',
          title: '',
        ),
        homeBottomMenuIcon(
          currentIndex: bottomNavBarSelectedIndex,
          itemIndex: 3,
          svgPic: 'assets/svg/profile.svg',
          title: '',
        ),
      ],
    );
  
  
  }
}
