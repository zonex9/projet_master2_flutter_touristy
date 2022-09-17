import 'package:projet_annuel/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/toulon/activites_toulon_screen.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/toulon/hotels_toulon_screen.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/toulon/parkings_toulon_screen.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/toulon/restaurants_toulon_screen.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/toulon/sitestouristiques_toulon_annonces_list.dart';

class ToulonCategoryList extends StatefulWidget {
  const ToulonCategoryList({Key? key}) : super(key: key);

  @override
  State<ToulonCategoryList> createState() => _ToulonCategoryListState();
}

class _ToulonCategoryListState extends State<ToulonCategoryList> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categoryList.length,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                if (categoryList[i].name.contains("Hotels") ){
                  setState(() {
                    currentSelected == i;
                                  print("test------- hotels");

                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HotelsToulonScreen()),
                );
                  });
                }
                else  if (categoryList[i].name.contains("Parkings")){
                  setState(() {
                    currentSelected == i;
                  print("test------- parkings");
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ParkingsToulonScreen()),
                );
                  });
                }
                else if  (categoryList[i].name.contains("Sites touristiques") ){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SitestouristiquesToulonAnnoncesList()),
                );
                  });
                }

                  else if  (categoryList[i].name.contains("Restaurants") ){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RestaurantsToulonScreen()),
                );
                  });
                }
                 else if  (categoryList[i].name.contains("Activités") ){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ActivitesToulonScreen()),
                );
                  });
                }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 120,      
                      decoration: BoxDecoration(
                       
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image:  AssetImage(
                            categoryList[i].background,
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                      alignment: Alignment.center,
                      child:  Text(categoryList[i].name,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                    const SizedBox(height: 5),
                  
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
