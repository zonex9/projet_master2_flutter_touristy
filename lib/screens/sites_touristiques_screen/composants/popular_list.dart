import 'package:projet_annuel/dummy_data.dart';
import 'package:projet_annuel/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';

import '../../detail_screen/components/hotels_screen/hotels_detail_screen.dart';
import '../../detail_screen/components/sites_touristiques_screen/sites_touristiques_detail_screen.dart';

class SitesTouristiquesPopularList extends StatefulWidget {
  const SitesTouristiquesPopularList({Key? key}) : super(key: key);

  @override
  State<SitesTouristiquesPopularList> createState() => _SitesTouristiquesPopularListtState();
}

class _SitesTouristiquesPopularListtState extends State<SitesTouristiquesPopularList> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          childAspectRatio: .7,
        ),
        delegate: SliverChildBuilderDelegate(
          (ctx, i) {
            return GestureDetector(
             onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => SitesTouristiquesDetailScreen(
                        popularModel: sitestouristiquesListToulon[i],
                      )),
                ),
              ),
              child: Card(
                elevation: .7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage(sitestouristiquesListToulon[i].pictureprincipale),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(sitestouristiquesListToulon[i].title),
                              Text(
                                '\€${sitestouristiquesListToulon[i].price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                sitestouristiquesListToulon[i].favorite =
                                    !sitestouristiquesListToulon[i].favorite;
                              });
                            },
                            icon: sitestouristiquesListToulon[i].favorite
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 18,
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: sitestouristiquesListToulon.length,
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()..moveTo(0, 0);

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);

    path.lineTo(size.width - 20, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height - 25, size.width, size.height - 50);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
