import 'package:flutter/material.dart';
import 'package:projet_annuel/dummy_data.dart';

class ContainerColumnRow extends StatelessWidget {
const ContainerColumnRow({Key, key}) : super(key: key);

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Difference between container, column and row',
home: CCRFirstPage(),
);
}
}

class CCRFirstPage extends StatelessWidget {
const CCRFirstPage({Key, key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Container, Column and Row first page'),
),
body: CCRFirstPageBody(),
);
}
}

class CCRFirstPageBody extends StatelessWidget {
const CCRFirstPageBody({Key, key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Container(
margin: EdgeInsets.all(8),
padding: EdgeInsets.all(15),
decoration: BoxDecoration(
   image: DecorationImage(

                          image:  AssetImage(
                            villesList[0].icon,
                          ),
                          fit: BoxFit.cover,
                        
                        ),
),
child: Column(
mainAxisAlignment: MainAxisAlignment.end,
children: [
Card(
child: Column(
mainAxisSize: MainAxisSize.min,
children: <Widget>[
const ListTile(
leading: Text('Bienvenue à la ville de Toulon'),
//title: Icon(Icons.stars),
),


],
),
),
],
),
);
}
}