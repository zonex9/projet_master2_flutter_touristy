import 'package:projet_annuel/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:projet_annuel/screens/nos_coups_de_coeur/components/nice/default_activite_nice_detail_screen.dart';
import 'package:projet_annuel/screens/nos_coups_de_coeur/components/toulon/default_hotel_toulon_detail_screen.dart';
import 'package:projet_annuel/screens/nos_coups_de_coeur/components/toulon/default_restaurant_toulon_detail_screen.dart';
import 'package:projet_annuel/screens/parkings_screen/parkings_screen.dart';
import 'package:projet_annuel/screens/restaurants_screen/restaurants_screen.dart';
import 'package:projet_annuel/screens/sites_touristiques_screen/sites_touristiques_screen.dart';

class nosCoupsDeCoeurList extends StatefulWidget {
  const nosCoupsDeCoeurList({Key? key}) : super(key: key);

  @override
  State<nosCoupsDeCoeurList> createState() => _nosCoupsDeCoeurListState();
}

class _nosCoupsDeCoeurListState extends State<nosCoupsDeCoeurList> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                if (CoupsDeCoeurList[i].name.contains("Hotels")){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DefaultHotelToulonCoupsDeCoeurScreen(popularModel: hotelsListToulon[0])),
                );
                  });
                }
             
            

                  else if  (CoupsDeCoeurList[i].name.contains("Restaurants")){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DefaultRestaurantToulonCoupsDeCoeurScreen(popularModel: restaurantsListToulon[0])),
                );
                  });
                }

                  else if  (CoupsDeCoeurList[i].name.contains("Activités")){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DefaultActiviteNiceCoupsDeCoeurScreen(popularModel: activitesListNice[0])),
                );
                  });
                }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 115,
                      width: 115,      
                      decoration: BoxDecoration(
                       
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image:  AssetImage(
                            villesPageAccueilList[i].pictureprincipale,
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                      alignment: Alignment.center,
                      child:  Text(villesPageAccueilList[i].title,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
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
