import 'package:flutter/material.dart';

import 'package:apriori/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apotek Golong',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const OnBoarding(),
    );
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/img_brand.png', // Ganti dengan path gambar Anda
              width: 180,
              height: 180,
            ),
            const SizedBox(height: 0.0),
            const Text(
              'APOTEK',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF22411F),
              ),
            ),
            const SizedBox(height: 0.0),
            const Text(
              'GOLONG',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF5C06A),
              ),
            ),
            const SizedBox(height: 200),
            SizedBox(
              height: 48,
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                  // Logika saat tombol ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF22411F)),
                ),
                child: const Text('Get Started'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
