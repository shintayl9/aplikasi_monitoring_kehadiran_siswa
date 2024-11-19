import 'package:aplikasi_monitoring_kehadiran_siswa/provider/presence_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final attendanceHistory =
        Provider.of<AttendanceProvider>(context); // Mengakses provider data.

    return Scaffold(
      appBar: AppBar(
          title: const Text('Riwayat Kehadiran')), // Header dengan judul layar.
      body: attendanceHistory.history.isEmpty
          ? Center(
              child: Text(
                  'Tidak ada data kehadiran')) // Pesan jika tidak ada riwayat kehadiran.
          : ListView.builder(
              itemCount: attendanceHistory.history.length, // Jumlah riwayat.
              itemBuilder: (context, index) {
                final record =
                    attendanceHistory.history[index]; // Mengambil data riwayat.
                final date = DateFormat('dd MMMM yyyy')
                    .format(record['waktu']); // Format waktu.
                return ListTile(
                  title: Text(date), // Menampilkan tanggal presensi.
                  subtitle: Text(
                      // Menampilkan jumlah siswa hadir dan tidak hadir.
                      'Hadir: ${record['hadir']}, Tidak Hadir: ${record['tidak hadir']}'),
                );
              },
            ),
    );
  }
}
