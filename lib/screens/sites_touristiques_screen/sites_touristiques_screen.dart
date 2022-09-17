import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/screens/hotel_screen/composants/category_title.dart';
import 'package:projet_annuel/screens/hotel_screen/composants/feed_news.dart';
import 'package:projet_annuel/screens/hotel_screen/composants/popular_list.dart';
import 'package:projet_annuel/screens/hotel_screen/composants/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/home_bottom_menu_icon.dart';
import 'composants/popular_list.dart';


class SitesTouristiquesScreen extends StatefulWidget {
  const SitesTouristiquesScreen({Key? key}) : super(key: key);

  @override
  State<SitesTouristiquesScreen> createState() => _SitesTouristiquesScreenState();
}

class _SitesTouristiquesScreenState extends State<SitesTouristiquesScreen> {
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
          CategoryTitle(title: 'Catégories', trailingTitle: 'Voir tout'),
          //SitesTouristiquesCategoryList(),
          CategoryTitle(title: 'Dernières annonces', trailingTitle: 'Voir tout'),
         // SitesTouristiquesToulonPopularList(),
        ],
      ),
      bottomNavigationBar: bottomMenu(),
    );
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
              'assets/svg/shop.svg',
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
          svgPic: 'assets/svg/category.svg',
          title: '',
        ),
        homeBottomMenuIcon(
          currentIndex: bottomNavBarSelectedIndex,
          itemIndex: 2,
          svgPic: 'assets/svg/notification.svg',
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
