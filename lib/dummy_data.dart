import 'package:projet_annuel/models/category_model.dart';
import 'package:projet_annuel/models/popular_model.dart';
import 'package:projet_annuel/screens/parkings_screen/parkings_screen.dart';
import 'package:projet_annuel/models/route_model.dart' as route;

List<CategoryModel> logoPrincipale = [
  CategoryModel(icon: '',background: 'assets/pictures/logo.png', name: 'logo'),
   

];


List<CategoryModel> villesList = [
  CategoryModel(icon: 'assets/pictures/villes/nice.jpg',background: '', name: 'nice'),
    CategoryModel(icon: 'assets/pictures/villes/toulon.jpg', background: '', name: 'toulon'),
  CategoryModel(icon: 'assets/pictures/villes/marseille.jpg', background: '',name: 'marseille'),
  CategoryModel(icon: 'assets/pictures/villes/cannes.jpg', background: '',name: 'cannes'),

];

List<CategoryModel> toulonPicturesList = [
  CategoryModel(icon: '',background: 'assets/pictures/villes/toulon/1.jpg', name: 'toulon.picture1'),
    CategoryModel(icon: '', background: 'assets/pictures/villes/toulon/2.jpg', name: 'toulon.picture2'),
  CategoryModel(icon: '', background: 'assets/pictures/villes/toulon/3.jpg',name: 'toulon.picture3'),
  CategoryModel(icon: '', background: 'assets/pictures/villes/toulon/4.jpg',name: 'toulon.picture4'),

];

List<CategoryModel> nicePicturesList = [
  CategoryModel(icon: '',background: 'assets/pictures/villes/nice/1.jpg', name: 'nice.picture1'),
    CategoryModel(icon: '', background: 'assets/pictures/villes/nice/2.jpg', name: 'nice.picture2'),
  CategoryModel(icon: '', background: 'assets/pictures/villes/nice/3.jpg',name: 'nice.picture3'),
  CategoryModel(icon: '', background: 'assets/pictures/villes/nice/4.jpg',name: 'nice.picture4'),

];


List<CategoryModel> CoupsDeCoeurList = [
      CategoryModel(icon: 'assets/svg/verified.svg',  background:'assets/pictures/categories/activites.jpg',name: 'Activités'),
      CategoryModel(icon: 'assets/svg/restaurant.svg', background:'assets/pictures/categories/restaurants.jpg', name: 'Restaurants'),
      CategoryModel(icon: 'assets/svg/hotel.svg', background:'assets/pictures/categories/hotels.jpg', name: 'Hotels'),

];  
List<CategoryModel> categoryList = [
  CategoryModel(icon: 'assets/svg/hotel.svg', background:'assets/pictures/categories/hotels.jpg', name: 'Hotels'),
    CategoryModel(icon: 'assets/svg/verified.svg',  background:'assets/pictures/categories/activites.jpg',name: 'Activités'),
  CategoryModel(icon: 'assets/svg/restaurant.svg', background:'assets/pictures/categories/restaurants.jpg', name: 'Restaurants'),
  CategoryModel(icon: 'assets/svg/sitetouristique.svg', background:'assets/pictures/categories/sitestouristiques.jpg', name: 'Sites touristiques'),
    CategoryModel(icon: 'assets/svg/transport.svg',  background:'assets/pictures/categories/transports.jpg',name: 'Transports'),
  CategoryModel(icon: 'assets/svg/parking.svg',  background:'assets/pictures/categories/parkings.jpg',name: 'Parkings'),
];  

// ********* a voir apes ***************//
List<PopularModel> villesPageAccueilList = [
  PopularModel(
    pictureprincipale: 'assets/pictures/nos_coups_de_coeur/activite.jpg',
    picture1: '.',
    picture2: '',
    picture3: '',
    price:  0,
    title: 'Excursion en bateau',
    desc : ''
 
  ),
   PopularModel(
    pictureprincipale: 'assets/pictures/nos_coups_de_coeur/restaurant.jpg',
    picture1: '.',
    picture2: '',
    picture3: '',
    price:  0,
    title: 'Restaurant CANTOCH',
    desc : ''
 
  ),
   PopularModel(
    pictureprincipale: 'assets/pictures/nos_coups_de_coeur/hotel.jpg',
    picture1: '.',
    picture2: '',
    picture3: '',
    price:  0,
    title: 'MEINNGER Hotel',
    desc : ''
 
  ),
];

//******************Nice**************** */

