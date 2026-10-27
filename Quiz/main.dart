import 'package:flutter/material.dart';
import 'package:kuis/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppHub',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Akun Yang Terhubung'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama: Rasyid Rasyid'),
              Text('NPM: 5520124053'),
              Text('Email: rrasyid380@gmail.com'),
              Text('Kelas: IF B 24'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Kembali'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> apps = [
      {
        'name': 'FIFA WORD CUP',
        'image':
            'https://images.unsplash.com/photo-1637203723757-a9b26181e1ad?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
        'rating': '4.5 ★',
        'developer': 'Electronic Arts',
        'description': 'Game sepak bola dunia.',
      },
      {
        'name': 'Ruang Guru',
        'image':
            'https://logos.ruangkosong.net/wp-content/uploads/2025/05/Ruang-Guru_Ruang-Logo-3D-Logo-Featured-800x500.jpg',
        'rating': '4.8 ★',
        'developer': 'EduTech ID',
        'description': 'Aplikasi terbaik untuk belajar berbagai Mata pelajaran.',
      },
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Text(
                  'Kelola Aplikasi',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              ListTile(leading: Icon(Icons.home), title: Text('Beranda')),
              ListTile(leading: Icon(Icons.category), title: Text('Kategori')),
              ListTile(leading: Icon(Icons.settings), title: Text('Setelan')),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          title: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Cari aplikasi...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () => _showProfileDialog(context),
                child: const CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.blueGrey,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blueGrey,
            tabs: [
              Tab(text: 'UNTUK ANDA'),
              Tab(text: 'POPULER'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: UNTUK ANDA
            ListView.builder(
              itemCount: apps.length,
              itemBuilder: (context, index) {
                final app = apps[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        app['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image, size: 50),
                      ),
                    ),
                    title: Text(
                      app['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          app['rating']!,
                          style: const TextStyle(color: Colors.black54),
                        ),
                        Text(
                          app['developer']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            name: app['name']!,
                            image: app['image']!,
                            description: app['description']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            // Tab 2: POPULER
            const Center(child: Text('Daftar Aplikasi Populer')),
          ],
        ),
      ),
    );
  }
}