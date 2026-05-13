import 'package:flutter/material.dart';
import 'package:pertemuan_2/models/pages/register_page.dart';
// Import halaman RegisterPage agar bisa dijadikan 'home'
// Sesuaikan path jika lokasi file berubah.



void main() {
  // Fungsi utama untuk menjalankan aplikasi
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adventure Guild ITG', // Nama aplikasi (opsional)
      debugShowCheckedModeBanner:
          false, // Menghilangkan banner DEBUG di pojok kanan
      // Tema aplikasi dengan nuansa petualangan/RPG
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A7483)),
        useMaterial3: true,
        // Kamu bisa menyesuaikan font di sini jika sudah mendaftarkannya di pubspec.yaml
        fontFamily: 'Georgia',
      ),


      home: RegisterPage(),
    );
  }
}