List<PopularModel> hotelsListNice = [
  PopularModel(
pictureprincipale: 'assets/pictures/villes/nice/hotels/hotel1/1.jpg',
    picture1: 'assets/pictures/villes/nice/hotels/hotel1/2.jpg',
    picture2: 'assets/pictures/villes/nice/hotels/hotel1/3.jpg',
    picture3: 'assets/pictures/villes/nice/hotels/hotel1/4.jpg',
    price: 35,
    title: 'Premiere Classe Nice',
    desc : "L'établissement Premiere Classe Nice - Promenade des Anglais vous accueille en face de la Méditerranée, sur la promenade des Anglais. Il se trouve à seulement 10 minutes de route de l'aéroport de Nice-Côte d'Azur, à 5 km de la vieille ville de Nice et à 6,5 km du stade Allianz Riviera. Une connexion Wi-Fi haut débit est accessible gratuitement."
  ),
   PopularModel(
    pictureprincipale: 'assets/pictures/villes/nice/hotels/hotel2/1.jpg',
    picture1: 'assets/pictures/villes/nice/hotels/hotel2/2.jpg',
    picture2: 'assets/pictures/villes/nice/hotels/hotel2/3.jpg',
    picture3: 'assets/pictures/villes/nice/hotels/hotel2/4.jpg',
    price: 45,
    title: 'Sunlight Properties',
    desc : "Situé dans le quartier des Baumettes à Nice, le Sunlight Properties - Parisian Bleu - Calm with Sea View dispose de la climatisation, d'une terrasse et d'une vue sur la ville. Vous pourrez pratiquer diverses activités dans les environs, telles que la pêche et la randonnée."
  ),
];

List<PopularModel> activitesListNice = [
  PopularModel(
   pictureprincipale: 'assets/pictures/villes/nice/activites/activite1/1.jpg',
    picture1: 'assets/pictures/villes/nice/activites/activite1/2.jpg',
    picture2: 'assets/pictures/villes/nice/activites/activite1/3.jpg',
    picture3: 'assets/pictures/villes/nice/activites/activite1/4.jpg',
    price: 4,
    title: '1 h vers la baie',
    desc : "Profitez d’une vue imprenable sur Nice, Saint-Jean-Cap-Ferrat et Villefranche-sur-Mer au cours d’une croisière d’1 h à la Côte d’Azur. Admirez les yachts des personnes riches et célèbres et les superbes paysages de la Côte d’Azur."
  ),
   PopularModel(
    pictureprincipale: 'assets/pictures/villes/nice/activites/activite2/1.jpg',
    picture1: 'assets/pictures/villes/nice/activites/activite2/2.jpg',
    picture2: 'assets/pictures/villes/nice/activites/activite2/3.jpg',
    picture3: 'assets/pictures/villes/nice/activites/activite2/4.jpg',
    price: 5,
    title: 'visite en bus',
    desc : "Explorez Nice selon de vos centres d'intérêt et votre programme. Choisissez le pass 1 ou 2 jours et profitez du bus touristique à arrêts multiples. Montez et descendez librement et visitez la place Garibaldi, la promenade des Anglais et bien plus encore."
  ),
];
List<PopularModel> sitestouristiquesListNice = [
  PopularModel(
     pictureprincipale: 'assets/pictures/villes/nice/sitestouristiques/sitetouristique1/1.jpg',
    picture1: 'assets/pictures/villes/nice/sitestouristiques/sitetouristique1/2.jpg',
    picture2: 'assets/pictures/villes/nice/sitestouristiques/sitetouristique1/3.jpg',
    picture3: 'assets/pictures/villes/nice/sitestouristiques/sitetouristique1/4.jpg',
    price: 2,
    title: 'visite en bus à arrêts multiples',
    desc : "Explorez Nice selon de vos centres d'intérêt et votre programme. Choisissez le pass 1 ou 2 jours et profitez du bus touristique à arrêts multiples. Montez et descendez librement et visitez la place Garibaldi, la promenade des Anglais et bien plus encore."
  ),
   PopularModel(
     pictureprincipale: 'assets/pictures/villes/nice/sitestouristiques/sitetouristique2/1.jpg',
    picture1: 'assets/pictures/villes/nice/sitestouristiques/sitetouristique2/2.jpg',
    picture2: 'assets/pictures/villes/nice/sitestouristiques/sitetouristique2/3.jpg',
    picture3: 'assets/pictures/villes/nice/sitestouristiques/sitetouristique2/4.jpg',
    price: 3,
    title: 'collection Nahmad',
    desc : "Répondant à leur volonté de partager l’art avec le plus grand nombre, David et Ezra Nahmad, marchands-collectionneurs éclairés, ont consenti au Musée Matisse le prêt des seize œuvres d’Henri Matisse de leur collection. Cet ensemble exceptionnel est pour la première fois révélé au public dans sa totalité."
  ),
];

