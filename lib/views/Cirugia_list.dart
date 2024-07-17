import 'package:clase05_06_2024/entities/cirugia_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class Cirugia_list extends StatelessWidget {
  const Cirugia_list({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cirugia',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
          color: Color.fromARGB(255, 194, 242, 250),
          child: FutureBuilder<List<Cirugia>>(
              future: Cirugia.select(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error:${snapshot.error}'),
                  );
                } else {
                  List<Cirugia> data = snapshot.data as List<Cirugia>;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: Row(
                            children: [
                              Expanded(child: Text(data[i].tipo)),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/Cirugia/edit',
                                        arguments: data[i]);
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Text('Eliminar Cirugía'),
                                            content: Text(
                                                '¿Está seguro de eliminar la cirugía?'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () async {
                                                    await DbConnection.delete(
                                                        'Cirugia',
                                                        data[i].id as int);
                                                    Navigator.pushNamed(context,
                                                        '/listCirugia');
                                                  },
                                                  child: Text('Aceptar')),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, 'Cancel');
                                                  },
                                                  child: Text('Cancelar'))
                                            ],
                                          )),
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        );
                      });
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/Cirugia/create');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
