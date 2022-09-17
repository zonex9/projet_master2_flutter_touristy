
import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
//https://pub.dev/packages/country_list_pick/install
import 'package:cloud_firestore/cloud_firestore.dart';
import  "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet_annuel/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_annuel/screens/authentification_screen/authentification.dart';
import 'package:uuid/uuid.dart';

class MotDePasseOublieScreen extends StatefulWidget {
  const MotDePasseOublieScreen({ Key? key }) : super(key: key);

  @override
  _MotDePasseOublieScreenState createState() => _MotDePasseOublieScreenState();
}
class _MotDePasseOublieScreenState extends State<MotDePasseOublieScreen> {
 // our form key
  final _formkey = GlobalKey<FormState>();
     final _auth = FirebaseAuth.instance;

  String pays = "";

  //editing Controller
  final firstNameEditingController = new TextEditingController();
   final secondNameEditingController = new TextEditingController();
    final emailEditingController = new TextEditingController();
    final universiteArriveeEditingController = new TextEditingController();
    final paysOrigineEditingController  = new TextEditingController();
     final passwordEditingController = new TextEditingController();
      final confirmPasswordEditingController = new TextEditingController();
 
void _onCountryChange(CountryCode paysOriginCode) {  
    this.pays =  paysOriginCode.toString();
    print("New Country selected: " + pays.toString());
  }

void check(){
    print("Full Text: "+ this.pays + paysOrigineEditingController.text);

  }

@override
  Widget build(BuildContext context) {

  
     final emailField;
     final passwordField;
     final confirmPasswordField;

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
                    Text(
                        'Retrouver le mot de passe',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
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
                    controller: emailEditingController,
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
                       emailEditingController.text = value!;
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
                  controller: passwordEditingController,
                   obscureText: true, //cacher texte
                //validator for password field
               validator: (value) {
                  RegExp regex = new RegExp(r'^.{6,}$');
                   if(value!.isEmpty)
                    {
                         return('Password is required for login');
                    }
                 if(!regex.hasMatch(value)){
                      return("Enter Valid Password(Min. 6 Character)");
                   }
               },
                     onSaved: (value){
                           passwordEditingController.text = value!;
                    },
                  textInputAction: TextInputAction.next, //
                    decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.black45,
                        hintText: 'Nouveau mot de passe'),
                  ),
                   SizedBox(
                    height: 10.0,
                  ),
                  
                  SizedBox(
                    height: 10.0,
                  ),                
                  //**ici boutton changer mot de passe */
                  ElevatedButton(
                     onPressed: () {
                   ChangerMotDePasse(emailEditingController.text, passwordEditingController.text);
                 //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())); //redirection vers homescreen lorsque on clique sur le bouton
                      },
                    child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('Changer le mot de passe')),
                    style: ElevatedButton.styleFrom(  
                    primary: Color.fromARGB(255, 71, 132, 173),
                    onPrimary: Colors.white,
                  )),
                                    //**end: boutton inscription */

                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: <Widget>[
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
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
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



//registration form
  void ChangerMotDePasse(String email, String password) async {
    if(_formkey.currentState!.validate()){
    await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            postDetailsToFirestore()
          }).catchError((e)
          {
            Fluttertoast.showToast(msg: e!.message);
          });
    }
  }

  postDetailsToFirestore() async
  {
  

    // calling our firestore
    // calling our user model
    // sending those values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
   

      
    
    await firebaseFirestore.collection("users").doc(user.uid).update(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created succefully :)");


    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => const AuthentificationScreen()), (route) => false);

  }
}