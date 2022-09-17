import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/screens/accueil_screen/accueil_screen.dart';
import 'package:projet_annuel/screens/hotel_screen/composants/category_title.dart';
import 'package:projet_annuel/screens/hotel_screen/composants/feed_news.dart';
import 'package:projet_annuel/screens/hotel_screen/composants/popular_list.dart';
import 'package:projet_annuel/screens/hotel_screen/composants/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_annuel/screens/profil_screen/body.dart';
import 'package:projet_annuel/screens/reservations_screen/composants/popular_list.dart';
import 'package:projet_annuel/screens/whishlist_screen/whishlist_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/home_bottom_menu_icon.dart';


class ReservationAncienScreen extends StatefulWidget {
  const ReservationAncienScreen({Key? key}) : super(key: key);

  @override
  State<ReservationAncienScreen> createState() => _ReservationAncienScreenState();
}

class _ReservationAncienScreenState extends State<ReservationAncienScreen> {
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
          SearchBar(),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
         // FeedNews(),
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
      
          CategoryTitle(title: 'Mes réservations', trailingTitle: 'Voir tout'),
          ReservationsPopularList(),
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
      title: const Text(
        'TOURISTY',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/message.svg',
              height: 20,
              width: 20,
              color: Colors.black,
            ),
            const Positioned(
              bottom: 32,
              right: -3,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/notification.svg',
              height: 20,
              width: 20,
              color: Colors.black,
            ),
            const Positioned(
              bottom: 32,
              right: -5,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
      ],
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
          svgPic: '../assets/svg/gps.svg',
          title: '',
        ),
        homeBottomMenuIcon(
          currentIndex: bottomNavBarSelectedIndex,
          itemIndex: 2,
          svgPic: '../assets/svg/whishlist.svg',
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
