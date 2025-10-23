<<<<<<< HEAD
import 'package:flutter/material.dart';

class Tugas7Checkbox extends StatefulWidget {
  const Tugas7Checkbox({super.key});

  @override
  State<Tugas7Checkbox> createState() => _Tugas7CheckboxState();
}

class _Tugas7CheckboxState extends State<Tugas7Checkbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    isChecked = value!;
                  });
                },
              ),
              Text('Saya menyetujui persyaratan yang berlaku'),
            ],
          ),
          Row(
            children: [
              Text(
                isChecked
                    ? 'Lanjutkan pendaftaran di perbolehkan'
                    : 'Anda belum bisa melanjutkan',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';

class Tugas7Checkbox extends StatefulWidget {
  const Tugas7Checkbox({super.key});

  @override
  State<Tugas7Checkbox> createState() => _Tugas7CheckboxState();
}

class _Tugas7CheckboxState extends State<Tugas7Checkbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    isChecked = value!;
                  });
                },
              ),
              Text('Saya menyetujui persyaratan yang berlaku'),
            ],
          ),
          Row(
            children: [
              Text(
                isChecked
                    ? 'Lanjutkan pendaftaran di perbolehkan'
                    : 'Anda belum bisa melanjutkan',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
>>>>>>> 81e46b4cc88fed7d181152f063dc23239c4bc4e8
