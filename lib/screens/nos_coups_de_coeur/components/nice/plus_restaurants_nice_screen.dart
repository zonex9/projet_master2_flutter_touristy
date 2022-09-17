import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_annuel/models/category_model.dart';
import 'package:projet_annuel/models/popular_model.dart';
import 'package:projet_annuel/models/route_model.dart';

import 'package:projet_annuel/screens/nos_coups_de_coeur/components/nice/others_activite_nice_detail_screen.dart';
import 'package:projet_annuel/screens/nos_coups_de_coeur/components/nice/others_restaurants_nice_detail_screen.dart';
import 'package:projet_annuel/screens/parkings_screen/parkings_screen.dart';


class PlusRestaurantsNiceList extends StatefulWidget {
  const PlusRestaurantsNiceList({Key? key}) : super(key: key);

  @override
  State<PlusRestaurantsNiceList> createState() => _PlusRestaurantsNiceListState();
}

class _PlusRestaurantsNiceListState extends State<PlusRestaurantsNiceList> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: restaurantsListNice.length,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OthersRestaurantsNiceScreen( popularModel: restaurantsListNice[i])));
               
                  });
             
                
           

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
                            restaurantsListNice[i].pictureprincipale,
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                      alignment: Alignment.center,
                      child:  Text(  restaurantsListNice[i].title,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                    const SizedBox(height: 5),
                  
                  ],
                ),
              ),
            );
          },
        ),
      );
   
  }
}
