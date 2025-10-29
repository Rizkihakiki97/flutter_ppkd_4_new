import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_19/database/db_helper.dart';
import 'package:flutter_ppkd_4_new/day_19/model/user_model.dart';

class Welcome18 extends StatefulWidget {
  const Welcome18({super.key});

  @override
  State<Welcome18> createState() => _Welcome18State();
}

class _Welcome18State extends State<Welcome18> {
  final nameC = TextEditingController();
  final passC = TextEditingController();
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  getData() {
    DbHelper.getAllUsers();
    setState(() {});
  }

  Future<void> _onEdit(UserModel user) async {
    final editNameC = TextEditingController(text: user.name);
    final editPhoneC = TextEditingController(text: user.phone.toString());
    final editPassC = TextEditingController(text: user.password);
    final editEmailC = TextEditingController(text: user.email);
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              buildTextField(hintText: "Name", controller: editNameC),
              buildTextField(hintText: "No HP", controller: editEmailC),
              buildTextField(hintText: "Password", controller: editPassC),
              buildTextField(hintText: "Email", controller: editEmailC),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      final updated = UserModel(
        id: user.id,
        name: editNameC.text,
        email: editEmailC.text,
        password: editPassC.text,
        phone: int.parse(editPhoneC.text),
      );
      DbHelper.updateUser(updated);
      getData();
      // Fluttertoast.showToast(msg: "Data berhasil di update");
    }
  }

  Future<void> _onDelete(UserModel user) async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(
                "Apakah anda yakin ingin menghapus data ${user.name}?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Jangan"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Ya, hapus aja"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      DbHelper.deleteUser(user.id!);
      getData();
      // Fluttertoast.showToast(msg: "Data berhasil di hapus");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            // Text("Pendaftaran Siswa", style: TextStyle(fontSize: 24)),
            // buildTextField(hintText: "Name", controller: nameC),
            // buildTextField(hintText: "Phone", controller: phoneC),
            // buildTextField(hintText: "Pass", controller: passC),
            // buildTextField(hintText: "Email", controller: emailC),
            // TextButton(

            //   onPressed: () {
            //     if (nameC.text.isEmpty) {
            //       // Fluttertoast.showToast(msg: "Nama belum diisi");
            //     } else if (emailC.text.isEmpty) {
            //       // Fluttertoast.showToast(msg: "Email belum diisi");
            //     } else if (classC.text.isEmpty) {
            //       // Fluttertoast.showToast(msg: "Class belum diisi");
            //     } else if (ageC.text.isEmpty) {
            //       // Fluttertoast.showToast(msg: "Age belum diisi");
            //     } else {
            //       final UserModel datauser = UserModel(
            //         name: nameC.text,
            //         email: emailC.text,
            //         password: passC.text,
            //         phone: int.parse(phoneC.text),
            //       );
            //       DbHelper.createStudent(datauser).then((value) {
            //         emailC.clear();
            //         ageC.clear();
            //         classC.clear();
            //         nameC.clear();
            //         getData();
            //         Fluttertoast.showToast(msg: "Data berhasil ditambahkan");
            //       });
            //     }
            //   },
            //   child: Text("Tambahkan"),
            // ),
            SizedBox(height: 30),
            FutureBuilder(
              future: DbHelper.getAllUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.data == null || snapshot.data.isEmpty) {
                  return Column(children: [Text("Data belum ada")]);
                } else {
                  final data = snapshot.data as List<UserModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = data[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(items.name),
                              subtitle: Text(items.email),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _onEdit(items);
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _onDelete(items);
                                    },
                                    icon: Icon(Icons.delete, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

TextFormField buildTextField({
  String? hintText,
  bool isPassword = false,
  TextEditingController? controller,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    validator: validator,
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.2),
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(color: Colors.black, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.2),
          width: 1.0,
        ),
      ),
    ),
  );
}