List<PopularModel> restaurantsListNice = [
  PopularModel(
     pictureprincipale: 'assets/pictures/villes/nice/restaurants/restaurant1/1.jpg',
    picture1: 'assets/pictures/villes/nice/restaurants/restaurant1/2.jpg',
    picture2: 'assets/pictures/villes/nice/restaurants/restaurant1/3.jpg',
    picture3: 'assets/pictures/villes/nice/restaurants/restaurant1/4.jpg',
    price: 15,
    title: 'Olim Meyerbeer',
    desc : "Ayant vu English Library Nice, c'est le moment de faire une pause dans ce restaurant. La cuisine française dirigée par un chef grandiose est merveilleuse à cet endroit. Vous pouvez toujours déguster un brandade fascinant, c'est une offre spéciale de Olim Meyerbeer. Essayez un parfait délicieux. Certains clients recommandent un café immense dans ce lieu"
  ),
  PopularModel(
     pictureprincipale: 'assets/pictures/villes/nice/restaurants/restaurant2/1.jpg',
    picture1: 'assets/pictures/villes/nice/restaurants/restaurant2/2.jpg',
    picture2: 'assets/pictures/villes/nice/restaurants/restaurant2/3.jpg',
    picture3: 'assets/pictures/villes/nice/restaurants/restaurant2/4.jpg',
    price: 20,
    title: 'That’s Amore',
    desc : "Ayant vu English Library Nice, c'est le moment de faire une pause dans ce restaurant. La cuisine française dirigée par un chef grandiose est merveilleuse à cet endroit. Vous pouvez toujours déguster un brandade fascinant, c'est une offre spéciale de Olim Meyerbeer. Essayez un parfait délicieux. Certains clients recommandent un café immense dans ce lieu"
  ),
];

List<PopularModel> parkingsListNice = [
  PopularModel(
        pictureprincipale: 'assets/pictures/villes/nice/parkings/parking1/1.jpg',
    picture1: 'assets/pictures/villes/nice/parkings/parking1/2.jpg',
    picture2: 'assets/pictures/villes/nice/parkings/parking1/3.jpg',
    picture3: 'assets/pictures/villes/nice/parkings/parking1/4.jpg',
    price: 1,
    title: 'Parking 1',
    desc : "Parkig 1 - Nice"
  ),
   PopularModel(
        pictureprincipale: 'assets/pictures/villes/nice/parkings/parking2/1.jpg',
    picture1: 'assets/pictures/villes/nice/parkings/parking2/2.jpg',
    picture2: 'assets/pictures/villes/nice/parkings/parking2/3.jpg',
    picture3: 'assets/pictures/villes/nice/parkings/parking2/4.jpg',
    price: 1,
    title: 'Parking 2',
    desc : "Parking 2 - Nice"
  ),
  
];
//*****************Toulon****************** */



