import 'package:aplikasi_monitoring_kehadiran_siswa/provider/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Riwayat Kehadiran')),
        body: ListView.builder(
            itemCount: attendanceProvider.history.length,
            itemBuilder: (context, index) {
              final record = attendanceProvider.history[index];
              return ListTile(
                title: Text(DateFormat('dd mmm yyyy').format(record['waktu'])),
                subtitle: Text(
                  'Hadir: ${record['present']}, Tidak Hadir:${record['absent']}',
                ),
              );
            }));
  }
}
