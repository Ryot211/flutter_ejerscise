import 'package:clase05_06_2024/entities/course_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class CourseEdit extends StatefulWidget {
  const CourseEdit({super.key});
  @override
  State<CourseEdit> createState() => _CourseEditState();
}

class _CourseEditState extends State<CourseEdit> {
  final CourseForm = GlobalKey<FormState>();
  final NombreController = TextEditingController();
  final DescripcionController = TextEditingController();
  final CreditsController = TextEditingController();
  final UbicationController = TextEditingController();
  final EncargadoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Course;
    NombreController.text = args.nombre;
    DescripcionController.text = args.description;
    CreditsController.text = args.credits.toString();
    UbicationController.text = args.ubication;
    EncargadoController.text = args.encargado;
    int id = args.id as int;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar Curso',
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
                  height: 14,
                ),
                ElevatedButton(
                    onPressed: () {
                      edit(id);
                      Navigator.pushNamed(context, '/listCourses');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 12)),
                    child: Text('Actualizar Curso'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  edit(int id) async {
    print('Llegue a la funcion ');
    if (CourseForm.currentState!.validate()) {
      CourseForm.currentState!.save();
      var data = Course(
          id: id,
          nombre: NombreController.text,
          description: DescripcionController.text,
          credits: CreditsController.text,
          ubication: UbicationController.text,
          encargado: EncargadoController.text);
      print(await DbConnection.update('Curso', data.toDictionary(), id));
    }
  }
}
