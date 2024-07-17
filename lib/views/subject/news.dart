import 'package:clase05_06_2024/entities/subject_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class SubjetCreate extends StatefulWidget {
  @override
  State<SubjetCreate> createState() => _SubjetCreateState();
}

class _SubjetCreateState extends State<SubjetCreate> {
  final SubjetForm = GlobalKey<FormState>();
  final NombreController = TextEditingController();
  final CreditsController = TextEditingController();
  final DescripcionController = TextEditingController();
  final TeacherController = TextEditingController();
  final DateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crear Asignatura',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Color.fromARGB(255, 194, 242, 250),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: SubjetForm,
            child: Column(
              children: [
                TextFormField(
                  controller: NombreController,
                  decoration: InputDecoration(
                      labelText: 'Nombre:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
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
                  controller: DateController,
                  decoration: InputDecoration(
                      labelText: 'Fecha:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
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
                  controller: CreditsController,
                  decoration: InputDecoration(
                      labelText: 'Créditos:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
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
                  controller: DescripcionController,
                  decoration: InputDecoration(
                      labelText: 'Descripción:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
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
                  controller: TeacherController,
                  decoration: InputDecoration(
                      labelText: 'Profesor:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
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
                      Navigator.pushNamed(context, '/listSubjects');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 12)),
                    child: Text('Insertar Materia'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  insert() async {
    print('Llegue a la funcion');
    if (SubjetForm.currentState!.validate()) {
      SubjetForm.currentState!.save();
      var data = Subject(
          name: NombreController.text,
          date: DateController.text,
          credits: CreditsController.text,
          description: DescripcionController.text,
          teacher: TeacherController.text);
      print(await DbConnection.insert('Materia', data.toDictionary()));
    }
  }
}
