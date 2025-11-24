import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_18/day_18/preference/preference_handler.dart';
// import 'package:flutter_ppkd_4_new/day_18/preference/preference_handler.dart';
import 'package:flutter_ppkd_4_new/day_19/database/db_helper.dart';
import 'package:flutter_ppkd_4_new/day_19/login_page.dart';
import 'package:flutter_ppkd_4_new/day_19/model/user_model.dart';
import 'package:flutter_ppkd_4_new/day_33/extension/navigation.dart';
import 'package:flutter_ppkd_4_new/day_39/model/user_firebase_model.dart';
import 'package:flutter_ppkd_4_new/day_39/views/login_pages_screen.dart';
import 'package:flutter_ppkd_4_new/services/firebase.dart';

class Registrasi_Screen39 extends StatefulWidget {
  const Registrasi_Screen39({super.key});

  @override
  State<Registrasi_Screen39> createState() => _Registrasi_Screen39State();
}

class _Registrasi_Screen39State extends State<Registrasi_Screen39> {
  UserFirebaseModel user = UserFirebaseModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              // TextFormField(
              //   controller: phoneController,
              //   decoration: const InputDecoration(
              //     labelText: 'Nomor Telepon',
              //     border: OutlineInputBorder(),
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'nomor telpon harus diisi';
              //     }
              //     return null;
              //   },
              // ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                          final result =
                                            await FirebaseServies.registerUser(
                                              email: emailController.text,
                                              username: nameController.text,
                                              password: passwordController.text,
                                            );
                                        setState(() {
                                          user = result;
                                        });
                                        if (user.uid != null) {
                                          await PreferenceHandler.saveToken(
                                            user.uid!,
                                          );
                                        }
                                        context.pushReplacement(apps_login_screen39());  
                                      } catch (e) {
                                        ScaffoldMessenger(
                                          child: Text(e.toString()),
                                        );
                                      }
                  //   showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         title: Text('Pastikan data sesuai'),
                  //         content: Text(
                  //           'Nama: ${nameController.text} \nEmail: ${emailController.text} \npassword: ${passwordController.text} \nomor telpon: ${phoneController.text}',
                  //         ),
                  //         actions: [
                  //           TextButton(
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //             child: Text('Cancel'),
                  //           ),
                  //           TextButton(
                  //             onPressed: () async {
                  //               final UserModel data = UserModel(
                  //                 email: emailController.text,
                  //                 name: nameController.text,
                  //                 phone: int.parse(phoneController.text),
                  //                 password: passwordController.text,
                  //               );
                  //               await DbHelper.registerUser(data);
                  //               // DbHelper.loginUser(
                  //               //   email: emailController.text,
                  //               //   password: passwordController.text,
                  //               //   phone: int.parse(phoneController.text),
                  //               // );
                  //               // Navigator.of(context).pop();
                  //               Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                   builder: (context) {
                  //                     return FormLoginpage19();
                  //                   },
                  //                 ),
                  //               );
                  //             },
                  //             child: Text('Proceed'),
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  }
                },
                child: Text('Submit'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
