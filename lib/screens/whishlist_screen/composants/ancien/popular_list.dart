import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet_annuel/dummy_data.dart';
import 'package:projet_annuel/models/whishlist_model.dart';
import 'package:projet_annuel/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


class WhishPopularList extends StatefulWidget {
  const WhishPopularList({Key? key}) : super(key: key);
  @override
  State<WhishPopularList> createState() => _WhishPopularListState();
}

     User? user = FirebaseAuth.instance.currentUser;


class _WhishPopularListState extends State<WhishPopularList> {
    var test =0 ;

  @override
  Widget build(BuildContext context) {

  return SliverPadding(
    
          padding: const EdgeInsets.symmetric(horizontal: 10),
    
   sliver: Container(

      child: StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
    stream: FirebaseFirestore.instance.collection('whishlist').where('uid',  isEqualTo: user?.uid).snapshots(),
      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          var items = snapshot.data?.docs ?? [];
    
     return SliverGrid(
       
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          childAspectRatio: .7,
        ),
        delegate: SliverChildBuilderDelegate(
      
          (ctx, i) {
            return GestureDetector(
            /* onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => HotelsDetailScreen(
                        popularModel: hotelsList[i],
                      )),
                ),
              ),*/
              child: Card(
                elevation: .7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipPath(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage(items[i].get('imageprincipale')),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(items[i].get('titre')),
                              Text(
                                '\€${items[i].get('prix')}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          //save to whishlist
                    
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
                        },
          
       //   childCount:   snapshot.data?.docs.length,
       childCount: items.length,
                   

        ),
      );
        }
            
      
  
      )
      
   )
     );
  }

}
  


 






