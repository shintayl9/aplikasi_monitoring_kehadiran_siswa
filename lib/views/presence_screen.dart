import 'package:aplikasi_monitoring_kehadiran_siswa/provider/presence_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  _AttendanceScreenState createState() =>
      _AttendanceScreenState(); // Membuat state widget.
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider =
        Provider.of<AttendanceProvider>(context); // Mengakses provider data.

    return Scaffold(
        appBar: AppBar(
            title: const Text('Presensi Siswa')), // Header dengan judul layar.
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                // Membuat daftar siswa menggunakan ListView.
                itemCount: attendanceProvider.students.length, // Jumlah siswa.
                itemBuilder: (context, index) {
                  final student = attendanceProvider.students[
                      index]; // Mengambil data siswa berdasarkan index.
                  return ListTile(
                    title: Text(student['name']), // Menampilkan nama siswa.
                    trailing: Checkbox(
                      value: student['isPresent'], // Status kehadiran.
                      onChanged: (_) => attendanceProvider.replaceAttendance(
                          index), // Mengubah status kehadiran siswa.
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: attendanceProvider.students
                        .any((s) => s['isPresent'])
                    ? () => attendanceProvider
                        .saveAttendance() // Menyimpan data kehadiran ke riwayat.
                    : null,
                child: const Text('Simpan Kehadiran'), // tombol.
              ),
            )
          ],
        ));
  }
}
