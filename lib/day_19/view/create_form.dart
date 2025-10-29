import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_19/database/db_helper.dart';
import 'package:flutter_ppkd_4_new/day_19/model/student_screen.dart';
import 'package:flutter_ppkd_4_new/day_19/model/user_model.dart';

class CreateForm21 extends StatefulWidget {
  const CreateForm21({super.key});

  @override
  State<CreateForm21> createState() => _CreateForm21State();
}

class _CreateForm21State extends State<CreateForm21> {
  final nameC = TextEditingController();
  final passwordC = TextEditingController();
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  
  get editAgeC => null;
  
  get editClasssC => null;
  
  get Fluttertoast => null;
  getData() {
    // DbHelper.getAllStudent() isn't defined; call the correct DB method here if you have one,
    // for example: DbHelper.getAllStudents(); or await DbHelper.instance.getAllStudents();
    // If you don't need to fetch here, just update the UI state.
    setState(() {});
  }

  Future<void> _onEdit(StudentModel student) async {
    final editNameC = TextEditingController(text: student.name);
    final editEmailC = TextEditingController(text: student.email);
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
              buildTextField(hintText: "Email", controller: editEmailC),
              buildTextField(hintText: "password", controller: editAgeC),
              buildTextField(hintText: "nomer telpon", controller: editClasssC),
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
        id: student.id,
        name: editNameC.text,
        email: editEmailC.text,
        password: editClasssC.text,
        phone: int.parse(editAgeC.text),
      );
      DbHelper.updateUser(updated);
      getData();
      Fluttertoast.showToast (msg: "Data berhasil di update");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _onEdit(StudentModel(
                      id: 1,
                      name: 'Test',
                      email: 'test@test.com',
                      password: 'password',
                      phone: 123456789,
                    )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  
  buildTextField({required String hintText, required TextEditingController controller}) {}
}
