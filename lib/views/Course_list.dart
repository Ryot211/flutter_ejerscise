import 'package:clase05_06_2024/entities/course_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Course_list extends StatelessWidget {
  const Course_list({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listado Cursos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Course>>(
          future: Course.select(),
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
              List<Course> data = snapshot.data as List<Course>;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return Card(
                        child: Row(
                      children: [
                        Expanded(child: Text(data[i].nombre)),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/Course/edit',
                                  arguments: data[i]);
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text('Elminar Curso'),
                                    content: Text(
                                        'Estas seguro de que quieres eliminar el curso?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            await DbConnection.delete(
                                                'Curso', data[i].id as int);
                                            Navigator.pushNamed(
                                                context, '/listCourses');
                                          },
                                          child: Text('Aceptar')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'Cancel');
                                          },
                                          child: Text('Cancelar'))
                                    ],
                                  ),
                                ),
                            icon: Icon(Icons.delete))
                      ],
                    ));
                  });
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/Course/create');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
