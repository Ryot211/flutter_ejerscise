import 'package:clase05_06_2024/entities/subject_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Subject_list extends StatelessWidget {
  const Subject_list({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Listado de Materias',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder<List<Subject>>(
            future: Subject.select(),
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
                List<Subject> data = snapshot.data as List<Subject>;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: Row(
                          children: [
                            Expanded(child: Text(data[i].name)),
                            IconButton(onPressed: (){Navigator.pushNamed(context,'Subject/edit', routeName)}, icon: )
                          ],
                        ),
                      );
                    });
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Subject/create');
          },
          child: Icon(Icons.add),
        ));
  }
}
