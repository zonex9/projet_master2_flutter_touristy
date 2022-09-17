import 'package:flutter/material.dart';
import 'package:projet_annuel/screens/annoces_par_ville_screen/toulon/hotels_toulon_screen.dart';

import 'package:projet_annuel/screens/parkings_screen/parkings_screen.dart';

class routeModel{

 static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case hotelcategory:
        return MaterialPageRoute(builder: (_) => HotelsToulonScreen());
      case parkingcategory:
        return MaterialPageRoute(builder: (_) => parkingsToulonScreen());
            default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

//Dynamic Routes for generating navigation
const String hotelcategory = '';
const String parkingcategory = '';
