import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/nice/hotels_nice_screen.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/toulon/hotels_toulon_screen.dart';

import 'package:projet_annuel/screens/parkings_screen/parkings_screen.dart';
import 'package:projet_annuel/screens/restaurants_screen/restaurants_screen.dart';
import 'package:projet_annuel/screens/sites_touristiques_screen/sites_touristiques_screen.dart';

class villesPrincipalesList extends StatefulWidget {
  const villesPrincipalesList({Key? key}) : super(key: key);

  @override
  State<villesPrincipalesList> createState() => _villesPrincipalesListState();
}

class _villesPrincipalesListState extends State<villesPrincipalesList> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
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
                print("ok nice----------->");
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HotelsNiceScreen()),
                );
                  });
                }
                else  if (villesList[i].name.contains("toulon")){
                  setState(() {
                    currentSelected == i;
                                print("ok toulon----------->");

                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HotelsToulonScreen()),
                );
                  });
                }
                else if  (villesList[i].name.contains("marseille")){
                  setState(() {
                    currentSelected == i;
                
                
                  });
                }

                  else if  (villesList[i].name.contains("cannes")){
                  setState(() {
                    currentSelected == i;
               
                  });
                }
                },
               child: Container(
                     height: 180,
                      width: 360, 
             
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                     image: DecorationImage(

                          image:  AssetImage(
                            villesList[i].icon,
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                          child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                          
                 Column(
                    mainAxisSize: MainAxisSize.min,
                    children:  <Widget>[
                        ListTile(
                  leading: Text("Bienvenue à la ville de ${villesList[i].name}",style:const TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
//title: Icon(Icons.stars),
                  ),
                     SvgPicture.asset(
                       '../assets/svg/fivestars.svg',
                       height: 25.0,
                     )
],
),

],
),
),
              ),
            );
          },
        ),
      ),
    );
  }
}

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
   