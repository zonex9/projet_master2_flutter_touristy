import 'package:flutter/material.dart';
import '../profil_screen/profile_menu.dart';
import '../profil_screen/profile_pic.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MesInformationsPersonnellesScreen extends StatelessWidget {
    
    final String documentId;
    MesInformationsPersonnellesScreen(this.documentId);
    
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
  
       if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                        

        return Column(
          
        children: [

          SizedBox(height: 40),
          ProfilePic(),
          SizedBox(height: 40),
                      const Text(
                        'Mes informations personnelles',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
            SizedBox(height: 40),       
            ProfileMenu(
            text: "Nom :  ${data['firstName']} ",
            icon: "assets/svg/profile.svg",
          
          ),
         ProfileMenu(
            text: "Prénom :  ${data['secondName']} ",
            icon: "assets/svg/profile.svg",
           
          ),
         
         
           ProfileMenu(
            text: "Email :   ${data['email']}",
            icon: "../assets/svg/email.svg",
          
          ),
        ]
        );
        }
     return Text("loading");

            },
        
      );
    
  }
}