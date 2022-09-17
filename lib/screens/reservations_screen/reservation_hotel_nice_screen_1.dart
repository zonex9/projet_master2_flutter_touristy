
import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
//https://pub.dev/packages/country_list_pick/install
import 'package:cloud_firestore/cloud_firestore.dart';
import  "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet_annuel/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_annuel/screens/authentification_screen/authentification.dart';
import 'package:projet_annuel/screens/reservations_screen/reservation_hotel_nice_screen_2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class reservationHotelNiceScreen1 extends StatefulWidget {
  const reservationHotelNiceScreen1({ Key? key }) : super(key: key);

  @override
  _reservationHotelNiceScreen1State createState() => _reservationHotelNiceScreen1State();
}
class _reservationHotelNiceScreen1State extends State<reservationHotelNiceScreen1> {


  
late DropdownMenuItem default1 ;


  String? selectedValue;
  final _dropdownFormKey = GlobalKey<FormState>();
List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
  const DropdownMenuItem(value: "Chambre simple", child: Text("Chambre simple")),
    const DropdownMenuItem(value: "Chambre double", child: Text("Chambre double")),

  ];

  return menuItems;
}
 
 List<DropdownMenuItem<String>> get dropdownItems1{
  List<DropdownMenuItem<String>> testItems = [
        const DropdownMenuItem(value: "1 Adulte", child: Text("1 Adulte")),
    const DropdownMenuItem(value: "2 Adultes", child: Text("2 Adultes")),

  
  ];

  return testItems;
}
    List<String> _categories = <String>[];



  @override
  void initState() {
    super.initState();
    default1 = dropdownItems1[0];
    
    _getCategory().then((value) {
      _categories = value;
      setState(() {});
    });

  }

 // our form key
  final _formkey = GlobalKey<FormState>();
     final _auth = FirebaseAuth.instance;

  String pays = "";
 
  //editing Controller
   final secondNameEditingController = new TextEditingController();
    final emailEditingController = new TextEditingController();
    final universiteArriveeEditingController = new TextEditingController();
    final paysOrigineEditingController  = new TextEditingController();
     final passwordEditingController = new TextEditingController();
      final confirmPasswordEditingController = new TextEditingController();
 
List<String> items = ["Chambre simple", "Chambre double"];
    List<String> items1 = ["1 Adulte", "2 Adultes"];

  String selectedItem = "Chambre simple";
  String selectedItem1 = "1 Adulte";
@override
  Widget build(BuildContext context) {
  final firstNameEditingController = TextEditingController(text: _categories[0]);

     final firstNameField;
     final secondNameField;
     final universiteArriveeField;
     final paysOrigineField;
     final emailField;
     final passwordField;
     final confirmPasswordField;

    return Scaffold(
      
       extendBodyBehindAppBar: true,
         appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,
        
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,color: Color.fromARGB(255, 20, 197, 241)),
         onPressed: (){
           //passing to our root (login page)
           Navigator.of(context).pop();
           
         },

         ),
      title: Logo(), // 2

         ),
      body: Stack(
        children: <Widget>[
          Center(

            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30.0),
              child:Form(
                
                 key: _formkey, //retrieve valeur of the key
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[ 
                     const SizedBox(
                    height: 70.0,
                  ),
        
                    const Text(
                        'Réservation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                        ),
                      ),
                       
           // Text("Inscription", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 50.0,
                  ),



                  //*********************** */
       

        firstNameField =   TextFormField(
                     autofocus: false,
                  controller: firstNameEditingController,
                    keyboardType: TextInputType.name,
                       //validation input
                     validator: (value) {
                         RegExp regex  = new RegExp(r'^.{3,}$');
                          if(value!.isEmpty){
                           return('Merci de renseigner votre nom');
                               }
                            if(!regex.hasMatch(value)){
                          return("Enter Valid name(Min. 3 Characters)");
                         }
                       //if nothing
                       return null;
                   },
                     onSaved: (value){
                        firstNameEditingController.text = value!;
                      },
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black45,
                        hintText: 'Nom'
                                ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  //********** drop down ******** */
              

               Flex(direction: Axis.vertical, children:[
            
            DropdownButton<String>(
              isExpanded: true,
              value: selectedItem,
              onChanged: (_value) {  // update the selectedItem value
                setState(() {
                  selectedItem = _value!;
                });
              },
              items: items
                  .map<DropdownMenuItem<String>>((String _value) => DropdownMenuItem<String>(
                  value: _value, // add this property an pass the _value to it
                  child: Text(_value,)
              )).toList(),
            ),
                            const SizedBox(height: 5),

            DropdownButton<String>(
              isExpanded: true,
              value: selectedItem1,
              onChanged: (_value) {  // update the selectedItem value
                setState(() {
                  selectedItem1 = _value!;
                });
              },
              items: items1
                  .map<DropdownMenuItem<String>>((String _value) => DropdownMenuItem<String>(
                  value: _value, // add this property an pass the _value to it
                  child: Text(_value,)
              )).toList(),
            ),
          ]),
     

     
                  //************** end drop down ********* */
                   const SizedBox(
                    height: 20.0,
                  ),
                  
                  const SizedBox(
                    height: 10.0,
                  ),                
                  //**ici boutton inscription */
                  ElevatedButton(
                     onPressed: () async {
                      //0 title
                      //1 picture principale
                      //2 price
                      //SelectedItem    chhambre
                      //SelectedItem1 adulte
                      //5 ville
                       List<String> reservationAnnonce = [ _categories[0],_categories[1],_categories[2],selectedItem,selectedItem1,"Nice"];
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setStringList('reservationAnnonce', reservationAnnonce);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const reservationHotelNiceScreen2()));


                   signUp(emailEditingController.text, passwordEditingController.text);
                 //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())); //redirection vers homescreen lorsque on clique sur le bouton
                      },
                    child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('Aller au calendrier')),
                    style: ElevatedButton.styleFrom(  
                    primary: const Color.fromARGB(255, 71, 132, 173),
                    onPrimary: Colors.white,
                  )),
                                    //**end: boutton inscription */

                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          color: Colors.white,
                          height: 8.0,
                        ),
                      ),
                      const SizedBox(
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
                      const Expanded(
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


//***********shared preferences********** */

   _getCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? categoryList = prefs.getStringList('reservationAnnonce');
    return categoryList;
  }
  


//***********end shared preferences */
//registration form
  void signUp(String email, String password) async {
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
    userModel.firstName = _categories[0];
    userModel.secondName = secondNameEditingController.text;
    userModel.universiteArrivee = universiteArriveeEditingController.text;
    userModel.paysOrigine = paysOrigineEditingController.text;


    
    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created succefully :)");


    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => const AuthentificationScreen()), (route) => false);

  }
}