List<PopularModel> hotelsListToulon = [
  PopularModel(
pictureprincipale: 'assets/pictures/villes/toulon/hotels/hotel1/1.jpg',
    picture1: 'assets/pictures/villes/toulon/hotels/hotel1/2.jpg',
    picture2: 'assets/pictures/villes/toulon/hotels/hotel1/3.jpg',
    picture3: 'assets/pictures/villes/toulon/hotels/hotel1/4.jpg',
    price: 50,
    title: 'Holiday Inn EST',
    desc : "Le Holiday Inn Express Toulon - Est se trouve à 10 minutes de route du centre de Toulon et de son port, proposant des liaisons directes en ferry vers la Corse, la Sardaigne, la Sicile et Majorque. Sa réception ouverte 24h/24 assure des services d'enregistrement et de départ rapides. Vous aurez accès gratuitement à un espace affaires. Vous pourrez également vous détendre au bar ou sur la terrasse de l'hôtel. Une connexion Wi-Fi est disponible gratuitement dans l'ensemble de l'établissement."
  ),
   PopularModel(
    pictureprincipale: 'assets/pictures/villes/toulon/hotels/hotel2/1.jpg',
    picture1: 'assets/pictures/villes/toulon/hotels/hotel2/2.jpg',
    picture2: 'assets/pictures/villes/toulon/hotels/hotel2/3.jpg',
    picture3: 'assets/pictures/villes/toulon/hotels/hotel2/4.jpg',
    price: 45,
    title: 'Hôtel Bonaparte',
    desc : "L'Hôtel Bonaparte se trouve au cœur de Toulon, à 2 minutes à pied du port et de l'Arsenal de Toulon. Il propose des chambres avec salle de bains privative et télévision. Une connexion Wi-Fi gratuite est disponible dans les parties communes."
  ),
   PopularModel(
pictureprincipale: 'assets/pictures/villes/toulon/hotels/hotel3/1.jpg',
    picture1: 'assets/pictures/villes/toulon/hotels/hotel3/2.jpg',
    picture2: 'assets/pictures/villes/toulon/hotels/hotel3/3.jpg',
    picture3: 'assets/pictures/villes/toulon/hotels/hotel3/4.jpg',
    price: 60,
    title: 'Eautel Toulon',
    desc : "Situé à Toulon, à 1,9 km de la plage de Mitre, L'Eautel Toulon Centre Port propose un restaurant, un parking privé, une piscine extérieure et un bar. Il propose une réception ouverte 24h/24, un service d'étage et une connexion Wi-Fi gratuite dans l'ensemble de ses locaux. L'hôtel propose des chambres familiales."
  ),
   PopularModel(
    pictureprincipale: 'assets/pictures/villes/toulon/hotels/hotel4/1.jpg',
    picture1: 'assets/pictures/villes/toulon/hotels/hotel4/2.jpg',
    picture2: 'assets/pictures/villes/toulon/hotels/hotel4/3.jpg',
    picture3: 'assets/pictures/villes/toulon/hotels/hotel4/4.jpg',
    price: 75,
    title: 'Holiday Inn',
    desc : "L’Holiday Inn Toulon City Centre est situé à 5 minutes de marche de la gare ferroviaire de Toulon et à 10 minutes à pied de la place de la Liberté. L’établissement dispose d'une piscine extérieure et d'une terrasse meublée. En outre, vous pourrez profiter d’un bar et d’un restaurant."
  ),
];

List<PopularModel> activitesListToulon = [
  PopularModel(
   pictureprincipale: 'assets/pictures/villes/toulon/activites/activite1/1.jpg',
    picture1: 'assets/pictures/villes/toulon/activites/activite1/2.jpg',
    picture2: 'assets/pictures/villes/toulon/activites/activite1/3.jpg',
    picture3: 'assets/pictures/villes/toulon/activites/activite1/4.jpg',
    price: 4,
    title: 'journée complète',
    desc : "Découvrez trois villages historiques de Provence lors de cette visite privée, y compris les favoris locaux qui manquent à de nombreux voyageurs. Explorez les rues médiévales pittoresques d'Olllioules, visitez le château perché et admirez la vue sur les vignobles du Castellet, puis promenez-vous dans le village de pêcheurs coloré de Sanary-sur-Mer. En chemin, arrêtez-vous pour profiter d'une dégustation de vin à la Maison de Vin à Bandol."
  ),
   PopularModel(
    pictureprincipale: 'assets/pictures/villes/toulon/activites/activite2/1.jpg',
    picture1: 'assets/pictures/villes/toulon/activites/activite2/2.jpg',
    picture2: 'assets/pictures/villes/toulon/activites/activite2/3.jpg',
    picture3: 'assets/pictures/villes/toulon/activites/activite2/4.jpg',
    price: 5,
    title: 'Visite guidée à Toulon: port et vieille ville',
    desc : "Toulon est la capitale du Var. Son importance en tant que ville portuaire centrale de la côte méditerranéenne était connue dès l'Empire romain. Toulon est une base permanente de la Marine Nationale. Toulon a également servi de port à Napoléon d'où il s'est embarqué pour son voyage vers l'Egypte. Joséphine a grimpé la tour royale et a salué son mari pour s'assurer qu'il partait bien. Nous marcherons le long du quai du port, discuterons de l'histoire de la ville, regarderons les célèbres statues devant l'hôtel de ville. Nous traverserons ensuite la vieille ville et le célèbre marché provençal et explorerons quelques-unes des spécialités locales. Nous continuerons au cœur de la vieille ville, en regardant des maisons, des fontaines, en racontant des histoires et en présentant les figures auparavant vibrantes de Toulon. Passager de bateau de croisière ? Au plaisir de vous rencontrer au terminal ou à la descente de votre annexe. Petits groupes intimes sans système de guidage audio. Je te parle :-) Tu marches avec moi, pas derrière moi ;-)"
  ),
];
List<PopularModel> sitestouristiquesListToulon = [
  PopularModel(
     pictureprincipale: 'assets/pictures/villes/toulon/sitestouristiques/sitetouristique1/1.jpg',
    picture1: 'assets/pictures/villes/toulon/sitestouristiques/sitetouristique1/2.jpg',
    picture2: 'assets/pictures/villes/toulon/sitestouristiques/sitetouristique1/3.jpg',
    picture3: 'assets/pictures/villes/toulon/sitestouristiques/sitetouristique1/4.jpg',
    price: 2,
    title: 'Le Village du Mourillon',
    desc : "Les hauteurs du Mourillon, situées en Provence cristalline au sud de la dépression permienne, présentent un faible relief constitué de phyllades et de roches métamorphiques longuement érodées1,2. La presqu'île du Mourillon donne à la fois sur la petite rade et sur la grande rade, sous la forme d'une butte dont la ligne de crête est le boulevard Grignan orienté Nord-Est/Sud-Ouest, et présentant deux versants :"
  ),
   PopularModel(
     pictureprincipale: 'assets/pictures/villes/toulon/sitestouristiques/sitetouristique2/1.jpg',
    picture1: 'assets/pictures/villes/toulon/sitestouristiques/sitetouristique2/2.jpg',
    picture2: 'assets/pictures/villes/toulon/sitestouristiques/sitetouristique2/3.jpg',
    picture3: 'assets/pictures/villes/toulon/sitestouristiques/sitetouristique2/4.jpg',
    price: 3,
    title: 'Cours Lafayette',
    desc : "Le cours Lafayette est une voie de circulation située en limite des 3ᵉ et 6ᵉ arrondissements de la ville de Lyon, en France. Il est l'une des principales artères de la rive gauche du Rhône et de la ville."
  ),
];

