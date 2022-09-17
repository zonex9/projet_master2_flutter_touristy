import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet_annuel/models/reservation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';


class reservationHotelNiceScreen2 extends StatefulWidget {
  const reservationHotelNiceScreen2({Key? key}) : super(key: key);


  @override
  State<reservationHotelNiceScreen2> createState() => _reservationHotelNiceScreen2State();
}


  
class _reservationHotelNiceScreen2State extends State<reservationHotelNiceScreen2> {


  //**shared preferendces */
  List<String> _reserationAnnonce = <String>[];


  //*** end shared preferences */
  final now = DateTime.now();
  late BookingService mockBookingService;

  @override
  void initState() {
    super.initState();

      _getReservationAnnonce().then((value) {
      _reserationAnnonce = value;
      setState(() {});
    });


      final _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;

    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
   converted.add(DateTimeRange(
            start: newBooking.bookingStart, end: newBooking.bookingEnd));
    //print('${newBooking.toJson()} has been uploaded');
    print('${newBooking.bookingStart} has been uploaded !' );
    postDetailsToFirestore(_reserationAnnonce[1], _reserationAnnonce[0], _reserationAnnonce[2], "hotels", '${newBooking.bookingStart}', '${newBooking.bookingEnd}',_reserationAnnonce[5],_reserationAnnonce[3],_reserationAnnonce[4]);
  }
    List<DateTimeRange> converted = [];

  
 //0 title
                      //1 picture principale
                      //2 price
                      //SelectedItem    chhambre
                      //SelectedItem1 adulte
                      //5 ville
          
                   



  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    DateTime first = now;
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(
        DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));
    return converted;
  }

  List<DateTimeRange> pauseSlots = [
    DateTimeRange(
        start: DateTime.now().add(const Duration(minutes: 5)),
        end: DateTime.now().add(const Duration(minutes: 60)))
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        title: 'Choisir une date de résevration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
           extendBodyBehindAppBar: true,
         appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,
        
      leading: IconButton(
        icon: Icon(Icons.arrow_back,color: Color.fromARGB(255, 20, 197, 241)),
         onPressed: (){
           //passing to our root (login page)
           Navigator.of(context).pop();
           
         },
      ),
         ),
         
          body: Center(
            child: BookingCalendar(
              bookingService: mockBookingService,
              convertStreamResultToDateTimeRanges: convertStreamResultMock,
              getBookingStream: getBookingStreamMock,
              uploadBooking: uploadBookingMock,
              pauseSlots: pauseSlots,
              pauseSlotText: 'LUNCH',
              hideBreakTime: false,
            ),
          ),
        ));
        
  }
  }
  
 
 


_getReservationAnnonce() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? categoryList = prefs.getStringList('reservationAnnonce');
    return categoryList;
  }


  

  postDetailsToFirestore(String imageprincipale,String titre, String  prix,String category,String datedebut,String datefin,String ville,String chambres,String passagers) async {

    var uuid = Uuid();
        // calling our firestore
    // calling our user model
    // sending those values
     final _auth = FirebaseAuth.instance;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    ReservationModel reservationModel = ReservationModel();// writing all the values

    reservationModel.uid = user?.uid;
    reservationModel.imageprincipale = imageprincipale;
    reservationModel.titre = titre;
    reservationModel.prix = prix;
    reservationModel.category = category;
    reservationModel.datedebut = datedebut;
    reservationModel.datefin = datefin;
    reservationModel.ville = ville;
    reservationModel.chambres = chambres;
    reservationModel.passagers = passagers;
     //genere un id aleatoire
    await firebaseFirestore.collection("réservations").doc(uuid.v4()).set(reservationModel.toMap());

    Fluttertoast.showToast(msg: "Réservation réussie");


  }
