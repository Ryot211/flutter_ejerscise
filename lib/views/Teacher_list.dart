import 'package:clase05_06_2024/entities/teacher_entiry.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Teacher_list extends StatelessWidget {
  const Teacher_list({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Listado de Profesores',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Color.fromARGB(255, 194, 242, 250),
          child: FutureBuilder<List<Teacher>>(
              future: Teacher.select(),
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
                  List<Teacher> data = snapshot.data as List<Teacher>;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  Text(data[i].name),
                                  Text(' '),
                                  Text(data[i].lastName)
                                ],
                              )),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/Teacher/edit',
                                        arguments: data[i]);
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title:
                                              const Text('Eliminar Profesor'),
                                          content: Text(
                                              'Estas Seguro de que quiere eliminar el profesor?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () async {
                                                  await DbConnection.delete(
                                                      'Profesor',
                                                      data[i].id as int);
                                                  Navigator.pushNamed(
                                                      context, '/listTeacher');
                                                },
                                                child: Text('Aceptar')),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context, 'Cancel');
                                                },
                                                child: Text('Cancelar'))
                                          ],
                                        ),
                                      ),
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        );
                      });
                }
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Teacher/create');
          },
          child: Icon(Icons.add),
        ));
  }
}
