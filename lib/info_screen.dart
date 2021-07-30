import 'package:covid_19_ui/widgets/header.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        MyHeader(
            imagePath: 'assets/icons/coronadr.svg',
            textTop: 'Get to know',
            textBottom: 'About COVID-19')
      ],
    ));
  }
}
