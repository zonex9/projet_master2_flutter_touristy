

import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
//https://pub.dev/packages/country_list_pick/install
import 'package:cloud_firestore/cloud_firestore.dart';
import  "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet_annuel/components/app_buttons.dart';
import 'package:projet_annuel/components/app_buttons_connexion.dart';
import 'package:projet_annuel/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_annuel/screens/Mot_de_passe_oublie_screen/Mot_de_passe_oublie_screen.dart';
import 'package:projet_annuel/screens/accueil_screen/accueil_screen.dart';

import 'package:projet_annuel/screens/welcome_screen/composants/welcome_image.dart';
import 'package:projet_annuel/screens/welcome_screen/welcome_screen.dart';
import 'package:projet_annuel/screens/whishlist_screen/whishlist_ancien_screen.dart';
import 'package:projet_annuel/screens/whishlist_screen/whishlist_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../whishlist_screen/composants/popular_list.dart'; //to save data locally

class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({ Key? key }) : super(key: key);

  @override
  _AuthentificationScreenState createState() => _AuthentificationScreenState();
}


class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // centers horizontally
      crossAxisAlignment: CrossAxisAlignment.center, // centers vertically
      children: <Widget>[
        Image.asset("assets/pictures/logo.png", width: 140),
        SizedBox(
          width: 3,
        ), // The size box provides an immediate spacing between the widgets
       
      ],
    );
  }
}
class _AuthentificationScreenState extends State<AuthentificationScreen> {
int currentPage = 0;
  // form key
  final _formkey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   // firebase
  final _auth = FirebaseAuth.instance;

final FirebaseAuth auth = FirebaseAuth.instance;

/*
String? inputData() {
  final User? user = auth.currentUser;
  final uid = user?.uid;
return uid;  // here you write the codes to input the data into firestore
}
*/
/*void inputData(){
  final User? user = auth.currentUser;
  final uid = user?.uid;
}*/
String intputData(){
  final User? user = auth.currentUser;
  final uid = user?.uid;
  return uid.toString();
}

@override
  Widget build(BuildContext context) {

     final emailField;
     final passwordField;


    return Scaffold(
       extendBodyBehindAppBar: true,
       appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,
        
      leading: IconButton(
        icon: Icon(Icons.arrow_back,color: Color.fromARGB(255, 20, 197, 241)),
         onPressed: (){
           //passing to our root (login page)
           Navigator.of(context).pop();
           
         },

         ),
      title: Logo(), // 2

         ),
      body: Stack(
        children: <Widget>[
          Container(
              constraints: const BoxConstraints.expand(),
              
            decoration: const BoxDecoration(
                image:  DecorationImage(
               image: AssetImage("assets/pictures/background.png"), fit: BoxFit.cover))),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(30.0),
              child:Form(
                 key: _formkey, //retrieve valeur of the key
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[         
                     const Text(
                        'Se connecter',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                        ),
                      ),
           // Text("Inscription", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20.0,
                  ),

       
          
                     SizedBox(
                    height: 10.0,
                  ),
                emailField =  TextFormField(
                    style: TextStyle(color: Colors.white),

                     autofocus: false,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  //validator for email field
                  validator: (value) {
                   if(value!.isEmpty){
                        return("Please Enter Your Email");
                     }
                //reg expression for meail validation
                  if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return("Please Enter a valid email");
                   }
                    return null;
                },
                   onSaved: (value){
                       emailController.text = value!;
                      },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black45,
                        hintText: 'Adresse mail'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                passwordField=  TextFormField(
                                      style: TextStyle(color: Colors.white),
                    autofocus: false,
                  controller: passwordController,
                   obscureText: true, //cacher texte
                //validator for password field
              //validator for password field
                validator: (value) {
                     RegExp regex = RegExp(r'^.{6,}$');
                      if(value!.isEmpty)
                   {
                     return('Password is required for login');
                        }
                          if(!regex.hasMatch(value)){
                       return("Plase enter Valid Password(Min. 6 Character");
                     }
                      },
                     onSaved: (value)
                    {
                         passwordController.text = value!;
                    },
                  textInputAction: TextInputAction.next, //
                    decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.black45,
                        hintText: 'Mot de passe'),
                  ),
                   SizedBox(
                    height: 10.0,
                  ),              
                  //**ici boutton inscription */
                   AppButtonConnexion.normalButton(
                title: 'Se connecter',
                onPress: () {
                       signIn(emailController.text, passwordController.text);
                },
              ),
                 
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: const <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          height: 8.0,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                     /* Text(
                        'OR',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      */
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          height: 8.0,
                        ),
                      ),
                       SizedBox(
                    height: 12.0,
                  ),
                            //**end: boutton inscription */

                    ],
                  ),
                  Column(

                    children:  <Widget>[
                      InkWell(
                      onTap:  () {    Navigator.push(context, MaterialPageRoute(builder: (context) => const MotDePasseOublieScreen())); 
                      },//redirection vers homescreen lorsque on clique sur le bouton  },
                     child: const Padding(
                   padding: EdgeInsets.all(10.0),
                     child:  Text(
                        'Mot de passe oublié ?',
                        textAlign: TextAlign.center,
                        
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        
                      ),
                    ),
                ),
                         
                      
                  
                      // TODO Social Icons
                    ],
                  ),
                ],
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }


   //login function
  void signIn(String email, String password) async
  {

    if(_formkey.currentState!.validate()){
                 SharedPreferences prefs = await SharedPreferences.getInstance();

      await _auth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((uid) async => {
        
        /***shared preferences */
        print("uid :"),
         print(intputData()),
         
        prefs.setString('Categories', intputData()),
                   
        /**** end shared preferences */
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AccueilScreen())),

      }).catchError((e)
      {
          Fluttertoast.showToast(msg: e!.message);
      });
      
   
  }
  }

}