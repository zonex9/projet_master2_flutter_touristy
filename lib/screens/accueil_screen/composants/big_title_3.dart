import 'package:projet_annuel/app/app_consts.dart';
import 'package:flutter/material.dart';

class BigTitle3 extends StatelessWidget {
  final String title;

  const BigTitle3({
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
              'Blog',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 20,
              ),
            ),
              
            
          
          ],
        ),
      ),
    );
  }
}
