import 'package:flutter/material.dart';
import 'package:utsproject/pages/tugas.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreateSchedule(),
    );
  }
}

class CreateSchedule extends StatefulWidget {
  @override
  _CreateScheduleState createState() => _CreateScheduleState();
}

class _CreateScheduleState extends State<CreateSchedule> {
  String _startPeriod = 'AM';
  String _endPeriod = 'PM';
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  String? _selectedCategory;

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  final List<String> _categories = [
    'Tugas Kuliah',
    'Projek',
    'Jalan-jalan',
    'Pekerjaan kantor',
    'Freelance project',
    'Catatan',
  ];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Buat tugas baru', style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.greenAccent[400],
              ),
              body: Container(
                color: Colors.greenAccent[400],
                child: ListView(
                  children: [
                    Padding(padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Judul',
                            ),
                          ),
                          SizedBox(height: 30),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Tanggal',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 55,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)
                          )
                      ),
                      child: Padding(padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Expanded(child: GestureDetector(
                                  onTap: () => _selectTime(context, true),
                                  child: _buildTimeInput(
                                      label: "Mulai Jam",
                                      time: _startTime,
                                      period: _startPeriod,
                                      onPeriodChange: (value) {
                                        setModalState(() {
                                          _startPeriod = value!;
                                        });
                                      }),
                                )
                                ),
                                SizedBox(height: 10,),
                                Expanded(child: GestureDetector(
                                  onTap: () => _selectTime(context, false),
                                  child: _buildTimeInput(label: "Hingga Jam",
                                      time: _endTime,
                                      period: _endPeriod,
                                      onPeriodChange: (value) {
                                        setModalState(() {
                                          _endPeriod = value!;
                                        });
                                      }),
                                ))
                              ],
                            ),
                            SizedBox(height: 50,),
                            Text(
                              "Deskripsi", style: TextStyle(color: Colors.grey),),
                            TextField(
                              maxLines: 2,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)
                                  )
                              ),
                            ),
                            SizedBox(height: 50,),
                            Text("Kategori", style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 15,),
                            Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: _categories.map((category) {
                                  final bool isSelected = _selectedCategory ==
                                      category;
                                  return GestureDetector(
                                    onTap: () {
                                      setModalState(() {
                                        _selectedCategory = category;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.greenAccent[400]
                                              : Colors.grey[300],
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Text(category,style: TextStyle(fontSize: 12, color: isSelected ? Colors.white : Colors.black),
                                      ),
                                    ),
                                  );
                                }).toList()
                            ),
                            SizedBox(height: 120,),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) => SchedulePage(),)
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.greenAccent[400],
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: Size(60, 60)
                                ),
                                child: Text('Buat Tugas', style: TextStyle(fontSize: 20),),
                              ),
                            ),
                          ],
                        ),),
                    ),
                  ],
                ),
              )
          );
        }
    );
  }


  Widget _buildTimeInput({
    required String label,
    required TimeOfDay? time,
    required String period,
    required Function(String?) onPeriodChange,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey)),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  time != null
                      ? time.format(context).split(' ')[0]
                      : '08.00',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              DropdownButton<String>(
                value: period,
                items: ['AM', 'PM']
                    .map((p) => DropdownMenuItem(
                  value: p,
                  child: Text(p),
                ))
                    .toList(),
                onChanged: onPeriodChange,
                underline: SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
