import 'package:apriori/login.dart';
import 'package:apriori/calculateapriori.dart';
import 'package:apriori/main.dart';
import 'package:apriori/transaction.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String username;

  const DashboardPage({super.key, required this.username});

  void signOut(BuildContext context) {
    // TODO: Implement your sign-out logic here
    // Example code: Navigate back to the login page
    Navigator.pop(context); // Close the dashboard page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF22411F),
        elevation: 0,
        title: const Text(
          'Hello!!! Selamat Datang',
          style: TextStyle(fontSize: 20.0),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFFFFFFF), // Warna hijau untuk ikon
        ),
      ),
      drawer: Drawer(
        // backgroundColor:Color(0xFF22411F),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 40),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(username, style: const TextStyle(fontSize: 15),
              ),
              iconColor: const Color(0xFF22411F),
              textColor: const Color(0xFF22411F),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('sign out', style: TextStyle(fontSize: 15),
              ),
              iconColor: const Color(0xFF22411F),
              textColor: const Color(0xFF22411F),
              onTap: () {
                signOut(context); // Call the signOut function
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView( // Wrap the column in a SingleChildScrollView
          child: Column(
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Image.asset(
                    'assets/images/banner.jpg',
                    height: constraints.maxWidth * 0.4,
                    width: constraints.maxWidth,
                    fit: BoxFit.cover,
                  );
                },
              ),
              const SizedBox(height: 120.0),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DataTransaksiPage(
                            data: [],
                          )),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF22411F)),
                  ),
                  child: const Text('Data Transaksi'),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: 200,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CountAprioriPage(data: [],)),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF22411F)),
                  ),
                  child: const Text('Perhitungan Apriori'),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: 200,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF22411F)),
                  ),
                  child: const Text('Keluar'),
                ),
              ),
              // Tombol "Home" sebagai widget tambahan
              const SizedBox(height: 120.0),
              IconButton(
                onPressed: () {
                  // Ganti bagian ini dengan logika navigasi ke halaman beranda
                  // Misalnya, Anda dapat menggunakan Navigator untuk kembali ke halaman beranda
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(
                  Icons.home,
                  color: Color(0xFF22411F),
                  size: 40.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
