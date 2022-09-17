import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_annuel/models/category_model.dart';
import 'package:projet_annuel/models/popular_model.dart';
import 'package:projet_annuel/models/route_model.dart';

import 'package:projet_annuel/screens/nos_coups_de_coeur/components/toulon/others_activites_toulon_detail_screen.dart';
import 'package:projet_annuel/screens/nos_coups_de_coeur/components/toulon/others_hotels_toulon_detail_screen.dart';
import 'package:projet_annuel/screens/parkings_screen/parkings_screen.dart';


class PlusActivitesToulonList extends StatefulWidget {
  const PlusActivitesToulonList({Key? key}) : super(key: key);

  @override
  State<PlusActivitesToulonList> createState() => _PlusActivitesToulonListState();
}

class _PlusActivitesToulonListState extends State<PlusActivitesToulonList> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: activitesListToulon.length,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentSelected == i;
                
                 Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OthersActivitesToulonScreen( popularModel: activitesListToulon[i])));
               
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
                            activitesListToulon[i].pictureprincipale,
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                      alignment: Alignment.center,
                      child:  Text(  activitesListToulon[i].title,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
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
