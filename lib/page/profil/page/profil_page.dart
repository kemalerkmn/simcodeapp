import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profilim',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Center(child: LottieBuilder.asset("assets/lottie/profil.json")));
  }
}
