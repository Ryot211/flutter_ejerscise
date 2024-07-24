import 'package:clase05_06_2024/entities/student_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class StudentEdit extends StatefulWidget {
  const StudentEdit({super.key});

  @override
  State<StudentEdit> createState() => _StudentEditState();
}

class _StudentEditState extends State<StudentEdit> {
  final studentForm = GlobalKey<FormState>(); //ID DEL FORMULARIO
  final nombreController = TextEditingController(); //ID DE TEXTFIELD
  final apellidoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Student;
    // captura el paramtero enviado
    nombreController.text = args.name;
    // setear el valor del noimbre del estudiante en la caja de texto correpondiente
    apellidoController.text = args.lastName;
    int id = args.id as int;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Editar Estudiante',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Color.fromARGB(255, 194, 242, 250),
          child: Padding(
            //ESTABLECER MARGENES
            padding: const EdgeInsets.all(
                20), //TODOS LOS MARGENES DE 20 DE SEPARACION
            child: Form(
                key: studentForm,
                //CREAR UN WIDGET PARA FORMULARIOS
                child: Column(
                  //AÑADO UNA COLUMNA PARA INVOLUCRAR
                  children: [
                    TextFormField(
                      controller: nombreController,
                      decoration: InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      validator: (value) {
                        //PROGRAMAR UNA FUNCION DE VALIDACION
                        if (value == null || value.isEmpty) {
                          return 'Este campo es requerido';
                        }
                        return null;
                      },
                    ), //CAJA DE TEXTO ENLAZADA AL FORMULARIO
                    SizedBox(height: 20), //AGREGAR ESPACIO
                    TextFormField(
                      controller: apellidoController,
                      decoration: InputDecoration(
                          labelText: 'Apellido',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      validator: (value) {
                        //PROGRAMAR UNA FUNCION DE VALIDACION
                        if (value == null || value.isEmpty) {
                          return 'Este campo es requerido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          edit(id);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 12)),
                        child: Text('Actualizar Etudiante'))
                  ],
                )),
          ),
        ));
  }

  edit(int id) async {
    print("Llegue a la funcion"); // imprimir un mensaje
    if (studentForm.currentState!.validate()) {
      // validar un formulario
      studentForm.currentState!.save(); //grabar el esatdo del formulario
      var data = Student(
          // crear un objetco  con instancia de Student
          id: id,
          name: nombreController.text,
          lastName: apellidoController.text);
      await DbConnection.update('Estudiantes', data.toDictionary(),
          id); // llamar al metodo actualizar
      Navigator.pushNamed(context, '/list'); //redirigir al listad
    }
  }

/*
  edit(int id) async {
    print('Llegue a la funcion');
    if (studentForm.currentState!.validate()) {
      studentForm.currentState!.save(); //ALMACENAR EL ESTADO ACTUAL
      var data = Student(
          id: id,
          name: nombreController.text, //NOMBRE
          lastName: apellidoController.text //APELLIDO
          ); //CREAR INSTANCIA CON LA DATA
      //LLAMADO A LA FUNCION INSERT
      print(await DbConnection.update('Estudiantes', data.toDictionary(), id));
    } //VALIDANDO LAS CAJAS DE TEXTO
  }*/
}
