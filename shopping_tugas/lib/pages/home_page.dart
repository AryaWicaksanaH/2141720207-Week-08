import 'package:shopping_tugas/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'BMW 316ti',
        price: 1400,
        detail:
            'most hated E46 model because it is slow. but, it is a starter pack for european younger gen for anything',
        imageUrl: 'pics/316ti.jpg',
        stok: 13,
        rating: 3.5),
    Item(
        name: 'BMW 318i',
        price: 2500,
        detail:
            'A starter pack for every new BMW fans who just hoped in. every car enthusiasts started from this 318i',
        imageUrl: 'pics/318i.jpg',
        stok: 38,
        rating: 4.9),
    Item(
        name: 'BMW 318i Touring',
        price: 3000,
        detail:
            'Same trim level. But, wagon version for you who wanted M version which never made it into production',
        imageUrl: 'pics/318i_T.jpg',
        stok: 24,
        rating: 4.7),
    Item(
        name: 'BMW 320d',
        price: 1900,
        detail:
            'Diesel version. Many average low budget BMW fans buy this and pretending to be fast',
        imageUrl: 'pics/320d.jpg',
        stok: 45,
        rating: 4.5),
    Item(
        name: 'BMW 330xi',
        price: 6000,
        detail:
            'An AWD version of E46. perfect for beating another street racer at highway.',
        imageUrl: 'pics/330xi.jpg',
        stok: 4,
        rating: 4.9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMW USED CARS'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Menampilkan 2 item per baris
          childAspectRatio: 0.7, // Mengatur rasio lebar-tinggi item
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(
                    8), // Tambahkan padding pada keseluruhan Card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'productImage${item.name}',
                      child: AspectRatio(
                        aspectRatio:
                            1, // Rasio lebar-tinggi 1:1 untuk ukuran yang sama
                        child: Image.asset(item.imageUrl, fit: BoxFit.fitWidth),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Agar rating berada di sebelah kanan
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8), // Padding di atas teks "name"
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            Text(
                              item.rating.toString(),
                              style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        '€ ${item.price}',
                        style: const TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      'Unit(s): ${item.stok}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nama: Arya Wicaksana Hidayat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                'NIM: 2141720207',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
