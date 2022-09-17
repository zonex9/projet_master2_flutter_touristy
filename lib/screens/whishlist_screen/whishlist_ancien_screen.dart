import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WhishListAncienScreen extends StatefulWidget {
  const WhishListAncienScreen({Key? key}) : super(key: key);

  @override
  State<WhishListAncienScreen> createState() => _WhishListAncienScreenState();
}

class _WhishListAncienScreenState extends State<WhishListAncienScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  late final Stream<QuerySnapshot> _mainStream = FirebaseFirestore.instance
     /* .collection('users')
      .doc(user!.uid)
      */
      .collection('whishlist')
      .where('uid',  isEqualTo: user?.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: _mainStream,
      builder: (context, mainSnapshot) {
        if (mainSnapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        if (mainSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
            var pendenciesList = mainSnapshot.data!.docs;
           
           print(pendenciesList.length);
            for (int i=0; i<pendenciesList.length; i++){
           //Map<String, dynamic> data = mainSnapshot.data!.docs as Map<String, dynamic>;
            print("whishlist : ----------->");
            print(pendenciesList[i].get('titre'));
            }
           // print(pendenciesList[2].get('titre'));
            /*print(mainSnapshot.data!.docs.first['titre'].toString());
            print(mainSnapshot.data!.docs.first['description'].toString());
            print(mainSnapshot.data!.docs.first['image1'].toString());
            print(mainSnapshot.data!.docs.first['image2'].toString());
            print(mainSnapshot.data!.docs.first['image3'].toString());
            print(mainSnapshot.data!.docs.first['imageprincipale'].toString());
            print(mainSnapshot.data!.docs.first['prix'].toString());
            print(mainSnapshot.data!.docs.first['uid'].toString());
            */

            return SafeArea(
              child: SizedBox(
                width: mediaQuery.width,
                height: mediaQuery.height,
                child: const Center(
                  child: Text('Test')
                ),
              ),
            );
          },
        );
      
  }
}