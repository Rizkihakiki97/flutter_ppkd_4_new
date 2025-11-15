import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_33/extension/navigation.dart';
import 'package:flutter_ppkd_4_new/day_33/models/user_dart';
import 'package:flutter_ppkd_4_new/day_33/preferences/preferences_handler.dart';
import 'package:flutter_ppkd_4_new/day_33/service/api.dart';
import 'package:flutter_ppkd_4_new/day_33/views/navbar.dart';
import 'package:flutter_ppkd_4_new/day_33/views/registrasi_screen.dart';

class FormLoginpage33 extends StatefulWidget {
  const FormLoginpage33({super.key});
  static const id = "apps_login_screen18";

  @override
  State<FormLoginpage33> createState() => _FormLoginpage33State();
}

class _FormLoginpage33State extends State<FormLoginpage33> {
  RegisterModel user = RegisterModel();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  Widget buildTextFieldNew({
    required String label,
    required String hintText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
    bool isPassword = false,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: isPassword ? _obscurePassword : obscureText,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                : suffixIcon,
          ),
        ),
      ],
    );
  }

  Widget buildButton({
    required String text,
    required VoidCallback onPressed,
    Color backgroundColor = const Color(0xFF1E40FF),
    Color textColor = Colors.white,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget buildSocialButton({
    required String iconImage,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Image(image: AssetImage(iconImage), height: 24, width: 24),
        label: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color.fromARGB(255, 248, 247, 247)),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/image/24.png')),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Login to access your account",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    const SizedBox(height: 40),

                    buildTextFieldNew(
                      controller: emailController,
                      label: "Email Address",
                      hintText: "Masukan Email Anda",
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email tidak boleh kosong";
                        } else if (!value.contains('@')) {
                          return "Email tidak valid";
                        } else if (!RegExp(
                          r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                        ).hasMatch(value)) {
                          return "Format Email tidak valid";
                        }
                        return null;
                      },
                    ),
                    buildTextFieldNew(
                      controller: passwordController,
                      label: "Password",
                      hintText: "Masukan Password Anda",
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email tidak boleh kosong";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    buildButton(
                      text: "Login",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final RegisterModel result =
                                await AuthAPI.LoginUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                            PreferenceHandler.saveLogin(true);
                            setState(() {
                              isLoading = false;
                              user = result;
                            });
                            PreferenceHandler.saveToken(result.data!.token!);
                            context.pushReplacement(BottomNavbar());
                          } catch (e) {
                            setState(() => isLoading = false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login Berhasil")),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("validate eror"),
                                content: Text("Tolong isi semua dengan benar"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        // final data = await DbHelper.registerUser(
                        //   nama : nameController.text,
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        //   phone: int.parse(phoneController.text),
                        // );
                        // if (data != null) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Welcome18(),
                        //     ),
                        //   );
                        // } else {
                        //   ScaffoldMessenger(
                        //     child: Text("Email Pasword Anda Salah"),
                        //   );
                        // }
                      },
                    ),

                    const SizedBox(height: 25),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            "Or Sign In With",
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 10, 10),
                            ),
                          ),
                        ),
                        Expanded(
                          child: const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    buildSocialButton(
                      iconImage: 'assets/image/iconGoogle.png',
                      text: "Google",
                      onPressed: () {
                        Navigator.pushNamed(context, '/googlepage');
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Homepage()),
                        // );
                      },
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Registrasi33(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign Up",
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
          ),
        ),
      ),
    );
  }
}
