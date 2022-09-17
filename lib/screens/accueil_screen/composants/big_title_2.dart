import 'package:projet_annuel/app/app_consts.dart';
import 'package:flutter/material.dart';

class BigTitle2 extends StatelessWidget {
  final String title;
  final String trailingTitle;
  final VoidCallback? onPressMore;

  const BigTitle2({
    Key? key,
    required this.title,
    required this.trailingTitle,
    this.onPressMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          OutlinedButton(
  onPressed: null,
  style: OutlinedButton.styleFrom(
  ),
  child:  Text(trailingTitle,
   style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent
              ) ),
),
          ],
        ),
      ),
    );
  }
}
