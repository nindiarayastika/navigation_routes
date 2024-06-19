import 'package:flutter/material.dart';

void main() {
  runApp(FlowerShopApp());
}

class FlowerShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower Shop',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/bouquet': (context) => BouquetScreen(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flower Shop'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 450, height: 450), // Gambar logo
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bouquet');
              },
              child: Text('Katalog View Bouquets'),
            ),
          ],
        ),
      ),
    );
  }
}

class BouquetScreen extends StatelessWidget {
  final List<Map<String, String>> bouquets = [
    {
      'name': 'Pure White Rose Bouquet',
      'image': 'assets/images/buket 1.jpeg',
      'price': '\$140',
      'description': 'A symbol of purity and peace, this bouquet consists of elegant and pure white roses. Suitable for paying tribute to someone you respect or as a classy gift on various occasions.'
    },
    {
      'name': 'Sparkling Red Rose Bouquet',
      'image': 'assets/images/buket 2.jpeg',
      'price': '\$155',
      'description': 'Combining red roses in varying degrees of redness, this bouquet exudes undeniable aura and romance. Ideal for expressing deep love or celebrating historic moments in a relationship.'
    },
    {
      'name': 'Delicate Pink Rose Bouquet',
      'image': 'assets/images/buket 3.jpeg',
      'price': '\$135',
      'description': 'With a mix of soft and sweet pink roses, this bouquet depicts the tenderness and warmth of love. Suitable for expressing affection for loved ones or as a special thank you.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bouquets'),
      ),
      body: ListView.builder(
        itemCount: bouquets.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(bouquets[index]['image']!, width: 50, height: 50),
            title: Text(bouquets[index]['name']!),
            subtitle: Text(bouquets[index]['price']!), // Menampilkan harga
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: bouquets[index],
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String name = args['name']!;
    final String image = args['image']!;
    final String description = args['description']!;
    final String price = args['price']!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 500, height: 300),
            SizedBox(height: 20),
            Text(
              'Bouquet Name: $name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Price: $price',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
