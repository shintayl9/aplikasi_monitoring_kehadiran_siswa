import 'package:flutter/material.dart';

// Mengelola state kehadiran siswa dan riwayatnya.
class AttendanceProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _students = [
    {'name': 'Ali', 'isPresent': false},
    {'name': 'Budi', 'isPresent': false},
    {'name': 'Citra', 'isPresent': false},
    {'name': 'Putri', 'isPresent': false},
    {'name': 'Laura', 'isPresent': false},
    {'name': 'Putra', 'isPresent': false},
    {'name': 'Maharani', 'isPresent': false},
    {'name': 'Riski', 'isPresent': false},
  ];

  final List<Map<String, dynamic>> _history = []; // Riwayat kehadiran siswa.

  List<Map<String, dynamic>> get students => _students; // Mengambil data siswa.

  List<Map<String, dynamic>> get history =>
      _history; // Mengambil riwayat kehadiran.

  void replaceAttendance(int index) {
    // Mengubah status kehadiran siswa (dari hadir ke tidak hadir atau sebaliknya).
    _students[index]['isPresent'] = !_students[index]['isPresent'];
    notifyListeners(); // Memberi tahu widget lain bahwa data telah berubah.
  }

  void saveAttendance() {
    // Menyimpan data kehadiran saat ini ke dalam riwayat.
    int present =
        _students.where((student) => student['isPresent'] == true).length;
    int absent = _students.length - present;

    _history.insert(0, {
      'waktu': DateTime.now(), // Menyimpan waktu pencatatan kehadiran.
      'hadir': present, // Jumlah siswa hadir.
      'tidak hadir': absent, // Jumlah siswa tidak hadir.
    });

    for (var student in _students) {
      student['isPresent'] = false;
    }

    notifyListeners(); // Memberi tahu widget lain bahwa riwayat telah diperbarui.
  }
}
