import 'package:flutter/material.dart';

class Tugas7Timepicker extends StatefulWidget {
  const Tugas7Timepicker({super.key});

  @override
  State<Tugas7Timepicker> createState() => _Tugas7TimepickerState();
}

class _Tugas7TimepickerState extends State<Tugas7Timepicker> {
  TimeOfDay? timePicked = TimeOfDay.now();

  // String formatTime = 'Test';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                setState(() {
                  timePicked = time;
                });
              }
            },
            child: Text("Pilih waktu pengingat"),
          ),
          // Text(Time)
          // Text("Pengingat diatur pukul: ${timePicked!.format(context)}"),
        ],
      ),
    );
  }
}
