import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF5C333),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "MANTOOLS",
                style: TextStyle(
                  letterSpacing: 2.56,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Aplikasi Jasa Tukang Professional",
              ),
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
