import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet_annuel/dummy_data.dart';
import 'package:projet_annuel/models/whishlist_model.dart';
import 'package:projet_annuel/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../detail_screen/components/hotels_screen/hotels_detail_screen.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: SizedBox(
     child :Column(
     children: [
      Card (
        margin: EdgeInsets.all(10),
        color: Color.fromARGB(255, 242, 243, 242),
        shadowColor: Colors.blueGrey,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            ListTile(
              leading:CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage("assets/pictures/blog/calanque_de_sormiou.jpg"),
            ),
              title: Text(
                "Calanque de sormiou",
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('France'),
            ),
             ListTile(
               
                 title: Text(
                "La calanque de Sormiou est une calanque sur le littoral de la Méditerranée entre Marseille et Cassis. Elle fait partie du massif ...",
                style: TextStyle(fontSize: 15),
              ),
               ),
          ],
        ),
        
      ),
      Card (
        color: Color.fromARGB(255, 242, 243, 242),
        shadowColor: Colors.blueGrey,
        elevation: (10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            ListTile(
        
             leading:CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage("assets/pictures/blog/cassis.jpg"),
            ),
              title: Text(
                "Cassis",
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('France'),

            ),
               ListTile(
               
                 title: Text(
                "Cassis est un port de pêche méditerranien situé dans le sud de la France surplombée d'un château veux ...",
                style: TextStyle(fontSize: 15),
              ),
               ),
          ],
        ),
        
      ),
     ],
    )
      )
    );
   
  }
}      
    
