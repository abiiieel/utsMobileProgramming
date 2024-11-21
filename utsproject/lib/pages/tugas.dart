import 'package:flutter/material.dart';
import 'package:utsproject/pages/buat_tugas.dart';
import 'package:utsproject/pages/home.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String _selectedDay = '17'; // Simpan tanggal yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Text("List Jadwal", style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage(),)
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Profile clicked!")),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.green[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Header
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nov, 2024',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateSchedule(),
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text("Tugas"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent[400],
                    foregroundColor: Colors.white, // Warna teks diubah menjadi putih
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Baris tanggal
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateItem('17', 'Min'),
                _buildDateItem('18', 'Sen'),
                _buildDateItem('19', 'Sel'),
                _buildDateItem('20', 'Rab'),
                _buildDateItem('21', 'Kam'),
                _buildDateItem('22', 'Jum'),
                _buildDateItem('23', 'Sab'),
              ],
            ),
          ),
          SizedBox(height: 8), // Spasi antar elemen lebih kecil
          // Daftar Tugas
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Tugas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildTaskCard(
                              'UTS Mobile Programming', '10:00 - 14:00'),
                          SizedBox(height: 8),
                          _buildTaskCard('Ngerjakan Tugas', '18:00'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(String day, String weekday) {
    final bool isSelected = _selectedDay == day;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDay = day;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Spasi proporsional
        decoration: BoxDecoration(
          color: isSelected ? Colors.greenAccent[400] : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              weekday,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(String title, String time) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.assignment, color: Colors.greenAccent[400]),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(time),
        trailing: Icon(Icons.more_vert, color: Colors.black),
      ),
    );
  }
}
