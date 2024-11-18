import 'package:aplikasi_monitoring_kehadiran_siswa/provider/presence_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceHistory = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Kehadiran')),
      body: attendanceHistory.history.isEmpty
          ? Center(child: Text('Tidak ada data kehadiran'))
          : ListView.builder(
              itemCount: attendanceHistory.history.length,
              itemBuilder: (context, index) {
                final record = attendanceHistory.history[index];
                final date = DateFormat('dd MMM yyyy').format(record['waktu']);
                return ListTile(
                  title: Text(date),
                  subtitle: Text(
                      'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}'),
                );
              },
            ),
    );
  }
}
