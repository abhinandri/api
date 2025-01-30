import 'package:amazone_prime_clone/view/bottom_navigation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) =>Bottom_navigation()));
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF003366),
              Color.fromARGB(255, 9, 202, 154),
            ],
            ),
        ),
        child: Center(child: SizedBox(width: 200,height: 200,
        child: Image.asset('assets/images/Logo Alternative.png'),),),
      )
    );
  }
}
