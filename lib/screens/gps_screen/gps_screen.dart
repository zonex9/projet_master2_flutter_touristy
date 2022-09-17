import 'package:flutter/material.dart';
import 'package:projet_annuel/screens/gps_screen/composants/clustering_many_markers_page.dart';
import 'package:projet_annuel/screens/gps_screen/composants/clustering_page.dart';


class GpsScreen extends StatelessWidget {
  const GpsScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clustering Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClusteringPage(),
      routes: <String, WidgetBuilder>{
        ClusteringPage.route: (context) => const ClusteringPage(),
        ClusteringManyMarkersPage.route: (context) =>
            const ClusteringManyMarkersPage(),
      },
    );
  }
}