import 'package:projet_annuel/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/nice/activites_nice_screen.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/nice/hotels_nice_screen.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/nice/parkings_nice_screen.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/nice/restaurants_nice_screen.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/nice/sites_touristiques_nice_annonces_list.dart';

class NiceCategoryList extends StatefulWidget {
  const NiceCategoryList({Key? key}) : super(key: key);

  @override
  State<NiceCategoryList> createState() => _NiceCategoryListState();
}

class _NiceCategoryListState extends State<NiceCategoryList> {
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
                  context, MaterialPageRoute(builder: (context) => HotelsNiceScreen()),
                );
                  });
                }
                else  if (categoryList[i].name.contains("Parkings")){
                  setState(() {
                    currentSelected == i;
                  print("test------- parkings");
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ParkingsNiceScreen()),
                );
                  });
                }
                else if  (categoryList[i].name.contains("Sites touristiques") ){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SitestouristiquesNiceAnnoncesList()),
                );
                  });
                }

                  else if  (categoryList[i].name.contains("Restaurants") ){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RestaurantsNiceScreen()),
                );
                  });
                }
                 else if  (categoryList[i].name.contains("Activités") ){
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ActivitesNiceScreen()),
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
