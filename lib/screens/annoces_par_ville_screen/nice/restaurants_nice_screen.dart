import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/components/villes_list.dart';
import 'package:projet_annuel/screens/accueil_screen/accueil_screen.dart';
import 'package:projet_annuel/screens/accueil_screen/composants/big_title_nice.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/nice/gallerie_nice_screen.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/nice/nice_category_list.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/nice/restaurants_nice_annonce_list.dart';
import 'package:projet_annuel/screens/authentification_screen/authentification.dart';
import 'package:projet_annuel/screens/hotel_screen/composants/category_title.dart';

import 'package:projet_annuel/screens/hotel_screen/composants/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_annuel/screens/profil_screen/body.dart';
import 'package:projet_annuel/screens/reservations_screen/reservations_screen.dart';
import 'package:projet_annuel/screens/whishlist_screen/whishlist_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/home_bottom_menu_icon.dart';


class RestaurantsNiceScreen extends StatefulWidget {
  const RestaurantsNiceScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantsNiceScreen> createState() => _RestaurantsNiceScreenState();
}

class _RestaurantsNiceScreenState extends State<RestaurantsNiceScreen> {
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
          SearchBar(),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
         // FeedNews(),
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          villesCategoryList(), 
          BigTitleNice(title: 'Bienvenue à Nice !'),
           SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
           gallerieNice(),//photo lkbira
           SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          CategoryTitle(title: 'Catégories', trailingTitle: 'Voir tout'),
          NiceCategoryList(),
          CategoryTitle(title: 'Dernières annonces ', trailingTitle: 'Voir tout'),
          restaurantsNiceAnnoncesList(),

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
