import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restoran Sedap Rasa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // Ganti dengan email, telepon, dan lokasi yang sudah ditentukan
  final String email = 'resto@sedaprasa.com';
  final String phone = '08123456789';
  final double latitude = -7.005145;
  final double longitude = 110.438125;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Makan Enak Kuy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/R.jpeg'), // Ganti dengan gambar profil restoran
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () {
                    _launchEmail(email);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {
                    _launchPhone(phone);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.map),
                  onPressed: () {
                    _launchMap(latitude, longitude);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Restoran Sedap Rasa menyajikan makanan khas Indonesia dengan rasa yang autentik dan bahan-bahan segar setiap hari.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'List Menu:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('1. Nasi Goreng'),
            const Text('2. Ayam Bakar'),
            const Text('3. Sate Ayam'),
            const SizedBox(height: 16),
            const Text(
              'Alamat:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('Jl. Pandanaran No. 123, Semarang'),
            const SizedBox(height: 16),
            const Text(
              'Jam Buka:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('Senin - Jumat: 08:00 - 22:00'),
            const Text('Sabtu - Minggu: 10:00 - 23:00'),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuka aplikasi email
  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Tanya Seputar Resto',
    );
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  // Fungsi untuk membuka aplikasi telepon
  void _launchPhone(String phone) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  // Fungsi untuk membuka aplikasi peta
  void _launchMap(double lat, double lng) async {
    final String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}
