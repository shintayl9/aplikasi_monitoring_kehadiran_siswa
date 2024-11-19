import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/history_screen.dart';
import 'views/presence_screen.dart';
import 'provider/presence_provider.dart';

void main() {
  runApp(
    MultiProvider(
      // Menyediakan state management untuk banyak provider.
      providers: [
        ChangeNotifierProvider(create: (_) => AttendanceProvider()),
        // Mendaftarkan `AttendanceProvider` untuk menyediakan data kehadiran.
      ],
      child: const MyApp(), // Menjalankan aplikasi utama.
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Struktur utama aplikasi Flutter.
      title: 'Aplikasi Monitoring Kehadiran Siswa', // Judul aplikasi.
      theme: ThemeData(
          primarySwatch: Colors.blue), // Tema aplikasi dengan warna dasar biru.
      home: const MainScreen(), // Menentukan layar awal aplikasi.
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() =>
      _MainScreenState(); // Membuat state untuk MainScreen.
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Menyimpan index tab yang aktif.

  final List<Widget> _screens = const [
    AttendanceScreen(), // Layar pencatatan kehadiran.
    HistoryScreen(), // Layar riwayat kehadiran.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Struktur dasar layar dengan AppBar, body, dan navigasi bawah.
      body: _screens[
          _currentIndex], // Menampilkan layar berdasarkan index tab yang aktif.
      bottomNavigationBar: BottomNavigationBar(
        // Navigasi bawah untuk berpindah antar layar.
        currentIndex: _currentIndex, // Menyimpan tab yang aktif.
        onTap: (index) {
          // Mengatur aksi saat tab diubah.
          setState(() {
            _currentIndex = index; // Mengubah tab aktif.
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.edit), // Ikon untuk tab pencatatan.
              label: 'Pencatatan'), // Label untuk tab pencatatan.
          BottomNavigationBarItem(
              icon: Icon(Icons.history), // Ikon untuk tab riwayat.
              label: 'Riwayat'), // Label untuk tab riwayat.
        ],
      ),
    );
  }
}
