import 'package:projet_annuel/app/app_consts.dart';
import 'package:projet_annuel/components/app_buttons.dart';
import 'package:projet_annuel/components/app_buttons_connexion.dart';
import 'package:projet_annuel/dummy_data.dart';
import 'package:projet_annuel/screens/Inscription_screen/inscription.dart';
import 'package:projet_annuel/screens/authentification_screen/authentification.dart';
import 'package:flutter/material.dart';
import '../whishlist_screen/whishlist_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentPage = 0;

  List<Widget> picturesList = [
   
    Image.asset(
      'assets/pictures/background.png',
      key: UniqueKey(),
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: ClipPath(
               // clipper:  MyClipper(),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    
                  
                    Positioned(
                      top: 0,
                      bottom: 0,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: picturesList[currentPage],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: PageView.builder(
                onPageChanged: (i) {
                  setState(() => currentPage = i);
                },
                itemCount: 3,
                itemBuilder: (ctx, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                           Row(
                mainAxisAlignment: MainAxisAlignment.center, // centers horizontally
                crossAxisAlignment: CrossAxisAlignment.center, // centers vertically
                children: <Widget>[
                  Image.asset("assets/pictures/logo.png", width: 140),
                
      ],
    )
                   
                 
                    ],
                  );
                },
              ),
            ),
         
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppButton.normalButton(
                title: 'Se connecter',
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) =>  AuthentificationScreen()),
                  ));
                },
              ),
            ),
            const SizedBox(height: 10),
             Padding(
               
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppButtonConnexion.normalButton(
                title: 'Inscription',
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) =>  InscriptionScreen()),
                  ));
                },
                 
              ),
            ),
            const SizedBox(height: 10),

          ],
        ),
    
    );
  }
}
