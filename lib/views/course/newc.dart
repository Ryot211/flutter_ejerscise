import 'package:clase05_06_2024/entities/course_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class CourseCreate extends StatefulWidget {
  @override
  State<CourseCreate> createState() => _CourseCreateState();
}

class _CourseCreateState extends State<CourseCreate> {
  final CourseForm = GlobalKey<FormState>();
  final NombreController = TextEditingController();
  final DescripcionController = TextEditingController();
  final CreditsController = TextEditingController();
  final UbicationController = TextEditingController();
  final EncargadoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Course',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Color.fromARGB(255, 194, 242, 250),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: CourseForm,
            child: Column(
              children: [
                TextFormField(
                  controller: NombreController,
                  decoration: InputDecoration(
                      labelText: 'Nombre: ',
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
                TextFormField(
                  controller: DescripcionController,
                  decoration: InputDecoration(
                      labelText: 'Descripcion:',
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
                TextFormField(
                  controller: CreditsController,
                  decoration: InputDecoration(
                      labelText: 'Credits:',
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
                TextFormField(
                  controller: UbicationController,
                  decoration: InputDecoration(
                      labelText: 'Ubicacion:',
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
                TextFormField(
                  controller: EncargadoController,
                  decoration: InputDecoration(
                      labelText: 'Encargado:',
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
                ElevatedButton(
                    onPressed: () {
                      insert();
                      Navigator.pushNamed(context, '/listCourses');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 12)),
                    child: Text('Insertar Curso'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  insert() async {
    print('Llegue a la funcion ');
    if (CourseForm.currentState!.validate()) {
      CourseForm.currentState!.save();
      var data = Course(
          nombre: NombreController.text,
          description: DescripcionController.text,
          credits: CreditsController.text,
          ubication: UbicationController.text,
          encargado: EncargadoController.text);
      print(await DbConnection.insert('Curso', data.toDictionary()));
    }
  }
}
