
import 'package:flutter/material.dart';


class gallerieNice extends StatefulWidget {
  const gallerieNice({Key? key}) : super(key: key);

  @override
  State<gallerieNice> createState() => _gallerieNiceState();
}

class _gallerieNiceState extends State<gallerieNice> {
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

                          image:  AssetImage('assets/pictures/villes/nice/1.png'),
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
                            'assets/pictures/villes/nice/2.png',
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
                            'assets/pictures/villes/nice/3.png',
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
                            'assets/pictures/villes/nice/4.png',
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
        
   