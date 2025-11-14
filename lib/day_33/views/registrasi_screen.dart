import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_18/day_18/preference/preference_handler.dart';
import 'package:flutter_ppkd_4_new/day_33/extension/navigation.dart';
import 'package:flutter_ppkd_4_new/day_33/models/user_dart';
import 'package:flutter_ppkd_4_new/day_33/service/api.dart';
import 'package:flutter_ppkd_4_new/day_33/views/login.dart';

// import 'package:flutter_ppkd_4_new/day_33/login_screen.dart';

class Registrasi33 extends StatefulWidget {
  const Registrasi33({super.key});

  @override
  State<Registrasi33> createState() => _Registrasi33State();
}

class _Registrasi33State extends State<Registrasi33> {
  bool isLoading = false;
  RegisterModel user = RegisterModel();
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
        title: const Text('Form Pendaftaran'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
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
                validator: (value) => value == null || value.isEmpty
                    ? 'Nama lengkap harus diisi'
                    : null,
              ),
              const SizedBox(height: 12),
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
              const SizedBox(height: 12),
              TextFormField(
                controller: telponController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              // TextFormField(
              //   controller: domisiliController,
              //   decoration: const InputDecoration(
              //     labelText: 'Kota domilisi',
              //     border: OutlineInputBorder(),
              //   ),
              //   validator: (value) => value == null || value.isEmpty
              //       ? 'Kota domilisi harus diisi'
              //       : null,
              // ),
              // const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      final result = await AuthAPI.registerUser(
                        email: emailController.text,
                        name: nameController.text,
                        password: telponController.text,
                      );
                      setState(() {
                        isLoading = false;
                        user = result;
                        PreferenceHandler.saveToken(user.data!.token!);
                      });
                      print(result);
                      context.pushReplacement(FormLoginpage33());
                    } catch (e) {
                      ScaffoldMessenger(child: Text(e.toString()));
                      setState(() {
                        isLoading = false;
                      });
                    }
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         BottomNavigationEDU(
                    //           // email: emailcontroler.text,
                    //           // nama: namacontroler.text,
                    //           // kelas: kelascontroler.text,
                    //           // umur: umurcontroler.text,
                    //         ),
                    //     // settings: RouteSettings(
                    //     //   arguments: {
                    //     //     'nama': namacontroler.text,
                    //     //     'kelas': kelascontroler.text,
                    //     //     'email': emailcontroler.text,
                    //     //   },
                    //     // ),
                    //   ),
                    //   (route) => false,
                    // );
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Daftar Berhasil")));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Validasi eror"),
                          content: Text("Tolong isi semua dengan benar"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Ok"),
                            ),
                            // TextButton(
                            //   onPressed: () {
                            //     Navigator.pop(context);
                            //   },
                            //   child: Text("Ga Ok"),
                            // ),
                          ],
                        );
                      },
                    );
                    // ScaffoldMessenger.of(
                    //   context,
                    // ).showSnackBar(
                    //   SnackBar(
                    //     content: Text(
                    //       "Masukan Semua Data Dengan Benar",
                    //     ),
                    //   ),
                    // );
                  }
                  // print('Nama: ${namacontroler.text}');
                  // print('Email: ${emailcontroler.text}');
                  // print('kelas: ${kelascontroler.text}');
                  // final StudentModel dataStudent =
                  //     StudentModel(
                  //       name: namacontroler.text,
                  //       email: emailcontroler.text,
                  //       classs: kelascontroler.text,
                  //       age: int.parse(umurcontroler.text),
                  //       password: passwordController.text,
                  //     );
                  // DbHelper.registerUser(dataStudent);
                },
                child: Text("Daftar", style: TextStyle(color: Colors.white)),

                // onPressed: () async {
                //   if (_formKey.currentState!.validate()) {
                //     setState(() {
                //       isLoading = true;
                //     });
                //     try {
                //       final result = await AuthAPI.registerUser(
                //         email: emailController.text,
                //         name: nameController.text,
                //         password: telponController.text,
                //       );
                //       setState(() {
                //         isLoading = false;
                //         user = result;
                //         PreferenceHandler.saveToken(user.data!.token!);
                //       });
                //       print(result);
                //       context.pushReplacement(FormLoginpage33());
                //     } catch (e) {
                //       print(e.toString());
                //       ScaffoldMessenger(child: Text(e.toString()));
                //       setState(() {
                //         isLoading = false;
                //       });
                //     }
                //     // } else {
                //     //   showDialog(
                //     //     context: context,
                //     //     builder: (context) {
                //     //       return AlertDialog(
                //     //         title: Text("Validation Error"),
                //     //         content: Text("Please fill all fields"),
                //     //         actions: [
                //     //           TextButton(
                //     //             child: Text("OK"),
                //     //             onPressed: () {
                //     //               Navigator.pop(context);
                //     //             },
                //     //           ),
                //     //           TextButton(
                //     //             child: Text("Ga OK"),
                //     //             onPressed: () {
                //     //               Navigator.pop(context);
                //     //             },
                //     //           ),
                //     //         ],
                //     //       );
                //     //     },
                //     //   );
                //     // showDialog(
                //     //   context: context,
                //     //   builder: (_) {
                //     //     return AlertDialog(
                //     //       title: const Text('Pastikan data sesuai'),
                //     //       content: Text(
                //     //         'Nama: ${nameController.text}\n'
                //     //         'Email: ${emailController.text}\n'
                //     //         'Nomor HP: ${telponController.text}\n'
                //     //         'Kota Domisili: ${domisiliController.text}',
                //     //       ),
                //     //       actions: [
                //     //         TextButton(
                //     //           child: const Text('Cancel'),
                //     //           onPressed: () => Navigator.pop(context),
                //     //         ),
                //     //         TextButton(
                //     //           child: const Text('Proceed'),
                //     //           onPressed: () {
                //     //             Navigator.pop(context);
                //     //             Navigator.pushReplacement(
                //     //               context,
                //     //               MaterialPageRoute(
                //     //                 builder: (context) => FormLoginpage33(),
                //     //               ),
                //     //             );
                //     //           },
                //     //         ),
                //     //       ],
                //     //     );
                //     //   },
                //     // );
                //   }
                // },
                // child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
