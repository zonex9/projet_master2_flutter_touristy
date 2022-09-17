import 'package:projet_annuel/app/app_consts.dart';
import 'package:flutter/material.dart';

class BigTitle1 extends StatelessWidget {
  final String title;

  const BigTitle1({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Vivez votre voyage avec nous!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 25,
              ),
            ),
              
            
          
          ],
        ),
      ),
    );
  }
}
