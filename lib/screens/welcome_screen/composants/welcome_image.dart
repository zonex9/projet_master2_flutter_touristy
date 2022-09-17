import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                "../assets/pictures/welcomeimage.png")
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
          Row(
          children: [
            Expanded(
              child: Image.asset(
                "assets/pictures/logo.png",
              ),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}