List<PopularModel> restaurantsListToulon = [
  PopularModel(
     pictureprincipale: 'assets/pictures/villes/toulon/restaurants/restaurant1/1.jpg',
    picture1: 'assets/pictures/villes/toulon/restaurants/restaurant1/2.jpg',
    picture2: 'assets/pictures/villes/toulon/restaurants/restaurant1/3.jpg',
    picture3: 'assets/pictures/villes/toulon/restaurants/restaurant1/4.jpg',
    price: 12,
    title: 'Il Parasole di Marco',
    desc : "Depuis que Marco Casolla s’est installé plage du Mourillon, le bouche-à-oreille fonctionne avec merveille, plébiscitant le décor à l’atmosphère amalfitaine, tout en matériaux naturels, céramiques blanches, mur intérieur de restanques, terrasse embaumée de jasmin, le personnel et Marco, un vrai G.O. de bienveillance. Même si le temps est gris, le soleil brille toujours chez lui. Loin d’être un inconnu pour les Toulonnais, il les régale depuis 2013 à La Fabbrica di Marco, son premier restaurant napolitain près des nouvelles Halles, qu’il a dédoublé tellement avec succès."
  ),
  PopularModel(
     pictureprincipale: 'assets/pictures/villes/toulon/restaurants/restaurant2/1.JPG',
    picture1: 'assets/pictures/villes/toulon/restaurants/restaurant2/2.jpg',
    picture2: 'assets/pictures/villes/toulon/restaurants/restaurant2/3.jpg',
    picture3: 'assets/pictures/villes/toulon/restaurants/restaurant2/4.jpg',
    price: 15,
    title: 'Équerre à Eautel',
    desc : "Quatrième unité de soixante-quatre chambres d’une chaîne lyonnaise, L’Eautel, dirigé par la charmante Lila Nammathao, a ouvert ses portes en juillet dernier. À proximité du Zénith Oméga, de l’hôtel de ville et du port de Toulon, c’est un plaisant établissement hôtelier tout confort, avec piscine sur la terrasse qui domine la ville, Spa et centre de bien-être dont la déco marine est le fil conducteur."
  ),
];

List<PopularModel> parkingsListToulon = [
  PopularModel(
        pictureprincipale: 'assets/pictures/villes/toulon/parkings/parking1/1.jpg',
    picture1: 'assets/pictures/villes/toulon/parkings/parking1/2.jpg',
    picture2: 'assets/pictures/villes/toulon/parkings/parking1/3.jpg',
    picture3: 'assets/pictures/villes/toulon/parkings/parking1/4.jpg',
    price: 1,
    title: 'Parking 1',
    desc : "Parking 1 à Toulon"
  ),
   PopularModel(
        pictureprincipale: 'assets/pictures/villes/toulon/parkings/parking2/1.jpg',
    picture1: 'assets/pictures/villes/toulon/parkings/parking2/2.jpg',
    picture2: 'assets/pictures/villes/toulon/parkings/parking2/3.jpg',
    picture3: 'assets/pictures/villes/toulon/parkings/parking2/4.jpg',
    price: 1,
    title: 'Parking 2',
    desc : "Parking 2 à Toulon"
  ),
];