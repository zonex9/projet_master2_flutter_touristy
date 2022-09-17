import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/toulon/hotels_toulon_screen.dart';
import 'package:projet_annuel/screens/parkings_screen/parkings_screen.dart';
import 'package:projet_annuel/screens/restaurants_screen/restaurants_screen.dart';
import 'package:projet_annuel/screens/sites_touristiques_screen/sites_touristiques_screen.dart';

class hotelsCategoryList extends StatefulWidget {
  const hotelsCategoryList({Key? key}) : super(key: key);

  @override
  State<hotelsCategoryList> createState() => _hotelsCategoryListState();
}

class _hotelsCategoryListState extends State<hotelsCategoryList> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 90,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categoryList.length,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                if (categoryList[i].name.contains("Hotels")){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HotelsToulonScreen()),
                );
                  });
                }
                else  if (categoryList[i].name.contains("Parkings")){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => parkingsToulonScreen()),
                );
                  });
                }
                else if  (categoryList[i].name.contains("Sites touristiques")){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SitesTouristiquesScreen()),
                );
                  });
                }

                  else if  (categoryList[i].name.contains("Restaurants")){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RestaurantsScreen()),
                );
                  });
                }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 70,      
                      decoration: BoxDecoration(
                        color: currentSelected == i
                            ? AppColors.darkGrey
                            : AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: const AssetImage(
                            'assets/pictures/clothes_shop.jpg',
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            currentSelected == i
                                ? Colors.black.withOpacity(.5)
                                : Colors.black.withOpacity(.85),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        categoryList[i].icon,
                        height: 24,
                        width: 24,
                        color: currentSelected == i
                            ? Colors.white
                            : AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categoryList[i].name,
                      style: TextStyle(
                        fontWeight: currentSelected == i
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
