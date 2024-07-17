import 'package:clase05_06_2024/entities/student_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Student_list extends StatelessWidget {
  const Student_list({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listado de Estudiantes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Color.fromARGB(255, 194, 242, 250),
        child: FutureBuilder<List<Student>>(
          future: Student.select(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<Student> data = snapshot.data as List<Student>;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: Row(
                        children: [
                          Expanded(child: Text(data[i].name)),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'Student/edit',
                                    arguments: data[i]);
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              /* onPressed: () async {
                                // declaro el metodo async
                                // llamada a la fucnion delet de la clase DbConnection
                                //primer parametro es el nombre de la tabla
                                //segundo parametro es el id del registro a eliminar
                                await DbConnection.delete(
                                    'Estudiantes', data[i].id as int);
                                Navigator.pushNamed(context, '/list');
                              },*/
                              onPressed: () => showDialog<String>(
                                    // configuro el metodo para mostrar el cuadro del dialogo
                                    context:
                                        context, // relacionamos el contexto
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text('Eliminar Registro'),
                                      content: Text(
                                          'Estas seguro que quieres eliminar el registro?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () async {
                                              await DbConnection.delete(
                                                  'Estudiantes',
                                                  data[i].id as int);
                                              Navigator.pushNamed(
                                                  context, '/list');
                                            },
                                            child: Text('Aceptar')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context,
                                                  'Cancel'); // evento para cerrar el cuadro
                                            },
                                            child: Text('Cancelar')),
                                      ],
                                    ), // construimos un nuevo widget llamado AlertDialog
                                  ),
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    );
                  });
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/Student/create');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
