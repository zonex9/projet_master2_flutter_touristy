import 'package:projet_annuel/app/app_consts.dart';
import 'package:flutter/material.dart';

class BigTitleNice extends StatelessWidget {
  final String title;

  const BigTitleNice({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: const [ 
            Text(
              'Bienvenue à Nice !',
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
