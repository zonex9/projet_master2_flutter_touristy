import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/components/villes_list.dart';
import 'package:projet_annuel/screens/accueil_screen/composants/big_title_1.dart';
import 'package:projet_annuel/screens/accueil_screen/composants/big_title_2.dart';
import 'package:projet_annuel/screens/accueil_screen/composants/big_title_3.dart';
import 'package:projet_annuel/screens/accueil_screen/composants/big_title_whishlist.dart';
import 'package:projet_annuel/screens/accueil_screen/composants/blog.dart';
import 'package:projet_annuel/screens/accueil_screen/composants/nos_coups_de_coeur.dart';
import 'package:projet_annuel/screens/accueil_screen/composants/villes_principales_list.dart';
import 'package:projet_annuel/screens/authentification_screen/authentification.dart';
import 'package:projet_annuel/screens/gps_screen/gps_screen.dart';
import 'package:projet_annuel/screens/hotel_screen/composants/category_title.dart';
import 'package:projet_annuel/screens/hotel_screen/composants/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_annuel/screens/profil_screen/body.dart';
import 'package:projet_annuel/screens/reservations_screen/reservations_screen_ancien.dart';
import 'package:projet_annuel/screens/whishlist_screen/composants/popular_list.dart';
import 'package:projet_annuel/screens/whishlist_screen/whishlist_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../components/home_bottom_menu_icon.dart';


class AccueilScreen extends StatefulWidget {
  const AccueilScreen({Key? key}) : super(key: key);

  @override
  State<AccueilScreen> createState() => _AccueilScreenState();
}

class _AccueilScreenState extends State<AccueilScreen> {
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
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
         // FeedNews(),
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
     
          villesPrincipalesList(),
           SliverToBoxAdapter(
            child: SizedBox(height: 25),
          ),
               SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
               SliverToBoxAdapter(
            child: SizedBox(height: 5),
          ),
          BigTitleWhishlist(title: 'Ma Whishlist'),
          WhishPopularList(),
           SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
      //Blog(),     
        ],
      ),
      bottomNavigationBar: bottomMenu(),
    );
  }


 _getCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   // List<String>? categoryList = prefs.getStringList('Categories');
     String?  categoryList = prefs.getString('Categories');
    print(categoryList);
    return categoryList;
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
          svgPic: '../assets/svg/reservations.svg',
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
