import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class Tugas7Datepicker extends StatefulWidget {
  const Tugas7Datepicker({super.key});

  @override
  State<Tugas7Datepicker> createState() => _Tugas7DatepickerState();
}

class _Tugas7DatepickerState extends State<Tugas7Datepicker> {
  List<DateTime?> _dates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
            ),
            value: _dates,
            onValueChanged: (dates) => _dates = dates,
          ),
        ],
      ),
    );
  }
}
