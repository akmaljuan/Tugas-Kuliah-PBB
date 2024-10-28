import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(RestaurantProfileApp());
}

class RestaurantProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RestaurantProfile(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RestaurantProfile extends StatelessWidget {
  final String restaurantName = "Warung Bapakmu";
  final String description = "Cita Rasa Seperti Buatan Bapakmu Sendiri";
  final List<String> menuItems = ["Nasi Goreng", "Mie Ayam", "Sate Ayam"];
  final String address =
      "Jl. Imam Bonjol No.207, Pendrikan Kidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50131";
  final String openingHours = "Setiap Hari: 09:00 - 21:00";
  final String email = "111202214807@mhs.dinus.ac.id";
  final String phoneNumber = "+6283866456128";
  final String mapLink = "https://maps.app.goo.gl/5LZZHZgKivEyEGj47";

  void _openEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': 'Tanya Seputar Resto'},
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  void _openPhone() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  void _openMap() async {
    final Uri mapUri = Uri.parse(mapLink);
    if (await canLaunchUrl(mapUri)) {
      await launchUrl(mapUri);
    } else {
      throw 'Could not launch $mapUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantName),
        backgroundColor: const Color.fromARGB(255, 62, 210, 62),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image Placeholder
            // Profile Image Placeholder
            Container(
              width: double.infinity,
              height: 150,
              color: const Color.fromARGB(255, 180, 26, 26),
              child: Image.asset(
                'assets/bapakmu.jpg',
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Center(child: Text('Image not found'));
                },
              ),
            ),

            // Contact Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.email, color: Colors.blue),
                  onPressed: _openEmail,
                ),
                IconButton(
                  icon: Icon(Icons.phone, color: Colors.green),
                  onPressed: _openPhone,
                ),
                IconButton(
                  icon: Icon(Icons.map, color: Colors.red),
                  onPressed: _openMap,
                ),
              ],
            ),
            SizedBox(height: 16),

            // Description Section
            Text(
              "Deskripsi:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(description),
            SizedBox(height: 16),

            // Menu List Section
            Text(
              "List Menu:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ...menuItems.map((item) => Text("• $item")).toList(),
            SizedBox(height: 16),

            // Address Section
            Text(
              "Alamat:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(address),
            SizedBox(height: 16),

            // Opening Hours Section
            Text(
              "Jam Buka:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(openingHours),
          ],
        ),
      ),
    );
  }
}
