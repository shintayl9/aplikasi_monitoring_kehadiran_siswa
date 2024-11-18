import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/history_screen.dart';
import 'views/attendance_screen.dart';
import 'provider/attendance_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AttendanceProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Monitoring Kehadiran Siswa',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class MainScreen extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    AttendanceScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.edit), label: 'Pencatatan'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          ]),
    );
  }
}
