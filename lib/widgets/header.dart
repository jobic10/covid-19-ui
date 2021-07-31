import 'package:covid_19_ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../info_screen.dart';

class MyHeader extends StatelessWidget {
  final String imagePath;
  final String textTop, textBottom;
  final bool pop;
  const MyHeader({
    Key? key,
    required this.imagePath,
    required this.textTop,
    required this.textBottom,
    this.pop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(
          top: 50,
          left: 40,
          right: 20,
        ),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/virus.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                pop
                    ? Navigator.of(context).pop()
                    : Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => InfoScreen()));
              },
              child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset('assets/icons/menu.svg'),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    imagePath,
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: 20,
                    left: 150,
                    child: Text(
                      '$textTop \n$textBottom',
                      style: kHeadingTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
