import 'package:flutter/material.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _students = [
    {'name': 'Ali', 'isPresent': false, 'icon': Icons.person},
    {'name': 'Budi', 'isPresent': false, 'icon': Icons.person},
    {'name': 'Citra', 'isPresent': false, 'icon': Icons.person},
    {'name': 'Putri', 'isPresent': false, 'icon': Icons.person},
    {'name': 'Laura', 'isPresent': false, 'icon': Icons.person},
    {'name': 'Putra', 'isPresent': false, 'icon': Icons.person},
    {'name': 'Maharani', 'isPresent': false, 'icon': Icons.person},
    {'name': 'Riski', 'isPresent': false, 'icon': Icons.person},
  ];

  final List<Map<String, dynamic>> _history = [];

  List<Map<String, dynamic>> get students => _students;

  List<Map<String, dynamic>> get history => _history;

  void replaceAttendance(int index) {
    _students[index]['isPresent'] = !_students[index]['isPresent'];
    notifyListeners();
  }

  void saveAttendance() {
    int present =
        _students.where((student) => student['isPresent'] == true).length;
    int absent = _students.length - present;

    _history.insert(0, {
      'waktu': DateTime.now(),
      'hadir': present,
      'tidak hadir': absent,
    });

    for (var student in _students) {
      student['isPresent'] = false;
    }

    notifyListeners();
  }
}
