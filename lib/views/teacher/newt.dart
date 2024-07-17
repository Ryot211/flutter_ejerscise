import 'package:clase05_06_2024/entities/teacher_entiry.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class TeacherCreate extends StatefulWidget {
  @override
  State<TeacherCreate> createState() => _TeacherCreateState();
}

class _TeacherCreateState extends State<TeacherCreate> {
  final TeacherForm = GlobalKey<FormState>();
  final NombreController = TextEditingController();
  final LastNameController = TextEditingController();
  final DeparmentController = TextEditingController();
  final EmailController = TextEditingController();
  final TelefonoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Crear Profesor',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Color.fromARGB(255, 194, 242, 250),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: TeacherForm,
              child: Column(children: [
                TextFormField(
                  controller: NombreController,
                  decoration: InputDecoration(labelText: 'Nombre:'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' este campo es obligatorio';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: LastNameController,
                  decoration: InputDecoration(labelText: 'Apellido:'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' este campo es obligatorio';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: DeparmentController,
                  decoration: InputDecoration(labelText: 'Departamento:'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' este campo es obligatorio';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: EmailController,
                  decoration: InputDecoration(labelText: 'Correo electronico:'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' este campo es obligatorio';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: TelefonoController,
                  decoration: InputDecoration(labelText: 'Telefono:'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' este campo es obligatorio';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      insert();
                      Navigator.of(context).pushNamed('/listTeacher');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 12)),
                    child: Text('Insertar Profesor'))
              ]),
            ),
          ),
        ));
  }

  insert() async {
    print('Llegue a la funcion');
    if (TeacherForm.currentState!.validate()) {
      TeacherForm.currentState!.save();
      var data = Teacher(
        name: NombreController.text,
        lastName: LastNameController.text,
        deparment: DeparmentController.text,
        email: EmailController.text,
        telefono: TelefonoController.hashCode,
      );
      print(await DbConnection.insert('Profesor', data.toDictionary()));
    }
  }
}
