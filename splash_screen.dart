import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/loading screen.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Logo for loading screen.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                value: null,
                strokeWidth: 5,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
