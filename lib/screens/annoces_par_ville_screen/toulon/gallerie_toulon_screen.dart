
import 'package:flutter/material.dart';


class gallerieToulon extends StatefulWidget {
  const gallerieToulon({Key? key}) : super(key: key);

  @override
  State<gallerieToulon> createState() => _gallerieToulonState();
}

class _gallerieToulonState extends State<gallerieToulon> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 315,
        child: Column(
                children:<Widget>[
             Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
            
               child: Container(
                     height: 180,
                      width: 360, 
                    decoration: const BoxDecoration(
                     image: DecorationImage(

                          image:  AssetImage('assets/pictures/villes/toulon/1.jpg'),
                          fit: BoxFit.cover,
                     ), 
                    ),
                    

               ),
  
              )
             ),
                     const SizedBox(height: 5),

             Padding(
                    padding: const EdgeInsets.only(left: 10),

              child: Row( //column : les widgets spnt a en bas de l'autre, row : les widgets sont a coté
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: [
                   
                    Container(
                      height: 120,
                      width: 115,      
                      decoration: const BoxDecoration(
                       
                        image: DecorationImage(
                          image:  AssetImage(
                            'assets/pictures/villes/toulon/2.jpg',
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                      
                    ),
                         const SizedBox(width:5),
                     Container(
                      height: 120,
                      width: 115,      
                      decoration: const BoxDecoration(
                       
                       // borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image:  AssetImage(
                            'assets/pictures/villes/toulon/3.jpg',
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                      
                    ),
                        const SizedBox(width:5),

                      Container(
                      height: 120,
                      width: 119,      
                      decoration: const BoxDecoration(
                       
                       // borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image:  AssetImage(
                            'assets/pictures/villes/toulon/4.jpg',
                          ),
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                      
                    ),
                    const SizedBox(height: 5),
                  
                  ],
                ),
             ),
                ]
        )
      )
    );
  }
}    
        
   