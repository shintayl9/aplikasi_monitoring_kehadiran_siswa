
import 'package:aplikasi_monitoring_kehadiran_siswa/provider/presence_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Presensi Siswa')),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: attendanceProvider.students.length,
                itemBuilder: (context, index) {
                  final student = attendanceProvider.students[index];
                  return ListTile(
                    title: Text(student['name']),
                    trailing: Checkbox(
                      value: student['isPresent'],
                      onChanged: (_) =>
                          attendanceProvider.replaceAttendance(index),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed:
                    attendanceProvider.students.any((s) => s['isPresent'])
                        ? () => attendanceProvider.saveAttendance()
                        : null,
                child: const Text('Simpan Kehadiran'),
              ),
            )
          ],
        ));
  }
}
