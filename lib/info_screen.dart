import 'package:covid_19_ui/constant.dart';
import 'package:covid_19_ui/widgets/header.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyHeader(
              imagePath: 'assets/icons/coronadr.svg',
              textTop: 'Get to know',
              textBottom: 'About COVID-19'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Symptoms',
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SymptomCard(
                      imagePath: 'assets/images/headache.png',
                      title: 'Headache',
                    ),
                    SymptomCard(
                      imagePath: 'assets/images/caugh.png',
                      title: 'Cough',
                    ),
                    SymptomCard(
                      imagePath: 'assets/images/fever.png',
                      title: 'Fever',
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String imagePath, title;
  const SymptomCard({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 20,
                color: kActiveShadowColor)
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 90,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }
}
