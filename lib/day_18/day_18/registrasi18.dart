import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_18/welcome18.dart';

class Registrasi18 extends StatefulWidget {
  const Registrasi18({super.key});

  @override
  State<Registrasi18> createState() => _Registrasi18State();
}

class _Registrasi18State extends State<Registrasi18> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telponController = TextEditingController();
  final TextEditingController domisiliController = TextEditingController();
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pendaftaran'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama lengkap harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      !RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                    return 'Email harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: telponController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: domisiliController,
                decoration: const InputDecoration(
                  labelText: 'Kota domilisi',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kota domilisi harus diisi';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Pastikan data sesuai'),
                          content: Text(
                            'Nama: ${nameController.text} \nEmail: ${emailController.text} \nNomor HP: ${telponController.text} \nKota Domisili: ${domisiliController.text}',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Welcome18(
                                        
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Text('Proceed'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
