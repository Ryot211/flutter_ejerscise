import 'package:clase05_06_2024/entities/student_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class StudentCreate extends StatefulWidget {
  const StudentCreate({super.key});

  @override
  State<StudentCreate> createState() => _StudentCreateState();
}

class _StudentCreateState extends State<StudentCreate> {
  final studentForm = GlobalKey<FormState>(); //ID DEL FORMULARIO
  final nombreController = TextEditingController(); //ID DE TEXTFIELD
  final apellidoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear Estudiante'),
        ),
        body: Padding(
          //ESTABLECER MARGENES
          padding:
              const EdgeInsets.all(20), //TODOS LOS MARGENES DE 20 DE SEPARACION
          child: Form(
              key: studentForm,
              //CREAR UN WIDGET PARA FORMULARIOS
              child: Column(
                //AÑADO UNA COLUMNA PARA INVOLUCRAR
                children: [
                  TextFormField(
                    controller: nombreController,
                    decoration: InputDecoration(labelText: 'Nombre'),
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
                    decoration: InputDecoration(labelText: 'Apellido'),
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
                        insert();
                        Navigator.of(context).pushNamed('/list');
                      },
                      child: Text('Insertar Etudiante'))
                ],
              )),
        ));
  }

  insert() async {
    print('Llegue a la funcion');
    if (studentForm.currentState!.validate()) {
      studentForm.currentState!.save(); //ALMACENAR EL ESTADO ACTUAL
      var data = Student(
          name: nombreController.text, //NOMBRE
          lastName: apellidoController.text //APELLIDO
          ); //CREAR INSTANCIA CON LA DATA
      //LLAMADO A LA FUNCION INSERT
      print(await DbConnection.insert('Estudiantes', data.toDictionary()));

    } //VALIDANDO LAS CAJAS DE TEXTO
  }
}