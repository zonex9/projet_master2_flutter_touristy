import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/nice/hotels_nice_screen.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/toulon/hotels_toulon_screen.dart';

import 'package:projet_annuel/screens/parkings_screen/parkings_screen.dart';
import 'package:projet_annuel/screens/restaurants_screen/restaurants_screen.dart';
import 'package:projet_annuel/screens/sites_touristiques_screen/sites_touristiques_screen.dart';

class villesCategoryList extends StatefulWidget {
  const villesCategoryList({Key? key}) : super(key: key);

  @override
  State<villesCategoryList> createState() => _villesCategoryListState();
}

class _villesCategoryListState extends State<villesCategoryList> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 90,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: villesList.length,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                if (villesList[i].name.contains("nice")){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HotelsNiceScreen()),
                );
                  });
                }
                else  if (villesList[i].name.contains("toulon")){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HotelsToulonScreen()),
                );
                  });
                }
                else if  (villesList[i].name.contains("marseille")){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const SitesTouristiquesScreen()),
                );
                  });
                }

                  else if  (villesList[i].name.contains("cannes")){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const RestaurantsScreen()),
                );
                  });
                }
                },
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 120,      
                      decoration: BoxDecoration(
                       
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image:  AssetImage(
                            villesList[i].icon,
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                      alignment: Alignment.center,
                      child:  Text(villesList[i].name,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
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

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
   